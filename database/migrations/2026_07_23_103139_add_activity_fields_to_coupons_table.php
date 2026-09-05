<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Modify visibility enum to include 'activity' and add activity requirement columns
        DB::statement("ALTER TABLE coupons MODIFY COLUMN visibility ENUM('public', 'private', 'activity') NOT NULL DEFAULT 'public'");

        Schema::table('coupons', function (Blueprint $table) {
            $table->string('activity_type')->nullable()->after('assigned_user_id'); // e.g., first_order, min_orders, review_product, wishlist_items
            $table->integer('activity_threshold')->default(1)->after('activity_type'); // e.g., 5 orders or 3 reviews
            $table->text('activity_description')->nullable()->after('activity_threshold'); // Human readable instructions
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('coupons', function (Blueprint $table) {
            $table->dropColumn(['activity_type', 'activity_threshold', 'activity_description']);
        });
        DB::statement("ALTER TABLE coupons MODIFY COLUMN visibility ENUM('public', 'private') NOT NULL DEFAULT 'public'");
    }
};
