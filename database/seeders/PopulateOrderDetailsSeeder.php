<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Order;
use App\Models\OrderShipping;
use App\Models\Payment;
use App\Models\ShippingMethod;

class PopulateOrderDetailsSeeder extends Seeder
{
    public function run()
    {
        $orders = Order::all();
        $sm = ShippingMethod::first();
        $smId = $sm ? $sm->id : null;

        $addresses = [
            '12 Gulshan Avenue, Suite 402, Dhaka 1212',
            '45 Banani Road 11, Block C, Dhaka 1213',
            '78 Dhanmondi Lake View, Road 27, Dhaka 1209',
            '99 Uttara Sector 3, Sonargaon Janapath, Dhaka 1230',
        ];

        $paymentMethods = ['card', 'mobile_banking', 'COD'];
        $statuses = ['success', 'pending', 'failed'];

        foreach ($orders as $order) {
            if (!$order->payment) {
                Payment::create([
                    'order_id' => $order->id,
                    'payment_method' => $paymentMethods[rand(0, 2)],
                    'transaction_id' => 'PAY-TXN-' . strtoupper(substr(md5(rand()), 0, 10)),
                    'amount' => $order->final_amount,
                    'status' => $statuses[rand(0, 2)],
                ]);
            }

            if (!$order->shipping) {
                OrderShipping::create([
                    'order_id' => $order->id,
                    'shipping_method_id' => $smId,
                    'address' => $addresses[rand(0, count($addresses) - 1)],
                    'tracking_number' => 'TRK-' . strtoupper(substr(md5(rand()), 0, 8)),
                ]);
            }
        }

        $this->command->info('Populated missing order shipping & payment records!');
    }
}
