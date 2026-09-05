<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\CouponUsage;
use App\Models\Coupon;
use App\Models\User;
use App\Models\Order;
use Illuminate\Support\Facades\DB;

class CouponUsageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('coupon_usages')->truncate();

        // Ensure all existing orders have an 8-character unique order_code
        $allOrders = Order::all();
        foreach ($allOrders as $ord) {
            if (empty($ord->order_code)) {
                $ord->order_code = Order::generateUniqueOrderCode();
                $ord->save();
            }
        }

        $coupons = Coupon::pluck('id')->toArray();
        $users = User::pluck('id')->toArray();
        $orders = Order::pluck('id')->toArray();

        if (empty($coupons) || empty($users) || empty($orders)) {
            return;
        }

        foreach ($orders as $orderId) {
            $uId = $users[array_rand($users)];
            $cId = $coupons[array_rand($coupons)];

            CouponUsage::create([
                'coupon_id' => $cId,
                'user_id' => $uId,
                'order_id' => $orderId,
                'used_at' => now()->subDays(rand(1, 20)),
            ]);
        }
    }
}
