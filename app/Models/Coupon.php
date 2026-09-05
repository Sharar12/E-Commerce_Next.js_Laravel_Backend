<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory;

    protected $fillable = [
        'code',
        'description',
        'discount_type',
        'discount_value',
        'min_purchase_amount',
        'max_discount_amount',
        'valid_from',
        'valid_to',
        'usage_limit',
        'status',
        'visibility',
        'assigned_user_id',
        'activity_type',
        'activity_threshold',
        'activity_description',
    ];

    public function assignedUser()
    {
        return $this->belongsTo(User::class, 'assigned_user_id');
    }

    public function usages()
    {
        return $this->hasMany(CouponUsage::class, 'coupon_id');
    }

    // protected $casts = [
    //     'discount_value' => 'decimal:2',
    //     'min_purchase_amount' => 'decimal:2',
    //     'max_discount_amount' => 'decimal:2',
    //     'valid_from' => 'date',
    //     'valid_to' => 'date',
    // ];
}
