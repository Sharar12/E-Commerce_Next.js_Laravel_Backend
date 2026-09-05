<?php

namespace App\Observers;

use App\Models\Product;
use Illuminate\Support\Facades\Cache;

class ProductObserver
{
    public function saved(Product $product): void
    {
        Cache::forget('product:' . $product->id);
        Cache::forget('products:list');
        Cache::forget('dashboard:stats');
        Cache::forget('categories:tree');
    }

    public function deleted(Product $product): void
    {
        Cache::forget('product:' . $product->id);
        Cache::forget('products:list');
        Cache::forget('dashboard:stats');
        Cache::forget('categories:tree');
    }
}
