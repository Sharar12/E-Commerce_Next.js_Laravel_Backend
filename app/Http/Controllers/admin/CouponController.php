<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Coupon;
use Illuminate\Support\Facades\Validator;

class CouponController extends Controller
{
     /**
     * Display all coupons
     */
    public function index()
    {
        $coupons = Coupon::with('assignedUser')->withCount('usages')->latest()->get();

        return response()->json([
            'status' => 200,
            'data' => $coupons,
        ]);
    }

    /**
     * Store a new coupon
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'code' => 'required|string|max:50|unique:coupons,code',
            'description' => 'nullable|string',
            'discount_type' => 'required|in:percentage,fixed',
            'discount_value' => 'required|numeric|min:0',
            'min_purchase_amount' => 'nullable|numeric|min:0',
            'max_discount_amount' => 'nullable|numeric|min:0',
            'valid_from' => 'nullable|date',
            'valid_to' => 'nullable|date|after_or_equal:valid_from',
            'usage_limit' => 'nullable|integer|min:0',
            'status' => 'required|in:active,inactive',
            'visibility' => 'required|in:public,private,activity',
            'assigned_user_id' => 'required_if:visibility,private|nullable|exists:users,id',
            'activity_type' => 'required_if:visibility,activity|nullable|string|max:100',
            'activity_threshold' => 'required_if:visibility,activity|nullable|integer|min:1',
            'activity_description' => 'nullable|string',
        ]);

        $validator->after(function ($validator) use ($request) {
            $discountType = $request->input('discount_type');
            $discountValue = (float) $request->input('discount_value', 0);
            $minPurchase = (float) $request->input('min_purchase_amount', 0);
            $maxDiscount = $request->input('max_discount_amount');

            if ($discountType === 'fixed' && $minPurchase > 0 && $discountValue >= $minPurchase) {
                $validator->errors()->add('min_purchase_amount', 'Minimum purchase amount must be greater than the fixed discount value.');
            }

            if ($maxDiscount !== null && $maxDiscount !== '' && $minPurchase > 0 && (float) $maxDiscount > $minPurchase) {
                $validator->errors()->add('max_discount_amount', 'Maximum discount amount cannot exceed the minimum purchase amount.');
            }
        });

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ], 422);
        }

        $validated = $validator->validated();
        if ($validated['visibility'] === 'public') {
            $validated['assigned_user_id'] = null;
            $validated['activity_type'] = null;
            $validated['activity_threshold'] = 1;
            $validated['activity_description'] = null;
        } elseif ($validated['visibility'] === 'private') {
            $validated['activity_type'] = null;
            $validated['activity_threshold'] = 1;
            $validated['activity_description'] = null;
        } elseif ($validated['visibility'] === 'activity') {
            $validated['assigned_user_id'] = null;
        }

        $coupon = Coupon::create($validated);
        $coupon->load('assignedUser');

        return response()->json([
            'status' => 201,
            'message' => 'Coupon created successfully',
            'data' => $coupon,
        ]);
    }

    /**
     * Show a single coupon
     */
    public function show($id)
    {
        $coupon = Coupon::with('assignedUser')->find($id);

        if (!$coupon) {
            return response()->json([
                'status' => 404,
                'message' => 'Coupon not found',
            ], 404);
        }

        return response()->json([
            'status' => 200,
            'data' => $coupon,
        ]);
    }

