<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

use Illuminate\Support\Facades\Cache;

class CategoryController extends Controller
{
    /**
     * Return full category tree for admin panel (Level-1 roots with children + grandchildren).
     */
    public function index()
    {
        $categories = Cache::remember('categories:admin:tree', now()->addHours(1), function () {
            return Category::whereNull('parent_id')
                ->with(['children' => function ($q) {
                    $q->with('children')->withCount('products');
                }])
                ->withCount('products')
                ->get();
        });

        return response()->json(['status' => 200, 'data' => $categories]);
    }

    /**
     * Public active category tree (3 levels, status=1 only).
     */
    public function tree()
    {
        $categories = Cache::remember('categories:tree', now()->addHours(1), function () {
            return Category::whereNull('parent_id')
                ->where('status', 1)
                ->with([
                    'children' => function ($q) {
                        $q->where('status', 1)->with([
                            'children' => fn($q) => $q->where('status', 1)
                        ]);
                    }
                ])
                ->withCount('products')
                ->get();
        });

        return response()->json(['status' => 200, 'data' => $categories]);
    }

    /**
     * Store a new category with optional parent_id and depth guard.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string|max:500',
            'status'      => 'required|integer|in:0,1',
            'image'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'parent_id'   => 'nullable|exists:categories,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 400, 'errors' => $validator->errors()], 400);
        }

        // Depth guard — prevent Level-4
        if ($request->parent_id) {
            $parent = Category::find($request->parent_id);
            if ($parent && $parent->parent_id !== null) {
                $grandparent = Category::find($parent->parent_id);
                if ($grandparent && $grandparent->parent_id !== null) {
                    return response()->json([
                        'status'  => 400,
                        'message' => 'Maximum category depth is 3 levels.',
                    ], 400);
                }
            }
        }

        $imagePath = null;
        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('uploads/categories', 'public');
            $imagePath = '/storage/' . $path;
        }

        $category = new Category();
        $category->parent_id   = $request->input('parent_id') ?: null;
        $category->name        = $request->input('name');
        $category->description = $request->input('description');
        $category->status      = $request->input('status');
        $category->image       = $imagePath;
        $category->save();

        return response()->json([
            'status'  => 200,
            'message' => 'Category created successfully',
            'data'    => $category->load('parent'),
        ], 200);
    }

    /**
     * Show single category by id.
     */
    public function show($id)
    {
        $category = Category::with(['parent', 'children'])->find($id);
        if (!$category) {
            return response()->json(['status' => 404, 'message' => 'Category not found']);
        }
        return response()->json(['status' => 200, 'data' => $category]);
    }

    /**
     * Update category with optional parent_id change and depth guard.
     */
    public function update(Request $request, $id)
    {
        $category = Category::find($id);
        if (!$category) {
            return response()->json(['status' => 404, 'message' => 'Category not found']);
        }

        $validator = Validator::make($request->all(), [
            'name'        => 'sometimes|required|string|max:255',
            'description' => 'nullable|string|max:500',
            'status'      => 'sometimes|integer|in:0,1',
            'image'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'parent_id'   => 'nullable|exists:categories,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 400, 'errors' => $validator->errors()]);
        }

        // Depth guard on update
        if ($request->has('parent_id') && $request->parent_id) {
            // Cannot set itself as parent
            if ((int)$request->parent_id === (int)$id) {
                return response()->json(['status' => 400, 'message' => 'A category cannot be its own parent.'], 400);
            }

            $parent = Category::find($request->parent_id);
            if ($parent && $parent->parent_id !== null) {
                $grandparent = Category::find($parent->parent_id);
                if ($grandparent && $grandparent->parent_id !== null) {
                    return response()->json([
                        'status'  => 400,
                        'message' => 'Maximum category depth is 3 levels.',
                    ], 400);
                }
            }
        }

        if ($request->has('name'))        $category->name        = $request->name;
        if ($request->has('description')) $category->description = $request->description;
        if ($request->has('status'))      $category->status      = $request->status;

        // Allow explicit null to unset parent (promote to Level-1)
        if ($request->has('parent_id')) {
            $category->parent_id = $request->parent_id ?: null;
        }

        if ($request->hasFile('image')) {
            if ($category->image) {
                $oldPath = str_replace('/storage/', '', $category->image);
                Storage::disk('public')->delete($oldPath);
            }
            $path = $request->file('image')->store('uploads/categories', 'public');
            $category->image = '/storage/' . $path;
        }

        $category->save();

        return response()->json([
            'status'  => 200,
            'message' => 'Category updated successfully',
            'data'    => $category->load('parent'),
        ]);
    }

    /**
     * Delete category — cascade is handled by DB.
     * Returns child counts in response for UI warning.
     */
    public function destroy($id)
    {
        $category = Category::withCount(['children as sub_count', 'childrenWithGrandchildren as child_count'])
            ->find($id);

        if (!$category) {
            return response()->json(['status' => 404, 'message' => 'Category not found'], 404);
        }

        $category->delete();

        return response()->json([
            'status'  => 200,
            'message' => 'Category deleted successfully',
        ], 200);
    }
}
