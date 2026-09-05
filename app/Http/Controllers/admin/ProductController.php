<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * 🧾 List all products with images
     */
    public function index(Request $request)
    {
        $query = Product::with([
            'category',
            'brand',
            'images',
            'reviews.user',
            'wishlists.user',
            'orderItems' => function ($q) {
                $q->whereHas('order', function ($oq) {
                    $oq->where('status', 'delivered');
                });
            }
        ]);

        // Handle status filter: 'all' returns all items, specific values filter by status
        if ($request->has('status')) {
            $status = $request->query('status');
            if ($status !== 'all') {
                $query->where('status', $status);
            }
        } elseif (!$request->user('sanctum') && !$request->bearerToken()) {
            $query->where('status', 'active');
        }

        $products = $query->latest()->get();

        // Append calculated delivered sales_count attribute
        $products->transform(function ($p) {
            $p->sales_count = $p->orderItems->sum('quantity');
            unset($p->orderItems);
            return $p;
        });

        return response()->json([
            'success' => true,
            'status' => 200,
            'data' => $products
        ], 200);
    }

    /**
     * 🆕 Store new product with multiple images
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_id' => 'required|exists:categories,id',
            'brand_id' => 'required|exists:brands,id',
            'name' => 'required|string|max:255',
            'sku' => 'required|string|max:100|unique:products,sku',
            'description' => 'nullable|string',
            'base_price' => 'required|numeric|min:0',
            'stock_quantity' => 'required|integer|min:0',
            'weight' => 'nullable|numeric|min:0',
            'is_seasonal' => 'nullable|boolean',
            'seasonal_start_date' => 'nullable|date',
            'seasonal_end_date' => 'nullable|date',
            'status' => 'nullable|in:active,inactive',
            'images.*' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'status' => 422,
                'errors' => $validator->errors()
            ], 422);
        }

        $product = Product::create($validator->validated());

        // Explicitly persist weight since it's nullable and may be skipped
        if ($request->has('weight') && is_numeric($request->input('weight'))) {
            $product->weight = (float) $request->input('weight');
            $product->save();
        }

        // Handle images
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $key => $image) {
                $path = $image->store('uploads/products', 'public');
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_url' => '/storage/' . $path,
                    'is_primary' => $key === 0, // first image = primary
                ]);
            }
        }

        return response()->json([
            'success' => true,
            'message' => 'Product created successfully',
            'data' => $product->load('images')
        ], 201);
    }

    /**
     * 📦 Show single product with images
     */
    public function show($id)
    {
        $product = Cache::remember("product:{$id}", now()->addMinutes(30), function () use ($id) {
            return Product::with(['category', 'brand', 'images', 'reviews.user', 'wishlists.user'])->find($id);
        });

        if (!$product) {
            return response()->json(['success' => false, 'message' => 'Product not found'], 404);
        }

        return response()->json(['success' => true, 'data' => $product], 200);
    }

    /**
     * ✏️ Update product with optional new images
     */
    public function update(Request $request, $id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['success' => false, 'message' => 'Product not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'category_id' => 'sometimes|exists:categories,id',
            'brand_id' => 'sometimes|exists:brands,id',
            'name' => 'sometimes|string|max:255',
            'sku' => 'sometimes|string|max:100|unique:products,sku,' . $id,
            'description' => 'nullable|string',
            'base_price' => 'sometimes|numeric|min:0',
            'stock_quantity' => 'sometimes|integer|min:0',
            'weight' => 'sometimes|nullable|numeric|min:0',
            'is_seasonal' => 'nullable|boolean',
            'seasonal_start_date' => 'nullable|date',
            'seasonal_end_date' => 'nullable|date',
            'status' => 'sometimes|in:active,inactive',
            'primary_image_id' => 'nullable',
            'images_to_delete' => 'nullable|array',
            'images_to_delete.*' => 'integer|exists:product_images,id',
            'images.*' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }

        $validated = $validator->validated();
        $product->update($validated);

        // Explicitly persist weight in case validated() skipped it due to nullable handling
        if ($request->has('weight')) {
            $product->weight = is_numeric($request->input('weight')) ? (float) $request->input('weight') : null;
            $product->save();
        }

        // Handle image deletions
        if ($request->has('images_to_delete') && is_array($request->input('images_to_delete'))) {
            ProductImage::whereIn('id', $request->input('images_to_delete'))
                ->where('product_id', $product->id)
                ->delete();
        }

        // Handle primary image setting if explicit primary_image_id is provided
        if ($request->filled('primary_image_id')) {
            $primaryId = $request->input('primary_image_id');
            ProductImage::where('product_id', $product->id)->update(['is_primary' => false]);
            ProductImage::where('id', $primaryId)->where('product_id', $product->id)->update(['is_primary' => true]);
        }

        // Handle new images if uploaded
        if ($request->hasFile('images')) {
            $hasExistingPrimary = ProductImage::where('product_id', $product->id)->where('is_primary', true)->exists();
            foreach ($request->file('images') as $key => $image) {
                $path = $image->store('uploads/products', 'public');
                $isPrimary = !$hasExistingPrimary && ($key === 0);
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_url' => '/storage/' . $path,
                    'is_primary' => $isPrimary,
                ]);
                if ($isPrimary) {
                    $hasExistingPrimary = true;
                }
            }
        }

        // Fallback: If no image is marked primary, make the first available image primary
        if (!ProductImage::where('product_id', $product->id)->where('is_primary', true)->exists()) {
            $firstImg = ProductImage::where('product_id', $product->id)->first();
            if ($firstImg) {
                $firstImg->update(['is_primary' => true]);
            }
        }

        return response()->json([
            'success' => true,
            'message' => 'Product updated successfully',
            'data' => $product->load('images')
        ], 200);
    }

    /**
     * 🗑️ Soft delete product
     */
    public function destroy($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['success' => false, 'message' => 'Product not found'], 404);
        }

        $product->delete();

        return response()->json(['success' => true, 'message' => 'Product deleted successfully'], 200);
    }
}
