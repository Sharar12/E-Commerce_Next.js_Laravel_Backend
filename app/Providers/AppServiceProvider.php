<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

use App\Models\Category;
use App\Models\Product;
use App\Models\ShippingMethod;
use App\Models\Coupon;
use App\Models\Discount;
use App\Observers\CategoryObserver;
use App\Observers\ProductObserver;
use App\Observers\ShippingObserver;
use App\Observers\CouponObserver;
use App\Observers\DiscountObserver;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Category::observe(CategoryObserver::class);
        Product::observe(ProductObserver::class);
        ShippingMethod::observe(ShippingObserver::class);
        Coupon::observe(CouponObserver::class);
        Discount::observe(DiscountObserver::class);
    }
}