    /**
     * Update an existing coupon
     */
    public function update(Request $request, $id)
    {
        $coupon = Coupon::find($id);

        if (!$coupon) {
            return response()->json([
                'status' => 404,
                'message' => 'Coupon not found',
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'code' => 'sometimes|required|string|max:50|unique:coupons,code,' . $coupon->id,
            'description' => 'nullable|string',
            'discount_type' => 'sometimes|required|in:percentage,fixed',
            'discount_value' => 'sometimes|required|numeric|min:0',
            'min_purchase_amount' => 'nullable|numeric|min:0',
            'max_discount_amount' => 'nullable|numeric|min:0',
            'valid_from' => 'nullable|date',
            'valid_to' => 'nullable|date|after_or_equal:valid_from',
            'usage_limit' => 'nullable|integer|min:0',
            'status' => 'sometimes|required|in:active,inactive',
            'visibility' => 'sometimes|required|in:public,private,activity',
            'assigned_user_id' => 'required_if:visibility,private|nullable|exists:users,id',
            'activity_type' => 'required_if:visibility,activity|nullable|string|max:100',
            'activity_threshold' => 'required_if:visibility,activity|nullable|integer|min:1',
            'activity_description' => 'nullable|string',
        ]);

        $validator->after(function ($validator) use ($request, $coupon) {
            $discountType = $request->input('discount_type', $coupon->discount_type);
            $discountValue = (float) $request->input('discount_value', $coupon->discount_value);
            $minPurchase = (float) $request->input('min_purchase_amount', $coupon->min_purchase_amount);
            $maxDiscount = $request->input('max_discount_amount', $coupon->max_discount_amount);

            if ($discountType === 'fixed' && $minPurchase > 0 && $discountValue >= $minPurchase) {
                $validator->errors()->add('min_purchase_amount', 'Minimum purchase amount must be greater than the fixed discount value.');
            }

            if ($maxDiscount !== null && $maxDiscount !== '' && $minPurchase > 0 && (float) $maxDiscount > $minPurchase) {
                $validator->errors()->add('max_discount_amount', 'Maximum discount amount cannot exceed the minimum purchase amount.');
            }
        });

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ], 422);
        }

        $validated = $validator->validated();
        if (isset($validated['visibility'])) {
            if ($validated['visibility'] === 'public') {
                $validated['assigned_user_id'] = null;
                $validated['activity_type'] = null;
                $validated['activity_threshold'] = 1;
                $validated['activity_description'] = null;
            } elseif ($validated['visibility'] === 'private') {
                $validated['activity_type'] = null;
                $validated['activity_threshold'] = 1;
                $validated['activity_description'] = null;
            } elseif ($validated['visibility'] === 'activity') {
                $validated['assigned_user_id'] = null;
            }
        }

        $coupon->update($validated);
        $coupon->load('assignedUser');

        return response()->json([
            'status' => 200,
            'message' => 'Coupon updated successfully',
            'data' => $coupon,
        ]);
    }

    /**
     * Delete a coupon
     */
    public function destroy($id)
    {
        $coupon = Coupon::find($id);

        if (!$coupon) {
            return response()->json([
                'status' => 404,
                'message' => 'Coupon not found',
            ], 404);
        }

        $coupon->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Coupon deleted successfully',
        ], 200);
    }

    /**
     * Verify coupon code against cart amount
     */
    public function verifyCoupon(Request $request)
    {
        $code = strtoupper(trim($request->input('code', '')));
        $subtotal = (float) $request->input('subtotal', 0);
        $userId = $request->input('user_id');

        if (empty($code)) {
            return response()->json(['status' => 400, 'message' => 'Please enter a coupon code.'], 400);
        }

        $coupon = Coupon::where('code', $code)->first();

        if (!$coupon) {
            return response()->json(['status' => 404, 'message' => 'Invalid or non-existent promo coupon code.'], 404);
        }

        if ($coupon->status !== 'active') {
            return response()->json(['status' => 400, 'message' => 'This promo coupon is currently inactive.'], 400);
        }

        $now = now();
        if ($coupon->valid_from && $now->lt(\Carbon\Carbon::parse($coupon->valid_from)->startOfDay())) {
            return response()->json(['status' => 400, 'message' => 'This promo coupon is not active yet.'], 400);
        }

        if ($coupon->valid_to && $now->gt(\Carbon\Carbon::parse($coupon->valid_to)->endOfDay())) {
            return response()->json(['status' => 400, 'message' => 'This promo coupon has expired.'], 400);
        }

        if ($coupon->min_purchase_amount && $subtotal < (float) $coupon->min_purchase_amount) {
            return response()->json([
                'status' => 400,
                'message' => 'Minimum purchase amount of ৳' . number_format($coupon->min_purchase_amount, 2) . ' is required to redeem this coupon.'
            ], 400);
        }

        // Usage limit check
        if ($coupon->usage_limit !== null && $coupon->usage_limit > 0) {
            $timesUsed = \App\Models\CouponUsage::where('coupon_id', $coupon->id)->count();
            if ($timesUsed >= (int) $coupon->usage_limit) {
                return response()->json([
                    'status' => 400,
                    'message' => 'This promo coupon has reached its maximum total usage limit (' . $coupon->usage_limit . ' redemptions).'
                ], 400);
            }
        }

        if ($coupon->visibility === 'private' && $coupon->assigned_user_id) {
            if (!$userId || (int)$userId !== (int)$coupon->assigned_user_id) {
                return response()->json(['status' => 403, 'message' => 'This private coupon code is exclusive to a specific customer account.'], 403);
            }
        }

        // Calculate discount amount
        $calculatedDiscount = 0;
        if ($coupon->discount_type === 'percentage') {
            $calculatedDiscount = ($subtotal * (float) $coupon->discount_value) / 100;
            if ($coupon->max_discount_amount && $calculatedDiscount > (float) $coupon->max_discount_amount) {
                $calculatedDiscount = (float) $coupon->max_discount_amount;
            }
        } else {
            $calculatedDiscount = (float) $coupon->discount_value;
        }

        // Discount cannot exceed subtotal
        if ($calculatedDiscount > $subtotal) {
            $calculatedDiscount = $subtotal;
        }

        return response()->json([
            'status' => 200,
            'message' => 'Coupon applied successfully!',
            'data' => [
                'code' => $coupon->code,
                'discount_type' => $coupon->discount_type,
                'discount_value' => (float) $coupon->discount_value,
                'calculated_discount' => round($calculatedDiscount, 2),
                'coupon' => $coupon
            ]
        ], 200);
    }
}
