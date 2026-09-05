-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2026 at 05:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_globixtech_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Apple', NULL, 1, '2026-08-02 01:02:25', '2026-08-02 01:02:25'),
(2, 'Sony', NULL, 1, '2026-08-02 01:02:25', '2026-08-02 01:02:25'),
(3, 'Aarong', NULL, 1, '2026-08-02 01:02:25', '2026-08-02 01:02:25'),
(4, 'Apple', NULL, 1, '2026-08-02 01:02:56', '2026-08-02 01:02:56'),
(5, 'Redmi', '/storage/uploads/brands/Uq5i1TVDtWfEKkYri4H6SkEXd4m24tJz2TMOsnIP.jpg', 1, '2026-08-02 09:03:57', '2026-08-02 09:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `status`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Consumer Electronics', 1, 'Electronic devices and gadgets', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(2, 1, 'Computers & Laptops', 1, 'Computers, laptops and accessories', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(4, 2, 'Laptops & Ultrabooks', 1, 'Portable laptops and ultrabooks', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(5, 2, 'Desktop PCs & Workstations', 1, 'Desktop computers and workstations', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(6, 1, 'Audio Devices', 1, 'Headphones, speakers and sound systems', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(7, 6, 'Headphones & Earbuds', 1, 'Wired and wireless headphones and earbuds', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(8, 6, 'Speakers & Soundbars', 1, 'Bluetooth speakers and TV soundbars', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(9, 1, 'Mobile Devices & Accessories', 1, 'Smartphones, power banks and chargers', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(10, 9, 'Smartphones', 1, 'Android and iOS smartphones', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(11, 9, 'Power Banks & Chargers', 1, 'Portable power banks and fast chargers', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(12, NULL, 'Apparel & Clothing', 1, 'Fashion apparel and clothing for all occasions', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(13, 12, 'Men\'s Wear', 1, 'Men\'s clothing and fashion collection', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(14, 13, 'Shirts & T-Shirts', 1, 'Casual and formal shirts, t-shirts and polos', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(15, 13, 'Trousers & Jeans', 1, 'Denim jeans, formal trousers and chinos', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(16, 12, 'Women\'s Wear', 1, 'Women\'s fashion and apparel collection', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(17, 16, 'Dresses & Skirts', 1, 'Casual and evening dresses, mini and maxi skirts', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(18, 16, 'Tops & Blouses', 1, 'Stylish tops, formal blouses and shirts', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(19, 12, 'Outerwear & Sportswear', 1, 'Jackets, winter coats and athletic activewear', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(20, 19, 'Jackets & Coats', 1, 'Winter jackets, coats, blazers and hoodies', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16'),
(21, 19, 'Activewear & Leggings', 1, 'Sports leggings, gym wear and tracksuits', NULL, '2026-08-02 01:02:16', '2026-08-02 01:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `cart_items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cart_items`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_purchase_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `usage_limit` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `visibility` enum('public','private','activity') NOT NULL DEFAULT 'public',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `assigned_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `activity_threshold` int(11) NOT NULL DEFAULT 1,
  `activity_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `description`, `discount_type`, `discount_value`, `min_purchase_amount`, `max_discount_amount`, `valid_from`, `valid_to`, `usage_limit`, `status`, `visibility`, `created_at`, `updated_at`, `assigned_user_id`, `activity_type`, `activity_threshold`, `activity_description`) VALUES
(1, 'FEE-78U6HW', 'sdvsdv', 'percentage', 33.00, 1200000.00, NULL, '2026-08-02', '2026-08-29', 1, 'active', 'public', '2026-08-02 02:31:36', '2026-08-02 02:54:23', NULL, NULL, 1, NULL),
(2, 'FEE-0F4CWT', 'asasfsdf', 'percentage', 15.00, 10000.00, NULL, '2026-08-02', '2026-08-31', 1, 'active', 'public', '2026-08-02 09:11:42', '2026-08-02 09:11:42', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_usages`
--

INSERT INTO `coupon_usages` (`id`, `coupon_id`, `user_id`, `order_id`, `used_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, 4, '2026-08-02 09:12:29', '2026-08-02 09:12:29', '2026-08-02 09:12:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `product_id`, `category_id`, `discount_type`, `discount_value`, `valid_from`, `valid_to`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'percentage', 10.00, '2026-08-01', '2026-08-31', '2026-08-02 01:06:02', '2026-08-02 01:06:02'),
(2, 2, NULL, 'percentage', 33.00, '2026-08-01', '2026-08-31', '2026-08-02 01:06:02', '2026-08-02 01:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_type` enum('in','out') NOT NULL,
  `quantity_changed` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_04_095633_create_personal_access_tokens_table', 2),
(5, '2025_10_04_104815_add_role_to_users_table', 3),
(6, '2025_10_04_130511_create_brands_table', 4),
(7, '2025_10_05_120444_create_categories_table', 5),
(8, '2025_10_05_134913_create_sizes_table', 6),
(9, '2025_10_06_021259_create_products_table', 7),
(10, '2025_10_06_010808_create_shippings_table', 8),
(11, '2025_10_06_043128_create_product_images_table', 8),
(12, '2025_10_06_103138_create_coupons_table', 9),
(13, '2025_10_06_130916_create_orders_table', 10),
(14, '2025_10_08_080120_create_product_variants_table', 11),
(15, '2025_10_08_090130_create_wishlists_table', 12),
(16, '2025_10_09_042242_create_order_items_table', 13),
(17, '2025_10_09_052116_create_reviews_table', 14),
(18, '2025_10_09_061315_create_inventory_log_table', 15),
(19, '2025_10_09_061456_create_inventory_logs_table', 16),
(20, '2025_10_09_072251_create_discounts_table', 17),
(21, '2025_10_09_083520_create_notifications_table', 18),
(22, '2025_10_09_085528_create_shipping_methods_table', 19),
(23, '2025_10_09_104434_create_coupon_usages_table', 20),
(24, '2025_10_09_111940_create_order_shippings_table', 21),
(25, '2025_10_09_153109_create_payments_table', 22),
(26, '2026_07_23_102842_add_visibility_and_assigned_user_id_to_coupons_table', 23),
(27, '2026_07_23_103139_add_activity_fields_to_coupons_table', 24),
(28, '2026_07_23_104517_add_order_code_to_orders_table', 25),
(29, '2026_07_23_105237_update_order_status_enum_to_processing', 26),
(30, '2026_07_30_053511_create_checkouts_table', 27),
(31, '2026_07_30_140141_add_image_to_categories_table', 28),
(32, '2026_08_01_062300_add_parent_id_to_categories_table', 29),
(33, '2026_08_01_141830_add_image_to_brands_table', 30),
(34, '2026_08_01_144120_add_image_to_product_variants_table', 31),
(35, '2026_08_02_044101_change_weight_precision_in_products_table', 32),
(36, '2026_08_02_210000_create_product_chats_table', 33);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `status` enum('unread','read') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(10) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `final_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','processing','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `total_amount`, `discount_amount`, `shipping_fee`, `final_amount`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'TL0JKW0C', 2, 243000.00, 0.00, 24300.00, 267300.00, 'delivered', NULL, '2026-08-02 03:07:19', '2026-08-02 03:14:08'),
(3, 'ZKBUO9GI', 2, 243000.00, 0.00, 24300.00, 267300.00, 'cancelled', NULL, '2026-08-02 03:08:09', '2026-08-02 03:17:29'),
(4, 'RZQRK1EQ', 2, 65996.00, 9899.40, 5609.66, 61706.26, 'delivered', NULL, '2026-08-02 09:12:29', '2026-08-02 09:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL,
  `discount_applied` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `variant_id`, `quantity`, `price_at_purchase`, `discount_applied`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, NULL, 2, 121500.00, 0.00, '2026-08-02 03:07:19', '2026-08-02 03:07:19', NULL),
(2, 3, 1, NULL, 2, 121500.00, 0.00, '2026-08-02 03:08:09', '2026-08-02 03:08:09', NULL),
(3, 4, 6, NULL, 4, 16499.00, 0.00, '2026-08-02 09:12:29', '2026-08-02 09:12:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_shippings`
--

CREATE TABLE `order_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_method_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` enum('card','mobile_banking','COD') NOT NULL,
  `transaction_id` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','success','failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', 'fd896c7371df4154f3a205b587a5b6c35a7bba090ba885b0dd63740a4fca5f76', '[\"*\"]', '2026-08-02 09:24:56', NULL, '2026-08-02 01:07:18', '2026-08-02 09:24:56'),
(2, 'App\\Models\\User', 2, 'token', 'f7130ecc65c107768d20a7d6d76eae6f57c22d8a50c6ecb8bb260112e09b16b3', '[\"*\"]', '2026-08-02 03:17:47', NULL, '2026-08-02 03:02:55', '2026-08-02 03:17:47'),
(3, 'App\\Models\\User', 3, 'token', 'cd3ac4b31a9e284b1afb21a81422465a9a74ef637511447d449e276b1db54f71', '[\"*\"]', '2026-08-02 03:44:11', NULL, '2026-08-02 03:18:27', '2026-08-02 03:44:11'),
(4, 'App\\Models\\User', 2, 'token', '2cb4734095829b135fd527631ddac75ab1945757aca04922a04bd8df8a7bef2e', '[\"*\"]', '2026-08-02 03:44:31', NULL, '2026-08-02 03:44:26', '2026-08-02 03:44:31'),
(5, 'App\\Models\\User', 3, 'token', '47e2945c91db1a0e493db5709382fce64b2a74c1689f9c3a2a8002eee620cf2e', '[\"*\"]', '2026-08-02 08:09:51', NULL, '2026-08-02 03:44:51', '2026-08-02 08:09:51'),
(6, 'App\\Models\\User', 2, 'token', '54c0bdd5f1b4e8821787a537757b6e0c31c3d195ba63c7e9e7b959f879353065', '[\"*\"]', '2026-08-02 09:26:38', NULL, '2026-08-02 08:16:24', '2026-08-02 09:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `weight` decimal(10,3) DEFAULT NULL,
  `is_seasonal` tinyint(1) DEFAULT 0,
  `seasonal_start_date` date DEFAULT NULL,
  `seasonal_end_date` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `sku`, `description`, `base_price`, `stock_quantity`, `weight`, `is_seasonal`, `seasonal_start_date`, `seasonal_end_date`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 'Apple iPhone 15 Pro (128GB - Natural Titanium)', 'GLBX-APPIPH-NMTG177', 'The Apple iPhone 15 Pro features a lightweight, aerospace-grade titanium design.', 135000.00, 13, 0.187, 0, NULL, NULL, 'active', NULL, '2026-08-02 01:02:25', '2026-08-02 03:17:29'),
(2, 7, 2, 'Sony WH-1000XM5 Wireless Headphones', 'GLBX-AUDIO-SNY005', 'Industry-leading noise canceling headphones.', 45000.00, 20, 0.250, 0, NULL, NULL, 'active', NULL, '2026-08-02 01:02:25', '2026-08-02 01:02:25'),
(3, 14, 3, 'Premium Oxford Cotton Shirt', 'GLBX-SHIRT-OXF001', 'Classic fit Oxford cotton shirt made from 100% premium woven fabric.', 3500.00, 25, 0.350, 0, NULL, NULL, 'active', NULL, '2026-08-02 01:02:25', '2026-08-02 01:02:25'),
(4, 17, 3, 'Silk Evening Maxi Dress', 'GLBX-DRSS-SLK007', 'Elegantly crafted Mulberry silk maxi dress.', 12500.00, 30, 0.450, 1, NULL, NULL, 'active', NULL, '2026-08-02 01:02:25', '2026-08-02 01:02:25'),
(6, 10, 5, 'Redmi 12 (Blue)', 'GLBX-RED12-LV54814', 'The Xiaomi Redmi 12 (4/128) is a feature-packed smartphone that caters to a wide range of users. The variants available for the Redmi 12 include different RAM configurations: 4GB, 6GB, and 8GB, paired with 128GB or 256GB of internal storage. This flexibility ensures that users can choose the right balance between performance and storage capacity based on their needs.\r\n\r\nOne of the notable features of the Redmi 12 is its large 6.79-inch IPS LCD display with a 90Hz refresh rate. This high refresh rate ensures smoother animations and interactions, making it ideal for gaming and multimedia consumption. Additionally, the display reaches a peak brightness of 550 nits, ensuring good visibility even in bright sunlight.\r\n\r\nThe camera setup on the Redmi 12 is impressive. The triple rear camera includes a 50MP primary lens with a wide aperture of f/1.8, an 8MP ultrawide lens, and a 2MP macro lens. These cameras deliver detailed and vibrant photos, whether you’re capturing landscapes, close-ups, or group shots. On the front, there’s an 8MP selfie camera for clear and sharp self-portraits.\r\n\r\nAnother compelling reason to consider the Redmi 12 is its 5000mAh battery. This substantial battery capacity ensures all-day usage without worrying about frequent recharges. Moreover, the phone supports 18W fast charging, allowing you to top up the battery quickly when needed.\r\n\r\nXiaomi Redmi 12 Price in Bangladesh\r\nThe Xiaomi Redmi 12 Price in Bangladesh is BDT 16,499 for its 4/128GB variant. It comes with four different colors which are Midnight Black, Sky Blue, Polar Silver, Moonstone Silver. You can purchase this smartphone from Xiaomi\'s official showroom, authorized shop and online marketplace.', 16499.00, 6, 0.300, 0, NULL, NULL, 'inactive', NULL, '2026-08-02 09:08:19', '2026-08-02 09:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_chats`
--

CREATE TABLE `product_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `question` text NOT NULL,
  `reply` text DEFAULT NULL,
  `replied_by` bigint(20) UNSIGNED DEFAULT NULL,
  `replied_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_chats`
--

INSERT INTO `product_chats` (`id`, `product_id`, `user_id`, `customer_name`, `customer_email`, `question`, `reply`, `replied_by`, `replied_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Sharar Hossain', 'sharar@gmail.com', 'Does this masterpiece include a certificate of authenticity?', NULL, NULL, NULL, 'pending', '2026-08-02 08:24:41', '2026-08-02 08:24:41'),
(2, 1, 2, 'Alex', 'A@gmail.com', 'sdgrdgegheg', 'hihihi', 1, '2026-08-02 08:39:57', 'replied', '2026-08-02 08:39:28', '2026-08-02 08:39:57'),
(3, 6, 2, 'Alex', 'A@gmail.com', 'AAAAAA', 'Hi', 1, '2026-08-02 09:18:07', 'replied', '2026-08-02 09:17:44', '2026-08-02 09:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `is_primary`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '/storage/uploads/products/iJKCYc2iUuL8jV7kVHVYJ9bIL46R0daSPZtM8bZB.webp', 1, NULL, '2026-08-02 01:08:10', '2026-08-02 01:08:10'),
(2, 2, '/storage/uploads/products/product_12_main.jpg', 1, NULL, '2026-08-02 01:08:10', '2026-08-02 01:08:10'),
(3, 3, '/storage/uploads/products/product_14_main.jpg', 1, NULL, '2026-08-02 01:08:10', '2026-08-02 01:08:10'),
(4, 4, '/storage/uploads/products/product_15_main.jpg', 1, NULL, '2026-08-02 01:08:10', '2026-08-02 01:08:10'),
(5, 6, '/storage/uploads/products/vxsMSI3eP56DeshLj0t5uk1UOxnjmsucSZJGKOKF.webp', 1, NULL, '2026-08-02 09:08:19', '2026-08-02 09:24:55'),
(6, 6, '/storage/uploads/products/Y8fdbseqX6IFtlbRKvOX4HWuwkuNvARHzOdxrKPx.jpg', 0, NULL, '2026-08-02 09:08:19', '2026-08-02 09:24:55'),
(7, 6, '/storage/uploads/products/Wkem2MBrWuGy2hfiWkdDbtlTtDsaFj7ZVnphb4kn.png', 0, NULL, '2026-08-02 09:08:19', '2026-08-02 09:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `additional_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `size_id`, `color`, `image`, `additional_price`, `stock_quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, '256GB Storage', '/storage/uploads/products/iJKCYc2iUuL8jV7kVHVYJ9bIL46R0daSPZtM8bZB.webp', 15000.00, 8, '2026-08-02 01:08:45', '2026-08-02 01:11:26', NULL),
(2, 1, NULL, '512GB Storage', '/storage/uploads/products/BcYolB71MPVCqzBklKzuZPSf1KmgR6HE35a5IYdA.png', 35000.00, 5, '2026-08-02 01:08:45', '2026-08-02 01:11:26', NULL),
(3, 2, NULL, 'Silver White', '/storage/uploads/products/product_12_main.jpg', 0.00, 10, '2026-08-02 01:08:45', '2026-08-02 01:11:26', NULL),
(4, 2, NULL, 'Midnight Black', '/storage/uploads/products/product_13_main.jpg', 0.00, 10, '2026-08-02 01:08:45', '2026-08-02 01:11:26', NULL),
(5, 3, NULL, 'Sky Blue - Size M', '/storage/uploads/products/product_14_main.jpg', 0.00, 12, '2026-08-02 01:08:45', '2026-08-02 01:11:26', NULL),
(6, 3, NULL, 'Classic White - Size L', '/storage/uploads/products/product_16_main.jpg', 200.00, 13, '2026-08-02 01:08:45', '2026-08-02 01:11:26', NULL),
(7, 4, NULL, 'Crimson Red - Size S', '/storage/uploads/products/product_15_main.jpg', 0.00, 10, '2026-08-02 01:08:45', '2026-08-02 01:11:26', NULL),
(8, 4, NULL, 'Emerald Green - Size M', '/storage/uploads/products/product_17_main.jpg', 500.00, 12, '2026-08-02 01:08:45', '2026-08-02 01:11:26', NULL),
(9, 4, NULL, 'Midnight Black - Size L', '/storage/uploads/products/product_18_main.jpg', 1000.00, 8, '2026-08-02 01:08:45', '2026-08-02 01:11:26', NULL),
(10, 6, NULL, 'Redmi 12 (White)', '/storage/uploads/variants/ntcJOzpYS5ScxlJLcLW6esaUDiiyrN9UGYXTiiCs.jpg', 0.00, 1, '2026-08-02 09:08:20', '2026-08-02 09:24:55', NULL),
(11, 6, NULL, 'Redmi 12 (Green) RAM 12 GB Storage 128 GB', '/storage/uploads/variants/Sds7XypjnVLgyrAZZUoiMjTEHkEP9D1rM69CGc6I.jpg', 0.00, 2, '2026-08-02 09:08:20', '2026-08-02 09:24:55', NULL),
(12, 6, NULL, 'Redmi 12 (Black)', '/storage/uploads/variants/8PNBgtFuj7BJZut2th1pNeG0Q0T8hSZf4YxHOFgz.webp', 500.00, 3, '2026-08-02 09:08:21', '2026-08-02 09:08:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 3, 'ghfghfgh', '2026-08-02 03:44:36', '2026-08-02 03:44:36', NULL),
(2, 2, 6, 4, 'GOOD!!!!', '2026-08-02 09:14:19', '2026-08-02 09:14:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1JgrLLSpF8Ykm0O4JUl0f9Yt0OZwlh8jhq0E4Ggk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFBFNmdxTjE1ZHM4RGVTZlZqZG15d1Zib0J6eWRVSFlmMEN5cElrcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759907601),
('2ryBVCBdk28sNWg8U43U5pjQEzeZralneVi20AmO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXdFSndWZlpxSXl6V2g4YVNBMTZPV3NtVm9HVGp2S3BZVmdkb3p4RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759933466),
('3LuVudKOPymxOwN6p7LxAYKT7HA2nBiZwW581yOH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic05BZG5TRlJFTHZNZ0xENlVOb1B3UmtCYU1LSWpmV3hldXVuakdzaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759885613),
('8XijJtjlsHekWLzeuS7gvNZVif5MEfDDzEeZFCUr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0VwS0VaOEZOdGE2azIzcVR6b2NaUjRSVHROTFlMTWM2eW1JOWp0ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759804921),
('bSX7Uxxoq2kKBO9cfjzXzHm1dA27KXvo5WpvqmZ3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWZLMzJzTTRUM1dSVmJuT0QwcFladUFGSTlGRk9nZHNXc0hncU5NYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8vc3RvcmFnZS91cGxvYWRzL3Byb2R1Y3RzL3B5SGpkWjQ5VmVoVHdxQnBHUzh2V2V3cm1icmlBTmxVbmF2MG5hMHAuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759765194),
('HgviEW8QxhXRVjGqMLqqoX4ApcWeCfBHmlpFdkAj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib044Q2xsRlJYWmxqM05Kb09kR2d4cHVKd2RKVVhaVmYwNWhZaG5sbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1760104719),
('J1h8nkK7S7NUHuSDD7cnG17Ap9eqcgH0oEhyTaLn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0J3d3RGM1poRnk5NDNTbGFZZ2tDdzJqVG13TVhhUWFSTURLWHhxUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759715429),
('kbvzbMSLaGkAUiw0x33KQirwN1tad50UVaGXaHAi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko/20100101 Firefox/143.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0tGS2tHU2R4SDJmeTZCdDZ2OWt2V3NSdG1RMm13emNxT2ZPZjROUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759887140),
('o85bM27BCqoNCmZyYRozuDumn1XclGBUSfd3SoGs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2tIQ2R5WHR6b2dYM2p6WkRYNndFSjhXWEtMeWVRRnJQR3RDbTdZQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759629181),
('qIvTUsqh5pwt1M79gMM36023dQNgkgj9AEX81ngH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGdwMUxwRTQwWURSVzNwTUFrM3VsMzl5Z3oyREc0REFvVTA2TllXOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759975305),
('qz5qfuRjtV9lBFBxSLZQAmbtJgNZ7SubzArzR4sb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0xDcDZzRzZPT2RMRWN0Vnl0bWlBUmN1WU4xTTR5WjJrRDR6akJySiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1760143209),
('rs0yd2Kh6d3FlE5rT7TlhPFqihtHql0sdU1eOoZQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0ZyV0o5MHB5ZlBmU1JpSW05NXVnYm9nWFM5dmdWcExQazZISUpzNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759582728),
('stRWRAWrFZqwoKAxC6p6dTxlosVfCJvgrqDpTqao', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkh5WkhjUWNjeEZ3Y2RBVXZqSmtPQ0h3RWRkb0tJb0w5c2h2cEFodSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759734372),
('yMpSZAYklTNgc9M7Pe9WCk8xddVxQyZXrVpnnTse', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1FONUlTYkFzWjBLTEdua05DNDd0OTlkSjV4UGZXZkE4QUJvUExXRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759571538);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL,
  `is_free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type` enum('debit','credit','refund','chargeback') NOT NULL,
  `method` enum('card','mobile_banking','COD','wallet') NOT NULL,
  `transaction_reference` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `status` enum('pending','success','failed','refunded') NOT NULL,
  `remarks` text DEFAULT NULL,
  `processed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `transaction_type`, `method`, `transaction_reference`, `amount`, `currency`, `status`, `remarks`, `processed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, 'debit', 'COD', 'COD-MSBKU34E', 267300.00, 'BDT', 'pending', 'Order #2 payment via COD [3243253535245]', '2026-08-02 03:07:19', '2026-08-02 03:07:19', '2026-08-02 03:07:19', NULL),
(2, 2, 3, 'debit', 'card', 'CARD-3535', 267300.00, 'BDT', 'success', 'Order #3 payment via CARD [**** **** **** 3535]', '2026-08-02 03:08:09', '2026-08-02 03:08:09', '2026-08-02 03:08:09', NULL),
(3, 2, 4, 'debit', 'COD', 'COD-MSBXVODQ', 61706.26, 'BDT', 'pending', 'Order #4 payment via COD [234345345345]', '2026-08-02 09:12:29', '2026-08-02 09:12:29', '2026-08-02 09:12:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', NULL, '$2y$12$iNhLPAXAy2Ju58j15f5NletH8pMhnKQVVS1Rhwzp.A3obYoBJaS0i', NULL, '2026-08-02 01:02:09', '2026-08-02 01:02:09'),
(2, 'Alex', 'A@gmail.com', 'customer', NULL, '$2y$12$hNunrGHZO6GsNuOiPu7AnOpSbqmV5qY.5qfFRtd7MjB8hb1sFmXRC', NULL, '2026-08-02 01:02:09', '2026-08-02 01:02:09'),
(3, 'Customer B', 'B@gmail.com', 'customer', NULL, '$2y$12$rHgpKfMfriI6xjKyNNZFwus1cjyaFaSzDT8b0j7P/c9qfp2LCwpUi', NULL, '2026-08-02 03:18:27', '2026-08-02 03:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkouts_user_id_foreign` (`user_id`),
  ADD KEY `checkouts_session_id_index` (`session_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_assigned_user_id_foreign` (`assigned_user_id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_usages_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_usages_user_id_foreign` (`user_id`),
  ADD KEY `coupon_usages_order_id_foreign` (`order_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_product_id_foreign` (`product_id`),
  ADD KEY `discounts_category_id_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_logs_product_id_foreign` (`product_id`),
  ADD KEY `inventory_logs_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_shippings_order_id_foreign` (`order_id`),
  ADD KEY `order_shippings_shipping_method_id_foreign` (`shipping_method_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_chats`
--
ALTER TABLE `product_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_chats_product_id_foreign` (`product_id`),
  ADD KEY `product_chats_user_id_foreign` (`user_id`),
  ADD KEY `product_chats_replied_by_foreign` (`replied_by`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`),
  ADD KEY `product_variants_size_id_foreign` (`size_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_shippings`
--
ALTER TABLE `order_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_chats`
--
ALTER TABLE `product_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD CONSTRAINT `checkouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_assigned_user_id_foreign` FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD CONSTRAINT `coupon_usages_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD CONSTRAINT `inventory_logs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_logs_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD CONSTRAINT `order_shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_shippings_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_chats`
--
ALTER TABLE `product_chats`
  ADD CONSTRAINT `product_chats_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_chats_replied_by_foreign` FOREIGN KEY (`replied_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
