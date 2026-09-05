<?php

use App\Http\Controllers\admin\AuthController;
use App\Http\Controllers\admin\BrandController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\CouponController;
use App\Http\Controllers\admin\InventoryLogController;
use App\Http\Controllers\admin\OrderItemController;
use App\Http\Controllers\admin\SizeController;
use App\Http\Controllers\admin\ShippingController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\ProductVariantController;
use App\Http\Controllers\admin\ReviewController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\admin\WishlistController;
use App\Http\Controllers\admin\DashboardController;
use App\Http\Controllers\CouponUsageController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\OrderShippingController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ShippingMethodController;
use App\Http\Controllers\TransactionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\OrderController;
use App\Http\Controllers\admin\CheckoutController;
use App\Http\Controllers\admin\ProductChatController;




// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

// Named login route for Sanctum unauthenticated fallback
Route::get('/login', function () {
    return response()->json(['message' => 'Unauthenticated'], 401);
})->name('login');

// Admin Authentication Login & Registration
Route::post('/admin/login', [AuthController::class, 'authenticate']);
Route::post('/admin/register', [AuthController::class, 'register']);

// Public Product, Category, Discount & Checkout Routes
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/{id}', [ProductController::class, 'show']);
// Public active category tree (3 levels) — must be BEFORE /categories/{id} to avoid route conflict
Route::get('/categories/tree', [CategoryController::class, 'tree']);
Route::get('/categories', [CategoryController::class, 'index']);
Route::get('/discounts', [DiscountController::class, 'index']);
Route::get('/transactions', [TransactionController::class, 'index']);
Route::get('/orders', [OrderController::class, 'index']);
Route::get('/coupons', [CouponController::class, 'index']);
Route::get('/coupon-usages', [CouponUsageController::class, 'index']);
Route::post('/coupons/verify', [CouponController::class, 'verifyCoupon']);

// Public & Patron Review Routes
Route::get('/reviews', [ReviewController::class, 'index']);
Route::get('/reviews/check-eligibility', [ReviewController::class, 'checkEligibility']);
Route::post('/reviews', [ReviewController::class, 'store']);

// Public Checkout & Order endpoints
Route::get('/checkout/draft', [CheckoutController::class, 'show']);
Route::post('/checkout/draft', [CheckoutController::class, 'store']);
Route::delete('/checkout/draft', [CheckoutController::class, 'destroy']);
Route::post('/orders/place', [OrderController::class, 'store']);
Route::get('/orders/user-orders', [OrderController::class, 'userOrders']);

// Public Product Variants (read-only)
Route::get('/product-variants', [ProductVariantController::class, 'index']);
Route::get('/product-variants/{id}', [ProductVariantController::class, 'show']);

// Public Product Questions / Chat Routes
Route::get('/products/{id}/chats', [ProductChatController::class, 'publicChats']);
Route::post('/products/{id}/chats', [ProductChatController::class, 'storePublicChat']);

