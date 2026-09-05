<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Checkout;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CheckoutController extends Controller
{
    /**
     * Get or create checkout state for a user/session.
     */
    public function show(Request $request)
    {
        $userId = $request->user() ? $request->user()->id : null;
        $sessionId = $request->header('X-Session-ID') ?? $request->query('session_id');

        $checkout = null;

        if ($userId) {
            $checkout = Checkout::where('user_id', $userId)->first();
        } elseif ($sessionId) {
            $checkout = Checkout::where('session_id', $sessionId)->first();
        }

        if (!$checkout) {
            return response()->json([
                'status' => false,
                'message' => 'No active checkout state found',
                'data' => null
            ], 404);
        }

        return response()->json([
            'status' => true,
            'data' => $checkout
        ]);
    }

    /**
     * Save or update checkout draft (form fields & cart items).
     */
    public function store(Request $request)
    {
        $userId = $request->user() ? $request->user()->id : null;
        $sessionId = $request->header('X-Session-ID') ?? $request->input('session_id');

        if (!$userId && !$sessionId) {
            return response()->json([
                'status' => false,
                'message' => 'User or session identifier required'
            ], 400);
        }

        $data = [
            'email' => $request->input('email'),
            'phone' => $request->input('phone'),
            'first_name' => $request->input('first_name') ?? $request->input('firstName'),
            'last_name' => $request->input('last_name') ?? $request->input('lastName'),
            'address' => $request->input('address'),
            'city' => $request->input('city'),
            'state' => $request->input('state'),
            'zip_code' => $request->input('zip_code') ?? $request->input('zipCode'),
            'country' => $request->input('country'),
            'cart_items' => $request->input('cart_items') ?? $request->input('cartItems'),
        ];

        if ($userId) {
            $checkout = Checkout::updateOrCreate(
                ['user_id' => $userId],
                array_merge($data, ['session_id' => $sessionId])
            );
        } else {
            $checkout = Checkout::updateOrCreate(
                ['session_id' => $sessionId],
                $data
            );
        }

        return response()->json([
            'status' => true,
            'message' => 'Checkout state saved',
            'data' => $checkout
        ]);
    }

    /**
     * Delete checkout state when order is completed.
     */
    public function destroy(Request $request)
    {
        $userId = $request->user() ? $request->user()->id : null;
        $sessionId = $request->header('X-Session-ID') ?? $request->input('session_id') ?? $request->query('session_id');

        $deletedCount = 0;

        if ($userId) {
            $deletedCount = Checkout::where('user_id', $userId)->delete();
        }

        if ($sessionId) {
            $deletedCount += Checkout::where('session_id', $sessionId)->delete();
        }

        return response()->json([
            'status' => true,
            'message' => 'Checkout state cleared',
            'deleted' => $deletedCount
        ]);
    }
}
