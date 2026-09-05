<?php

namespace App\Observers;

use App\Models\Discount;
use Illuminate\Support\Facades\Cache;

class DiscountObserver
{
    public function saved(Discount $discount): void
    {
        Cache::forget('discounts:active');
    }

    public function deleted(Discount $discount): void
    {
        Cache::forget('discounts:active');
    }
}