Route::group(['middleware' => ['auth:sanctum']], function () {

    // Customer Chats (Admin)
    Route::get('/admin/customer-chats', [ProductChatController::class, 'indexAdminChats']);
    Route::post('/admin/customer-chats/{id}/reply', [ProductChatController::class, 'replyAdminChat']);
    Route::delete('/admin/customer-chats/{id}', [ProductChatController::class, 'deleteAdminChat']);

    // Admin Dashboard Stats
    Route::get('/dashboard/stats', [DashboardController::class, 'stats']);
    Route::get('/admin/dashboard/stats', [DashboardController::class, 'stats']);

    // User Accounts
    Route::get('/users', [UserController::class, 'index']);
    Route::post('/users', [UserController::class, 'store']);
    Route::get('/users/{id}', [UserController::class, 'show']);
    Route::put('/users/{id}', [UserController::class, 'update']);
    Route::delete('/users/{id}', [UserController::class, 'destroy']);

    // Admin Brand Routes
    Route::post('/brands', [BrandController::class, 'store']);
    Route::get('/brands', [BrandController::class, 'index']);
    Route::get('/brands/{id}', [BrandController::class, 'show']);
    Route::put('/brands/{id}', [BrandController::class, 'update']);
    Route::delete('/brands/{id}', [BrandController::class, 'destroy']);

    // Admin Category Routes
    Route::get('/admin/categories', [CategoryController::class, 'index']);
    Route::post('/categories/', [CategoryController::class, 'store']);
    Route::get('/categories/{id}', [CategoryController::class, 'show']);
    Route::put('/categories/{id}', [CategoryController::class, 'update']);
    Route::delete('/categories/{id}', [CategoryController::class, 'destroy']);

    // Admin Sizes Routes
    Route::post('/sizes/', [SizeController::class, 'store']);
    Route::get('/sizes', [SizeController::class, 'index']);
    Route::get('/sizes/{id}', [SizeController::class, 'show']);
    Route::put('/sizes/{id}', [SizeController::class, 'update']);
    Route::delete('/sizes/{id}', [SizeController::class, 'destroy']);

    // Admin Shipping Routes
    Route::post('/shippings/store', [ShippingController::class, 'store']);
    Route::get('/shippings', [ShippingController::class, 'index']);
    Route::get('/shippings/{id}', [ShippingController::class, 'show']);
    Route::put('/shippings/{id}', [ShippingController::class, 'update']);

    // Admin Product Routes
    Route::prefix('products')->group(function () {
        Route::post('/', [ProductController::class, 'store']);
        Route::put('/{id}', [ProductController::class, 'update']);
        Route::delete('/{id}', [ProductController::class, 'destroy']);
        Route::post('/restore/{id}', [ProductController::class, 'restore']);
        Route::delete('/force-delete/{id}', [ProductController::class, 'forceDelete']);
    });
    //Product variants (write only - reads are public)
        Route::post('/product-variants', [ProductVariantController::class, 'store']);
        Route::put('/product-variants/{id}', [ProductVariantController::class, 'update']);
        Route::delete('/product-variants/{id}', [ProductVariantController::class, 'destroy']);
    // });

    // Route::prefix('admin')->group(function () {
        Route::get('/wishlists', [WishlistController::class, 'index']);
        Route::post('/wishlists', [WishlistController::class, 'store']);
        Route::get('/wishlists/{id}', [WishlistController::class, 'show']);
        Route::delete('/wishlists/{id}', [WishlistController::class, 'destroy']);
    // });

    // Admin Order Routes
    Route::prefix('orders')->group(function () {
        Route::get('/', [OrderController::class, 'index']);
        Route::get('/{id}', [OrderController::class, 'show']);
        Route::post('/', [OrderController::class, 'store']);
        Route::put('/{id}', [OrderController::class, 'update']);
        Route::delete('/{id}', [OrderController::class, 'destroy']);
        Route::post('/restore/{id}', [OrderController::class, 'restore']);
        Route::delete('/force-delete/{id}', [OrderController::class, 'forceDelete']);
    });

    Route::prefix('admin/orders')->group(function () {
        Route::get('/', [OrderController::class, 'index']);
        Route::get('/{id}', [OrderController::class, 'show']);
        Route::post('/', [OrderController::class, 'store']);
        Route::put('/{id}', [OrderController::class, 'update']);
        Route::put('/{id}/status', [OrderController::class, 'update']);
        Route::delete('/{id}', [OrderController::class, 'destroy']);
        Route::post('/restore/{id}', [OrderController::class, 'restore']);
        Route::delete('/force-delete/{id}', [OrderController::class, 'forceDelete']);
    });

        // order items
        Route::get('/order-items', [OrderItemController::class, 'index']);
        Route::post('/order-items', [OrderItemController::class, 'store']);
        Route::get('/order-items/{id}', [OrderItemController::class, 'show']);
        Route::put('/order-items/{id}', [OrderItemController::class, 'update']);
        Route::delete('/order-items/{id}', [OrderItemController::class, 'destroy']);
        Route::get('order-items/trashed', [OrderItemController::class, 'trashed']);
        Route::post('order-items/{id}/restore', [OrderItemController::class, 'restore']);
        Route::delete('order-items/{id}/force-delete', [OrderItemController::class, 'forceDelete']);

        // Reviews (admin operations)
        Route::get('/reviews/{id}',[ReviewController::class,'show']);
        Route::put('/reviews/{id}',[ReviewController::class,'update']);
        Route::delete('/reviews/{id}',[ReviewController::class,'destroy']); 



        // Inventory Log
        Route::get('/inventory-log',[InventoryLogController::class,'index']);
        Route::post('/inventory-log',[InventoryLogController::class,'store']);
        Route::get('/inventory-log/{id}',[InventoryLogController::class,'show']);
        Route::put('/inventory-log/{id}',[InventoryLogController::class,'update']);
        Route::delete('/inventory-log/{id}',[InventoryLogController::class,'destroy']); 



        // Discounts
        Route::post('/discounts',[DiscountController::class,'store']);
        Route::get('/discounts/{id}',[DiscountController::class,'show']);
        Route::put('/discounts/{id}',[DiscountController::class,'update']);
        Route::delete('/discounts/{id}',[DiscountController::class,'destroy']);

        // Notifications
        Route::get('/notifications',[NotificationController::class,'index']);
        Route::post('/notifications',[NotificationController::class,'store']);
        Route::get('/notifications/{id}',[NotificationController::class,'show']);
        Route::put('/notifications/{id}',[NotificationController::class,'update']);
        Route::delete('/notifications/{id}',[NotificationController::class,'destroy']);

        // Shipping Methods
        Route::get('/shipping-methods',[ShippingMethodController::class,'index']);
        Route::post('/shipping-methods',[ShippingMethodController::class,'store']);
        Route::get('/shipping-methods/{id}',[ShippingMethodController::class,'show']);
        Route::put('/shipping-methods/{id}',[ShippingMethodController::class,'update']);
        Route::delete('/shipping-methods/{id}',[ShippingMethodController::class,'destroy']);

        // Coupons
        Route::get('/coupons',[CouponController::class,'index']);
        Route::get('/admin/coupons',[CouponController::class,'index']);
        Route::post('/coupons',[CouponController::class,'store']);
        Route::post('/admin/coupons',[CouponController::class,'store']);
        // Route::get('/coupons/{id}',[CouponController::class,'show']);
        Route::put('/coupons/{id}',[CouponController::class,'update']);
        Route::put('/admin/coupons/{id}',[CouponController::class,'update']);
        Route::delete('/coupons/{id}',[CouponController::class,'destroy']);
        Route::delete('/admin/coupons/{id}',[CouponController::class,'destroy']);

        // Coupon Usages    
        Route::get('/coupon-usages',[CouponUsageController::class,'index']);
        Route::post('/coupon-usages',[CouponUsageController::class,'store']);
        Route::get('/coupon-usages/{id}',[CouponUsageController::class,'show']);
        Route::put('/coupon-usages/{id}',[CouponUsageController::class,'update']);
        Route::delete('/coupon-usages/{id}',[CouponUsageController::class,'destroy']);

        // Order Shippings  
        Route::get('/order-shippings',[OrderShippingController::class,'index']);
        Route::post('/order-shippings',[OrderShippingController::class,'store']);
        Route::get('/order-shippings/{id}',[OrderShippingController::class,'show']);
        Route::put('/order-shippings/{id}',[OrderShippingController::class,'update']);
        Route::delete('/order-shippings/{id}',[OrderShippingController::class,'destroy']);  

        // Transactions
        Route::post('/transactions',[TransactionController::class,'store']);
        Route::get('/transactions/{id}',[TransactionController::class,'show']);
        Route::put('/transactions/{id}',[TransactionController::class,'update']);
        Route::delete('/transactions/{id}',[TransactionController::class,'destroy']);

        // Payments Routes  
        Route::get('/payments',[PaymentController::class,'index']);
        Route::post('/payments',[PaymentController::class,'store']);
        Route::get('/payments/{id}',[PaymentController::class,'show']);
        Route::put('/payments/{id}',[PaymentController::class,'update']);
        Route::delete('/payments/{id}',[PaymentController::class,'destroy']);       





});












