<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    /**
     * 🧾 Display all orders
     */
    public function index()
    {
        $orders = Order::with(['user', 'items.product', 'items.variant', 'shipping.shippingMethod', 'payment', 'transactions'])->latest()->get();

        return response()->json([
            'success' => true,
            'status' => 200,
            'data' => $orders
        ], 200);
    }

    /**
     * 🆕 Store a new order in MySQL database with items
     */
    public function store(Request $request)
    {
        $userId = $request->user() ? $request->user()->id : $request->input('user_id');

        // Fallback user if non-logged in patron completes checkout
        if (!$userId) {
            $user = User::where('role', 'customer')->first() ?? User::first();
            $userId = $user ? $user->id : 1;
        }

        return \Illuminate\Support\Facades\DB::transaction(function () use ($request, $userId) {
            $items = $request->input('items', []);

            // 1. Verify stock availability and lock rows
            foreach ($items as $item) {
                $productId = isset($item['product_id']) ? $item['product_id'] : (isset($item['product']) ? $item['product']['id'] : null);
                $qty = $item['quantity'] ?? 1;

                if ($productId) {
                    $product = \App\Models\Product::where('id', $productId)->lockForUpdate()->first();
                    if (!$product || $product->stock_quantity < $qty) {
                        $name = $product ? $product->name : "Product #{$productId}";
                        $avail = $product ? $product->stock_quantity : 0;
                        return response()->json([
                            'success' => false,
                            'status' => 422,
                            'message' => "Insufficient stock for '{$name}'. Available stock: {$avail}, requested: {$qty}.",
                        ], 422);
                    }
                }
            }

            // 2. Create Order
            $order = Order::create([
                'user_id' => $userId,
                'total_amount' => $request->input('total_amount', 0),
                'discount_amount' => $request->input('discount_amount', 0),
                'shipping_fee' => $request->input('shipping_fee', 0),
                'final_amount' => $request->input('final_amount', 0),
                'status' => 'pending',
            ]);

            // 3. Attach Order items & decrement product stock
            foreach ($items as $item) {
                $productId = isset($item['product_id']) ? $item['product_id'] : (isset($item['product']) ? $item['product']['id'] : null);
                $qty = $item['quantity'] ?? 1;

                if ($productId) {
                    \App\Models\OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $productId,
                        'quantity' => $qty,
                        'price_at_purchase' => $item['price'] ?? 0,
                        'discount_applied' => 0,
                    ]);

                    // Deduct stock quantity
                    \App\Models\Product::where('id', $productId)->decrement('stock_quantity', $qty);
                }
            }

        // Automatically record Transaction entry
        $paymentMethodInput = strtolower($request->input('payment_method', 'card'));
        $mappedMethod = 'card';
        if (in_array($paymentMethodInput, ['bkash', 'nagad', 'mobile_banking'])) {
            $mappedMethod = 'mobile_banking';
        } elseif ($paymentMethodInput === 'cod') {
            $mappedMethod = 'COD';
        }

        $trxRef = $request->input('transaction_reference') ?? ('TRX-' . strtoupper(substr(md5(time() . rand()), 0, 8)));
        $mobileNum = $request->input('mobile_number');
        $cardNumber = $request->input('card_number');

        if ($paymentMethodInput === 'card' && $cardNumber) {
            $cleanCard = preg_replace('/\D/', '', $cardNumber);
            $last4 = substr($cleanCard, -4);
            $payDetails = "**** **** **** " . ($last4 ?: "8888");
        } elseif ($paymentMethodInput === 'card') {
            $payDetails = "**** **** **** 8888";
        } elseif ($mobileNum) {
            $payDetails = $mobileNum;
        } else {
            $payDetails = "N/A";
        }

        $remarks = "Order #" . $order->id . " payment via " . strtoupper($paymentMethodInput) . " [" . $payDetails . "]";

        \App\Models\Transaction::create([
            'user_id' => $userId,
            'order_id' => $order->id,
            'transaction_type' => 'debit',
            'method' => $mappedMethod,
            'transaction_reference' => $trxRef,
            'amount' => $order->final_amount ?: $order->total_amount,
            'currency' => 'BDT',
            'status' => $mappedMethod === 'COD' ? 'pending' : 'success',
            'remarks' => $remarks,
            'processed_at' => now(),
        ]);

        // Automatically record CouponUsage entry if coupon code was redeemed
        $couponCodeInput = $request->input('coupon_code');
        if ($couponCodeInput) {
            $couponModel = \App\Models\Coupon::where('code', strtoupper(trim($couponCodeInput)))->first();
            if ($couponModel) {
                \App\Models\CouponUsage::create([
                    'coupon_id' => $couponModel->id,
                    'user_id' => $userId,
                    'order_id' => $order->id,
                    'used_at' => now(),
                ]);
            }
        }

        $order->load(['items.product', 'user']);

        return response()->json([
            'success' => true,
            'status' => 200,
            'message' => 'Order created successfully in database',
            'data' => $order
        ], 200);
        });
    }

    /**
     * Fetch orders for current customer / user
     */
    public function userOrders(Request $request)
    {
        $user = $request->user() ?? auth('sanctum')->user();
        $userId = $user ? $user->id : $request->input('user_id');

        if (!$userId) {
            return response()->json([
                'success' => true,
                'data' => []
            ]);
        }

        $orders = Order::where('user_id', $userId)
            ->with(['items.product.images', 'user'])
            ->latest()
            ->get();

        return response()->json([
            'success' => true,
            'data' => $orders
        ]);
    }

    /**
     * 📦 Show a single order
     */
    public function show($id)
    {
        $order = Order::with(['user', 'items.product', 'items.variant', 'shipping.shippingMethod', 'payment'])->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $order
        ], 200);
    }

    /**
     * ✏️ Update order
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'sometimes|exists:users,id',
            'total_amount' => 'sometimes|numeric|min:0',
            'discount_amount' => 'sometimes|numeric|min:0',
            'shipping_fee' => 'sometimes|numeric|min:0',
            'final_amount' => 'sometimes|numeric|min:0',
            'status' => 'sometimes|in:pending,processing,shipped,delivered,cancelled',
        ]);

        return \Illuminate\Support\Facades\DB::transaction(function () use ($request, $id, $validator) {
            $order = Order::with('items.product')->where('id', $id)->lockForUpdate()->first();

            if (!$order) {
                return response()->json([
                    'success' => false,
                    'message' => 'Order not found',
                ], 404);
            }

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'errors' => $validator->errors(),
                ], 422);
            }

            $validatedData = $validator->validated();
            $oldStatus = $order->status;
            $newStatus = isset($validatedData['status']) ? $validatedData['status'] : $oldStatus;

            // Enforce immutable terminal status check: once delivered or cancelled, status cannot be changed
            if (in_array(strtolower($oldStatus), ['delivered', 'cancelled']) && strtolower($newStatus) !== strtolower($oldStatus)) {
                return response()->json([
                    'success' => false,
                    'status' => 422,
                    'message' => "Order status is locked as '{$oldStatus}' and cannot be modified further.",
                ], 422);
            }

            // Scenario A: Admin CANCELS active order -> Restore product stock
            if ($newStatus === 'cancelled' && $oldStatus !== 'cancelled') {
                foreach ($order->items as $item) {
                    if ($item->product_id) {
                        \App\Models\Product::where('id', $item->product_id)->increment('stock_quantity', $item->quantity);
                    }
                }
            }

            // Scenario B: Admin REACTIVATES previously cancelled order -> Deduct product stock
            if ($oldStatus === 'cancelled' && $newStatus !== 'cancelled') {
                foreach ($order->items as $item) {
                    if ($item->product_id) {
                        $product = \App\Models\Product::where('id', $item->product_id)->lockForUpdate()->first();
                        if (!$product || $product->stock_quantity < $item->quantity) {
                            $name = $product ? $product->name : "Product #{$item->product_id}";
                            $avail = $product ? $product->stock_quantity : 0;
                            return response()->json([
                                'success' => false,
                                'status' => 422,
                                'message' => "Cannot reactivate order. '{$name}' has only {$avail} item(s) in stock (requested {$item->quantity}).",
                            ], 422);
                        }
                    }
                }

                foreach ($order->items as $item) {
                    if ($item->product_id) {
                        \App\Models\Product::where('id', $item->product_id)->decrement('stock_quantity', $item->quantity);
                    }
                }
            }

            $order->update($validatedData);

            return response()->json([
                'success' => true,
                'message' => 'Order updated successfully',
                'data' => $order
            ], 200);
        });
    }

    /**
     * 🗑️ Soft Delete order
     */
    public function destroy($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
            ], 404);
        }

        $order->delete();

        return response()->json([
            'success' => true,
            'message' => 'Order deleted successfully (soft deleted)',
        ], 200);
    }

    /**
     * 🔁 Restore a soft-deleted order
     */
    public function restore($id)
    {
        $order = Order::withTrashed()->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
            ], 404);
        }

        $order->restore();

        return response()->json([
            'success' => true,
            'message' => 'Order restored successfully',
            'data' => $order
        ], 200);
    }

    /**
     * 🚮 Permanently delete a soft-deleted order
     */
    public function forceDelete($id)
    {
        $order = Order::withTrashed()->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
            ], 404);
        }

        $order->forceDelete();

        return response()->json([
            'success' => true,
            'message' => 'Order permanently deleted',
        ], 200);
    }
}
