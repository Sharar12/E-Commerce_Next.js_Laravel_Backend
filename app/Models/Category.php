<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ['parent_id', 'name', 'status', 'description', 'image'];

    // Products belonging to this category
    public function products()
    {
        return $this->hasMany(Product::class);
    }

    // Direct children (one level down)
    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    // Children with their own children (full 3-level eager load)
    public function childrenWithGrandchildren()
    {
        return $this->hasMany(Category::class, 'parent_id')->with('children');
    }

    // Parent category
    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }
}
