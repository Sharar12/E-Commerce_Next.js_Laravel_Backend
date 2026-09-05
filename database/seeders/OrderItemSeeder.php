<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\OrderItem;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductVariant;
use Illuminate\Support\Facades\DB;

class OrderItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('order_items')->truncate();

        $orders = Order::all();
        $products = Product::all();
        $variants = ProductVariant::pluck('id')->toArray();

        if ($orders->isEmpty() || $products->isEmpty()) {
            return;
        }

        foreach ($orders as $order) {
            // Create 1-3 line items per order
            $itemCount = rand(1, 3);
            for ($k = 0; $k < $itemCount; $k++) {
                $product = $products->random();
                $variantId = !empty($variants) && rand(0, 1) ? $variants[array_rand($variants)] : null;
                $qty = rand(1, 3);
                $unitPrice = $product->price ?? rand(500, 5000);
                $discount = rand(0, 1) ? rand(50, 300) : 0;

                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $product->id,
                    'variant_id' => $variantId,
                    'quantity' => $qty,
                    'price_at_purchase' => $unitPrice,
                    'discount_applied' => $discount,
                ]);
            }
        }
    }
}
