<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Payment;
use App\Models\OrderShipping;
use App\Models\ShippingMethod;
use Carbon\Carbon;
use Illuminate\Support\Str;

class RealisticDataSeeder extends Seeder
{
    public function run()
    {
        $products = Product::all();
        if ($products->isEmpty()) {
            $this->command->error('No products found in database! Please seed products first.');
            return;
        }

        // Ensure we have customer users
        $customers = User::where('role', '!=', 'admin')->get();
        if ($customers->isEmpty()) {
            for ($i = 1; $i <= 10; $i++) {
                $customers->push(User::create([
                    'name' => "Patron Customer {$i}",
                    'email' => "customer{$i}@lumina.com",
                    'password' => bcrypt('password123'),
                    'role' => 'customer',
                ]));
            }
        }

        $sm = ShippingMethod::first();
        $smId = $sm ? $sm->id : null;

        $addresses = [
            'House 42, Road 11, Banani, Dhaka 1213',
            'Flat 5B, Gulshan Avenue, Dhaka 1212',
            'House 15, Road 27, Dhanmondi, Dhaka 1209',
            'Sector 4, Road 12, Uttara, Dhaka 1230',
            'East Nasirabad, GEC Circle, Chattogram 4000',
            'Zindabazar Luxury Suite, Sylhet 3100',
        ];

        $paymentMethods = ['card', 'mobile_banking', 'COD'];
        $statuses = ['delivered', 'delivered', 'delivered', 'shipped', 'processing', 'pending', 'cancelled'];

        // Generate sales history across the last 12 months (e.g. Aug 2025 to Jul 2026)
        $now = Carbon::now();
        
        $totalOrdersCreated = 0;

        for ($monthOffset = 11; $monthOffset >= 0; $monthOffset--) {
            $targetMonth = $now->copy()->subMonths($monthOffset);
            // Create 5 to 12 orders per month
            $ordersInMonthCount = rand(5, 12);

            for ($i = 0; $i < $ordersInMonthCount; $i++) {
                // Pick a random day/time within targetMonth
                $dayInMonth = rand(1, min(28, $targetMonth->daysInMonth));
                $hour = rand(9, 21);
                $minute = rand(0, 59);
                $orderDate = $targetMonth->copy()->day($dayInMonth)->hour($hour)->minute($minute);

                $user = $customers->random();
                $status = $statuses[rand(0, count($statuses) - 1)];

                // Pick 1 to 3 products
                $orderProducts = $products->random(rand(1, min(3, $products->count())));
                $totalAmount = 0;
                $itemsData = [];

                foreach ($orderProducts as $prod) {
                    $qty = rand(1, 3);
                    $price = Number_format((float)($prod->base_price ?? rand(2000, 15000)), 2, '.', '');
                    $lineTotal = $price * $qty;
                    $totalAmount += $lineTotal;

                    $itemsData[] = [
                        'product_id' => $prod->id,
                        'quantity' => $qty,
                        'price_at_purchase' => $price,
                        'discount_applied' => 0,
                    ];
                }

                $discountAmount = rand(0, 1) ? rand(100, 500) : 0;
                $shippingFee = 120;
                $finalAmount = max(0, $totalAmount - $discountAmount + $shippingFee);

                $order = Order::create([
                    'order_code' => Order::generateUniqueOrderCode(),
                    'user_id' => $user->id,
                    'total_amount' => $totalAmount,
                    'discount_amount' => $discountAmount,
                    'shipping_fee' => $shippingFee,
                    'final_amount' => $finalAmount,
                    'status' => $status,
                    'created_at' => $orderDate,
                    'updated_at' => $orderDate,
                ]);

                foreach ($itemsData as $item) {
                    OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $item['product_id'],
                        'quantity' => $item['quantity'],
                        'price_at_purchase' => $item['price_at_purchase'],
                        'discount_applied' => $item['discount_applied'],
                        'created_at' => $orderDate,
                        'updated_at' => $orderDate,
                    ]);
                }

                // Payment (Success for delivered, shipped, paid, processing)
                $paymentStatus = in_array($status, ['delivered', 'shipped', 'processing']) ? 'success' : ($status === 'cancelled' ? 'failed' : 'pending');
                
                Payment::create([
                    'order_id' => $order->id,
                    'payment_method' => $paymentMethods[rand(0, 2)],
                    'transaction_id' => 'TXN-' . strtoupper(Str::random(10)),
                    'amount' => $finalAmount,
                    'status' => $paymentStatus,
                    'created_at' => $orderDate,
                    'updated_at' => $orderDate,
                ]);

                // Shipping
                OrderShipping::create([
                    'order_id' => $order->id,
                    'shipping_method_id' => $smId,
                    'address' => $addresses[rand(0, count($addresses) - 1)],
                    'tracking_number' => 'TRK-' . strtoupper(Str::random(8)),
                    'created_at' => $orderDate,
                    'updated_at' => $orderDate,
                ]);

                $totalOrdersCreated++;
            }
        }

        $this->command->info("Successfully seeded {$totalOrdersCreated} realistic orders across 12 months!");
    }
}
