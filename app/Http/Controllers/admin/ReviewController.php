<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Review;
use App\Models\Order;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class ReviewController extends Controller
{
    public function index(Request $request)
    {
        $query = Review::with(['user', 'product']);
        if ($request->has('product_id')) {
            $query->where('product_id', $request->input('product_id'));
        }
        $reviews = $query->latest()->get();
        return response()->json([
            'data' => $reviews,
            'status' => 200,
            'message' => 'All reviews data is successfully found'
        ], 200);
    }

    /**
     * Check if a customer can review a given product (must have a delivered order)
     */
    public function checkEligibility(Request $request)
    {
        $productId = $request->input('product_id');
        $userId = $request->user() ? $request->user()->id : $request->input('user_id');

        if (!$userId && $request->bearerToken()) {
            $token = \Laravel\Sanctum\PersonalAccessToken::findToken($request->bearerToken());
            if ($token) {
                $userId = $token->tokenable_id;
            }
        }

        if (!$userId) {
            return response()->json([
                'can_review' => false,
                'reason' => 'Authentication or patron ID required.',
                'has_delivered_order' => false,
            ], 200);
        }

        $hasDeliveredOrder = Order::where('user_id', $userId)
            ->whereIn(DB::raw('LOWER(status)'), ['delivered', 'completed'])
            ->whereHas('items', function ($q) use ($productId) {
                $q->where('product_id', $productId);
            })->exists();

        $existingReview = Review::where('user_id', $userId)
            ->where('product_id', $productId)
            ->first();

        return response()->json([
            'can_review' => $hasDeliveredOrder,
            'has_delivered_order' => $hasDeliveredOrder,
            'existing_review' => $existingReview,
            'reason' => $hasDeliveredOrder ? 'Eligible to review' : 'Product has not been delivered to this customer.',
        ], 200);
    }

    public function store(Request $request)
    {
        $productId = $request->input('product_id');
        $userId = $request->user() ? $request->user()->id : $request->input('user_id');

        if (!$userId && $request->bearerToken()) {
            $token = \Laravel\Sanctum\PersonalAccessToken::findToken($request->bearerToken());
            if ($token) {
                $userId = $token->tokenable_id;
            }
        }

        if (!$userId) {
            $user = User::where('role', 'customer')->first() ?? User::first();
            $userId = $user ? $user->id : 1;
        }

        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string',
        ]);

        // STRICT VERIFICATION: Verify customer has a delivered order for this product
        $hasDeliveredOrder = Order::where('user_id', $userId)
            ->whereIn(DB::raw('LOWER(status)'), ['delivered', 'completed'])
            ->whereHas('items', function ($q) use ($productId) {
                $q->where('product_id', $productId);
            })->exists();

        if (!$hasDeliveredOrder) {
            return response()->json([
                'status' => 403,
                'message' => 'Review privilege is restricted to patrons who have received delivery of this product.',
                'can_review' => false,
            ], 403);
        }

        // Save or update review
        $review = Review::updateOrCreate(
            ['user_id' => $userId, 'product_id' => $productId],
            ['rating' => $validated['rating'], 'comment' => $validated['comment'] ?? '']
        );

        $review->load(['user', 'product']);

        return response()->json([
            'data' => $review,
            'status' => 201,
            'message' => 'Review has been created successfully'
        ], 201);
    }

    public function show($id)
    {
        $review = Review::with(['user', 'product'])->findOrFail($id);
        return response()->json([
            'data' => $review,
            'status' => 200,
            'message' => 'Review data successfully found'
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $review = Review::findOrFail($id);

        $validated = $request->validate([
            'rating' => 'sometimes|integer|min:1|max:5',
            'comment' => 'sometimes|string',
        ]);

        $review->update($validated);

        return response()->json([
            'data' => $review,
            'status' => 200,
            'message' => 'Review has been updated successfully'
        ], 200);
    }

    public function destroy($id)
    {
        $review = Review::findOrFail($id);
        $review->delete();

        return response()->json([
            'data' => null,
            'status' => 200,
            'message' => 'Review has been soft-deleted successfully'
        ], 200);
    }

    public function trashed()
    {
        $trashed = Review::onlyTrashed()->get();
        return response()->json([
            'data' => $trashed,
            'status' => 200,
            'message' => 'Soft-deleted reviews data successfully found'
        ], 200);
    }

    public function restore($id)
    {
        $review = Review::onlyTrashed()->findOrFail($id);
        $review->restore();

        return response()->json([
            'data' => $review,
            'status' => 200,
            'message' => 'Review has been restored successfully'
        ], 200);
    }

    public function forceDelete($id)
    {
        $review = Review::onlyTrashed()->findOrFail($id);
        $review->forceDelete();

        return response()->json([
            'data' => null,
            'status' => 200,
            'message' => 'Review has been permanently deleted'
        ], 200);
    }
}
