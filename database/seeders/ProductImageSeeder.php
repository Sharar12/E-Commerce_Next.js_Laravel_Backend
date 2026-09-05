<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\ProductImage;

class ProductImageSeeder extends Seeder
{
    public function run(): void
    {
        $products = Product::all();
        $sampleImages = [
            '/storage/uploads/products/product_11_main.jpg',
            '/storage/uploads/products/product_12_main.jpg',
            '/storage/uploads/products/product_13_main.jpg',
            '/storage/uploads/products/product_14_main.jpg',
            '/storage/uploads/products/product_15_main.jpg',
            '/storage/uploads/products/product_16_main.jpg',
            '/storage/uploads/products/product_17_main.jpg',
            '/storage/uploads/products/product_18_main.jpg',
            '/storage/uploads/products/product_19_main.jpg',
            '/storage/uploads/products/product_32_main.jpg',
            '/storage/uploads/products/product_34_main.jpg',
            '/storage/uploads/products/product_35_main.jpg',
            '/storage/uploads/products/product_36_main.jpg',
            '/storage/uploads/products/product_37_main.jpg',
            '/storage/uploads/products/product_38_main.jpg',
            '/storage/uploads/products/product_39_main.jpg',
            '/storage/uploads/products/product_40_main.jpg',
        ];

        foreach ($products as $index => $product) {
            if ($product->images()->count() === 0) {
                $imgUrl = $sampleImages[$index % count($sampleImages)];
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_url' => $imgUrl,
                    'is_primary' => true,
                ]);
            }
        }
    }
}
