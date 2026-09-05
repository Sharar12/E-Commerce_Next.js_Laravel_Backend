<?php

namespace App\Observers;

use App\Models\Category;
use Illuminate\Support\Facades\Cache;

class CategoryObserver
{
    public function saved(Category $category): void
    {
        Cache::forget('categories:tree');
        Cache::forget('categories:admin:tree');
    }

    public function deleted(Category $category): void
    {
        Cache::forget('categories:tree');
        Cache::forget('categories:admin:tree');
    }
}
