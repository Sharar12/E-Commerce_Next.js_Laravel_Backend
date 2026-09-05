<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;

class ConsumerElectronicsSeeder extends Seeder
{
    public function run(): void
    {
        $l1 = Category::firstOrCreate(['id' => 1], [
            'name' => 'Consumer Electronics',
            'status' => 1,
            'description' => 'Electronic devices and gadgets'
        ]);
        $l1->update(['name' => 'Consumer Electronics', 'parent_id' => null, 'status' => 1]);

        // 1. Computers & Laptops
        $l2_1 = Category::updateOrCreate(['id' => 2], [
            'name' => 'Computers & Laptops',
            'parent_id' => $l1->id,
            'status' => 1,
            'description' => 'Computers, laptops and accessories'
        ]);

        Category::updateOrCreate(['id' => 4], [
            'name' => 'Laptops & Ultrabooks',
            'parent_id' => $l2_1->id,
            'status' => 1,
            'description' => 'Portable laptops and ultrabooks'
        ]);

        Category::firstOrCreate([
            'name' => 'Desktop PCs & Workstations',
            'parent_id' => $l2_1->id,
        ], [
            'status' => 1,
            'description' => 'Desktop computers and workstations'
        ]);

        // 2. Audio Devices
        $l2_2 = Category::firstOrCreate([
            'name' => 'Audio Devices',
            'parent_id' => $l1->id,
        ], [
            'status' => 1,
            'description' => 'Headphones, speakers and sound systems'
        ]);

        Category::firstOrCreate([
            'name' => 'Headphones & Earbuds',
            'parent_id' => $l2_2->id,
        ], [
            'status' => 1,
            'description' => 'Wired and wireless headphones and earbuds'
        ]);

        Category::firstOrCreate([
            'name' => 'Speakers & Soundbars',
            'parent_id' => $l2_2->id,
        ], [
            'status' => 1,
            'description' => 'Bluetooth speakers and TV soundbars'
        ]);

        // 3. Mobile Devices & Accessories
        $l2_3 = Category::firstOrCreate([
            'name' => 'Mobile Devices & Accessories',
            'parent_id' => $l1->id,
        ], [
            'status' => 1,
            'description' => 'Smartphones, power banks and chargers'
        ]);

        Category::firstOrCreate([
            'name' => 'Smartphones',
            'parent_id' => $l2_3->id,
        ], [
            'status' => 1,
            'description' => 'Android and iOS smartphones'
        ]);

        Category::firstOrCreate([
            'name' => 'Power Banks & Chargers',
            'parent_id' => $l2_3->id,
        ], [
            'status' => 1,
            'description' => 'Portable power banks and fast chargers'
        ]);
    }
}
