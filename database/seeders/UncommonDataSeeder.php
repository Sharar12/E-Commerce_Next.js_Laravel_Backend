<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Size;
use App\Models\Product;
use App\Models\Coupon;
use App\Models\ShippingMethod;
use App\Models\User;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Transaction;
use App\Models\Review;
use App\Models\Wishlist;
use App\Models\Notification;
use App\Models\InventoryLog;
use App\Models\Discount;
use App\Models\OrderShipping;
use App\Models\OrderItem;
use App\Models\CouponUsage;
use App\Models\ProductVariant;

class UncommonDataSeeder extends Seeder
{
    public function run()
    {
        // -------------------------------------------------------
        // 1. BRANDS — Popular & Real Brands
        // -------------------------------------------------------
        $brandThemes = [
            'Apple',
            'Sony',
            'Nike',
            'Adidas',
            'Samsung',
            'Zara',
            'Gucci',
            'Logitech',
            'Canon',
            'Anker',
        ];
        $brandIds = [];
        foreach ($brandThemes as $name) {
            $b = Brand::firstOrCreate(['name' => $name], ['status' => 1]);
            $brandIds[] = $b->id;
        }

        // -------------------------------------------------------
        // 2. CATEGORIES — Clean Standard E-Commerce Categories
        // -------------------------------------------------------
        $categoryThemes = [
            'Electronics',
            'Fashion',
            'Home & Living',
            'Beauty & Care',
            'Sports & Fitness',
            'Accessories',
            'Footwear',
            'Audio & Sound',
        ];
        $categoryIds = [];
        foreach ($categoryThemes as $name) {
            $c = Category::firstOrCreate([
                'name' => $name
            ], [
                'description' => 'E-commerce category: ' . $name,
                'status' => 1,
            ]);
            $categoryIds[] = $c->id;
        }

        // -------------------------------------------------------
        // 3. SIZES — Standard Apparel Sizes
        // -------------------------------------------------------
        $sizeThemes = [
            'XS',
            'S',
            'M',
            'L',
            'XL',
            'XXL',
        ];
        $sizeIds = [];
        foreach ($sizeThemes as $name) {
            $s = Size::firstOrCreate(['name' => $name], ['status' => 1]);
            $sizeIds[] = $s->id;
        }

        // -------------------------------------------------------
        // 4. USERS — Famous Literary Characters Theme
        // -------------------------------------------------------
        $userThemes = [
            ['name' => 'Atticus Finch [LIT-USER]', 'email' => 'atticus.finch_' . rand(10, 99) . '@litmail.com', 'role' => 'customer'],
            ['name' => 'Elizabeth Bennet [LIT-USER]', 'email' => 'elizabeth.bennet_' . rand(10, 99) . '@litmail.com', 'role' => 'customer'],
            ['name' => 'Sherlock Holmes [LIT-USER]', 'email' => 'sherlock.holmes_' . rand(10, 99) . '@litmail.com', 'role' => 'customer'],
            ['name' => 'Jane Eyre [LIT-USER]', 'email' => 'jane.eyre_' . rand(10, 99) . '@litmail.com', 'role' => 'customer'],
            ['name' => 'Jay Gatsby [LIT-USER]', 'email' => 'jay.gatsby_' . rand(10, 99) . '@litmail.com', 'role' => 'customer'],
        ];
        $userIds = [];
        foreach ($userThemes as $uData) {
            $u = User::firstOrCreate(
                ['email' => $uData['email']],
                [
                    'name' => $uData['name'],
                    'password' => bcrypt('password123'),
                    'role' => $uData['role'],
                ]
            );
            $userIds[] = $u->id;
        }

        // -------------------------------------------------------
        // 5. PRODUCTS — Exotic Artifacts / Rare Gems Theme
        // -------------------------------------------------------
        $productThemes = [
            ['name' => 'The Obsidian Crown [PROD]', 'price' => 24999, 'sku' => 'OBS-CRN-' . rand(1000, 9999)],
            ['name' => 'Golden Fleece Shawl [PROD]', 'price' => 18999, 'sku' => 'GLD-FLC-' . rand(1000, 9999)],
            ['name' => 'Celestial Ember Ring [PROD]', 'price' => 45999, 'sku' => 'CEL-EMB-' . rand(1000, 9999)],
            ['name' => 'Moonstone Amulet [PROD]', 'price' => 12999, 'sku' => 'MON-AMT-' . rand(1000, 9999)],
            ['name' => 'Ivory Dragon Vase [PROD]', 'price' => 34999, 'sku' => 'IVY-DRG-' . rand(1000, 9999)],
            ['name' => 'Crimson Velvet Gown [PROD]', 'price' => 7999, 'sku' => 'CRM-VLV-' . rand(1000, 9999)],
            ['name' => 'Sapphire Encrusted Dagger [PROD]', 'price' => 59999, 'sku' => 'SAP-DGR-' . rand(1000, 9999)],
            ['name' => 'Amber Fossil Pendant [PROD]', 'price' => 8999, 'sku' => 'AMB-FSL-' . rand(1000, 9999)],
        ];
        $sampleImages = [
            '/storage/uploads/products/product_11_main.jpg',
            '/storage/uploads/products/product_12_main.jpg',
            '/storage/uploads/products/product_13_main.jpg',
            '/storage/uploads/products/product_14_main.jpg',
            '/storage/uploads/products/product_15_main.jpg',
            '/storage/uploads/products/product_16_main.jpg',
            '/storage/uploads/products/product_17_main.jpg',
            '/storage/uploads/products/product_18_main.jpg',
        ];
        $productIds = [];
        foreach ($productThemes as $i => $pData) {
            $p = Product::create([
                'brand_id' => $brandIds[array_rand($brandIds)],
                'category_id' => $categoryIds[array_rand($categoryIds)],
                'name' => $pData['name'],
                'base_price' => $pData['price'],
                'sku' => $pData['sku'],
                'stock_quantity' => rand(5, 50),
                'status' => 'active',
                'description' => 'Exclusive artifact: ' . $pData['name'] . '. Handcrafted with premium materials.',
                'weight' => rand(1, 50) / 10,
            ]);
            $productIds[] = $p->id;
            \App\Models\ProductImage::create([
                'product_id' => $p->id,
                'image_url' => $sampleImages[$i % count($sampleImages)],
                'is_primary' => true,
            ]);
        }

        // -------------------------------------------------------
        // 6. PRODUCT VARIANTS — Color Palette Theme
        // -------------------------------------------------------
        $colorThemes = [
            ['color' => '#8B0000', 'color_name' => 'Crimson Blood'],
            ['color' => '#1A1A2E', 'color_name' => 'Midnight Ink'],
            ['color' => '#C5A059', 'color_name' => 'Royal Gold'],
            ['color' => '#2E8B57', 'color_name' => 'Emerald Forest'],
            ['color' => '#4B0082', 'color_name' => 'Imperial Purple'],
            ['color' => '#FF6B35', 'color_name' => 'Solar Flare'],
            ['color' => '#006D77', 'color_name' => 'Teal Depths'],
            ['color' => '#DDA0DD', 'color_name' => 'Plum Blossom'],
        ];
        for ($i = 0; $i < count($colorThemes); $i++) {
            $pid = $productIds[array_rand($productIds)];
            $sid = $sizeIds[array_rand($sizeIds)];
            $ct = $colorThemes[$i];
            ProductVariant::create([
                'product_id' => $pid,
                'size_id' => $sid,
                'color' => $ct['color'],
                'additional_price' => rand(5, 50) * 10,
                'stock_quantity' => rand(3, 25),
            ]);
        }

        // -------------------------------------------------------
        // 7. COUPONS — Greek Mythology Theme
        // -------------------------------------------------------
        $couponThemes = [
            ['code' => 'ZEUS2026', 'type' => 'percentage', 'value' => 25],
            ['code' => 'ATHENA50', 'type' => 'fixed', 'value' => 5000],
            ['code' => 'HERA15', 'type' => 'percentage', 'value' => 15],
            ['code' => 'POSEIDON30', 'type' => 'fixed', 'value' => 3000],
            ['code' => 'APOLLO20', 'type' => 'percentage', 'value' => 20],
            ['code' => 'APHRODITE10', 'type' => 'fixed', 'value' => 1000],
            ['code' => 'ARES40', 'type' => 'percentage', 'value' => 40],
            ['code' => 'HERMES5', 'type' => 'fixed', 'value' => 500],
        ];
        $couponIds = [];
        foreach ($couponThemes as $cpData) {
            $cp = Coupon::create([
                'code' => $cpData['code'] . '_' . rand(10, 99),
                'discount_type' => $cpData['type'],
                'discount_value' => $cpData['value'],
                'min_purchase_amount' => rand(10, 50) * 100,
                'usage_limit' => rand(10, 100),
                'status' => 'active',
            ]);
            $couponIds[] = $cp->id;
        }

        // -------------------------------------------------------
        // 8. SHIPPING METHODS — Speed / Aviation Theme
        // -------------------------------------------------------
        $shipMethodThemes = [
            ['name' => 'Stratosphere Jet [SHIP]', 'fee' => 1500, 'free' => false],
            ['name' => 'Solar Wind Express [SHIP]', 'fee' => 2500, 'free' => false],
            ['name' => 'Orbital Freight [SHIP]', 'fee' => 500, 'free' => false],
            ['name' => 'Lightning Courier [SHIP]', 'fee' => 0, 'free' => true],
            ['name' => 'Aurora Parcel [SHIP]', 'fee' => 800, 'free' => false],
            ['name' => 'Void Delivery [SHIP]', 'fee' => 3000, 'free' => false],
        ];
        $shipMethodIds = [];
        foreach ($shipMethodThemes as $smData) {
            $sm = ShippingMethod::create([
                'name' => $smData['name'] . ' #' . rand(10, 99),
                'fee' => $smData['fee'],
                'is_free_shipping' => $smData['free'],
                'description' => 'Premium ' . $smData['name'] . ' shipping service',
            ]);
            $shipMethodIds[] = $sm->id;
        }

        // -------------------------------------------------------
        // 9. ORDERS — Unique per user (placed by literary users)
        // -------------------------------------------------------
        $orderIds = [];
        foreach ($userIds as $uid) {
            $total = rand(50, 500) * 100;
            $discount = rand(0, 20) * 100;
            $shipping = rand(0, 1) ? 500 : 0;
            $final = $total - $discount + $shipping;
            $statuses = ['pending', 'paid', 'shipped', 'delivered', 'cancelled'];
            $o = Order::create([
                'user_id' => $uid,
                'total_amount' => $total,
                'discount_amount' => $discount,
                'shipping_fee' => $shipping,
                'final_amount' => $final,
                'status' => $statuses[array_rand($statuses)],
            ]);
            $orderIds[] = $o->id;
        }

        // -------------------------------------------------------
        // 10. ORDER ITEMS — Connect orders with products
        // -------------------------------------------------------
        foreach ($orderIds as $oid) {
            $numItems = rand(1, 3);
            for ($j = 0; $j < $numItems; $j++) {
                $pid = $productIds[array_rand($productIds)];
                $qty = rand(1, 3);
                $prod = Product::find($pid);
                OrderItem::create([
                    'order_id' => $oid,
                    'product_id' => $pid,
                    'quantity' => $qty,
                    'price_at_purchase' => $prod ? $prod->base_price : 10000,
                    'discount_applied' => rand(0, 1) ? rand(5, 20) * 10 : 0,
                ]);
            }
        }

        // -------------------------------------------------------
        // 11. REVIEWS — Art Critique Style Comments
        // -------------------------------------------------------
        $reviewComments = [
            'A masterpiece of modern design! The craftsmanship is simply unparalleled. [REVIEW]',
            'Exquisite quality that transcends ordinary expectations. Truly a collector\'s gem. [REVIEW]',
            'The attention to detail is breathtaking. Every stitch tells a story of elegance. [REVIEW]',
            'A sublime fusion of tradition and avant-garde aesthetics. Absolutely captivating. [REVIEW]',
            'Radiates an aura of sophistication. The material feels like liquid silk. [REVIEW]',
            'A daring piece that challenges conventional fashion norms. Bold and beautiful. [REVIEW]',
            'Timeless elegance meets contemporary flair. An heirloom in the making. [REVIEW]',
            'The color palette evokes emotions I didn\'t know existed. Simply divine. [REVIEW]',
        ];
        foreach ($userIds as $i => $uid) {
            Review::create([
                'user_id' => $uid,
                'product_id' => $productIds[array_rand($productIds)],
                'rating' => rand(3, 5),
                'comment' => $reviewComments[$i % count($reviewComments)] . ' (#' . rand(100, 999) . ')',
            ]);
        }

        // -------------------------------------------------------
        // 12. WISHLISTS — User-product wish combinations
        // -------------------------------------------------------
        foreach ($userIds as $uid) {
            $wp = $productIds[array_rand($productIds)];
            // Avoid duplicate wishlist entries
            $existing = Wishlist::where('user_id', $uid)->where('product_id', $wp)->first();
            if (!$existing) {
                Wishlist::create([
                    'user_id' => $uid,
                    'product_id' => $wp,
                ]);
            }
        }

        // -------------------------------------------------------
        // 13. NOTIFICATIONS — System / Security Alerts Theme
        // -------------------------------------------------------
        $notifMessages = [
            '[NOTIF] 🔔 Order confirmed — your package is being prepared by our atelier.',
            '[NOTIF] ⚡ Flash Sale! Extra 20% off on all Celestial items for the next 6 hours.',
            '[NOTIF] 🚚 Your shipment has departed from our flagship warehouse. Track now!',
            '[NOTIF] 🎉 Welcome to ELYSIUM Loyalty! You\'ve earned 500 bonus points.',
            '[NOTIF] ⚠️ Security alert: New login detected from an unrecognized device.',
            '[NOTIF] 💎 Limited Edition: The Obsidian Crown is back in stock — only 3 remaining!',
            '[NOTIF] 🌟 Exclusive preview: Our Spring Collection drops next week. Be the first to see!',
            '[NOTIF] 📦 Your package has arrived at the local delivery hub. Expect delivery soon.',
        ];
        foreach ($userIds as $i => $uid) {
            Notification::create([
                'user_id' => $uid,
                'message' => $notifMessages[$i % count($notifMessages)] . ' (ID#' . rand(1000, 9999) . ')',
                'status' => rand(0, 1) ? 'unread' : 'read',
            ]);
        }

        // -------------------------------------------------------
        // 14. INVENTORY LOGS — Warehouse / Logistics Theme
        // -------------------------------------------------------
        $logNotes = [
            '[INV] WAREHOUSE-A: Bulk restock from ELYSIUM manufacturing unit.',
            '[INV] WAREHOUSE-B: Seasonal inventory rotation completed.',
            '[INV] WAREHOUSE-C: Quality check passed — items moved to premium storage.',
            '[INV] WAREHOUSE-A: Damaged items from transit returned to supplier.',
            '[INV] WAREHOUSE-D: New collection arrival — cataloging in progress.',
            '[INV] WAREHOUSE-B: Emergency restock for high-demand items.',
            '[INV] WAREHOUSE-C: Temperature-controlled storage audit completed.',
            '[INV] WAREHOUSE-A: Inter-warehouse transfer for order fulfillment.',
        ];
        foreach ($productIds as $i => $pid) {
            InventoryLog::create([
                'product_id' => $pid,
                'change_type' => rand(0, 1) ? 'in' : 'out',
                'quantity_changed' => rand(1, 50),
                'note' => $logNotes[$i % count($logNotes)] . ' (LOG#' . rand(1000, 9999) . ')',
            ]);
        }

        // -------------------------------------------------------
        // 15. DISCOUNTS — Seasonal / Holiday Sales Theme
        // -------------------------------------------------------
        $discountThemes = [
            ['type' => 'percentage', 'value' => 10, 'from' => '2026-01-01', 'to' => '2026-01-15'],
            ['type' => 'percentage', 'value' => 25, 'from' => '2026-02-14', 'to' => '2026-02-20'],
            ['type' => 'fixed', 'value' => 5000, 'from' => '2026-03-01', 'to' => '2026-03-31'],
            ['type' => 'percentage', 'value' => 50, 'from' => '2026-04-01', 'to' => '2026-04-07'],
            ['type' => 'fixed', 'value' => 2000, 'from' => '2026-05-01', 'to' => '2026-05-15'],
            ['type' => 'percentage', 'value' => 15, 'from' => '2026-06-01', 'to' => '2026-06-30'],
            ['type' => 'fixed', 'value' => 10000, 'from' => '2026-07-01', 'to' => '2026-07-10'],
            ['type' => 'percentage', 'value' => 30, 'from' => '2026-08-01', 'to' => '2026-08-15'],
        ];
        foreach ($discountThemes as $i => $dData) {
            Discount::create([
                'product_id' => $productIds[array_rand($productIds)],
                'category_id' => $categoryIds[array_rand($categoryIds)],
                'discount_type' => $dData['type'],
                'discount_value' => $dData['value'],
                'valid_from' => $dData['from'],
                'valid_to' => $dData['to'],
            ]);
        }

        // -------------------------------------------------------
        // 16. ORDER SHIPPINGS — Fantasy Kingdom Addresses Theme
        // -------------------------------------------------------
        $fantasyAddresses = [
            '123 Crystal Spire, Kingdom of Eldoria [SHIP-ADDR]',
            '45 Moonstone Lane, Silverhollow Valley [SHIP-ADDR]',
            '789 Dragonflight Avenue, Emberkeep [SHIP-ADDR]',
            '12 Starfall Boulevard, Celestia City [SHIP-ADDR]',
            '67 Whispering Woods Road, Thornwall [SHIP-ADDR]',
            '34 Golden Griffin Square, Aethelgard [SHIP-ADDR]',
            '90 Frost Giant Pass, Northrend Keep [SHIP-ADDR]',
            '56 Phoenix Rise, Ashenvale [SHIP-ADDR]',
        ];
        foreach ($orderIds as $i => $oid) {
            OrderShipping::create([
                'order_id' => $oid,
                'shipping_method_id' => $shipMethodIds[array_rand($shipMethodIds)],
                'address' => $fantasyAddresses[$i % count($fantasyAddresses)],
                'tracking_number' => 'TRK-' . strtoupper(substr(md5(rand()), 0, 8)) . '-' . rand(1000, 9999),
            ]);
        }

        // -------------------------------------------------------
        // 17. PAYMENTS — Different Methods Per Record
        // -------------------------------------------------------
        $paymentMethods = ['card', 'mobile_banking', 'COD'];
        $paymentStatuses = ['pending', 'success', 'failed'];
        foreach ($orderIds as $oid) {
            $existing = Payment::where('order_id', $oid)->first();
            if (!$existing) {
                Payment::create([
                    'order_id' => $oid,
                    'payment_method' => $paymentMethods[array_rand($paymentMethods)],
                    'transaction_id' => 'PAY-TXN-' . strtoupper(substr(md5(rand()), 0, 10)),
                    'amount' => rand(50, 500) * 100,
                    'status' => $paymentStatuses[array_rand($paymentStatuses)],
                ]);
            }
        }

        // -------------------------------------------------------
        // 18. TRANSACTIONS — Banking / Financial Theme
        // -------------------------------------------------------
        $txnTypes = ['debit', 'credit', 'refund', 'chargeback'];
        $txnMethods = ['card', 'mobile_banking', 'COD', 'wallet'];
        $currencies = ['BDT', 'USD', 'EUR', 'GBP'];
        $statusOptions = ['pending', 'success', 'failed', 'refunded'];
        foreach ($userIds as $i => $uid) {
            $oid = $orderIds[array_rand($orderIds)];
            Transaction::create([
                'user_id' => $uid,
                'order_id' => $oid,
                'transaction_type' => $txnTypes[array_rand($txnTypes)],
                'method' => $txnMethods[array_rand($txnMethods)],
                'transaction_reference' => 'BNK-REF-' . strtoupper(substr(md5(rand()), 0, 12)),
                'amount' => rand(10, 200) * 100,
                'currency' => $currencies[array_rand($currencies)],
                'status' => $statusOptions[array_rand($statusOptions)],
                'remarks' => 'UNIQUE TRANSACTION #' . rand(10000, 99999) . ' — Financial operations log',
                'processed_at' => now()->subDays(rand(1, 30)),
            ]);
        }

        // -------------------------------------------------------
        // 19. COUPON USAGES — Linking coupons to users and orders
        // -------------------------------------------------------
        foreach ($userIds as $i => $uid) {
            $oid = $orderIds[$i % count($orderIds)];
            $cpId = $couponIds[array_rand($couponIds)];
            $existing = CouponUsage::where('coupon_id', $cpId)->where('user_id', $uid)->where('order_id', $oid)->first();
            if (!$existing) {
                CouponUsage::create([
                    'coupon_id' => $cpId,
                    'user_id' => $uid,
                    'order_id' => $oid,
                    'used_at' => now()->subDays(rand(1, 15)),
                ]);
            }
        }

        $this->command->info('[✔] Uncommon Data Seeder Completed — ' . count($brandThemes) . ' themed records per table!');
    }
}
