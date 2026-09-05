<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BrandController extends Controller
{

    public function index(){
        $brands = Brand::all();
        return response()->json([
            'status' => 200,
            'data' => $brands,
        ]);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'status' => 'required|integer|in:0,1',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:4096',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors(),
            ], 400);
        }
        // Create and save the new brand
        $brand = new Brand();
        $brand->name = $request->input('name');
        $brand->status = $request->input('status');

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('uploads/brands', 'public');
            $brand->image = '/storage/' . $path;
        }

        $brand->save();

        return response()->json([
            'status' => 200,
            'message' => 'Brand created successfully',
            'data' => $brand,
        ], 200);
    }
    // show brand by id
    public function show($id)
    {
        $brand = Brand::find($id);
        if (!$brand) {
            return response()->json([
                'status' => 404,
                'message' => 'Brand not found',
            ]);
        }
        return response()->json([
            'status' => 200,
            'data' => $brand,
        ]);
    }

    // update brand by id
    public function update(Request $request, $id)
    {
        $brand = Brand::find($id);
        if (!$brand) {
            return response()->json([
                'status' => 404,
                'message' => 'Brand not found',
            ]);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string|max:255',
            'status' => 'sometimes|required|integer|in:0,1',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:4096',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors(),
            ]);
        }
        // Update the brand
        if ($request->has('name')) {
            $brand->name = $request->name;
        }
        if ($request->has('status')) {
            $brand->status = $request->status;
        }

        if ($request->hasFile('image')) {
            if ($brand->image) {
                $oldPath = str_replace('/storage/', '', $brand->image);
                \Illuminate\Support\Facades\Storage::disk('public')->delete($oldPath);
            }
            $path = $request->file('image')->store('uploads/brands', 'public');
            $brand->image = '/storage/' . $path;
        }

        $brand->save();

        return response()->json([
            'status' => 200,
            'message' => 'Brand updated successfully',
            'data' => $brand
        ]);
    }

    /**
     * 🗑️ Delete brand by id
     */
    public function destroy($id)
    {
        $brand = Brand::find($id);
        if (!$brand) {
            return response()->json([
                'status' => 404,
                'message' => 'Brand not found',
            ], 404);
        }

        if ($brand->image) {
            $oldPath = str_replace('/storage/', '', $brand->image);
            \Illuminate\Support\Facades\Storage::disk('public')->delete($oldPath);
        }

        $brand->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Brand deleted successfully',
        ], 200);
    }
}
