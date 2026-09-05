<?php

namespace App\Observers;

use App\Models\ShippingMethod;
use Illuminate\Support\Facades\Cache;

class ShippingObserver
{
    public function saved(ShippingMethod $shippingMethod): void
    {
        Cache::forget('shipping:methods');
    }

    public function deleted(ShippingMethod $shippingMethod): void
    {
        Cache::forget('shipping:methods');
    }
}
