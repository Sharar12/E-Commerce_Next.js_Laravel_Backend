<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProductVariant;

class ProductVariantController extends Controller
{
    /**
     * Display a listing of product variants.
     */
    public function index(Request $request)
    {
        $query = ProductVariant::query();

        if ($request->has('product_id')) {
            $query->where('product_id', $request->product_id);
        }

        $productVariants = $query->get();
        return response()->json([
            'data'=> $productVariants,
            'status'=>200,
            'message' => 'product variants data is successfully found'
        ], 200);
    }

    /**
     * Store a newly created product variant.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'size_id' => 'nullable|exists:sizes,id',
            'color' => 'nullable|string|max:255',
            'additional_price' => 'nullable|numeric|min:0',
            'stock_quantity' => 'required|integer|min:0',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:4096',
        ]);

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('uploads/variants', 'public');
            $validated['image'] = '/storage/' . $path;
        }

        $variant = ProductVariant::create($validated);

        return response()->json([
            'message' => 'Product variant created successfully',
            'status' => 201,
            'data' => $variant,
        ], 201);
    }

    /**
     * Show a specific product variant.
     */
    public function show($id)
    {
        $variant = ProductVariant::findOrFail($id);
        return response()->json($variant, 200);
    }

    /**
     * Update a product variant.
     */
    public function update(Request $request, $id)
    {
        $variant = ProductVariant::findOrFail($id);

        $validated = $request->validate([
            'product_id' => 'sometimes|exists:products,id',
            'size_id' => 'nullable|exists:sizes,id',
            'color' => 'nullable|string|max:255',
            'additional_price' => 'nullable|numeric|min:0',
            'stock_quantity' => 'sometimes|integer|min:0',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:4096',
        ]);

        if ($request->hasFile('image')) {
            if ($variant->image) {
                $oldPath = str_replace('/storage/', '', $variant->image);
                \Illuminate\Support\Facades\Storage::disk('public')->delete($oldPath);
            }
            $path = $request->file('image')->store('uploads/variants', 'public');
            $validated['image'] = '/storage/' . $path;
        }

        $variant->update($validated);

        return response()->json([
            'message' => 'Product variant updated successfully',
            'data' => $variant,
        ], 200);
    }

    /**
     * Soft delete a variant.
     */
    public function destroy($id)
    {
        $variant = ProductVariant::findOrFail($id);
        $variant->delete();

        return response()->json(['message' => 'Product variant deleted successfully'], 200);
    }
}
