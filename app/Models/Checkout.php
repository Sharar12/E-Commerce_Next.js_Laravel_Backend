<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Checkout extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'session_id',
        'email',
        'phone',
        'first_name',
        'last_name',
        'address',
        'city',
        'state',
        'zip_code',
        'country',
        'cart_items',
    ];

    protected $casts = [
        'cart_items' => 'array',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
