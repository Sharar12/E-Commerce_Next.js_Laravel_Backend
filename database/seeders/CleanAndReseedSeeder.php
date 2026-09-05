<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class CleanAndReseedSeeder extends Seeder
{
    public function run(): void
    {
        $this->command->info('🔴 Disabling foreign key checks...');
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        // ── Truncate all data tables (leaf → parent order) ──────────────────
        $tables = [
            'checkouts',
            'payments',
            'transactions',
            'order_shippings',
            'coupon_usages',
            'order_items',
            'reviews',
            'wishlists',
            'inventory_logs',
            'discounts',
            'notifications',
            'orders',
            'product_images',
            'product_variants',
            'products',
            'coupons',
            'categories',
            'brands',
            'sizes',
            'shippings',
            'shipping_methods',
            'personal_access_tokens',
            'users',
        ];

        foreach ($tables as $table) {
            DB::table($table)->truncate();
            $this->command->line("  ✓ Truncated: {$table}");
        }

        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
        $this->command->info('🟢 Foreign key checks re-enabled.');

        // ── Re-seed the two users ────────────────────────────────────────────
        $this->command->info('👤 Creating users...');

        // Admin user
        User::create([
            'name'     => 'Admin',
            'email'    => 'admin@gmail.com',
            'password' => Hash::make('11111111'),
            'role'     => 'admin',
        ]);
        $this->command->line('  ✓ Admin: admin@gmail.com / 11111111');

        // Customer user
        User::create([
            'name'     => 'Alex',
            'email'    => 'A@gmail.com',
            'password' => Hash::make('11111111'),
            'role'     => 'customer',
        ]);
        $this->command->line('  ✓ Customer: A@gmail.com / 11111111');

        $this->command->info('');
        $this->command->info('✅ Done! All data cleared. 2 users re-created.');
    }
}
