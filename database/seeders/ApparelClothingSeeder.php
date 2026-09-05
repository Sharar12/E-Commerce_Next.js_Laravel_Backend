<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;

class ApparelClothingSeeder extends Seeder
{
    public function run(): void
    {
        // Category Level 1: Apparel & Clothing
        $l1 = Category::firstOrCreate([
            'name' => 'Apparel & Clothing',
        ], [
            'status' => 1,
            'description' => 'Fashion apparel and clothing for all occasions'
        ]);

        // 1. Men's Wear
        $l2_1 = Category::firstOrCreate([
            'name' => "Men's Wear",
            'parent_id' => $l1->id,
        ], [
            'status' => 1,
            'description' => "Men's clothing and fashion collection"
        ]);

        Category::firstOrCreate([
            'name' => 'Shirts & T-Shirts',
            'parent_id' => $l2_1->id,
        ], [
            'status' => 1,
            'description' => 'Casual and formal shirts, t-shirts and polos'
        ]);

        Category::firstOrCreate([
            'name' => 'Trousers & Jeans',
            'parent_id' => $l2_1->id,
        ], [
            'status' => 1,
            'description' => 'Denim jeans, formal trousers and chinos'
        ]);

        // 2. Women's Wear
        $l2_2 = Category::firstOrCreate([
            'name' => "Women's Wear",
            'parent_id' => $l1->id,
        ], [
            'status' => 1,
            'description' => "Women's fashion and apparel collection"
        ]);

        Category::firstOrCreate([
            'name' => 'Dresses & Skirts',
            'parent_id' => $l2_2->id,
        ], [
            'status' => 1,
            'description' => 'Casual and evening dresses, mini and maxi skirts'
        ]);

        Category::firstOrCreate([
            'name' => 'Tops & Blouses',
            'parent_id' => $l2_2->id,
        ], [
            'status' => 1,
            'description' => 'Stylish tops, formal blouses and shirts'
        ]);

        // 3. Outerwear & Sportswear
        $l2_3 = Category::firstOrCreate([
            'name' => 'Outerwear & Sportswear',
            'parent_id' => $l1->id,
        ], [
            'status' => 1,
            'description' => 'Jackets, winter coats and athletic activewear'
        ]);

        Category::firstOrCreate([
            'name' => 'Jackets & Coats',
            'parent_id' => $l2_3->id,
        ], [
            'status' => 1,
            'description' => 'Winter jackets, coats, blazers and hoodies'
        ]);

        Category::firstOrCreate([
            'name' => 'Activewear & Leggings',
            'parent_id' => $l2_3->id,
        ], [
            'status' => 1,
            'description' => 'Sports leggings, gym wear and tracksuits'
        ]);
    }
}
