-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2024 at 09:48 AM
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
-- Database: `zcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(255) DEFAULT 'Primary',
  `address_title` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_id` int(10) UNSIGNED DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `latitude` double(8,2) DEFAULT NULL,
  `longitude` double(8,2) DEFAULT NULL,
  `addressable_id` bigint(20) UNSIGNED NOT NULL,
  `addressable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `address_type`, `address_title`, `address_line_1`, `address_line_2`, `city`, `state_id`, `zip_code`, `country_id`, `phone`, `latitude`, `longitude`, `addressable_id`, `addressable_type`, `created_at`, `updated_at`) VALUES
(1, 'Primary', NULL, 'Platform Address', NULL, 'Hollywood', 453, '63585', 840, NULL, NULL, NULL, 1, 'App\\Models\\System', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(2, 'Primary', 'Primary Address', NULL, NULL, NULL, 523, NULL, 840, NULL, NULL, NULL, 1, 'App\\Models\\User', '2024-03-05 06:32:52', '2024-03-05 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `address_types`
--

CREATE TABLE `address_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address_types`
--

INSERT INTO `address_types` (`id`, `type`) VALUES
(2, 'Billing'),
(1, 'Primary'),
(3, 'Shipping');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` text NOT NULL,
  `name` text DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `attachable_id` int(10) UNSIGNED NOT NULL,
  `attachable_type` varchar(255) NOT NULL,
  `ownable_id` bigint(20) DEFAULT NULL,
  `ownable_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `attribute_type_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `shop_id`, `name`, `attribute_type_id`, `order`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Color', 1, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(2, NULL, 'Pattern', 1, 1, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(3, NULL, 'Size', 3, 2, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(4, NULL, 'Style', 3, 3, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(5, NULL, 'Gender', 2, 4, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(6, NULL, 'Format', 3, 5, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_categories`
--

CREATE TABLE `attribute_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_inventory`
--

CREATE TABLE `attribute_inventory` (
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `inventory_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_types`
--

CREATE TABLE `attribute_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attribute_types`
--

INSERT INTO `attribute_types` (`id`, `type`) VALUES
(1, 'Color/Pattern'),
(2, 'Radio'),
(3, 'Select');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `order` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `avg_feedback`
--

CREATE TABLE `avg_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `count` bigint(20) UNSIGNED DEFAULT NULL,
  `feedbackable_id` bigint(20) UNSIGNED NOT NULL,
  `feedbackable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `link_label` varchar(100) DEFAULT NULL,
  `bg_color` varchar(20) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `columns` int(11) DEFAULT 12,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) DEFAULT 100,
  `effect` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banner_groups`
--

CREATE TABLE `banner_groups` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banner_groups`
--

INSERT INTO `banner_groups` (`id`, `name`) VALUES
('group_1', 'Group 1'),
('group_2', 'Group 2'),
('group_3', 'Group 3'),
('group_4', 'Group 4'),
('group_5', 'Group 5'),
('group_6', 'Group 6');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `excerpt` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `published_at` timestamp NULL DEFAULT NULL,
  `likes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dislikes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` longtext NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `likes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dislikes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cancellations`
--

CREATE TABLE `cancellations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `cancellation_reason_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `items` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `return_goods` tinyint(1) DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cancellation_reasons`
--

CREATE TABLE `cancellation_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(255) NOT NULL,
  `office_use` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cancellation_reasons`
--

INSERT INTO `cancellation_reasons` (`id`, `detail`, `office_use`) VALUES
(1, 'Order created by mistake', NULL),
(2, 'Delivery takes so long', NULL),
(3, 'High shipping cost', NULL),
(4, 'Wrong shipping address', NULL),
(5, 'Need some adjustment', NULL),
(6, 'Wrong billing address', NULL),
(7, 'Other reason', NULL),
(8, 'No inventory', 1),
(9, 'Buyer cancelled', 1),
(10, 'General adjustment', 1),
(11, 'Shipping address undeliverable', 1),
(12, 'Pricing issue', 1),
(13, 'Customs problem', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carriers`
--

CREATE TABLE `carriers` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `tracking_url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `ship_to` int(10) UNSIGNED DEFAULT NULL,
  `ship_to_country_id` int(10) UNSIGNED DEFAULT NULL,
  `ship_to_state_id` int(10) UNSIGNED DEFAULT NULL,
  `shipping_zone_id` int(10) UNSIGNED DEFAULT NULL,
  `shipping_rate_id` int(10) UNSIGNED DEFAULT NULL,
  `packaging_id` int(10) UNSIGNED DEFAULT NULL,
  `is_digital` tinyint(1) NOT NULL DEFAULT 0,
  `item_count` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `total` decimal(20,6) DEFAULT NULL,
  `discount` decimal(20,6) DEFAULT NULL,
  `shipping` decimal(20,6) DEFAULT NULL,
  `packaging` decimal(20,6) DEFAULT NULL,
  `handling` decimal(20,6) DEFAULT NULL,
  `taxes` decimal(20,6) DEFAULT NULL,
  `grand_total` decimal(20,6) DEFAULT NULL,
  `taxrate` decimal(20,6) DEFAULT NULL,
  `shipping_weight` decimal(20,2) DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_address` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 1,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `message_to_customer` text DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `inventory_id` bigint(20) UNSIGNED NOT NULL,
  `item_description` longtext NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(20,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_sub_group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) DEFAULT NULL,
  `order` int(11) DEFAULT 100,
  `meta_title` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_groups`
--

CREATE TABLE `category_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(100) DEFAULT 'cube',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) DEFAULT 100,
  `meta_title` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_sub_groups`
--

CREATE TABLE `category_sub_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) DEFAULT 100,
  `meta_title` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `support_phone` varchar(255) DEFAULT NULL,
  `support_phone_toll_free` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `support_agent` bigint(20) UNSIGNED DEFAULT NULL,
  `default_sender_email_address` varchar(255) DEFAULT NULL,
  `default_email_sender_name` varchar(255) DEFAULT NULL,
  `return_refund` longtext DEFAULT NULL,
  `order_number_prefix` varchar(255) DEFAULT '#',
  `order_number_suffix` varchar(255) DEFAULT NULL,
  `default_tax_id` int(10) UNSIGNED DEFAULT 1,
  `order_handling_cost` decimal(20,6) DEFAULT NULL,
  `auto_archive_order` tinyint(1) DEFAULT 0,
  `default_payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `ac_holder_name` varchar(255) DEFAULT NULL,
  `ac_number` varchar(255) DEFAULT NULL,
  `ac_type` varchar(255) DEFAULT NULL,
  `ac_routing_number` varchar(255) DEFAULT NULL,
  `ac_swift_bic_code` varchar(255) DEFAULT NULL,
  `ac_iban` varchar(255) DEFAULT NULL,
  `ac_bank_address` text DEFAULT NULL,
  `pagination` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `show_shop_desc_with_listing` tinyint(1) DEFAULT NULL,
  `show_refund_policy_with_listing` tinyint(1) DEFAULT 1,
  `alert_quantity` int(11) DEFAULT NULL,
  `digital_goods_only` tinyint(1) DEFAULT 0,
  `default_warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `default_supplier_id` int(10) UNSIGNED DEFAULT NULL,
  `default_packaging_ids` varchar(255) DEFAULT NULL,
  `notify_new_message` tinyint(1) DEFAULT NULL,
  `notify_alert_quantity` tinyint(1) DEFAULT NULL,
  `notify_inventory_out` tinyint(1) DEFAULT NULL,
  `notify_new_order` tinyint(1) DEFAULT 1,
  `notify_abandoned_checkout` tinyint(1) DEFAULT NULL,
  `notify_new_disput` tinyint(1) DEFAULT 1,
  `enable_live_chat` tinyint(1) DEFAULT 1,
  `notify_new_chat` tinyint(1) DEFAULT 1,
  `maintenance_mode` tinyint(1) DEFAULT 1,
  `pending_verification` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active_ecommerce` tinyint(1) NOT NULL DEFAULT 1,
  `pay_online` tinyint(1) NOT NULL DEFAULT 1,
  `pay_in_person` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`shop_id`, `support_phone`, `support_phone_toll_free`, `support_email`, `support_agent`, `default_sender_email_address`, `default_email_sender_name`, `return_refund`, `order_number_prefix`, `order_number_suffix`, `default_tax_id`, `order_handling_cost`, `auto_archive_order`, `default_payment_method_id`, `ac_holder_name`, `ac_number`, `ac_type`, `ac_routing_number`, `ac_swift_bic_code`, `ac_iban`, `ac_bank_address`, `pagination`, `show_shop_desc_with_listing`, `show_refund_policy_with_listing`, `alert_quantity`, `digital_goods_only`, `default_warehouse_id`, `default_supplier_id`, `default_packaging_ids`, `notify_new_message`, `notify_alert_quantity`, `notify_inventory_out`, `notify_new_order`, `notify_abandoned_checkout`, `notify_new_disput`, `enable_live_chat`, `notify_new_chat`, `maintenance_mode`, `pending_verification`, `created_at`, `updated_at`, `active_ecommerce`, `pay_online`, `pay_in_person`) VALUES
(1, '01016856433', NULL, 'merchant@demo.com', NULL, 'merchant@demo.com', NULL, NULL, '#', NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, NULL, '2024-03-05 06:38:07', '2024-03-05 06:38:07', 1, 1, 0),
(2, '01016856433', NULL, 'merchant2@demo.com', NULL, 'merchant2@demo.com', NULL, NULL, '#', NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, NULL, '2024-03-05 06:39:15', '2024-03-05 06:39:15', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `config_cybersources`
--

CREATE TABLE `config_cybersources` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `merchant_id` text DEFAULT NULL,
  `api_key_id` text DEFAULT NULL,
  `secret` text DEFAULT NULL,
  `sandbox` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config_instamojo`
--

CREATE TABLE `config_instamojo` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `api_key` text DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sandbox` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config_manual_payments`
--

CREATE TABLE `config_manual_payments` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `additional_details` text DEFAULT NULL,
  `payment_instructions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config_paypals`
--

CREATE TABLE `config_paypals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL,
  `client_id` text DEFAULT NULL,
  `client_secret` text DEFAULT NULL,
  `sandbox` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config_paypal_express`
--

CREATE TABLE `config_paypal_express` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `account` text DEFAULT NULL,
  `client_id` text DEFAULT NULL,
  `secret` text DEFAULT NULL,
  `sandbox` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config_stripes`
--

CREATE TABLE `config_stripes` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `stripe_user_id` varchar(255) DEFAULT NULL,
  `publishable_key` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `timezone_id` int(10) UNSIGNED DEFAULT NULL,
  `citizenship` varchar(255) DEFAULT NULL,
  `iso_code` varchar(2) NOT NULL,
  `iso_numeric` varchar(3) DEFAULT NULL,
  `calling_code` varchar(3) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL,
  `eea` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `full_name`, `capital`, `currency_id`, `timezone_id`, `citizenship`, `iso_code`, `iso_numeric`, `calling_code`, `flag`, `eea`, `active`, `created_at`, `updated_at`) VALUES
(4, 'Afghanistan', 'Islamic Republic of Afghanistan', 'Kabul', 2, NULL, 'Afghan', 'AF', '004', '93', 'AF.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(8, 'Albania', 'Republic of Albania', 'Tirana', 3, NULL, 'Albanian', 'AL', '008', '355', 'AL.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(10, 'Antarctica', 'Antarctica', 'Antartica', NULL, NULL, 'of Antartica', 'AQ', '010', '672', 'AQ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(12, 'Algeria', 'People’s Democratic Republic of Algeria', 'Algiers', 42, NULL, 'Algerian', 'DZ', '012', '213', 'DZ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(16, 'American Samoa', 'Territory of American', 'Pago Pago', 148, NULL, 'American Samoan', 'AS', '016', '1', 'AS.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(20, 'Andorra', 'Principality of Andorra', 'Andorra la Vella', 46, NULL, 'Andorran', 'AD', '020', '376', 'AD.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(24, 'Angola', 'Republic of Angola', 'Luanda', 6, NULL, 'Angolan', 'AO', '024', '244', 'AO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(28, 'Antigua and Barbuda', 'Antigua and Barbuda', 'St John’s', 162, NULL, 'of Antigua and Barbuda', 'AG', '028', '1', 'AG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(31, 'Azerbaijan', 'Republic of Azerbaijan', 'Baku', 10, NULL, 'Azerbaijani', 'AZ', '031', '994', 'AZ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(32, 'Argentina', 'Argentine Republic', 'Buenos Aires', 7, NULL, 'Argentinian', 'AR', '032', '54', 'AR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(36, 'Australia', 'Commonwealth of Australia', 'Canberra', 8, NULL, 'Australian', 'AU', '036', '61', 'AU.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(40, 'Austria', 'Republic of Austria', 'Vienna', 46, NULL, 'Austrian', 'AT', '040', '43', 'AT.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(44, 'Bahamas', 'Commonwealth of the Bahamas', 'Nassau', 21, NULL, 'Bahamian', 'BS', '044', '1', 'BS.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(48, 'Bahrain', 'Kingdom of Bahrain', 'Manama', 15, NULL, 'Bahraini', 'BH', '048', '973', 'BH.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(50, 'Bangladesh', 'People’s Republic of Bangladesh', 'Dhaka', 13, NULL, 'Bangladeshi', 'BD', '050', '880', 'BD.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(51, 'Armenia', 'Republic of Armenia', 'Yerevan', 4, NULL, 'Armenian', 'AM', '051', '374', 'AM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(52, 'Barbados', 'Barbados', 'Bridgetown', 12, NULL, 'Barbadian', 'BB', '052', '1', 'BB.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(56, 'Belgium', 'Kingdom of Belgium', 'Brussels', 46, NULL, 'Belgian', 'BE', '056', '32', 'BE.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(60, 'Bermuda', 'Bermuda', 'Hamilton', 17, NULL, 'Bermudian', 'BM', '060', '1', 'BM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(64, 'Bhutan', 'Kingdom of Bhutan', 'Thimphu', 22, NULL, 'Bhutanese', 'BT', '064', '975', 'BT.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(68, 'Bolivia, Plurinational State of', 'Plurinational State of Bolivia', 'Sucre (BO1)', 19, NULL, 'Bolivian', 'BO', '068', '591', 'BO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(70, 'Bosnia and Herzegovina', 'Bosnia and Herzegovina', 'Sarajevo', 11, NULL, 'of Bosnia and Herzegovina', 'BA', '070', '387', 'BA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(72, 'Botswana', 'Republic of Botswana', 'Gaborone', 23, NULL, 'Botswanan', 'BW', '072', '267', 'BW.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(74, 'Bouvet Island', 'Bouvet Island', 'Bouvet island', NULL, NULL, 'of Bouvet island', 'BV', '074', '47', 'BV.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(76, 'Brazil', 'Federative Republic of Brazil', 'Brasilia', 20, NULL, 'Brazilian', 'BR', '076', '55', 'BR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(84, 'Belize', 'Belize', 'Belmopan', 26, NULL, 'Belizean', 'BZ', '084', '501', 'BZ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(86, 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'Diego Garcia', 148, NULL, 'Changosian', 'IO', '086', '246', 'IO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(90, 'Solomon Islands', 'Solomon Islands', 'Honiara', 122, NULL, 'Solomon Islander', 'SB', '090', '677', 'SB.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(92, 'Virgin Islands, British', 'British Virgin Islands', 'Road Town', 148, NULL, 'British Virgin Islander;', 'VG', '092', '1', 'VG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(96, 'Brunei Darussalam', 'Brunei Darussalam', 'Bandar Seri Begawan', 18, NULL, 'Bruneian', 'BN', '096', '673', 'BN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(100, 'Bulgaria', 'Republic of Bulgaria', 'Sofia', 14, NULL, 'Bulgarian', 'BG', '100', '359', 'BG.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(104, 'Myanmar', 'Union of Myanmar/', 'Yangon', 92, NULL, 'Burmese', 'MM', '104', '95', 'MM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(108, 'Burundi', 'Republic of Burundi', 'Bujumbura', 16, NULL, 'Burundian', 'BI', '108', '257', 'BI.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(112, 'Belarus', 'Republic of Belarus', 'Minsk', 25, NULL, 'Belarusian', 'BY', '112', '375', 'BY.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(116, 'Cambodia', 'Kingdom of Cambodia', 'Phnom Penh', 73, NULL, 'Cambodian', 'KH', '116', '855', 'KH.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(120, 'Cameroon', 'Republic of Cameroon', 'Yaoundé', 155, NULL, 'Cameroonian', 'CM', '120', '237', 'CM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(124, 'Canada', 'Canada', 'Ottawa', 27, NULL, 'Canadian', 'CA', '124', '1', 'CA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(132, 'Cape Verde', 'Republic of Cape Verde', 'Praia', 37, NULL, 'Cape Verdean', 'CV', '132', '238', 'CV.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(136, 'Cayman Islands', 'Cayman Islands', 'George Town', 78, NULL, 'Caymanian', 'KY', '136', '1', 'KY.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(140, 'Central African Republic', 'Central African Republic', 'Bangui', 155, NULL, 'Central African', 'CF', '140', '236', 'CF.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(144, 'Sri Lanka', 'Democratic Socialist Republic of Sri Lanka', 'Colombo', 82, NULL, 'Sri Lankan', 'LK', '144', '94', 'LK.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(148, 'Chad', 'Republic of Chad', 'N’Djamena', 155, NULL, 'Chadian', 'TD', '148', '235', 'TD.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(152, 'Chile', 'Republic of Chile', 'Santiago', 31, NULL, 'Chilean', 'CL', '152', '56', 'CL.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(156, 'China', 'People’s Republic of China', 'Beijing', 32, NULL, 'Chinese', 'CN', '156', '86', 'CN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(158, 'Taiwan, Province of China', 'Republic of China, Taiwan (TW1)', 'Taipei', 144, NULL, 'Taiwanese', 'TW', '158', '886', 'TW.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(162, 'Christmas Island', 'Christmas Island Territory', 'Flying Fish Cove', 8, NULL, 'Christmas Islander', 'CX', '162', '61', 'CX.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(166, 'Cocos (Keeling) Islands', 'Territory of Cocos (Keeling) Islands', 'Bantam', 8, NULL, 'Cocos Islander', 'CC', '166', '61', 'CC.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(170, 'Colombia', 'Republic of Colombia', 'Santa Fe de Bogotá', 33, NULL, 'Colombian', 'CO', '170', '57', 'CO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(174, 'Comoros', 'Union of the Comoros', 'Moroni', 74, NULL, 'Comorian', 'KM', '174', '269', 'KM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(175, 'Mayotte', 'Departmental Collectivity of Mayotte', 'Mamoudzou', 46, NULL, 'Mahorais', 'YT', '175', '262', 'YT.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(178, 'Congo', 'Republic of the Congo', 'Brazzaville', 155, NULL, 'Congolese', 'CG', '178', '242', 'CG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(180, 'Congo, the Democratic Republic of the', 'Democratic Republic of the Congo', 'Kinshasa', 28, NULL, 'Congolese', 'CD', '180', '243', 'CD.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(184, 'Cook Islands', 'Cook Islands', 'Avarua', 107, NULL, 'Cook Islander', 'CK', '184', '682', 'CK.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(188, 'Costa Rica', 'Republic of Costa Rica', 'San José', 34, NULL, 'Costa Rican', 'CR', '188', '506', 'CR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(191, 'Croatia', 'Republic of Croatia', 'Zagreb', 59, NULL, 'Croatian', 'HR', '191', '385', 'HR.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(192, 'Cuba', 'Republic of Cuba', 'Havana', 36, NULL, 'Cuban', 'CU', '192', '53', 'CU.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(196, 'Cyprus', 'Republic of Cyprus', 'Nicosia', 46, NULL, 'Cypriot', 'CY', '196', '357', 'CY.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(203, 'Czech Republic', 'Czech Republic', 'Prague', 38, NULL, 'Czech', 'CZ', '203', '420', 'CZ.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(204, 'Benin', 'Republic of Benin', 'Porto Novo (BJ1)', 164, NULL, 'Beninese', 'BJ', '204', '229', 'BJ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(208, 'Denmark', 'Kingdom of Denmark', 'Copenhagen', 40, NULL, 'Danish', 'DK', '208', '45', 'DK.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(212, 'Dominica', 'Commonwealth of Dominica', 'Roseau', 162, NULL, 'Dominican', 'DM', '212', '1', 'DM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(214, 'Dominican Republic', 'Dominican Republic', 'Santo Domingo', 41, NULL, 'Dominican', 'DO', '214', '1', 'DO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(218, 'Ecuador', 'Republic of Ecuador', 'Quito', 148, NULL, 'Ecuadorian', 'EC', '218', '593', 'EC.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(222, 'El Salvador', 'Republic of El Salvador', 'San Salvador', 134, NULL, 'Salvadoran', 'SV', '222', '503', 'SV.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(226, 'Equatorial Guinea', 'Republic of Equatorial Guinea', 'Malabo', 155, NULL, 'Equatorial Guinean', 'GQ', '226', '240', 'GQ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(231, 'Ethiopia', 'Federal Democratic Republic of Ethiopia', 'Addis Ababa', 45, NULL, 'Ethiopian', 'ET', '231', '251', 'ET.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(232, 'Eritrea', 'State of Eritrea', 'Asmara', 44, NULL, 'Eritrean', 'ER', '232', '291', 'ER.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(233, 'Estonia', 'Republic of Estonia', 'Tallinn', 46, NULL, 'Estonian', 'EE', '233', '372', 'EE.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(234, 'Faroe Islands', 'Faeroe Islands', 'Tórshavn', 40, NULL, 'Faeroese', 'FO', '234', '298', 'FO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(238, 'Falkland Islands (Malvinas)', 'Falkland Islands', 'Stanley', 48, NULL, 'Falkland Islander', 'FK', '238', '500', 'FK.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(239, 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'King Edward Point (Grytviken)', NULL, NULL, 'of South Georgia and the South Sandwich Islands', 'GS', '239', '44', 'GS.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(242, 'Fiji', 'Republic of Fiji', 'Suva', 47, NULL, 'Fijian', 'FJ', '242', '679', 'FJ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(246, 'Finland', 'Republic of Finland', 'Helsinki', 46, NULL, 'Finnish', 'FI', '246', '358', 'FI.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(248, 'Åland Islands', 'Åland Islands', 'Mariehamn', 46, NULL, 'Åland Islander', 'AX', '248', '358', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(250, 'France', 'French Republic', 'Paris', 46, NULL, 'French', 'FR', '250', '33', 'FR.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(254, 'French Guiana', 'French Guiana', 'Cayenne', 46, NULL, 'Guianese', 'GF', '254', '594', 'GF.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(258, 'French Polynesia', 'French Polynesia', 'Papeete', 166, NULL, 'Polynesian', 'PF', '258', '689', 'PF.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(260, 'French Southern Territories', 'French Southern and Antarctic Lands', 'Port-aux-Francais', 46, NULL, 'of French Southern and Antarctic Lands', 'TF', '260', '33', 'TF.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(262, 'Djibouti', 'Republic of Djibouti', 'Djibouti', 39, NULL, 'Djiboutian', 'DJ', '262', '253', 'DJ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(266, 'Gabon', 'Gabonese Republic', 'Libreville', 155, NULL, 'Gabonese', 'GA', '266', '241', 'GA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(268, 'Georgia', 'Georgia', 'Tbilisi', 50, NULL, 'Georgian', 'GE', '268', '995', 'GE.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(270, 'Gambia', 'Republic of the Gambia', 'Banjul', 53, NULL, 'Gambian', 'GM', '270', '220', 'GM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(275, 'Palestinian Territory, Occupied', NULL, NULL, 53, NULL, 'Palestinian', 'PS', '275', '970', 'PS.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(276, 'Germany', 'Federal Republic of Germany', 'Berlin', 46, NULL, 'German', 'DE', '276', '49', 'DE.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(288, 'Ghana', 'Republic of Ghana', 'Accra', 51, NULL, 'Ghanaian', 'GH', '288', '233', 'GH.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(292, 'Gibraltar', 'Gibraltar', 'Gibraltar', 52, NULL, 'Gibraltarian', 'GI', '292', '350', 'GI.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(296, 'Kiribati', 'Republic of Kiribati', 'Tarawa', 8, NULL, 'Kiribatian', 'KI', '296', '686', 'KI.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(300, 'Greece', 'Hellenic Republic', 'Athens', 46, NULL, 'Greek', 'GR', '300', '30', 'GR.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(304, 'Greenland', 'Greenland', 'Nuuk', 40, NULL, 'Greenlander', 'GL', '304', '299', 'GL.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(308, 'Grenada', 'Grenada', 'St George’s', 162, NULL, 'Grenadian', 'GD', '308', '1', 'GD.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(312, 'Guadeloupe', 'Guadeloupe', 'Basse Terre', 46, NULL, 'Guadeloupean', 'GP', '312', '590', 'GP.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(316, 'Guam', 'Territory of Guam', 'Agaña (Hagåtña)', 148, NULL, 'Guamanian', 'GU', '316', '1', 'GU.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(320, 'Guatemala', 'Republic of Guatemala', 'Guatemala City', 55, NULL, 'Guatemalan', 'GT', '320', '502', 'GT.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(324, 'Guinea', 'Republic of Guinea', 'Conakry', 54, NULL, 'Guinean', 'GN', '324', '224', 'GN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(328, 'Guyana', 'Cooperative Republic of Guyana', 'Georgetown', 56, NULL, 'Guyanese', 'GY', '328', '592', 'GY.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(332, 'Haiti', 'Republic of Haiti', 'Port-au-Prince', 60, NULL, 'Haitian', 'HT', '332', '509', 'HT.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(334, 'Heard Island and McDonald Islands', 'Territory of Heard Island and McDonald Islands', 'Territory of Heard Island and McDonald Islands', NULL, NULL, 'of Territory of Heard Island and McDonald Islands', 'HM', '334', '61', 'HM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(336, 'Holy See (Vatican City State)', 'the Holy See/ Vatican City State', 'Vatican City', 46, NULL, 'of the Holy See/of the Vatican', 'VA', '336', '39', 'VA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(340, 'Honduras', 'Republic of Honduras', 'Tegucigalpa', 58, NULL, 'Honduran', 'HN', '340', '504', 'HN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(344, 'Hong Kong', 'Hong Kong Special Administrative Region of the People’s Republic of China (HK2)', '(HK3)', 57, NULL, 'Hong Kong Chinese', 'HK', '344', '852', 'HK.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(348, 'Hungary', 'Republic of Hungary', 'Budapest', 61, NULL, 'Hungarian', 'HU', '348', '36', 'HU.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(352, 'Iceland', 'Republic of Iceland', 'Reykjavik', 67, NULL, 'Icelander', 'IS', '352', '354', 'IS.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(356, 'India', 'Republic of India', 'New Delhi', 64, NULL, 'Indian', 'IN', '356', '91', 'IN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(360, 'Indonesia', 'Republic of Indonesia', 'Jakarta', 62, NULL, 'Indonesian', 'ID', '360', '62', 'ID.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(364, 'Iran, Islamic Republic of', 'Islamic Republic of Iran', 'Tehran', 66, NULL, 'Iranian', 'IR', '364', '98', 'IR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(368, 'Iraq', 'Republic of Iraq', 'Baghdad', 65, NULL, 'Iraqi', 'IQ', '368', '964', 'IQ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(372, 'Ireland', 'Ireland (IE1)', 'Dublin', 46, NULL, 'Irish', 'IE', '372', '353', 'IE.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(376, 'Israel', 'State of Israel', '(IL1)', 63, NULL, 'Israeli', 'IL', '376', '972', 'IL.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(380, 'Italy', 'Italian Republic', 'Rome', 46, NULL, 'Italian', 'IT', '380', '39', 'IT.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(384, 'Côte d\'Ivoire', 'Republic of Côte d’Ivoire', 'Yamoussoukro (CI1)', 164, NULL, 'Ivorian', 'CI', '384', '225', 'CI.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(388, 'Jamaica', 'Jamaica', 'Kingston', 68, NULL, 'Jamaican', 'JM', '388', '1', 'JM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(392, 'Japan', 'Japan', 'Tokyo', 70, NULL, 'Japanese', 'JP', '392', '81', 'JP.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(398, 'Kazakhstan', 'Republic of Kazakhstan', 'Astana', 79, NULL, 'Kazakh', 'KZ', '398', '7', 'KZ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(400, 'Jordan', 'Hashemite Kingdom of Jordan', 'Amman', 69, NULL, 'Jordanian', 'JO', '400', '962', 'JO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(404, 'Kenya', 'Republic of Kenya', 'Nairobi', 71, NULL, 'Kenyan', 'KE', '404', '254', 'KE.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(408, 'Korea, Democratic People\'s Republic of', 'Democratic People’s Republic of Korea', 'Pyongyang', 75, NULL, 'North Korean', 'KP', '408', '850', 'KP.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(410, 'Korea, Republic of', 'Republic of Korea', 'Seoul', 76, NULL, 'South Korean', 'KR', '410', '82', 'KR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(414, 'Kuwait', 'State of Kuwait', 'Kuwait City', 77, NULL, 'Kuwaiti', 'KW', '414', '965', 'KW.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(417, 'Kyrgyzstan', 'Kyrgyz Republic', 'Bishkek', 72, NULL, 'Kyrgyz', 'KG', '417', '996', 'KG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(418, 'Lao People\'s Democratic Republic', 'Lao People’s Democratic Republic', 'Vientiane', 80, NULL, 'Lao', 'LA', '418', '856', 'LA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(422, 'Lebanon', 'Lebanese Republic', 'Beirut', 81, NULL, 'Lebanese', 'LB', '422', '961', 'LB.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(426, 'Lesotho', 'Kingdom of Lesotho', 'Maseru', 84, NULL, 'Basotho', 'LS', '426', '266', 'LS.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(428, 'Latvia', 'Republic of Latvia', 'Riga', 46, NULL, 'Latvian', 'LV', '428', '371', 'LV.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(430, 'Liberia', 'Republic of Liberia', 'Monrovia', 83, NULL, 'Liberian', 'LR', '430', '231', 'LR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(434, 'Libya', 'Socialist People’s Libyan Arab Jamahiriya', 'Tripoli', 87, NULL, 'Libyan', 'LY', '434', '218', 'LY.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(438, 'Liechtenstein', 'Principality of Liechtenstein', 'Vaduz', 29, NULL, 'Liechtensteiner', 'LI', '438', '423', 'LI.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(440, 'Lithuania', 'Republic of Lithuania', 'Vilnius', 46, NULL, 'Lithuanian', 'LT', '440', '370', 'LT.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(442, 'Luxembourg', 'Grand Duchy of Luxembourg', 'Luxembourg', 46, NULL, 'Luxembourger', 'LU', '442', '352', 'LU.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(446, 'Macao', 'Macao Special Administrative Region of the People’s Republic of China (MO2)', 'Macao (MO3)', 94, NULL, 'Macanese', 'MO', '446', '853', 'MO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(450, 'Madagascar', 'Republic of Madagascar', 'Antananarivo', 90, NULL, 'Malagasy', 'MG', '450', '261', 'MG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(454, 'Malawi', 'Republic of Malawi', 'Lilongwe', 98, NULL, 'Malawian', 'MW', '454', '265', 'MW.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(458, 'Malaysia', 'Malaysia', 'Kuala Lumpur (MY1)', 100, NULL, 'Malaysian', 'MY', '458', '60', 'MY.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(462, 'Maldives', 'Republic of Maldives', 'Malé', 97, NULL, 'Maldivian', 'MV', '462', '960', 'MV.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(466, 'Mali', 'Republic of Mali', 'Bamako', 164, NULL, 'Malian', 'ML', '466', '223', 'ML.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(470, 'Malta', 'Republic of Malta', 'Valletta', 46, NULL, 'Maltese', 'MT', '470', '356', 'MT.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(474, 'Martinique', 'Martinique', 'Fort-de-France', 46, NULL, 'Martinican', 'MQ', '474', '596', 'MQ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(478, 'Mauritania', 'Islamic Republic of Mauritania', 'Nouakchott', 95, NULL, 'Mauritanian', 'MR', '478', '222', 'MR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(480, 'Mauritius', 'Republic of Mauritius', 'Port Louis', 96, NULL, 'Mauritian', 'MU', '480', '230', 'MU.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(484, 'Mexico', 'United Mexican States', 'Mexico City', 99, NULL, 'Mexican', 'MX', '484', '52', 'MX.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(492, 'Monaco', 'Principality of Monaco', 'Monaco', 46, NULL, 'Monegasque', 'MC', '492', '377', 'MC.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(496, 'Mongolia', 'Mongolia', 'Ulan Bator', 93, NULL, 'Mongolian', 'MN', '496', '976', 'MN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(498, 'Moldova, Republic of', 'Republic of Moldova', 'Chisinau', 89, NULL, 'Moldovan', 'MD', '498', '373', 'MD.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(499, 'Montenegro', 'Montenegro', 'Podgorica', 46, NULL, 'Montenegrin', 'ME', '499', '382', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(500, 'Montserrat', 'Montserrat', 'Plymouth (MS2)', 162, NULL, 'Montserratian', 'MS', '500', '1', 'MS.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(504, 'Morocco', 'Kingdom of Morocco', 'Rabat', 88, NULL, 'Moroccan', 'MA', '504', '212', 'MA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(508, 'Mozambique', 'Republic of Mozambique', 'Maputo', 101, NULL, 'Mozambican', 'MZ', '508', '258', 'MZ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(512, 'Oman', 'Sultanate of Oman', 'Muscat', 108, NULL, 'Omani', 'OM', '512', '968', 'OM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(516, 'Namibia', 'Republic of Namibia', 'Windhoek', 102, NULL, 'Namibian', 'NA', '516', '264', 'NA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(520, 'Nauru', 'Republic of Nauru', 'Yaren', 8, NULL, 'Nauruan', 'NR', '520', '674', 'NR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(524, 'Nepal', 'Nepal', 'Kathmandu', 106, NULL, 'Nepalese', 'NP', '524', '977', 'NP.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(528, 'Netherlands', 'Kingdom of the Netherlands', 'Amsterdam (NL2)', 46, NULL, 'Dutch', 'NL', '528', '31', 'NL.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(531, 'Curaçao', 'Curaçao', 'Willemstad', 5, NULL, 'Curaçaoan', 'CW', '531', '599', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(533, 'Aruba', 'Aruba', 'Oranjestad', 9, NULL, 'Aruban', 'AW', '533', '297', 'AW.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(534, 'Sint Maarten (Dutch part)', 'Sint Maarten', 'Philipsburg', 5, NULL, 'Sint Maartener', 'SX', '534', '721', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(535, 'Bonaire, Sint Eustatius and Saba', NULL, NULL, 148, NULL, 'of Bonaire, Sint Eustatius and Saba', 'BQ', '535', '599', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(540, 'New Caledonia', 'New Caledonia', 'Nouméa', 166, NULL, 'New Caledonian', 'NC', '540', '687', 'NC.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(548, 'Vanuatu', 'Republic of Vanuatu', 'Port Vila', 153, NULL, 'Vanuatuan', 'VU', '548', '678', 'VU.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(554, 'New Zealand', 'New Zealand', 'Wellington', 107, NULL, 'New Zealander', 'NZ', '554', '64', 'NZ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(558, 'Nicaragua', 'Republic of Nicaragua', 'Managua', 104, NULL, 'Nicaraguan', 'NI', '558', '505', 'NI.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(562, 'Niger', 'Republic of Niger', 'Niamey', 164, NULL, 'Nigerien', 'NE', '562', '227', 'NE.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(566, 'Nigeria', 'Federal Republic of Nigeria', 'Abuja', 103, NULL, 'Nigerian', 'NG', '566', '234', 'NG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(570, 'Niue', 'Niue', 'Alofi', 107, NULL, 'Niuean', 'NU', '570', '683', 'NU.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(574, 'Norfolk Island', 'Territory of Norfolk Island', 'Kingston', 8, NULL, 'Norfolk Islander', 'NF', '574', '672', 'NF.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(578, 'Norway', 'Kingdom of Norway', 'Oslo', 105, NULL, 'Norwegian', 'NO', '578', '47', 'NO.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(580, 'Northern Mariana Islands', 'Commonwealth of the Northern Mariana Islands', 'Saipan', 148, NULL, 'Northern Mariana Islander', 'MP', '580', '1', 'MP.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(581, 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', 148, NULL, 'of United States Minor Outlying Islands', 'UM', '581', '1', 'UM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(583, 'Micronesia, Federated States of', 'Federated States of Micronesia', 'Palikir', 148, NULL, 'Micronesian', 'FM', '583', '691', 'FM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(584, 'Marshall Islands', 'Republic of the Marshall Islands', 'Majuro', 148, NULL, 'Marshallese', 'MH', '584', '692', 'MH.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(585, 'Palau', 'Republic of Palau', 'Melekeok', 148, NULL, 'Palauan', 'PW', '585', '680', 'PW.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(586, 'Pakistan', 'Islamic Republic of Pakistan', 'Islamabad', 113, NULL, 'Pakistani', 'PK', '586', '92', 'PK.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(591, 'Panama', 'Republic of Panama', 'Panama City', 109, NULL, 'Panamanian', 'PA', '591', '507', 'PA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(598, 'Papua New Guinea', 'Independent State of Papua New Guinea', 'Port Moresby', 111, NULL, 'Papua New Guinean', 'PG', '598', '675', 'PG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(600, 'Paraguay', 'Republic of Paraguay', 'Asunción', 115, NULL, 'Paraguayan', 'PY', '600', '595', 'PY.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(604, 'Peru', 'Republic of Peru', 'Lima', 110, NULL, 'Peruvian', 'PE', '604', '51', 'PE.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(608, 'Philippines', 'Republic of the Philippines', 'Manila', 112, NULL, 'Filipino', 'PH', '608', '63', 'PH.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(612, 'Pitcairn', 'Pitcairn Islands', 'Adamstown', 107, NULL, 'Pitcairner', 'PN', '612', '649', 'PN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(616, 'Poland', 'Republic of Poland', 'Warsaw', 114, NULL, 'Polish', 'PL', '616', '48', 'PL.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(620, 'Portugal', 'Portuguese Republic', 'Lisbon', 46, NULL, 'Portuguese', 'PT', '620', '351', 'PT.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(624, 'Guinea-Bissau', 'Republic of Guinea-Bissau', 'Bissau', 164, NULL, 'Guinea-Bissau national', 'GW', '624', '245', 'GW.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(626, 'Timor-Leste', 'Democratic Republic of East Timor', 'Dili', 148, NULL, 'East Timorese', 'TL', '626', '670', 'TL.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(630, 'Puerto Rico', 'Commonwealth of Puerto Rico', 'San Juan', 148, NULL, 'Puerto Rican', 'PR', '630', '1', 'PR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(634, 'Qatar', 'State of Qatar', 'Doha', 116, NULL, 'Qatari', 'QA', '634', '974', 'QA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(638, 'Réunion', 'Réunion', 'Saint-Denis', 46, NULL, 'Reunionese', 'RE', '638', '262', 'RE.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(642, 'Romania', 'Romania', 'Bucharest', 117, NULL, 'Romanian', 'RO', '642', '40', 'RO.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(643, 'Russian Federation', 'Russian Federation', 'Moscow', 119, NULL, 'Russian', 'RU', '643', '7', 'RU.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(646, 'Rwanda', 'Republic of Rwanda', 'Kigali', 120, NULL, 'Rwandan; Rwandese', 'RW', '646', '250', 'RW.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(652, 'Saint Barthélemy', 'Collectivity of Saint Barthélemy', 'Gustavia', 46, NULL, 'of Saint Barthélemy', 'BL', '652', '590', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(654, 'Saint Helena, Ascension and Tristan da Cunha', 'Saint Helena, Ascension and Tristan da Cunha', 'Jamestown', 127, NULL, 'Saint Helenian', 'SH', '654', '290', 'SH.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(659, 'Saint Kitts and Nevis', 'Federation of Saint Kitts and Nevis', 'Basseterre', 162, NULL, 'Kittsian; Nevisian', 'KN', '659', '1', 'KN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(660, 'Anguilla', 'Anguilla', 'The Valley', 162, NULL, 'Anguillan', 'AI', '660', '1', 'AI.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(662, 'Saint Lucia', 'Saint Lucia', 'Castries', 162, NULL, 'Saint Lucian', 'LC', '662', '1', 'LC.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(663, 'Saint Martin (French part)', 'Collectivity of Saint Martin', 'Marigot', 46, NULL, 'of Saint Martin', 'MF', '663', '590', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(666, 'Saint Pierre and Miquelon', 'Territorial Collectivity of Saint Pierre and Miquelon', 'Saint-Pierre', 46, NULL, 'St-Pierrais; Miquelonnais', 'PM', '666', '508', 'PM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(670, 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'Kingstown', 162, NULL, 'Vincentian', 'VC', '670', '1', 'VC.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(674, 'San Marino', 'Republic of San Marino', 'San Marino', 46, NULL, 'San Marinese', 'SM', '674', '378', 'SM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(678, 'Sao Tome and Principe', 'Democratic Republic of São Tomé and Príncipe', 'São Tomé', 133, NULL, 'São Toméan', 'ST', '678', '239', 'ST.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(682, 'Saudi Arabia', 'Kingdom of Saudi Arabia', 'Riyadh', 121, NULL, 'Saudi Arabian', 'SA', '682', '966', 'SA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(686, 'Senegal', 'Republic of Senegal', 'Dakar', 164, NULL, 'Senegalese', 'SN', '686', '221', 'SN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(688, 'Serbia', 'Republic of Serbia', 'Belgrade', 118, NULL, 'Serb', 'RS', '688', '381', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(690, 'Seychelles', 'Republic of Seychelles', 'Victoria', 123, NULL, 'Seychellois', 'SC', '690', '248', 'SC.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(694, 'Sierra Leone', 'Republic of Sierra Leone', 'Freetown', 129, NULL, 'Sierra Leonean', 'SL', '694', '232', 'SL.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(702, 'Singapore', 'Republic of Singapore', 'Singapore', 126, NULL, 'Singaporean', 'SG', '702', '65', 'SG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(703, 'Slovakia', 'Slovak Republic', 'Bratislava', 46, NULL, 'Slovak', 'SK', '703', '421', 'SK.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(704, 'Viet Nam', 'Socialist Republic of Vietnam', 'Hanoi', 152, NULL, 'Vietnamese', 'VN', '704', '84', 'VN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(705, 'Slovenia', 'Republic of Slovenia', 'Ljubljana', 46, NULL, 'Slovene', 'SI', '705', '386', 'SI.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(706, 'Somalia', 'Somali Republic', 'Mogadishu', 130, NULL, 'Somali', 'SO', '706', '252', 'SO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(710, 'South Africa', 'Republic of South Africa', 'Pretoria (ZA1)', 170, NULL, 'South African', 'ZA', '710', '27', 'ZA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(716, 'Zimbabwe', 'Republic of Zimbabwe', 'Harare', NULL, NULL, 'Zimbabwean', 'ZW', '716', '263', 'ZW.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(724, 'Spain', 'Kingdom of Spain', 'Madrid', 46, NULL, 'Spaniard', 'ES', '724', '34', 'ES.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(728, 'South Sudan', 'Republic of South Sudan', 'Juba', 132, NULL, 'South Sudanese', 'SS', '728', '211', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(729, 'Sudan', 'Republic of the Sudan', 'Khartoum', 124, NULL, 'Sudanese', 'SD', '729', '249', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(732, 'Western Sahara', 'Western Sahara', 'Al aaiun', 88, NULL, 'Sahrawi', 'EH', '732', '212', 'EH.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(740, 'Suriname', 'Republic of Suriname', 'Paramaribo', 131, NULL, 'Surinamese', 'SR', '740', '597', 'SR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(744, 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen', 'Longyearbyen', 105, NULL, 'of Svalbard', 'SJ', '744', '47', 'SJ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(748, 'Swaziland', 'Kingdom of Swaziland', 'Mbabane', 136, NULL, 'Swazi', 'SZ', '748', '268', 'SZ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(752, 'Sweden', 'Kingdom of Sweden', 'Stockholm', 125, NULL, 'Swedish', 'SE', '752', '46', 'SE.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(756, 'Switzerland', 'Swiss Confederation', 'Berne', 29, NULL, 'Swiss', 'CH', '756', '41', 'CH.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(760, 'Syrian Arab Republic', 'Syrian Arab Republic', 'Damascus', 135, NULL, 'Syrian', 'SY', '760', '963', 'SY.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(762, 'Tajikistan', 'Republic of Tajikistan', 'Dushanbe', 138, NULL, 'Tajik', 'TJ', '762', '992', 'TJ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(764, 'Thailand', 'Kingdom of Thailand', 'Bangkok', 137, NULL, 'Thai', 'TH', '764', '66', 'TH.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(768, 'Togo', 'Togolese Republic', 'Lomé', 164, NULL, 'Togolese', 'TG', '768', '228', 'TG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(772, 'Tokelau', 'Tokelau', '(TK2)', 107, NULL, 'Tokelauan', 'TK', '772', '690', 'TK.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(776, 'Tonga', 'Kingdom of Tonga', 'Nuku’alofa', 141, NULL, 'Tongan', 'TO', '776', '676', 'TO.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(780, 'Trinidad and Tobago', 'Republic of Trinidad and Tobago', 'Port of Spain', 143, NULL, 'Trinidadian; Tobagonian', 'TT', '780', '1', 'TT.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(784, 'United Arab Emirates', 'United Arab Emirates', 'Abu Dhabi', 1, NULL, 'Emirian', 'AE', '784', '971', 'AE.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(788, 'Tunisia', 'Republic of Tunisia', 'Tunis', 140, NULL, 'Tunisian', 'TN', '788', '216', 'TN.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(792, 'Turkey', 'Republic of Turkey', 'Ankara', 142, NULL, 'Turk', 'TR', '792', '90', 'TR.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(795, 'Turkmenistan', 'Turkmenistan', 'Ashgabat', 139, NULL, 'Turkmen', 'TM', '795', '993', 'TM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(796, 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'Cockburn Town', 148, NULL, 'Turks and Caicos Islander', 'TC', '796', '1', 'TC.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(798, 'Tuvalu', 'Tuvalu', 'Funafuti', 8, NULL, 'Tuvaluan', 'TV', '798', '688', 'TV.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(800, 'Uganda', 'Republic of Uganda', 'Kampala', 147, NULL, 'Ugandan', 'UG', '800', '256', 'UG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(804, 'Ukraine', 'Ukraine', 'Kiev', 146, NULL, 'Ukrainian', 'UA', '804', '380', 'UA.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(807, 'Macedonia, the former Yugoslav Republic of', 'the former Yugoslav Republic of Macedonia', 'Skopje', 91, NULL, 'of the former Yugoslav Republic of Macedonia', 'MK', '807', '389', 'MK.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(818, 'Egypt', 'Arab Republic of Egypt', 'Cairo', 43, NULL, 'Egyptian', 'EG', '818', '20', 'EG.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(826, 'United Kingdom', 'United Kingdom of Great Britain and Northern Ireland', 'London', 49, NULL, 'British', 'GB', '826', '44', 'GB.png', 1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(831, 'Guernsey', 'Bailiwick of Guernsey', 'St Peter Port', NULL, NULL, 'of Guernsey', 'GG', '831', '44', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(832, 'Jersey', 'Bailiwick of Jersey', 'St Helier', NULL, NULL, 'of Jersey', 'JE', '832', '44', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(833, 'Isle of Man', 'Isle of Man', 'Douglas', NULL, NULL, 'Manxman; Manxwoman', 'IM', '833', '44', NULL, 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(834, 'Tanzania, United Republic of', 'United Republic of Tanzania', 'Dodoma (TZ1)', 145, NULL, 'Tanzanian', 'TZ', '834', '255', 'TZ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(840, 'United States', 'United States of America', 'Washington DC', 148, NULL, 'American', 'US', '840', '1', 'US.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(850, 'Virgin Islands, U.S.', 'United States Virgin Islands', 'Charlotte Amalie', 148, NULL, 'US Virgin Islander', 'VI', '850', '1', 'VI.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(854, 'Burkina Faso', 'Burkina Faso', 'Ouagadougou', 164, NULL, 'Burkinabe', 'BF', '854', '226', 'BF.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(858, 'Uruguay', 'Eastern Republic of Uruguay', 'Montevideo', 149, NULL, 'Uruguayan', 'UY', '858', '598', 'UY.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(860, 'Uzbekistan', 'Republic of Uzbekistan', 'Tashkent', 150, NULL, 'Uzbek', 'UZ', '860', '998', 'UZ.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(862, 'Venezuela, Bolivarian Republic of', 'Bolivarian Republic of Venezuela', 'Caracas', 151, NULL, 'Venezuelan', 'VE', '862', '58', 'VE.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(876, 'Wallis and Futuna', 'Wallis and Futuna', 'Mata-Utu', 166, NULL, 'Wallisian; Futunan; Wallis and Futuna Islander', 'WF', '876', '681', 'WF.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(882, 'Samoa', 'Independent State of Samoa', 'Apia', 154, NULL, 'Samoan', 'WS', '882', '685', 'WS.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(887, 'Yemen', 'Republic of Yemen', 'San’a', 169, NULL, 'Yemenite', 'YE', '887', '967', 'YE.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(894, 'Zambia', 'Republic of Zambia', 'Lusaka', 172, NULL, 'Zambian', 'ZM', '894', '260', 'ZM.png', 0, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `name` text DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `value` decimal(20,6) DEFAULT NULL,
  `min_order_amount` decimal(20,6) DEFAULT NULL,
  `type` enum('amount','percent') NOT NULL DEFAULT 'amount',
  `quantity` int(11) DEFAULT NULL,
  `quantity_per_customer` int(11) DEFAULT NULL,
  `starting_time` timestamp NULL DEFAULT NULL,
  `ending_time` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_customer`
--

CREATE TABLE `coupon_customer` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_shipping_zone`
--

CREATE TABLE `coupon_shipping_zone` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_zone_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso_code` varchar(3) NOT NULL,
  `iso_numeric` varchar(3) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `disambiguate_symbol` varchar(255) DEFAULT NULL,
  `subunit` varchar(255) DEFAULT NULL,
  `subunit_to_unit` int(11) NOT NULL DEFAULT 100,
  `symbol_first` tinyint(1) NOT NULL DEFAULT 1,
  `html_entity` varchar(255) DEFAULT NULL,
  `decimal_mark` varchar(25) DEFAULT NULL,
  `thousands_separator` varchar(25) DEFAULT NULL,
  `smallest_denomination` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) DEFAULT 100,
  `active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `iso_code`, `iso_numeric`, `name`, `symbol`, `disambiguate_symbol`, `subunit`, `subunit_to_unit`, `symbol_first`, `html_entity`, `decimal_mark`, `thousands_separator`, `smallest_denomination`, `priority`, `active`, `created_at`, `updated_at`) VALUES
(1, 'AED', '784', 'United Arab Emirates Dirham', 'د.إ', NULL, 'Fils', 100, 0, '', '.', ',', 25, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(2, 'AFN', '971', 'Afghani', '؋', NULL, 'Pul', 100, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(3, 'ALL', '008', 'Albanian Lek', 'L', 'Lek', 'Qintar', 100, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(4, 'AMD', '051', 'Armenian Dram', 'դր.', NULL, 'Luma', 100, 0, '', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(5, 'ANG', '532', 'Netherlands Antillean Gulden', 'ƒ', NULL, 'Cent', 100, 1, '&#x0192;', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(6, 'AOA', '973', 'Angolan Kwanza', 'Kz', NULL, 'Cêntimo', 100, 0, '', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(7, 'ARS', '032', 'Argentine Peso', '$', '$m/n', 'Centavo', 100, 1, '&#x20B1;', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(8, 'AUD', '036', 'Australian Dollar', '$', 'A$', 'Cent', 100, 1, '$', '.', ',', 5, 4, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(9, 'AWG', '533', 'Aruban Florin', 'ƒ', NULL, 'Cent', 100, 0, '&#x0192;', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(10, 'AZN', '944', 'Azerbaijani Manat', '₼', NULL, 'Qəpik', 100, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(11, 'BAM', '977', 'Bosnia and Herzegovina Convertible Mark', 'КМ', NULL, 'Fening', 100, 1, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(12, 'BBD', '052', 'Barbadian Dollar', '$', 'Bds$', 'Cent', 100, 0, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(13, 'BDT', '050', 'Bangladeshi Taka', '৳', NULL, 'Paisa', 100, 1, '', '.', ',', 1, 10, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(14, 'BGN', '975', 'Bulgarian Lev', 'лв.', NULL, 'Stotinka', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(15, 'BHD', '048', 'Bahraini Dinar', 'ب.د', NULL, 'Fils', 1000, 1, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(16, 'BIF', '108', 'Burundian Franc', 'Fr', 'FBu', 'Centime', 1, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(17, 'BMD', '060', 'Bermudian Dollar', '$', 'BD$', 'Cent', 100, 1, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(18, 'BND', '096', 'Brunei Dollar', '$', 'BND', 'Sen', 100, 1, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(19, 'BOB', '068', 'Bolivian Boliviano', 'Bs.', NULL, 'Centavo', 100, 1, '', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(20, 'BRL', '986', 'Brazilian Real', 'R$', NULL, 'Centavo', 100, 1, 'R$', ',', '.', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(21, 'BSD', '044', 'Bahamian Dollar', '$', 'BSD', 'Cent', 100, 1, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(22, 'BTN', '064', 'Bhutanese Ngultrum', 'Nu.', NULL, 'Chertrum', 100, 0, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(23, 'BWP', '072', 'Botswana Pula', 'P', NULL, 'Thebe', 100, 1, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(24, 'BYN', '933', 'Belarusian Ruble', 'Br', 'BYN', 'Kapeyka', 100, 0, '', ',', ' ', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(25, 'BYR', '974', 'Belarusian Ruble', 'Br', 'BYR', NULL, 1, 0, '', ',', ' ', 100, 50, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(26, 'BZD', '084', 'Belize Dollar', '$', 'BZ$', 'Cent', 100, 1, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(27, 'CAD', '124', 'Canadian Dollar', '$', 'C$', 'Cent', 100, 1, '$', '.', ',', 5, 5, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(28, 'CDF', '976', 'Congolese Franc', 'Fr', 'FC', 'Centime', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(29, 'CHF', '756', 'Swiss Franc', 'CHF', NULL, 'Rappen', 100, 1, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(30, 'CLF', '990', 'Unidad de Fomento', 'UF', NULL, 'Peso', 10000, 1, '&#x20B1;', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(31, 'CLP', '152', 'Chilean Peso', '$', 'CLP', 'Peso', 1, 1, '&#36;', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(32, 'CNY', '156', 'Chinese Renminbi Yuan', '¥', NULL, 'Fen', 100, 1, '￥', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(33, 'COP', '170', 'Colombian Peso', '$', 'COL$', 'Centavo', 100, 1, '&#36;', ',', '.', 20, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(34, 'CRC', '188', 'Costa Rican Colón', '₡', NULL, 'Céntimo', 100, 1, '&#x20A1;', ',', '.', 500, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(35, 'CUC', '931', 'Cuban Convertible Peso', '$', 'CUC$', 'Centavo', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(36, 'CUP', '192', 'Cuban Peso', '$', '$MN', 'Centavo', 100, 1, '&#x20B1;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(37, 'CVE', '132', 'Cape Verdean Escudo', '$', 'Esc', 'Centavo', 100, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(38, 'CZK', '203', 'Czech Koruna', 'Kč', NULL, 'Haléř', 100, 0, '', ',', ' ', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(39, 'DJF', '262', 'Djiboutian Franc', 'Fdj', NULL, 'Centime', 1, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(40, 'DKK', '208', 'Danish Krone', 'kr.', 'DKK', 'Øre', 100, 0, '', ',', '.', 50, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(41, 'DOP', '214', 'Dominican Peso', '$', 'RD$', 'Centavo', 100, 1, '&#x20B1;', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(42, 'DZD', '012', 'Algerian Dinar', 'د.ج', NULL, 'Centime', 100, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(43, 'EGP', '818', 'Egyptian Pound', 'ج.م', NULL, 'Piastre', 100, 1, '&#x00A3;', '.', ',', 25, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(44, 'ERN', '232', 'Eritrean Nakfa', 'Nfk', NULL, 'Cent', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(45, 'ETB', '230', 'Ethiopian Birr', 'Br', 'ETB', 'Santim', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(46, 'EUR', '978', 'Euro', '€', NULL, 'Cent', 100, 1, '&#x20AC;', ',', '.', 1, 2, 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(47, 'FJD', '242', 'Fijian Dollar', '$', 'FJ$', 'Cent', 100, 0, '$', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(48, 'FKP', '238', 'Falkland Pound', '£', 'FK£', 'Penny', 100, 0, '&#x00A3;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(49, 'GBP', '826', 'British Pound', '£', NULL, 'Penny', 100, 1, '&#x00A3;', '.', ',', 1, 3, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(50, 'GEL', '981', 'Georgian Lari', 'ლ', NULL, 'Tetri', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(51, 'GHS', '936', 'Ghanaian Cedi', '₵', NULL, 'Pesewa', 100, 1, '&#x20B5;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(52, 'GIP', '292', 'Gibraltar Pound', '£', 'GIP', 'Penny', 100, 1, '&#x00A3;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(53, 'GMD', '270', 'Gambian Dalasi', 'D', NULL, 'Butut', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(54, 'GNF', '324', 'Guinean Franc', 'Fr', 'FG', 'Centime', 1, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(55, 'GTQ', '320', 'Guatemalan Quetzal', 'Q', NULL, 'Centavo', 100, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(56, 'GYD', '328', 'Guyanese Dollar', '$', 'G$', 'Cent', 100, 0, '$', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(57, 'HKD', '344', 'Hong Kong Dollar', '$', 'HK$', 'Cent', 100, 1, '$', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(58, 'HNL', '340', 'Honduran Lempira', 'L', 'HNL', 'Centavo', 100, 1, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(59, 'HRK', '191', 'Croatian Kuna', 'kn', NULL, 'Lipa', 100, 0, '', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(60, 'HTG', '332', 'Haitian Gourde', 'G', NULL, 'Centime', 100, 0, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(61, 'HUF', '348', 'Hungarian Forint', 'Ft', NULL, 'Fillér', 1, 0, '', ',', '.', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(62, 'IDR', '360', 'Indonesian Rupiah', 'Rp', NULL, 'Sen', 100, 1, '', ',', '.', 5000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(63, 'ILS', '376', 'Israeli New Sheqel', '₪', NULL, 'Agora', 100, 1, '&#x20AA;', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(64, 'INR', '356', 'Indian Rupee', '₹', NULL, 'Paisa', 100, 1, '&#x20b9;', '.', ',', 50, 59, 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(65, 'IQD', '368', 'Iraqi Dinar', 'ع.د', NULL, 'Fils', 1000, 0, '', '.', ',', 50000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(66, 'IRR', '364', 'Iranian Rial', '﷼', NULL, NULL, 100, 1, '&#xFDFC;', '.', ',', 5000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(67, 'ISK', '352', 'Icelandic Króna', 'kr', NULL, NULL, 1, 1, '', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(68, 'JMD', '388', 'Jamaican Dollar', '$', 'J$', 'Cent', 100, 1, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(69, 'JOD', '400', 'Jordanian Dinar', 'د.ا', NULL, 'Fils', 1000, 1, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(70, 'JPY', '392', 'Japanese Yen', '¥', NULL, NULL, 1, 1, '&#x00A5;', '.', ',', 1, 6, 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(71, 'KES', '404', 'Kenyan Shilling', 'KSh', NULL, 'Cent', 100, 1, '', '.', ',', 50, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(72, 'KGS', '417', 'Kyrgyzstani Som', 'som', NULL, 'Tyiyn', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(73, 'KHR', '116', 'Cambodian Riel', '៛', NULL, 'Sen', 100, 0, '&#x17DB;', '.', ',', 5000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(74, 'KMF', '174', 'Comorian Franc', 'Fr', 'CF', 'Centime', 1, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(75, 'KPW', '408', 'North Korean Won', '₩', NULL, 'Chŏn', 100, 0, '&#x20A9;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(76, 'KRW', '410', 'South Korean Won', '₩', NULL, NULL, 1, 1, '&#x20A9;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(77, 'KWD', '414', 'Kuwaiti Dinar', 'د.ك', NULL, 'Fils', 1000, 1, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(78, 'KYD', '136', 'Cayman Islands Dollar', '$', 'CI$', 'Cent', 100, 1, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(79, 'KZT', '398', 'Kazakhstani Tenge', '〒', NULL, 'Tiyn', 100, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(80, 'LAK', '418', 'Lao Kip', '₭', NULL, 'Att', 100, 0, '&#x20AD;', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(81, 'LBP', '422', 'Lebanese Pound', 'ل.ل', NULL, 'Piastre', 100, 1, '&#x00A3;', '.', ',', 25000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(82, 'LKR', '144', 'Sri Lankan Rupee', '₨', 'SLRs', 'Cent', 100, 0, '&#x0BF9;', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(83, 'LRD', '430', 'Liberian Dollar', '$', 'L$', 'Cent', 100, 0, '$', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(84, 'LSL', '426', 'Lesotho Loti', 'L', 'M', 'Sente', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(85, 'LTL', '440', 'Lithuanian Litas', 'Lt', NULL, 'Centas', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(86, 'LVL', '428', 'Latvian Lats', 'Ls', NULL, 'Santīms', 100, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(87, 'LYD', '434', 'Libyan Dinar', 'ل.د', NULL, 'Dirham', 1000, 0, '', '.', ',', 50, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(88, 'MAD', '504', 'Moroccan Dirham', 'د.م.', NULL, 'Centime', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(89, 'MDL', '498', 'Moldovan Leu', 'L', NULL, 'Ban', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(90, 'MGA', '969', 'Malagasy Ariary', 'Ar', NULL, 'Iraimbilanja', 5, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(91, 'MKD', '807', 'Macedonian Denar', 'ден', NULL, 'Deni', 100, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(92, 'MMK', '104', 'Myanmar Kyat', 'K', 'MMK', 'Pya', 100, 0, '', '.', ',', 50, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(93, 'MNT', '496', 'Mongolian Tögrög', '₮', NULL, 'Möngö', 100, 0, '&#x20AE;', '.', ',', 2000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(94, 'MOP', '446', 'Macanese Pataca', 'P', NULL, 'Avo', 100, 0, '', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(95, 'MRO', '478', 'Mauritanian Ouguiya', 'UM', NULL, 'Khoums', 5, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(96, 'MUR', '480', 'Mauritian Rupee', '₨', NULL, 'Cent', 100, 1, '&#x20A8;', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(97, 'MVR', '462', 'Maldivian Rufiyaa', 'MVR', NULL, 'Laari', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(98, 'MWK', '454', 'Malawian Kwacha', 'MK', NULL, 'Tambala', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(99, 'MXN', '484', 'Mexican Peso', '$', 'MEX$', 'Centavo', 100, 1, '$', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(100, 'MYR', '458', 'Malaysian Ringgit', 'RM', NULL, 'Sen', 100, 1, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(101, 'MZN', '943', 'Mozambican Metical', 'MTn', NULL, 'Centavo', 100, 1, '', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(102, 'NAD', '516', 'Namibian Dollar', '$', 'N$', 'Cent', 100, 0, '$', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(103, 'NGN', '566', 'Nigerian Naira', '₦', NULL, 'Kobo', 100, 1, '&#x20A6;', '.', ',', 50, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(104, 'NIO', '558', 'Nicaraguan Córdoba', 'C$', NULL, 'Centavo', 100, 0, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(105, 'NOK', '578', 'Norwegian Krone', 'kr', 'NOK', 'Øre', 100, 0, 'kr', ',', '.', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(106, 'NPR', '524', 'Nepalese Rupee', '₨', 'NPR', 'Paisa', 100, 1, '&#x20A8;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(107, 'NZD', '554', 'New Zealand Dollar', '$', 'NZ$', 'Cent', 100, 1, '$', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(108, 'OMR', '512', 'Omani Rial', 'ر.ع.', NULL, 'Baisa', 1000, 1, '&#xFDFC;', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(109, 'PAB', '590', 'Panamanian Balboa', 'B/.', NULL, 'Centésimo', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(110, 'PEN', '604', 'Peruvian Nuevo Sol', 'S/.', NULL, 'Céntimo', 100, 1, 'S/.', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(111, 'PGK', '598', 'Papua New Guinean Kina', 'K', 'PGK', 'Toea', 100, 0, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(112, 'PHP', '608', 'Philippine Peso', '₱', NULL, 'Centavo', 100, 1, '&#x20B1;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(113, 'PKR', '586', 'Pakistani Rupee', '₨', 'PKR', 'Paisa', 100, 1, '&#x20A8;', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(114, 'PLN', '985', 'Polish Złoty', 'zł', NULL, 'Grosz', 100, 0, 'z&#322;', ',', ' ', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(115, 'PYG', '600', 'Paraguayan Guaraní', '₲', NULL, 'Céntimo', 1, 1, '&#x20B2;', '.', ',', 5000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(116, 'QAR', '634', 'Qatari Riyal', 'ر.ق', NULL, 'Dirham', 100, 0, '&#xFDFC;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(117, 'RON', '946', 'Romanian Leu', 'Lei', NULL, 'Bani', 100, 0, '', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(118, 'RSD', '941', 'Serbian Dinar', 'РСД', NULL, 'Para', 100, 1, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(119, 'RUB', '643', 'Russian Ruble', '₽', NULL, 'Kopeck', 100, 0, '&#x20BD;', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(120, 'RWF', '646', 'Rwandan Franc', 'FRw', NULL, 'Centime', 1, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(121, 'SAR', '682', 'Saudi Riyal', 'ر.س', NULL, 'Hallallah', 100, 1, '&#xFDFC;', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(122, 'SBD', '090', 'Solomon Islands Dollar', '$', 'SI$', 'Cent', 100, 0, '$', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(123, 'SCR', '690', 'Seychellois Rupee', '₨', 'SRe', 'Cent', 100, 0, '&#x20A8;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(124, 'SDG', '938', 'Sudanese Pound', '£', 'SDG', 'Piastre', 100, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(125, 'SEK', '752', 'Swedish Krona', 'kr', 'SEK', 'Öre', 100, 0, '', ',', ' ', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(126, 'SGD', '702', 'Singapore Dollar', '$', 'S$', 'Cent', 100, 1, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(127, 'SHP', '654', 'Saint Helenian Pound', '£', 'SHP', 'Penny', 100, 0, '&#x00A3;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(128, 'SKK', '703', 'Slovak Koruna', 'Sk', NULL, 'Halier', 100, 1, '', '.', ',', 50, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(129, 'SLL', '694', 'Sierra Leonean Leone', 'Le', NULL, 'Cent', 100, 0, '', '.', ',', 1000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(130, 'SOS', '706', 'Somali Shilling', 'Sh', NULL, 'Cent', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(131, 'SRD', '968', 'Surinamese Dollar', '$', 'SRD', 'Cent', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(132, 'SSP', '728', 'South Sudanese Pound', '£', 'SSP', 'piaster', 100, 0, '&#x00A3;', '.', ',', 5, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(133, 'STD', '678', 'São Tomé and Príncipe Dobra', 'Db', NULL, 'Cêntimo', 100, 0, '', '.', ',', 10000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(134, 'SVC', '222', 'Salvadoran Colón', '₡', NULL, 'Centavo', 100, 1, '&#x20A1;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(135, 'SYP', '760', 'Syrian Pound', '£S', NULL, 'Piastre', 100, 0, '&#x00A3;', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(136, 'SZL', '748', 'Swazi Lilangeni', 'E', 'SZL', 'Cent', 100, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(137, 'THB', '764', 'Thai Baht', '฿', NULL, 'Satang', 100, 1, '&#x0E3F;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(138, 'TJS', '972', 'Tajikistani Somoni', 'ЅМ', NULL, 'Diram', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(139, 'TMT', '934', 'Turkmenistani Manat', 'T', NULL, 'Tenge', 100, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(140, 'TND', '788', 'Tunisian Dinar', 'د.ت', NULL, 'Millime', 1000, 0, '', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(141, 'TOP', '776', 'Tongan Paʻanga', 'T$', NULL, 'Seniti', 100, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(142, 'TRY', '949', 'Turkish Lira', '₺', NULL, 'kuruş', 100, 1, '&#8378;', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(143, 'TTD', '780', 'Trinidad and Tobago Dollar', '$', 'TT$', 'Cent', 100, 0, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(144, 'TWD', '901', 'New Taiwan Dollar', '$', 'NT$', 'Cent', 100, 1, '$', '.', ',', 50, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(145, 'TZS', '834', 'Tanzanian Shilling', 'Sh', NULL, 'Cent', 100, 1, '', '.', ',', 5000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(146, 'UAH', '980', 'Ukrainian Hryvnia', '₴', NULL, 'Kopiyka', 100, 0, '&#x20B4;', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(147, 'UGX', '800', 'Ugandan Shilling', 'USh', NULL, 'Cent', 1, 0, '', '.', ',', 1000, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(148, 'USD', '840', 'United States Dollar', '$', 'US$', 'Cent', 100, 1, '$', '.', ',', 1, 1, 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(149, 'UYU', '858', 'Uruguayan Peso', '$', NULL, 'Centésimo', 100, 1, '&#x20B1;', ',', '.', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(150, 'UZS', '860', 'Uzbekistan Som', '', NULL, 'Tiyin', 100, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(151, 'VEF', '937', 'Venezuelan Bolívar', 'Bs', NULL, 'Céntimo', 100, 1, '', ',', '.', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(152, 'VND', '704', 'Vietnamese Đồng', '₫', NULL, 'Hào', 1, 1, '&#x20AB;', ',', '.', 100, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(153, 'VUV', '548', 'Vanuatu Vatu', 'Vt', NULL, NULL, 1, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(154, 'WST', '882', 'Samoan Tala', 'T', 'WS$', 'Sene', 100, 0, '', '.', ',', 10, 100, 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(155, 'XAF', '950', 'Central African Cfa Franc', 'Fr', 'FCFA', 'Centime', 1, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(156, 'XAG', '961', 'Silver (Troy Ounce)', 'oz t', 'XAG', 'oz', 1, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(157, 'XAU', '959', 'Gold (Troy Ounce)', 'oz t', 'XAU', 'oz', 1, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(158, 'XBA', '955', 'European Composite Unit', '', 'XBA', '', 1, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(159, 'XBB', '956', 'European Monetary Unit', '', 'XBB', '', 1, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(160, 'XBC', '957', 'European Unit of Account 9', '', 'XBC', '', 1, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(161, 'XBD', '958', 'European Unit of Account 17', '', 'XBD', '', 1, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(162, 'XCD', '951', 'East Caribbean Dollar', '$', 'EX$', 'Cent', 100, 1, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(163, 'XDR', '960', 'Special Drawing Rights', 'SDR', NULL, '', 1, 0, '$', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(164, 'XOF', '952', 'West African Cfa Franc', 'Fr', 'CFA', 'Centime', 1, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(165, 'XPD', '964', 'Palladium', 'oz t', 'XPD', 'oz', 1, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(166, 'XPF', '953', 'Cfp Franc', 'Fr', NULL, 'Centime', 1, 0, '', '.', ',', 100, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(167, 'XPT', '962', 'Platinum', 'oz t', NULL, '', 1, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(168, 'xts', '963', 'Codes specifically reserved for testing purposes', '', NULL, '', 1, 0, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(169, 'YER', '886', 'Yemeni Rial', '﷼', NULL, 'Fils', 100, 0, '&#xFDFC;', '.', ',', 100, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(170, 'ZAR', '710', 'South African Rand', 'R', NULL, 'Cent', 100, 1, '&#x0052;', '.', ',', 10, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(171, 'ZMK', '894', 'Zambian Kwacha', 'ZK', 'ZMK', 'Ngwee', 100, 0, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(172, 'ZMW', '967', 'Zambian Kwacha', 'ZK', 'ZMW', 'Ngwee', 100, 0, '', '.', ',', 5, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(173, 'BTC', '', 'Bitcoin', 'B⃦', NULL, 'Satoshi', 100000000, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(174, 'JEP', '', 'Jersey Pound', '£', 'JEP', 'Penny', 100, 1, '&#x00A3;', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(175, 'GGP', '', 'Guernsey Pound', '£', 'GGP', 'Penny', 100, 1, '&#x00A3;', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(176, 'IMP', '', 'Isle of Man Pound', '£', 'IMP', 'Penny', 100, 1, '&#x00A3;', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(177, 'XFU', '', 'UIC Franc', '', 'XFU', '', 100, 1, '', '.', ',', 1, 100, 0, '2024-03-05 06:32:52', '2024-03-05 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `nice_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `last_visited_at` timestamp NULL DEFAULT NULL,
  `last_visited_from` varchar(45) DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `card_holder_name` text DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `accepts_marketing` tinyint(1) DEFAULT 1,
  `verification_token` varchar(100) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configs`
--

CREATE TABLE `dashboard_configs` (
  `user_id` bigint(20) NOT NULL,
  `upgrade_plan_notice` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dashboard_configs`
--

INSERT INTO `dashboard_configs` (`user_id`, `upgrade_plan_notice`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boys`
--

CREATE TABLE `delivery_boys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `nice_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `verification_token` varchar(100) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disputes`
--

CREATE TABLE `disputes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `dispute_type_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `order_received` tinyint(1) NOT NULL DEFAULT 1,
  `return_goods` tinyint(1) DEFAULT NULL,
  `refund_amount` decimal(20,6) DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispute_types`
--

CREATE TABLE `dispute_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dispute_types`
--

INSERT INTO `dispute_types` (`id`, `detail`) VALUES
(2, 'Counterfeit goods'),
(9, 'Customs problem'),
(4, 'Damaged goods'),
(1, 'Did not receive goods'),
(7, 'Problems with the accessories'),
(6, 'Product not as described'),
(5, 'Quality not good'),
(3, 'Quantity shortage'),
(10, 'Shipping address not correct'),
(8, 'Shipping method');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `type` enum('HTML','Text') NOT NULL DEFAULT 'HTML',
  `position` enum('Content','Header','Footer') NOT NULL DEFAULT 'Content',
  `template_for` enum('Platform','Merchant') NOT NULL DEFAULT 'Platform',
  `files` longtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `faq_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `faq_topic_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'Why should I sell on :marketplace?', 'There are many reasons to sell on :marketplace. We have our customers who can see your products to the ability to start selling fast without the need to create a new standalone website. You spend no time and money to do marekting, We do it for you!', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(2, 1, 'Where else can I learn about how selling on :marketplace works?', 'We have videos, web docs, and blogs to help you find what you need.<ul><li>Getting Started page</li><li>Training and tutorials</li><li>Blog</li></ul>', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(3, 1, 'Can I close my account?', 'If you want to close your account permanently, Seller Support can assist you. Keep in mind that you can use the Maintenance mode feature that will hide all your listings, or you can deactivate or remove your listings entirely but hold on to your account for future use. Before you close your account permanently, please cancel and remove your listings and resolve all transactions.', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(4, 2, 'How do I manage my merchant account?', 'Use will get access to a full featured Merchant Dashboard to manage all aspects of selling on :marketplace, like manage your selling account, add product information, make inventory updates, manage orders, and manage users.', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(5, 2, 'How many items i can add on my inventory?', 'It depends on which sbscription you choose. Please visit the pricing section for detail.', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(6, 2, 'How will I know when I have a sale?', ':marketplace notifies you by email when you receive an order. You can change the notification settings in your account settings.', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(7, 2, 'Can I offer gift-wrap and packaging services to my customers?', 'Yes. Our packaging service allows customers to choose when they check out, you can make the options available for any individual item on your listing page.', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(8, 3, 'How much does it cost to sell on :marketplace?', ':marketplace offers different selling plans for a monthly subscription fee plus per-item selling fees, which vary by subscriptions. Please visit the pricing section for detail.', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(9, 3, 'Is there any hidden cost?', 'No', '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `faq_topics`
--

CREATE TABLE `faq_topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `for` enum('Merchant','Customer') NOT NULL DEFAULT 'Merchant',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faq_topics`
--

INSERT INTO `faq_topics` (`id`, `name`, `for`, `created_at`, `updated_at`) VALUES
(1, 'Overview', 'Merchant', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(2, 'Sell your items', 'Merchant', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(3, 'Pricing', 'Merchant', '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `feedbackable_id` bigint(20) UNSIGNED NOT NULL,
  `feedbackable_type` varchar(255) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `spam` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `pin_code` varchar(255) DEFAULT NULL,
  `value` decimal(20,6) DEFAULT NULL,
  `remaining_value` decimal(20,6) DEFAULT NULL,
  `partial_use` tinyint(1) DEFAULT NULL,
  `activation_time` timestamp NULL DEFAULT NULL,
  `expiry_time` timestamp NULL DEFAULT NULL,
  `exclude_offer_items` tinyint(1) DEFAULT NULL,
  `exclude_tax_n_shipping` tinyint(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gtin_types`
--

CREATE TABLE `gtin_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gtin_types`
--

INSERT INTO `gtin_types` (`id`, `name`, `description`) VALUES
(1, 'UPC', 'Universal Product Code (UPC), also called GTIN-12 and UPC-A'),
(2, 'EAN', 'European Article Number (EAN), also called GTIN-13'),
(3, 'JAN', 'Japanese Article Number (JAN), also called GTIN-13'),
(4, 'ISBN', 'International Standard Book Number (ISBN)'),
(5, 'ITF', 'ITF barcodes, also known as Interleaved 2 of 5 barcodes, encode 14 numeric digits and are generally used for the packaging level of products. Since they can deal with high printing tolerances, ITF is a good choice when barcodes need to be printed on corrugated cardboard.');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` text NOT NULL,
  `name` text DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT 0,
  `featured` tinyint(4) DEFAULT NULL,
  `imageable_id` int(10) UNSIGNED NOT NULL,
  `imageable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `title` text NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `supplier_id` int(10) UNSIGNED DEFAULT NULL,
  `sku` varchar(200) NOT NULL,
  `condition` enum('New','Used','Refurbished') NOT NULL,
  `condition_note` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `key_features` text DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `sold_quantity` int(11) NOT NULL DEFAULT 0,
  `download_limit` int(11) DEFAULT NULL,
  `damaged_quantity` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_price` decimal(20,6) DEFAULT NULL,
  `sale_price` decimal(20,6) NOT NULL,
  `offer_price` decimal(20,6) DEFAULT NULL,
  `offer_start` timestamp NULL DEFAULT NULL,
  `offer_end` timestamp NULL DEFAULT NULL,
  `shipping_weight` decimal(20,2) DEFAULT NULL,
  `free_shipping` tinyint(1) DEFAULT NULL,
  `available_from` timestamp NOT NULL DEFAULT current_timestamp(),
  `min_order_quantity` int(11) NOT NULL DEFAULT 1,
  `slug` varchar(200) NOT NULL,
  `linked_items` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `stuff_pick` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `provider_id` varchar(255) NOT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `tax` decimal(8,2) DEFAULT NULL,
  `card_country` varchar(255) DEFAULT NULL,
  `billing_state` varchar(255) DEFAULT NULL,
  `billing_zip` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `php_locale_code` varchar(255) NOT NULL,
  `language` text NOT NULL,
  `order` int(11) NOT NULL DEFAULT 100,
  `rtl` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `php_locale_code`, `language`, `order`, `rtl`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'en', 'en_US', 'English', 1, 0, 1, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(2, 'es', 'es_ES', 'Spanish', 2, 0, 1, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(3, 'fa', 'fa_IR', 'Persian', 3, 1, 1, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(4, 'bn', 'bn_BD', 'Bangla (Bangali)', 4, 0, 1, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(5, 'ar', 'ar_AE', 'Arabic', 100, 1, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(6, 'zh', 'zh_CN', 'Chinese', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(7, 'hi', 'hi_IN', 'Hindi', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(8, 'da', 'da_DK', 'Danish', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(9, 'de', 'de_DE', 'German', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(10, 'el', 'el_GR', 'Greek', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(11, 'fr', 'fr_FR', 'French', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(12, 'he', 'he_IL', 'Hebrew', 100, 1, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(13, 'nl', 'nl_NL', 'Dutch', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(14, 'no', 'no_NO', 'Norwegian', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(15, 'pt', 'pt', 'Portuguese', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(16, 'pt_PT', 'pt_PT', 'Portuguese', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(17, 'ru', 'ru_RU', 'Russian', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(18, 'sv', 'sv_SE', 'Swedish', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(19, 'th', 'th_TH', 'Thai', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(20, 'tr', 'tr_TR', 'Turkish', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(21, 'id', 'id_ID', 'Indonesian', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(22, 'vi', 'vi_VN', 'Vietnamese', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(23, 'uk', 'uk_UA', 'Ukrainian', 100, 0, 0, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `customer_status` int(11) DEFAULT 1,
  `label` int(11) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_01_151049_create_activity_log_table', 1),
(2, '2014_10_11_000000_create_modules_table', 1),
(3, '2014_10_11_000010_create_roles_table', 1),
(4, '2014_10_11_000011_create_permissions_table', 1),
(5, '2014_10_11_000020_create_attachments_table', 1),
(6, '2014_10_11_000020_create_images_table', 1),
(7, '2014_10_12_000000_create_subscription_items_table', 1),
(8, '2014_10_12_000000_create_subscriptions_table', 1),
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_000001_create_password_resets_table', 1),
(11, '2014_10_12_000003_create_dashboard_configs_table', 1),
(12, '2014_10_12_000003_create_pages_table', 1),
(13, '2014_10_12_000003_create_systems_table', 1),
(14, '2014_10_12_000004_create_customers_table', 1),
(15, '2014_12_31_000001_create_countries_table', 1),
(16, '2014_12_31_000004_create_addresses_table', 1),
(17, '2015_01_11_135657_create_shops_table', 1),
(18, '2015_01_12_000002_create_configs_table', 1),
(19, '2015_05_12_131134_create_performance_indicators_table', 1),
(20, '2015_05_12_151257_create_invoices_table', 1),
(21, '2015_12_31_000002_create_tags_table', 1),
(22, '2015_12_31_000004_create_blogs_table', 1),
(23, '2016_01_11_135655_create_manufacturers_table', 1),
(24, '2016_01_11_135658_create_products_table', 1),
(25, '2016_01_11_135660_create_attribute_table', 1),
(26, '2016_01_11_135714_create_suppliers_table', 1),
(27, '2016_01_15_191220_create_category_groups_table', 1),
(28, '2016_03_11_182034_create_warehouse_table', 1),
(29, '2016_03_11_190111_create_inventory_table', 1),
(30, '2016_03_25_192206_create_taxes_table', 1),
(31, '2016_03_26_091903_create_carriers_table', 1),
(32, '2016_03_26_091903_create_shipping_zones_table', 1),
(33, '2016_04_22_162519_create_email_templates_table', 1),
(34, '2016_04_22_162552_create_payment_methods_table', 1),
(35, '2016_04_22_162555_create_config_manual_payments_table', 1),
(36, '2016_04_22_162555_create_config_paypal_express_table', 1),
(37, '2016_04_22_162555_create_config_stripe_table', 1),
(38, '2016_04_22_162559_create_order_table', 1),
(39, '2016_04_24_151506_create_cart_table', 1),
(40, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(41, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(42, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(43, '2016_06_01_000004_create_oauth_clients_table', 1),
(44, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(45, '2017_09_13_195828_create_coupons_table', 1),
(46, '2017_09_17_202406_create_gift_cards_table', 1),
(47, '2017_11_27_144538_create_contact_us_table', 1),
(48, '2017_11_27_144538_create_disputes_table', 1),
(49, '2017_11_27_144538_create_messages_table', 1),
(50, '2017_11_27_144538_create_refunds_table', 1),
(51, '2017_11_27_144538_create_tickets_table', 1),
(52, '2017_11_27_144548_create_replies_table', 1),
(53, '2018_04_08_155212_create_notifications_table', 1),
(54, '2018_04_11_202451_create_jobs_table', 1),
(55, '2018_04_28_201222_create_faqs_table', 1),
(56, '2018_05_27_135039_create_visitors_table', 1),
(57, '2018_07_04_210334_create_banners_table', 1),
(58, '2018_07_04_210813_create_sliders_table', 1),
(59, '2018_07_16_015501_create_wishlists_table', 1),
(60, '2018_07_19_191545_create_feedbacks_table', 1),
(61, '2018_10_04_162859_create_options_table', 1),
(62, '2018_12_25_163942_create_config_cybersource_table', 1),
(63, '2018_12_25_163942_create_config_instamojo_table', 1),
(64, '2019_07_11_165534_create_languages_table', 1),
(65, '2019_12_27_092414_add_notify_chat_to_configs_table', 1),
(66, '2020_01_09_054507_add_payment_instruction_fields_to_order_table', 1),
(67, '2020_05_06_172818_add_email_phone_fields_to_messages_table', 1),
(68, '2020_06_30_154819_create_cancellation_table', 1),
(69, '2020_07_01_103906_add_cancellation_config_to_systems_table', 1),
(70, '2020_10_22_195815_add_stripe_status_to_subscriptions_table', 1),
(71, '2020_11_20_195815_create_package_table', 1),
(72, '2020_12_18_054507_add_cancellation_fields_to_systems_table', 1),
(73, '2021_01_30_061710_add_fields_to_packages_table', 1),
(74, '2021_02_01_054507_add_amount_fields_to_shop_table', 1),
(75, '2021_02_01_054507_add_description_fields_to_sliders_table', 1),
(76, '2021_02_01_054507_add_device_id_fields_to_orders_table', 1),
(77, '2021_02_01_054507_add_social_auth_fields_to_systems_table', 1),
(78, '2021_02_17_112139_add_type_field_to_images_table', 1),
(79, '2021_03_01_172738_add_show_merchant_info_as_vendor_system_table', 1),
(80, '2021_03_03_054507_add_active_ecommerce_fields_to_configs_table', 1),
(81, '2021_03_03_054507_add_fulfilment_type_fields_to_orders_table', 1),
(82, '2021_03_03_054507_add_opening_and_close_time_fields_to_warehouse_table', 1),
(83, '2021_03_03_054507_add_pay_in_person_and_pay_online_fields_to_configs_table', 1),
(84, '2021_03_04_051130_add_effect_to_banners_table', 1),
(85, '2021_06_02_062412_add_show_item_conditions_to_systems_table', 1),
(86, '2021_06_07_200450_create_avg_feedback_table', 1),
(87, '2021_10_13_074513_change_subscriptions_tables_for_cashier', 1),
(88, '2021_10_14_193443_add_uuid_to_failed_jobs_table', 1),
(89, '2021_10_24_161811_add_split_money_to_payment_methods_table', 1),
(90, '2021_11_20_052700_rename_billing_info_on_billables', 1),
(91, '2021_12_04_083515_add_payment_ref_id_to_orders_table', 1),
(92, '2022_01_04_065320_create_delivery_boys_table', 1),
(93, '2022_01_10_072540_add_delivery_boy_id_to_orders_table', 1),
(94, '2022_02_02_064852_create_attribute_categories_table', 1),
(95, '2022_02_13_091819_add_notification_sent_field_to_subscriptions_table', 1),
(96, '2022_02_17_113926_add_customer_phone_to_orders_table', 1),
(97, '2022_08_05_063657_add_api_key_to_users_table', 1),
(98, '2022_10_04_071941_add_hide_technical_details_on_product_page_to_systems_table', 1),
(99, '2022_11_11_095200_add_fcm_token_to_users_table', 1),
(100, '2022_11_17_065145_create_config_paypals_table', 1),
(101, '2022_12_06_052602_add_vendor_bank_detail_to_configs_table', 1),
(102, '2023_01_25_112227_update_email_in_customers_table', 1),
(103, '2023_03_28_080939_update_default_language_length_in_systems_table', 1),
(104, '2023_05_28_144404_add_sold_quantity_field_to_inventories_table', 1),
(105, '2023_07_18_144404_add_download_limit_field_to_inventories_table', 1),
(106, '2023_07_27_114702_add_is_digital_field_to_carts_and_orders_table', 1),
(107, '2023_07_28_080741_add_download_field_to_order_items_table', 1),
(108, '2023_08_05_161320_add_total_item_sold_to_shops_table', 1),
(109, '2023_08_08_072131_add_shop_id_to_banners_table', 1),
(110, '2023_08_17_113230_update_decimal_column_precision_in_subscription_plans_table', 1),
(111, '2023_08_28_054507_add_pay_to_fields_to_shop_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `access` enum('Super Admin','Platform','Merchant','Common') NOT NULL,
  `actions` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `description`, `access`, `actions`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Appearance', 'Manage all appearance.', 'Platform', 'customize', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(2, 'Attribute', 'Manage all attribute.', 'Common', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(3, 'Carrier', 'Manage all carrier.', 'Merchant', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(4, 'Category', 'Manage all category.', 'Platform', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(5, 'Category Group', 'Manage all category group.', 'Platform', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(6, 'Category Sub Group', 'Manage all category sub group.', 'Platform', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(7, 'Config', 'Manage all config.', 'Merchant', 'view,edit', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(8, 'Cart', 'Manage all cart.', 'Common', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(9, 'Customer', 'Manage all customer.', 'Platform', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(10, 'Dispute', 'Manage all dispute.', 'Common', 'view,response', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(11, 'Inventory', 'Manage all inventory.', 'Merchant', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(12, 'Manufacturer', 'Manage all manufacturer.', 'Common', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(13, 'Message', 'Manage all message.', 'Common', 'view,add,update,delete,reply', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(14, 'Module', 'Manage all module.', 'Super Admin', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(15, 'Order', 'Manage all order.', 'Common', 'view,add,fulfill,cancel,archive,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(16, 'Product', 'Manage all product.', 'Common', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(17, 'Refund', 'Manage all refund.', 'Common', 'view,initiate,update,approve', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(18, 'Role', 'Manage all role.', 'Common', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(19, 'Supplier', 'Manage all supplier.', 'Merchant', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(20, 'Subscription Plan', 'Manage all subscription plan.', 'Super Admin', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(21, 'Shipping Zone', 'Manage all shipping zone.', 'Merchant', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(22, 'Shipping Rate', 'Manage all shipping rate.', 'Merchant', 'add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(23, 'System', 'Manage all system.', 'Super Admin', 'view,edit', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(24, 'System Config', 'Manage all system config.', 'Platform', 'view,edit', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(25, 'Tax', 'Manage all tax.', 'Merchant', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(26, 'Ticket', 'Manage all ticket.', 'Platform', 'view,update,reply,assign', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(27, 'Vendor', 'Manage all vendor.', 'Platform', 'view,add,edit,delete,login', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(28, 'Warehouse', 'Manage all warehouse.', 'Merchant', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(29, 'User', 'Manage all user.', 'Common', 'view,add,edit,delete,login', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(30, 'Utility', 'Manage all utility.', 'Platform', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(31, 'Coupon', 'Manage all packagings.', 'Merchant', 'view,add,edit,delete', 1, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `action_text` varchar(255) DEFAULT NULL,
  `action_url` text DEFAULT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `created_by`, `icon`, `action_text`, `action_url`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('470b4705-d594-48d5-a6bd-2a63eea261c2', 'App\\Notifications\\Shop\\ShopCreated', 'App\\Models\\User', 3, NULL, NULL, NULL, NULL, '{\"name\":\"Store2\"}', NULL, '2024-03-05 06:39:15', '2024-03-05 06:39:15'),
('7234ea35-fd94-4eb0-b564-569aeba98839', 'App\\Notifications\\Shop\\ShopCreated', 'App\\Models\\User', 2, NULL, NULL, NULL, NULL, '{\"name\":\"Store\"}', NULL, '2024-03-05 06:38:07', '2024-03-05 06:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_value` longtext DEFAULT NULL,
  `autoload` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `option_name`, `option_value`, `autoload`, `created_at`, `updated_at`) VALUES
(1, 'trending_categories', 'a:0:{}', 1, '2024-03-05 06:33:09', '2024-03-05 06:33:09'),
(2, 'featured_brands', 'a:0:{}', 1, '2024-03-05 06:33:09', '2024-03-05 06:33:09'),
(3, 'featured_vendors', 'a:0:{}', 1, '2024-03-05 06:33:09', '2024-03-05 06:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `delivery_boy_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ship_to` int(10) UNSIGNED DEFAULT NULL,
  `shipping_zone_id` int(10) UNSIGNED DEFAULT NULL,
  `shipping_rate_id` int(10) UNSIGNED DEFAULT NULL,
  `packaging_id` int(10) UNSIGNED DEFAULT NULL,
  `is_digital` tinyint(1) NOT NULL DEFAULT 0,
  `item_count` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `taxrate` decimal(20,6) DEFAULT NULL,
  `shipping_weight` decimal(20,6) DEFAULT NULL,
  `total` decimal(20,6) DEFAULT NULL,
  `discount` decimal(20,6) DEFAULT NULL,
  `shipping` decimal(20,6) DEFAULT NULL,
  `packaging` decimal(20,6) DEFAULT NULL,
  `handling` decimal(20,6) DEFAULT NULL,
  `taxes` decimal(20,6) DEFAULT NULL,
  `grand_total` decimal(20,6) DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `fulfilment_type` enum('deliver','pickup') NOT NULL DEFAULT 'deliver',
  `payment_instruction` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `customer_phone_number` varchar(255) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `tracking_id` varchar(255) DEFAULT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `carrier_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 1,
  `payment_ref_id` varchar(255) DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `order_status_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `message_to_customer` text DEFAULT NULL,
  `send_invoice_to_customer` tinyint(1) DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `buyer_note` text DEFAULT NULL,
  `goods_received` tinyint(1) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `disputed` tinyint(1) DEFAULT NULL,
  `feedback_id` bigint(20) UNSIGNED DEFAULT NULL,
  `device_id` char(40) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `inventory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_description` longtext NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(20,6) NOT NULL,
  `download` int(11) NOT NULL DEFAULT 0,
  `feedback_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `compatible` varchar(255) DEFAULT NULL,
  `dependency` varchar(255) DEFAULT NULL,
  `version` varchar(255) NOT NULL DEFAULT '1',
  `license_key` varchar(255) NOT NULL,
  `installation_key` varchar(255) NOT NULL,
  `installation_hash` varchar(255) NOT NULL,
  `lcd` varchar(255) NOT NULL,
  `lrd` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT 0,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` text DEFAULT NULL,
  `slug` varchar(200) NOT NULL,
  `content` longtext DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `position` varchar(50) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `slug`, `content`, `published_at`, `visibility`, `position`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'About us', 'about-us', 'Add your own About Us info here. You can modify this page from ADMIN PANEL >> UTILITIES >> PAGES section.', '2024-03-05 06:32:53', 1, 'copyright_area', NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(2, 1, 'Contact us', 'contact-us', 'Contact details. A contact form will be added automatically with this info. You can modify this page from ADMIN PANEL >> UTILITIES >> PAGES section.', '2024-03-05 06:32:53', 1, 'footer_3rd_column', NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(3, 1, 'Privacy policy', 'privacy-policy', 'Add your own privacy policy here. You can modify this page from ADMIN PANEL >> UTILITIES >> PAGES section.', '2024-03-05 06:32:53', 1, 'copyright_area', NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(4, 1, 'Terms and condition for customer', 'terms-of-use-customer', 'Add your own terms and condition for customer here. You can modify this page from ADMIN PANEL >> UTILITIES >> PAGES section.', '2024-03-05 06:32:53', 1, 'copyright_area', NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(5, 1, 'Terms and condition for merchant', 'terms-of-use-merchant', 'Add your own terms and condition for merchant here. You can modify this page from ADMIN PANEL >> UTILITIES >> PAGES section.', '2024-03-05 06:32:53', 2, 'copyright_area', NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(6, 1, 'Return and refund policy', 'return-and-refund-policy', 'Return and refund policy. You can modify this page from ADMIN PANEL >> UTILITIES >> PAGES section.', '2024-03-05 06:32:53', 1, 'footer_1st_column', NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(7, 1, 'Shipping', 'shipping', 'Shipping details. You can modify this page from ADMIN PANEL >> UTILITIES >> PAGES section.', '2024-03-05 06:32:53', 1, 'footer_1st_column', NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(8, 1, 'Career', 'career', 'You can modify this page from ADMIN PANEL >> UTILITIES >> PAGES section.', '2024-03-05 06:32:53', 1, 'footer_2nd_column', NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `split_money` tinyint(1) NOT NULL DEFAULT 0,
  `company_name` varchar(255) DEFAULT NULL,
  `website` text DEFAULT NULL,
  `help_doc_link` text DEFAULT NULL,
  `terms_conditions_link` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `admin_description` text DEFAULT NULL,
  `admin_help_doc_link` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 99,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `code`, `name`, `type`, `split_money`, `company_name`, `website`, `help_doc_link`, `terms_conditions_link`, `description`, `instructions`, `admin_description`, `admin_help_doc_link`, `enabled`, `order`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'PayPal Express Checkout', 1, 0, 'PayPal Inc.', 'https://www.paypal.com/', 'https://www.paypal.com/us/webapps/mpp/express-checkout', NULL, 'Add PayPal as a payment method to allow customers to checkout with PayPal. Express Checkout offers the ease of convenience and security of PayPal, can turn more shoppers into buyers. You must have a PayPal business account to activate this payment method. - You must have a PayPal business account.<br/><strong>To activate PayPal Express: </strong><br/>- You must have a PayPal business account to accept payments.<br/>- Create an app to receive API credentials for testing and live transactions.<br/>- Go to this link to create your app: <small>https://developer.paypal.com/webapps/developer/applications/myapps</small>', NULL, 'Add PayPal as a payment method to any checkout with Express Checkout. Express Checkout offers the ease of convenience and security of PayPal, can be set up in minutes and can turn more shoppers into buyers.', 'https://developer.paypal.com/docs/integration/direct/express-checkout/integration-jsv4/', 1, 1, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(2, 'stripe', 'Stripe', 2, 1, 'Stripe Inc.', 'https://stripe.com/', 'https://stripe.com/docs/checkout/tutorial', NULL, 'Stripe is one of the best and safe option to charge credit and debit cards around the world. Stripe has a simple fee structure and no hidden costs. No other gateway or merchant account is required. <br/><strong>By using Stripe: </strong><br/>- You have to connect our platform to your Stripe account. <br/>- You agree to Stripe\'s <a href=\"https://stripe.com/us/privacy\" target=\"_blank\">Terms of Service</a>.', NULL, 'Stripe is one of the best and safe option to charge credit and debit cards around the world. Stripe has a product for marketplace like this. To enable Stripe to your vendors, you must have to register your platform with Stripe.<br/><strong> Follow This Simple steps:</strong><br/>- Create an Stripe application using the bellow information. <a href=\"https://stripe.com/docs/connect/quickstart\" target=\"_blank\">Check their documentation for help.</a><br/>- Update the .env file on your server with Stripe API credentials.<br/><br/><strong>Remember </strong> when you register your platform use this information: <br/>- Name: \'zCart Marketplace\'<br/>- Website URL: \'http://example.com\'<br/>- Redirect URL: \'http://example.com/admin/setting/stripe/redirect\'', 'https://stripe.com/docs/connect/quickstart', 1, 2, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(3, 'cod', 'Cash On Delivery', 3, 0, 'Cash on Delivery', NULL, NULL, NULL, 'Cash on delivery (COD), sometimes called collect on delivery, is the sale of goods by mail order where payment is made on delivery rather than in advance.', NULL, 'Cash on delivery (COD), sometimes called collect on delivery, is the sale of goods by mail order where payment is made on delivery rather than in advance.', '', 1, 5, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(4, 'wire', 'Bank Wire Transfer', 3, 0, 'Pay by bank wire transfer', NULL, NULL, NULL, 'Pay by bank wire transfer,  transfer the invoice amount via wire tranfer to the merchant account and confirm manually. After payment confirmation the goods will be shipped.', NULL, 'Pay by bank wire transfer,  transfer the invoice amount via wire tranfer to the merchant account and confirm manually. After payment confirmation the goods will be shipped.', '', 1, 6, '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `performance_indicators`
--

CREATE TABLE `performance_indicators` (
  `id` int(10) UNSIGNED NOT NULL,
  `monthly_recurring_revenue` decimal(8,2) DEFAULT NULL,
  `daily_volume` decimal(8,2) DEFAULT NULL,
  `new_merchants` int(11) NOT NULL,
  `new_customers` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Customize', 'customize_appearance', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(2, 2, 'View', 'view_attribute', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(3, 2, 'Add', 'add_attribute', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(4, 2, 'Edit', 'edit_attribute', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(5, 2, 'Delete', 'delete_attribute', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(6, 3, 'View', 'view_carrier', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(7, 3, 'Add', 'add_carrier', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(8, 3, 'Edit', 'edit_carrier', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(9, 3, 'Delete', 'delete_carrier', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(10, 4, 'View', 'view_category', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(11, 4, 'Add', 'add_category', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(12, 4, 'Edit', 'edit_category', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(13, 4, 'Delete', 'delete_category', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(14, 5, 'View', 'view_category_group', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(15, 5, 'Add', 'add_category_group', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(16, 5, 'Edit', 'edit_category_group', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(17, 5, 'Delete', 'delete_category_group', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(18, 6, 'View', 'view_category_sub_group', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(19, 6, 'Add', 'add_category_sub_group', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(20, 6, 'Edit', 'edit_category_sub_group', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(21, 6, 'Delete', 'delete_category_sub_group', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(22, 7, 'View', 'view_config', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(23, 7, 'Edit', 'edit_config', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(24, 8, 'View', 'view_cart', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(25, 8, 'Add', 'add_cart', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(26, 8, 'Edit', 'edit_cart', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(27, 8, 'Delete', 'delete_cart', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(28, 9, 'View', 'view_customer', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(29, 9, 'Add', 'add_customer', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(30, 9, 'Edit', 'edit_customer', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(31, 9, 'Delete', 'delete_customer', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(32, 10, 'View', 'view_dispute', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(33, 10, 'Response', 'response_dispute', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(34, 11, 'View', 'view_inventory', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(35, 11, 'Add', 'add_inventory', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(36, 11, 'Edit', 'edit_inventory', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(37, 11, 'Delete', 'delete_inventory', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(38, 12, 'View', 'view_manufacturer', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(39, 12, 'Add', 'add_manufacturer', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(40, 12, 'Edit', 'edit_manufacturer', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(41, 12, 'Delete', 'delete_manufacturer', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(42, 13, 'View', 'view_message', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(43, 13, 'Add', 'add_message', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(44, 13, 'Update', 'update_message', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(45, 13, 'Delete', 'delete_message', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(46, 13, 'Reply', 'reply_message', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(47, 15, 'View', 'view_order', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(48, 15, 'Add', 'add_order', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(49, 15, 'Fulfill', 'fulfill_order', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(50, 15, 'Cancel', 'cancel_order', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(51, 15, 'Archive', 'archive_order', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(52, 15, 'Delete', 'delete_order', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(53, 16, 'View', 'view_product', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(54, 16, 'Add', 'add_product', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(55, 16, 'Edit', 'edit_product', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(56, 16, 'Delete', 'delete_product', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(57, 17, 'View', 'view_refund', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(58, 17, 'Initiate', 'initiate_refund', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(59, 17, 'Update', 'update_refund', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(60, 17, 'Approve', 'approve_refund', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(61, 18, 'View', 'view_role', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(62, 18, 'Add', 'add_role', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(63, 18, 'Edit', 'edit_role', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(64, 18, 'Delete', 'delete_role', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(65, 19, 'View', 'view_supplier', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(66, 19, 'Add', 'add_supplier', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(67, 19, 'Edit', 'edit_supplier', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(68, 19, 'Delete', 'delete_supplier', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(69, 21, 'View', 'view_shipping_zone', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(70, 21, 'Add', 'add_shipping_zone', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(71, 21, 'Edit', 'edit_shipping_zone', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(72, 21, 'Delete', 'delete_shipping_zone', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(73, 22, 'Add', 'add_shipping_rate', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(74, 22, 'Edit', 'edit_shipping_rate', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(75, 22, 'Delete', 'delete_shipping_rate', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(76, 24, 'View', 'view_system_config', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(77, 24, 'Edit', 'edit_system_config', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(78, 25, 'View', 'view_tax', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(79, 25, 'Add', 'add_tax', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(80, 25, 'Edit', 'edit_tax', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(81, 25, 'Delete', 'delete_tax', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(82, 26, 'View', 'view_ticket', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(83, 26, 'Update', 'update_ticket', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(84, 26, 'Reply', 'reply_ticket', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(85, 26, 'Assign', 'assign_ticket', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(86, 27, 'View', 'view_vendor', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(87, 27, 'Add', 'add_vendor', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(88, 27, 'Edit', 'edit_vendor', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(89, 27, 'Delete', 'delete_vendor', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(90, 27, 'Login', 'login_vendor', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(91, 28, 'View', 'view_warehouse', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(92, 28, 'Add', 'add_warehouse', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(93, 28, 'Edit', 'edit_warehouse', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(94, 28, 'Delete', 'delete_warehouse', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(95, 29, 'View', 'view_user', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(96, 29, 'Add', 'add_user', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(97, 29, 'Edit', 'edit_user', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(98, 29, 'Delete', 'delete_user', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(99, 29, 'Login', 'login_user', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(100, 30, 'View', 'view_utility', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(101, 30, 'Add', 'add_utility', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(102, 30, 'Edit', 'edit_utility', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(103, 30, 'Delete', 'delete_utility', '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(104, 31, 'View', 'view_coupon', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(105, 31, 'Add', 'add_coupon', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(106, 31, 'Edit', 'edit_coupon', '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(107, 31, 'Delete', 'delete_coupon', '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(2, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(2, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(3, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(3, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(4, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(4, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(5, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(5, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(6, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(7, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(8, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(9, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(10, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(11, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(12, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(13, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(14, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(15, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(16, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(17, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(18, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(19, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(20, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(21, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(22, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(23, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(24, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(24, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(25, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(25, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(26, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(26, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(27, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(27, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(28, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(29, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(30, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(31, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(32, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(32, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(33, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(33, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(34, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(35, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(36, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(37, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(38, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(38, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(39, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(39, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(40, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(40, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(41, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(41, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(42, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(42, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(43, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(43, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(44, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(44, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(45, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(45, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(46, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(46, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(47, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(47, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(48, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(48, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(49, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(49, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(50, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(50, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(51, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(51, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(52, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(52, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(53, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(53, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(54, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(54, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(55, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(55, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(56, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(56, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(57, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(57, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(58, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(58, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(59, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(59, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(60, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(60, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(61, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(61, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(62, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(62, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(63, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(63, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(64, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(64, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(65, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(66, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(67, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(68, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(69, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(70, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(71, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(72, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(73, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(74, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(75, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(76, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(77, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(78, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(79, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(80, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(81, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(82, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(83, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(84, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(85, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(86, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(87, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(88, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(89, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(90, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(91, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(92, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(93, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(94, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(95, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(95, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(96, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(96, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(97, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(97, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(98, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(98, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(99, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(99, 3, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(100, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(101, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(102, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(103, 2, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(104, 3, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(105, 3, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(106, 3, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
(107, 3, '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `manufacturer_id` int(10) UNSIGNED DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `model_number` varchar(255) DEFAULT NULL,
  `mpn` varchar(255) DEFAULT NULL,
  `gtin` varchar(255) DEFAULT NULL,
  `gtin_type` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `min_price` decimal(20,6) DEFAULT 0.000000,
  `max_price` decimal(20,6) DEFAULT NULL,
  `origin_country` int(10) UNSIGNED DEFAULT NULL,
  `has_variant` tinyint(1) DEFAULT NULL,
  `requires_shipping` tinyint(1) DEFAULT 1,
  `downloadable` tinyint(1) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `sale_count` bigint(20) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_fulfilled` tinyint(1) DEFAULT NULL,
  `return_goods` tinyint(1) DEFAULT NULL,
  `amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `description` longtext DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reply` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `repliable_id` bigint(20) UNSIGNED NOT NULL,
  `repliable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `level` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `shop_id`, `name`, `description`, `public`, `level`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Super Admin', 'Super Admin can do anything over the application.', 0, 1, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(2, NULL, 'Admin', 'Admins can do anything over the application. Just cant access Super Admin and other Admins information.', 0, 2, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(3, NULL, 'Merchant', 'The owner of a shop. A merchant can control all contents under his/her shop.', 0, 3, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(4, NULL, 'Modaretor', 'Can access all information except the shop settings in under his/her shop.', 1, 4, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(5, NULL, 'Order Handler', 'Only can access order information under his/her shop.', 1, 5, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_rates`
--

CREATE TABLE `shipping_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `shipping_zone_id` int(10) UNSIGNED NOT NULL,
  `carrier_id` int(10) UNSIGNED DEFAULT NULL,
  `based_on` enum('price','weight') NOT NULL DEFAULT 'price',
  `minimum` decimal(20,6) DEFAULT NULL,
  `maximum` decimal(20,6) DEFAULT NULL,
  `rate` decimal(20,6) DEFAULT NULL,
  `delivery_takes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zones`
--

CREATE TABLE `shipping_zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `country_ids` text DEFAULT NULL,
  `state_ids` longtext DEFAULT NULL,
  `rest_of_the_world` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shipping_zones`
--

INSERT INTO `shipping_zones` (`id`, `shop_id`, `name`, `tax_id`, `country_ids`, `state_ids`, `rest_of_the_world`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Worldwide', 1, 'a:0:{}', 'a:0:{}', 1, 1, '2024-03-05 06:38:07', '2024-03-05 06:38:07'),
(2, 2, 'Worldwide', 1, 'a:0:{}', 'a:0:{}', 1, 1, '2024-03-05 06:39:15', '2024-03-05 06:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `legal_name` text DEFAULT NULL,
  `slug` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `external_url` varchar(255) DEFAULT NULL,
  `timezone_id` int(11) DEFAULT NULL,
  `current_billing_plan` varchar(255) DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `card_holder_name` text DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(255) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `hide_trial_notice` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 0,
  `pay_to` varchar(255) DEFAULT NULL,
  `total_item_sold` int(11) NOT NULL DEFAULT 0,
  `current_sale_amount` decimal(64,6) NOT NULL DEFAULT 0.000000,
  `payment_verified` tinyint(1) DEFAULT NULL,
  `id_verified` tinyint(1) DEFAULT NULL,
  `phone_verified` tinyint(1) DEFAULT NULL,
  `address_verified` tinyint(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `owner_id`, `name`, `legal_name`, `slug`, `email`, `description`, `external_url`, `timezone_id`, `current_billing_plan`, `stripe_id`, `card_holder_name`, `pm_type`, `pm_last_four`, `trial_ends_at`, `hide_trial_notice`, `active`, `pay_to`, `total_item_sold`, `current_sale_amount`, `payment_verified`, `id_verified`, `phone_verified`, `address_verified`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Store', NULL, 'store', 'merchant@demo.com', 'Welcome', NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0.000000, NULL, NULL, NULL, NULL, NULL, '2024-03-05 06:38:07', '2024-03-05 06:38:07'),
(2, 3, 'Store2', NULL, 'store2', 'merchant2@demo.com', 'Welcome', NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0.000000, NULL, NULL, NULL, NULL, NULL, '2024-03-05 06:39:15', '2024-03-05 06:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `shop_payment_methods`
--

CREATE TABLE `shop_payment_methods` (
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_color` varchar(20) DEFAULT '#333E48',
  `sub_title` varchar(255) DEFAULT NULL,
  `sub_title_color` varchar(20) DEFAULT '#333E48',
  `description` varchar(255) DEFAULT NULL,
  `description_color` varchar(20) NOT NULL DEFAULT '#868E8E',
  `alt_color` varchar(20) NOT NULL DEFAULT '#FED700',
  `link` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 100,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `text_position` varchar(10) NOT NULL DEFAULT 'right',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `iso_code` varchar(255) NOT NULL,
  `iso_numeric` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `calling_code` varchar(5) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `iso_code`, `iso_numeric`, `name`, `calling_code`, `active`, `created_at`, `updated_at`) VALUES
(1, 784, 'AZ', NULL, 'Abū Ȥaby[Abu Dhabi]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(2, 784, 'AJ', NULL, 'Ajman', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(3, 784, 'FU', NULL, 'Al Fujayrah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(4, 784, 'SH', NULL, 'Ash Shāriqah [Sharjah]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(5, 784, 'DU', NULL, 'Dubayy [Dubai]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(6, 784, 'RK', NULL, 'Rā\'s al Khaymah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(7, 784, 'UQ', NULL, 'Umm al Qaywayn', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(8, 51, 'AG', NULL, 'Aragaçotn', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(9, 51, 'AR', NULL, 'Ararat', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(10, 51, 'AV', NULL, 'Armavir', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(11, 51, 'ER', NULL, 'Erevan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(12, 51, 'GR', NULL, 'Geġark\'unik\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(13, 51, 'KT', NULL, 'Kotayk\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(14, 51, 'LO', NULL, 'Loṙy', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(15, 51, 'SU', NULL, 'Syunik\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(16, 51, 'TV', NULL, 'Tavuš', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(17, 51, 'VD', NULL, 'Vayoć Jor', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(18, 51, 'SH', NULL, 'Širak', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(19, 32, 'B', NULL, 'Buenos Aires', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(20, 32, 'K', NULL, 'Catamarca ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(21, 32, 'H', NULL, 'Chaco ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(22, 32, 'U', NULL, 'Chubut', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(23, 32, 'C', NULL, 'Ciudad Autónoma de Buenos Aires', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(24, 32, 'W', NULL, 'Corrientes', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(25, 32, 'X', NULL, 'Córdoba ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(26, 32, 'E', NULL, 'Entre Ríos', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(27, 32, 'P', NULL, 'Formosa ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(28, 32, 'Y', NULL, 'Jujuy ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(29, 32, 'L', NULL, 'La Pampa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(30, 32, 'F', NULL, 'La Rioja', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(31, 32, 'M', NULL, 'Mendoza ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(32, 32, 'N', NULL, 'Misiones', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(33, 32, 'Q', NULL, 'Neuquén ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(34, 32, 'R', NULL, 'Río Negro ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(35, 32, 'A', NULL, 'Salta ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(36, 32, 'J', NULL, 'San Juan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(37, 32, 'D', NULL, 'San Luis', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(38, 32, 'Z', NULL, 'Santa Cruz', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(39, 32, 'S', NULL, 'Santa Fe', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(40, 32, 'G', NULL, 'Santiago del Estero ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(41, 32, 'V', NULL, 'Tierra del Fuego', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(42, 32, 'T', NULL, 'Tucumán ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(43, 40, '1', NULL, 'Burgenland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(44, 40, '2', NULL, 'Kärnten', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(45, 40, '3', NULL, 'Niederösterreich', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(46, 40, '4', NULL, 'Oberösterreich', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(47, 40, '5', NULL, 'Salzburg', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(48, 40, '6', NULL, 'Steiermark', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(49, 40, '7', NULL, 'Tirol', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(50, 40, '8', NULL, 'Vorarlberg', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(51, 40, '9', NULL, 'Wien', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(52, 36, 'ACT', NULL, 'Australian Capital Territory', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(53, 36, 'CX', NULL, 'Christmas Island', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(54, 36, 'CC', NULL, 'Cocos Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(55, 36, 'HM', NULL, 'Heard Island and McDonald Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(56, 36, 'NSW', NULL, 'New South Wales', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(57, 36, 'NF', NULL, 'Norfolk Island', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(58, 36, 'NT', NULL, 'Northern Territory', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(59, 36, 'QLD', NULL, 'Queensland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(60, 36, 'SA', NULL, 'South Australia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(61, 36, 'TAS', NULL, 'Tasmania', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(62, 36, 'VIC', NULL, 'Victoria', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(63, 36, 'WA', NULL, 'Western Australia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(64, 50, 'A', NULL, 'Barisal', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(65, 50, 'B', NULL, 'Chittagong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(66, 50, 'C', NULL, 'Dhaka', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(67, 50, 'D', NULL, 'Khulna', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(68, 50, 'H', NULL, 'Mymensingh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(69, 50, 'E', NULL, 'Rajshahi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(70, 50, 'F', NULL, 'Rangpur', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(71, 50, 'G', NULL, 'Sylhet', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(72, 56, 'VAN', NULL, 'Antwerpen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(73, 56, 'WBR', NULL, 'Brabant wallon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(74, 56, 'WHT', NULL, 'Hainaut', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(75, 56, 'VLI', NULL, 'Limburg', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(76, 56, 'WLG', NULL, 'Luik', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(77, 56, 'WLX', NULL, 'Luxemburg', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(78, 56, 'WNA', NULL, 'Namur', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(79, 56, 'VOV', NULL, 'Oost-Vlaanderen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(80, 56, 'VBR', NULL, 'Vlaams-Brabant', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(81, 56, 'VWV', NULL, 'West-Vlaanderen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(82, 48, '14', NULL, 'Al Janūbīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(83, 48, '13', NULL, 'Al Manāmah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(84, 48, '15', NULL, 'Al Muḩarraq', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(85, 48, '16', NULL, 'Al Wusţá', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(86, 48, '17', NULL, 'Ash Shamālīyah ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(87, 204, 'AL', NULL, 'Alibori', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(88, 204, 'AK', NULL, 'Atakora', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(89, 204, 'AQ', NULL, 'Atlantique', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(90, 204, 'BO', NULL, 'Borgou', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(91, 204, 'CO', NULL, 'Collines', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(92, 204, 'DO', NULL, 'Donga', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(93, 204, 'KO', NULL, 'Kouffo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(94, 204, 'LI', NULL, 'Littoral', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(95, 204, 'MO', NULL, 'Mono', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(96, 204, 'OU', NULL, 'Ouémé', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(97, 204, 'PL', NULL, 'Plateau', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(98, 204, 'ZO', NULL, 'Zou', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(99, 68, 'H', NULL, 'Chuquisaca', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(100, 68, 'C', NULL, 'Cochabamba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(101, 68, 'B', NULL, 'El Beni', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(102, 68, 'L', NULL, 'La Paz', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(103, 68, 'O', NULL, 'Oruro', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(104, 68, 'N', NULL, 'Pando', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(105, 68, 'P', NULL, 'Potosí', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(106, 68, 'S', NULL, 'Santa Cruz', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(107, 68, 'T', NULL, 'Tarija', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(108, 76, 'AC', NULL, 'Acre', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(109, 76, 'AL', NULL, 'Alagoas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(110, 76, 'AP', NULL, 'Amapá', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(111, 76, 'AM', NULL, 'Amazonas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(112, 76, 'BA', NULL, 'Bahia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(113, 76, 'CE', NULL, 'Ceará', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(114, 76, 'DF', NULL, 'Distrito Federal', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(115, 76, 'ES', NULL, 'Espírito Santo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(116, 76, 'GO', NULL, 'Goiás', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(117, 76, 'MA', NULL, 'Maranhão', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(118, 76, 'MT', NULL, 'Mato Grosso', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(119, 76, 'MS', NULL, 'Mato Grosso do Sul', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(120, 76, 'MG', NULL, 'Minas Gerais', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(121, 76, 'PR', NULL, 'Paraná', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(122, 76, 'PB', NULL, 'Paraíba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(123, 76, 'PA', NULL, 'Pará', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(124, 76, 'PE', NULL, 'Pernambuco', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(125, 76, 'PI', NULL, 'Piauí', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(126, 76, 'RN', NULL, 'Rio Grande do Norte', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(127, 76, 'RS', NULL, 'Rio Grande do Sul', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(128, 76, 'RJ', NULL, 'Rio de Janeiro', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(129, 76, 'RO', NULL, 'Rondônia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(130, 76, 'RR', NULL, 'Roraima', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(131, 76, 'SC', NULL, 'Santa Catarina', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(132, 76, 'SE', NULL, 'Sergipe', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(133, 76, 'SP', NULL, 'São Paulo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(134, 76, 'TO', NULL, 'Tocantins', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(135, 124, 'AB', NULL, 'Alberta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(136, 124, 'BC', NULL, 'British Columbia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(137, 124, 'MB', NULL, 'Manitoba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(138, 124, 'NB', NULL, 'New Brunswick', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(139, 124, 'NL', NULL, 'Newfoundland and Labrador', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(140, 124, 'NT', NULL, 'Northwest Territories', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(141, 124, 'NS', NULL, 'Nova Scotia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(142, 124, 'NU', NULL, 'Nunavut', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(143, 124, 'ON', NULL, 'Ontario', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(144, 124, 'PE', NULL, 'Prince Edward Island', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(145, 124, 'QC', NULL, 'Quebec', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(146, 124, 'SK', NULL, 'Saskatchewan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(147, 124, 'YT', NULL, 'Yukon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(148, 152, 'AI', NULL, 'Aisén del General Carlos Ibáñez del Campo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(149, 152, 'AN', NULL, 'Antofagasta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(150, 152, 'AR', NULL, 'Araucanía', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(151, 152, 'AP', NULL, 'Arica y Parinacota', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(152, 152, 'AT', NULL, 'Atacama', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(153, 152, 'BI', NULL, 'Bío-Bío', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(154, 152, 'CO', NULL, 'Coquimbo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(155, 152, 'LI', NULL, 'Libertador General Bernardo O\'Higgins', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(156, 152, 'LL', NULL, 'Los Lagos', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(157, 152, 'LR', NULL, 'Los Ríos', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(158, 152, 'MA', NULL, 'Magallanes', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(159, 152, 'ML', NULL, 'Maule', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(160, 152, 'RM', NULL, 'Región Metropolitana de Santiago', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(161, 152, 'TA', NULL, 'Tarapacá', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(162, 152, 'VS', NULL, 'Valparaíso', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(163, 120, 'AD', NULL, 'Adamaoua', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(164, 120, 'CE', NULL, 'Centre', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(165, 120, 'ES', NULL, 'East', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(166, 120, 'EN', NULL, 'Far North', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(167, 120, 'LT', NULL, 'Littoral', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(168, 120, 'NO', NULL, 'North', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(169, 120, 'NW', NULL, 'North-West', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(170, 120, 'SU', NULL, 'South', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(171, 120, 'SW', NULL, 'South-West', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(172, 120, 'OU', NULL, 'West', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(173, 156, '沪', NULL, '上海', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(174, 156, '滇', NULL, '云南', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(175, 156, '蒙', NULL, '内蒙古', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(176, 156, '京', NULL, '北京', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(177, 156, '台', NULL, '台湾', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(178, 156, '吉', NULL, '吉林', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(179, 156, '川', NULL, '四川', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(180, 156, '津', NULL, '天津', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(181, 156, '宁', NULL, '宁夏', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(182, 156, '皖', NULL, '安徽', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(183, 156, '鲁', NULL, '山东', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(184, 156, '晋', NULL, '山西', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(185, 156, '粤', NULL, '广东', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(186, 156, '桂', NULL, '广西', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(187, 156, '新', NULL, '新疆', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(188, 156, '苏', NULL, '江苏', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(189, 156, '赣', NULL, '江西', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(190, 156, '冀', NULL, '河北', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(191, 156, '豫', NULL, '河南', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(192, 156, '浙', NULL, '浙江', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(193, 156, '琼', NULL, '海南', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(194, 156, '鄂', NULL, '湖北', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(195, 156, '湘', NULL, '湖南', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(196, 156, '澳', NULL, '澳门', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(197, 156, '甘', NULL, '甘肃', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(198, 156, '闽', NULL, '福建', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(199, 156, '藏', NULL, '西藏', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(200, 156, '黔', NULL, '贵州', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(201, 156, '辽', NULL, '辽宁', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(202, 156, '渝', NULL, '重庆', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(203, 156, '陕', NULL, '陕西', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(204, 156, '青', NULL, '青海', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(205, 156, '港', NULL, '香港', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(206, 156, '黑', NULL, '黑龙江', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(207, 188, 'A', NULL, 'Alajuela Province', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(208, 188, 'C', NULL, 'Cartago Province', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(209, 188, 'G', NULL, 'Guanacaste Province', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(210, 188, 'H', NULL, 'Heredia Province', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(211, 188, 'L', NULL, 'Limón Province', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(212, 188, 'P', NULL, 'Puntarenas Province', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(213, 188, 'SJ', NULL, 'San José', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(214, 276, 'BW', NULL, 'Baden-Württemberg', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(215, 276, 'BY', NULL, 'Bayern', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(216, 276, 'BE', NULL, 'Berlin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(217, 276, 'BB', NULL, 'Brandenburg', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(218, 276, 'HB', NULL, 'Bremen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(219, 276, 'HH', NULL, 'Hamburg', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(220, 276, 'HE', NULL, 'Hessen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(221, 276, 'MV', NULL, 'Mecklenburg-Vorpommern', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(222, 276, 'NI', NULL, 'Niedersachsen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(223, 276, 'NW', NULL, 'Nordrhein-Westfalen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(224, 276, 'RP', NULL, 'Rheinland-Pfalz', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(225, 276, 'SL', NULL, 'Saarland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(226, 276, 'SN', NULL, 'Sachsen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(227, 276, 'ST', NULL, 'Sachsen-Anhalt', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(228, 276, 'SH', NULL, 'Schleswig-Holstein', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(229, 276, 'TH', NULL, 'Thüringen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(230, 208, '84', NULL, 'Hovedstaden', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(231, 208, '82', NULL, 'Midtjylland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(232, 208, '81', NULL, 'Nordjylland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(233, 208, '85', NULL, 'Sjælland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(234, 208, '83', NULL, 'Syddanmark', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(235, 818, 'DK', NULL, 'Ad Daqahlīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(236, 818, 'BA', NULL, 'Al Baḩr al Aḩmar', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(237, 818, 'BH', NULL, 'Al Buḩayrah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(238, 818, 'FYM', NULL, 'Al Fayyūm', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(239, 818, 'GH', NULL, 'Al Gharbīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(240, 818, 'ALX', NULL, 'Al Iskandarīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(241, 818, 'IS', NULL, 'Al Ismā\'īlīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(242, 818, 'GZ', NULL, 'Al Jīzah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(243, 818, 'MN', NULL, 'Al Minyā', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(244, 818, 'MNF', NULL, 'Al Minūfīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(245, 818, 'KB', NULL, 'Al Qalyūbīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(246, 818, 'C', NULL, 'Al Qāhirah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(247, 818, 'LX', NULL, 'Al Uqşur', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(248, 818, 'WAD', NULL, 'Al Wādī al Jadīd', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(249, 818, 'SUZ ', NULL, 'As Suways', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(250, 818, 'SU', NULL, 'As Sādis min Uktūbar', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(251, 818, 'SHR', NULL, 'Ash Sharqīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(252, 818, 'ASN', NULL, 'Aswān', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(253, 818, 'AST', NULL, 'Asyūţ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(254, 818, 'BNS', NULL, 'Banī Suwayf', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(255, 818, 'PTS', NULL, 'Būr Sa‘īd', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(256, 818, 'DT', NULL, 'Dumyāţ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(257, 818, 'JS', NULL, 'Janūb Sīnā\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(258, 818, 'KFS', NULL, 'Kafr ash Shaykh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(259, 818, 'MT', NULL, 'Maţrūḩ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(260, 818, 'KN', NULL, 'Qinā', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(261, 818, 'SIN', NULL, 'Shamāl Sīnā\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(262, 818, 'SHG', NULL, 'Sūhāj', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(263, 818, 'HU', NULL, 'Ḩulwān', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(264, 724, 'AB', NULL, 'Albacete', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(265, 724, 'A', NULL, 'Alicante', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(266, 724, 'AL', NULL, 'Almeria', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(267, 724, 'BA', NULL, 'Badajoz', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(268, 724, 'B', NULL, 'Barcelona', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(269, 724, 'BU', NULL, 'Burgos', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(270, 724, 'CS', NULL, 'Castellón', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(271, 724, 'CR', NULL, 'Ciudad Real', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(272, 724, 'CU', NULL, 'Cuenca', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(273, 724, 'CC', NULL, 'Cáceres', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(274, 724, 'CA', NULL, 'Cádiz', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(275, 724, 'CO', NULL, 'Córdoba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(276, 724, 'GI', NULL, 'Gerona', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(277, 724, 'GR', NULL, 'Granada', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(278, 724, 'GU', NULL, 'Guadalajara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(279, 724, 'SS', NULL, 'Guipúzcoa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(280, 724, 'H', NULL, 'Huelva', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(281, 724, 'HU', NULL, 'Huesca', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(282, 724, 'J', NULL, 'Jaén', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(283, 724, 'C', NULL, 'La Coruña', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(284, 724, 'LO', NULL, 'La Rioja', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(285, 724, 'GC', NULL, 'Las Palmas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(286, 724, 'LE', NULL, 'León', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(287, 724, 'LU', NULL, 'Lugo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(288, 724, 'L', NULL, 'Lérida', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(289, 724, 'M', NULL, 'Madrid', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(290, 724, 'MU', NULL, 'Murcia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(291, 724, 'MA', NULL, 'Málaga', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(292, 724, 'OU', NULL, 'Orense', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(293, 724, 'P', NULL, 'Palencia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(294, 724, 'PO', NULL, 'Pontevedra', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(295, 724, 'SA', NULL, 'Salamanca', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(296, 724, 'SG', NULL, 'Segovia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(297, 724, 'SE', NULL, 'Sevilla', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(298, 724, 'SO', NULL, 'Soria', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(299, 724, 'T', NULL, 'Tarragona', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(300, 724, 'TF', NULL, 'Tenerife', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(301, 724, 'TE', NULL, 'Teruel', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(302, 724, 'TO', NULL, 'Toledo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(303, 724, 'V', NULL, 'Valencia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(304, 724, 'VA', NULL, 'Valladolid', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(305, 724, 'BI', NULL, 'Vizcaya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(306, 724, 'ZA', NULL, 'Zamora', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(307, 724, 'Z', NULL, 'Zaragoza', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(308, 724, 'VI', NULL, 'Álava', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(309, 724, 'AV', NULL, 'Ávila', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(310, 250, 'ARA', NULL, 'Auvergne-Rhône-Alpes', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(311, 250, 'BFC', NULL, 'Bourgogne-Franche-Comté', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(312, 250, 'BRE', NULL, 'Bretagne', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(313, 250, 'CVL', NULL, 'Centre-Val de Loire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(314, 250, 'COR', NULL, 'Corse', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(315, 250, 'GES', NULL, 'Grand-Est', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(316, 250, 'GUA', NULL, 'Guadeloupe', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(317, 250, 'HDF', NULL, 'Hauts-de-France', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(318, 250, 'LRE', NULL, 'La Réunion', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(319, 250, 'MAY', NULL, 'Mayotte', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(320, 250, 'NOR', NULL, 'Normandie', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(321, 250, 'NAQ', NULL, 'Nouvelle-Aquitaine', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(322, 250, 'OCC', NULL, 'Occitanie', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(323, 250, 'PDL', NULL, 'Pays-de-la-Loire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(324, 250, 'PAC', NULL, 'Provence-Alpes-Côte-d’Azur', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(325, 250, 'IDF', NULL, 'Île-de-France', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(326, 826, 'ABE', NULL, 'Aberdeen City', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(327, 826, 'ABD', NULL, 'Aberdeenshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(328, 826, 'ANS', NULL, 'Angus', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(329, 826, 'ANT', NULL, 'Antrim', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(330, 826, 'ARD', NULL, 'Ards', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(331, 826, 'AGB', NULL, 'Argyll and Bute', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(332, 826, 'ARM', NULL, 'Armagh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(333, 826, 'BLA', NULL, 'Ballymena', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(334, 826, 'BLY', NULL, 'Ballymoney', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(335, 826, 'BNB', NULL, 'Banbridge', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(336, 826, 'BDG', NULL, 'Barking and Dagenham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(337, 826, 'BNE', NULL, 'Barnet', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(338, 826, 'BNS', NULL, 'Barnsley', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(339, 826, 'BAS', NULL, 'Bath and North East Somerset', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(340, 826, 'BDF', NULL, 'Bedfordshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(341, 826, 'BFS', NULL, 'Belfast', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(342, 826, 'BEX', NULL, 'Bexley', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(343, 826, 'BIR', NULL, 'Birmingham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(344, 826, 'BBD', NULL, 'Blackburn with Darwen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(345, 826, 'BPL', NULL, 'Blackpool', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(346, 826, 'BGW', NULL, 'Blaenau Gwent', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(347, 826, 'BOL', NULL, 'Bolton', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(348, 826, 'BMH', NULL, 'Bournemouth', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(349, 826, 'BRC', NULL, 'Bracknell Forest', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(350, 826, 'BRD', NULL, 'Bradford', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(351, 826, 'BEN', NULL, 'Brent', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(352, 826, 'BGE', NULL, 'Bridgend [Pen-y-bont ar Ogwr GB-POG]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(353, 826, 'BNH', NULL, 'Brighton and Hove', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(354, 826, 'BST', NULL, 'Bristol, City of', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(355, 826, 'BRY', NULL, 'Bromley', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(356, 826, 'BKM', NULL, 'Buckinghamshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(357, 826, 'BUR', NULL, 'Bury', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(358, 826, 'CAY', NULL, 'Caerphilly [Caerffili GB-CAF]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(359, 826, 'CLD', NULL, 'Calderdale', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(360, 826, 'CAM', NULL, 'Cambridgeshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(361, 826, 'CMD', NULL, 'Camden', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(362, 826, 'CRF', NULL, 'Cardiff [Caerdydd GB-CRD]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(363, 826, 'CMN', NULL, 'Carmarthenshire [Sir Gaerfyrddin GB-GFY]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(364, 826, 'CKF', NULL, 'Carrickfergus', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(365, 826, 'CSR', NULL, 'Castlereagh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(366, 826, 'CBF', NULL, 'Central Bedfordshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(367, 826, 'CGN', NULL, 'Ceredigion [Sir Ceredigion]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(368, 826, 'CHE', NULL, 'Cheshire East', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(369, 826, 'CHW', NULL, 'Cheshire West and Chester', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(370, 826, 'CLK', NULL, 'Clackmannanshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(371, 826, 'CLR', NULL, 'Coleraine', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(372, 826, 'CWY', NULL, 'Conwy', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(373, 826, 'CKT', NULL, 'Cookstown', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(374, 826, 'CON', NULL, 'Cornwall', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(375, 826, 'COV', NULL, 'Coventry', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(376, 826, 'CGV', NULL, 'Craigavon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(377, 826, 'CRY', NULL, 'Croydon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(378, 826, 'CMA', NULL, 'Cumbria', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(379, 826, 'DAL', NULL, 'Darlington', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(380, 826, 'DEN', NULL, 'Denbighshire [Sir Ddinbych GB-DDB]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(381, 826, 'DER', NULL, 'Derby', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(382, 826, 'DBY', NULL, 'Derbyshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(383, 826, 'DRY', NULL, 'Derry', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(384, 826, 'DEV', NULL, 'Devon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(385, 826, 'DNC', NULL, 'Doncaster', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(386, 826, 'DOR', NULL, 'Dorset', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(387, 826, 'DOW', NULL, 'Down', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(388, 826, 'DUD', NULL, 'Dudley', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(389, 826, 'DGY', NULL, 'Dumfries and Galloway', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(390, 826, 'DND', NULL, 'Dundee City', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(391, 826, 'DGN', NULL, 'Dungannon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(392, 826, 'DUR', NULL, 'Durham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(393, 826, 'EAL', NULL, 'Ealing', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(394, 826, 'EAY', NULL, 'East Ayrshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(395, 826, 'EDU', NULL, 'East Dunbartonshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(396, 826, 'ELN', NULL, 'East Lothian', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(397, 826, 'ERW', NULL, 'East Renfrewshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(398, 826, 'ERY', NULL, 'East Riding of Yorkshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(399, 826, 'ESX', NULL, 'East Sussex', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(400, 826, 'EDH', NULL, 'Edinburgh, City of', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(401, 826, 'ELS', NULL, 'Eilean Siar', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(402, 826, 'ENF', NULL, 'Enfield', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(403, 826, 'ESS', NULL, 'Essex', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(404, 826, 'FAL', NULL, 'Falkirk', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(405, 826, 'FER', NULL, 'Fermanagh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(406, 826, 'FIF', NULL, 'Fife', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(407, 826, 'FLN', NULL, 'Flintshire [Sir y Fflint GB-FFL]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(408, 826, 'GAT', NULL, 'Gateshead', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(409, 826, 'GLG', NULL, 'Glasgow City', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(410, 826, 'GLS', NULL, 'Gloucestershire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(411, 826, 'GRE', NULL, 'Greenwich', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(412, 826, 'GWN', NULL, 'Gwynedd', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(413, 826, 'HCK', NULL, 'Hackney', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(414, 826, 'HAL', NULL, 'Halton', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(415, 826, 'HMF', NULL, 'Hammersmith and Fulham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(416, 826, 'HAM', NULL, 'Hampshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(417, 826, 'HRY', NULL, 'Haringey', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(418, 826, 'HRW', NULL, 'Harrow', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(419, 826, 'HPL', NULL, 'Hartlepool', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(420, 826, 'HAV', NULL, 'Havering', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(421, 826, 'HEF', NULL, 'Herefordshire, County of', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(422, 826, 'HRT', NULL, 'Hertfordshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(423, 826, 'HLD', NULL, 'Highland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(424, 826, 'HIL', NULL, 'Hillingdon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(425, 826, 'HNS', NULL, 'Hounslow', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(426, 826, 'IVC', NULL, 'Inverclyde', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(427, 826, 'AGY', NULL, 'Isle of Anglesey [Sir Ynys Môn GB-YNM]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(428, 826, 'IOW', NULL, 'Isle of Wight', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(429, 826, 'ISL', NULL, 'Islington', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(430, 826, 'KEC', NULL, 'Kensington and Chelsea', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(431, 826, 'KEN', NULL, 'Kent', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(432, 826, 'KHL', NULL, 'Kingston upon Hull, City of', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(433, 826, 'KTT', NULL, 'Kingston upon Thames', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(434, 826, 'KIR', NULL, 'Kirklees', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(435, 826, 'KWL', NULL, 'Knowsley', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(436, 826, 'LBH', NULL, 'Lambeth', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(437, 826, 'LAN', NULL, 'Lancashire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(438, 826, 'LRN', NULL, 'Larne', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(439, 826, 'LDS', NULL, 'Leeds', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(440, 826, 'LCE', NULL, 'Leicester', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(441, 826, 'LEC', NULL, 'Leicestershire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(442, 826, 'LEW', NULL, 'Lewisham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(443, 826, 'LMV', NULL, 'Limavady', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(444, 826, 'LIN', NULL, 'Lincolnshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(445, 826, 'LSB', NULL, 'Lisburn', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(446, 826, 'LIV', NULL, 'Liverpool', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(447, 826, 'LND', NULL, 'London, City of', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(448, 826, 'LUT', NULL, 'Luton', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(449, 826, 'MFT', NULL, 'Magherafelt', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(450, 826, 'MAN', NULL, 'Manchester', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(451, 826, 'MDW', NULL, 'Medway', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(452, 826, 'MTY', NULL, 'Merthyr Tydfil [Merthyr Tudful GB-MTU]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(453, 826, 'MRT', NULL, 'Merton', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(454, 826, 'MDB', NULL, 'Middlesbrough', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(455, 826, 'MLN', NULL, 'Midlothian', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(456, 826, 'MIK', NULL, 'Milton Keynes', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(457, 826, 'MON', NULL, 'Monmouthshire [Sir Fynwy GB-FYN]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(458, 826, 'MRY', NULL, 'Moray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(459, 826, 'MYL', NULL, 'Moyle', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(460, 826, 'NTL', NULL, 'Neath Port Talbot [Castell-nedd Port Talbot GB-CTL]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(461, 826, 'NET', NULL, 'Newcastle upon Tyne', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(462, 826, 'NWM', NULL, 'Newham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(463, 826, 'NWP', NULL, 'Newport [Casnewydd GB-CNW]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(464, 826, 'NYM', NULL, 'Newry and Mourne', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(465, 826, 'NTA', NULL, 'Newtownabbey', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(466, 826, 'NFK', NULL, 'Norfolk', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(467, 826, 'NAY', NULL, 'North Ayrshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(468, 826, 'NDN', NULL, 'North Down', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(469, 826, 'NEL', NULL, 'North East Lincolnshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(470, 826, 'NLK', NULL, 'North Lanarkshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(471, 826, 'NLN', NULL, 'North Lincolnshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(472, 826, 'NSM', NULL, 'North Somerset', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(473, 826, 'NTY', NULL, 'North Tyneside', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(474, 826, 'NYK', NULL, 'North Yorkshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(475, 826, 'NTH', NULL, 'Northamptonshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(476, 826, 'NBL', NULL, 'Northumberland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(477, 826, 'NGM', NULL, 'Nottingham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(478, 826, 'NTT', NULL, 'Nottinghamshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(479, 826, 'OLD', NULL, 'Oldham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(480, 826, 'OMH', NULL, 'Omagh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(481, 826, 'ORK', NULL, 'Orkney Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(482, 826, 'OXF', NULL, 'Oxfordshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(483, 826, 'PEM', NULL, 'Pembrokeshire [Sir Benfro GB-BNF]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(484, 826, 'PKN', NULL, 'Perth and Kinross', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(485, 826, 'PTE', NULL, 'Peterborough', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(486, 826, 'PLY', NULL, 'Plymouth', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(487, 826, 'POL', NULL, 'Poole', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(488, 826, 'POR', NULL, 'Portsmouth', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(489, 826, 'POW', NULL, 'Powys', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(490, 826, 'RDG', NULL, 'Reading', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(491, 826, 'RDB', NULL, 'Redbridge', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(492, 826, 'RCC', NULL, 'Redcar and Cleveland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(493, 826, 'RFW', NULL, 'Renfrewshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(494, 826, 'RCT', NULL, 'Rhondda, Cynon, Taff [Rhondda, Cynon,Taf]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(495, 826, 'RIC', NULL, 'Richmond upon Thames', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(496, 826, 'RCH', NULL, 'Rochdale', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(497, 826, 'ROT', NULL, 'Rotherham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(498, 826, 'RUT', NULL, 'Rutland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(499, 826, 'SLF', NULL, 'Salford', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(500, 826, 'SAW', NULL, 'Sandwell', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(501, 826, 'SCB', NULL, 'Scottish Borders, The', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(502, 826, 'SFT', NULL, 'Sefton', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(503, 826, 'SHF', NULL, 'Sheffield', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(504, 826, 'ZET', NULL, 'Shetland Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(505, 826, 'SHR', NULL, 'Shropshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(506, 826, 'SLG', NULL, 'Slough', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(507, 826, 'SOL', NULL, 'Solihull', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(508, 826, 'SOM', NULL, 'Somerset', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(509, 826, 'SAY', NULL, 'South Ayrshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(510, 826, 'SGC', NULL, 'South Gloucestershire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(511, 826, 'SLK', NULL, 'South Lanarkshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(512, 826, 'STY', NULL, 'South Tyneside', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(513, 826, 'STH', NULL, 'Southampton', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(514, 826, 'SOS', NULL, 'Southend-on-Sea', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(515, 826, 'SWK', NULL, 'Southwark', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(516, 826, 'SHN', NULL, 'St. Helens', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(517, 826, 'STS', NULL, 'Staffordshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(518, 826, 'STG', NULL, 'Stirling', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(519, 826, 'SKP', NULL, 'Stockport', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(520, 826, 'STT', NULL, 'Stockton-on-Tees', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(521, 826, 'STE', NULL, 'Stoke-on-Trent', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(522, 826, 'STB', NULL, 'Strabane', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(523, 826, 'SFK', NULL, 'Suffolk', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(524, 826, 'SND', NULL, 'Sunderland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(525, 826, 'SRY', NULL, 'Surrey', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(526, 826, 'STN', NULL, 'Sutton', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(527, 826, 'SWA', NULL, 'Swansea [Abertawe GB-ATA]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(528, 826, 'SWD', NULL, 'Swindon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(529, 826, 'TAM', NULL, 'Tameside', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(530, 826, 'TFW', NULL, 'Telford and Wrekin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(531, 826, 'THR', NULL, 'Thurrock', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(532, 826, 'TOB', NULL, 'Torbay', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(533, 826, 'TOF', NULL, 'Torfaen [Tor-faen]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(534, 826, 'TWH', NULL, 'Tower Hamlets', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(535, 826, 'TRF', NULL, 'Trafford', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(536, 826, 'VGL', NULL, 'Vale of Glamorgan, The [Bro Morgannwg GB-BMG]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(537, 826, 'WKF', NULL, 'Wakefield', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(538, 826, 'WLL', NULL, 'Walsall', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(539, 826, 'WFT', NULL, 'Waltham Forest', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(540, 826, 'WND', NULL, 'Wandsworth', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(541, 826, 'WRT', NULL, 'Warrington', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(542, 826, 'WAR', NULL, 'Warwickshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(543, 826, 'WBK', NULL, 'West Berkshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(544, 826, 'WDU', NULL, 'West Dunbartonshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52');
INSERT INTO `states` (`id`, `country_id`, `iso_code`, `iso_numeric`, `name`, `calling_code`, `active`, `created_at`, `updated_at`) VALUES
(545, 826, 'WLN', NULL, 'West Lothian', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(546, 826, 'WSX', NULL, 'West Sussex', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(547, 826, 'WSM', NULL, 'Westminster', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(548, 826, 'WGN', NULL, 'Wigan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(549, 826, 'WIL', NULL, 'Wiltshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(550, 826, 'WNM', NULL, 'Windsor and Maidenhead', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(551, 826, 'WRL', NULL, 'Wirral', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(552, 826, 'WOK', NULL, 'Wokingham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(553, 826, 'WLV', NULL, 'Wolverhampton', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(554, 826, 'WOR', NULL, 'Worcestershire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(555, 826, 'WRX', NULL, 'Wrexham [Wrecsam GB-WRC]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(556, 826, 'YOR', NULL, 'York', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(557, 268, 'AB', NULL, 'Abkhazia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(558, 268, 'AJ', NULL, 'Ajaria', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(559, 268, 'GU', NULL, 'Guria', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(560, 268, 'IM', NULL, 'Imeret\'i', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(561, 268, 'KK', NULL, 'K\'vemo K\'art\'li', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(562, 268, 'KA', NULL, 'Kakhet\'i', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(563, 268, 'MM', NULL, 'Mts\'khet\'a-Mt\'ianet\'i', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(564, 268, 'RL', NULL, 'Racha-Lech\'khumi-K\'vemo Svanet\'i', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(565, 268, 'SZ', NULL, 'Samegrelo-Zemo Svanet\'i', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(566, 268, 'SJ', NULL, 'Samts\'khe-Javakhet\'i', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(567, 268, 'SK', NULL, 'Shida K\'art\'li', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(568, 268, 'TB', NULL, 'T\'bilisi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(569, 288, 'AH', NULL, 'Ashanti', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(570, 288, 'BA', NULL, 'Brong-Ahafo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(571, 288, 'CP', NULL, 'Central', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(572, 288, 'EP', NULL, 'Eastern', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(573, 288, 'AA', NULL, 'Greater Accra', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(574, 288, 'NP', NULL, 'Northern', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(575, 288, 'UE', NULL, 'Upper East', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(576, 288, 'UW', NULL, 'Upper West', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(577, 288, 'TV', NULL, 'Volta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(578, 288, 'WP', NULL, 'Western', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(579, 360, 'BA', NULL, 'Bali', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(580, 360, 'BB', NULL, 'Bangka–Belitung Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(581, 360, 'BT', NULL, 'Banten', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(582, 360, 'BE', NULL, 'Bengkulu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(583, 360, 'JT', NULL, 'Central Java', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(584, 360, 'KT', NULL, 'Central Kalimantan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(585, 360, 'ST', NULL, 'Central Sulawesi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(586, 360, 'JI', NULL, 'East Java', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(587, 360, 'KI', NULL, 'East Kalimantan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(588, 360, 'NT', NULL, 'East Nusa Tenggara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(589, 360, 'GO', NULL, 'Gorontalo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(590, 360, 'JK', NULL, 'Jakarta Special Capital Region', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(591, 360, 'JA', NULL, 'Jambi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(592, 360, 'LA', NULL, 'Lampung', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(593, 360, 'MA', NULL, 'Maluku', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(594, 360, 'KU', NULL, 'North Kalimantan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(595, 360, 'MU', NULL, 'North Maluku', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(596, 360, 'SA', NULL, 'North Sulawesi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(597, 360, 'SU', NULL, 'North Sumatra', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(598, 360, 'RI', NULL, 'Riau', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(599, 360, 'KR', NULL, 'Riau Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(600, 360, 'KS', NULL, 'South Kalimantan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(601, 360, 'SN', NULL, 'South Sulawesi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(602, 360, 'SS', NULL, 'South Sumatra', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(603, 360, 'SG', NULL, 'Southeast Sulawesi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(604, 360, 'AC', NULL, 'Special Region of Aceh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(605, 360, 'PA', NULL, 'Special Region of Papua', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(606, 360, 'PB', NULL, 'Special Region of West Papua', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(607, 360, 'JB', NULL, 'West Java', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(608, 360, 'KB', NULL, 'West Kalimantan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(609, 360, 'NB', NULL, 'West Nusa Tenggara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(610, 360, 'SR', NULL, 'West Sulawesi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(611, 360, 'SB', NULL, 'West Sumatra', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(612, 360, 'YO', NULL, 'Yogyakarta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(613, 376, 'JM', NULL, 'Al Quds / Yerushalayim', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(614, 376, 'D', NULL, 'El Janūbī / HaDarom', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(615, 376, 'Z', NULL, 'Esh Shamālī / Ha Ẕafon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(616, 376, 'M', NULL, 'HaDarom / HaMerkaz', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(617, 376, 'YOUR', NULL, 'Tell Abīb / Tel Aviv', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(618, 376, 'HA', NULL, 'Ḥeifā / H̱efa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(619, 356, 'AN', NULL, 'Andaman and Nicobar Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(620, 356, 'AP', NULL, 'Andhra Pradesh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(621, 356, 'AR', NULL, 'Arunachal Pradesh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(622, 356, 'AS', NULL, 'Assam', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(623, 356, 'BR', NULL, 'Bihar', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(624, 356, 'CH', NULL, 'Chandigarh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(625, 356, 'CT', NULL, 'Chhattisgarh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(626, 356, 'DN', NULL, 'Dadra and Nagar Haveli', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(627, 356, 'DD', NULL, 'Daman and Diu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(628, 356, 'GA', NULL, 'Goa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(629, 356, 'GJ', NULL, 'Gujarat', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(630, 356, 'HR', NULL, 'Haryana', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(631, 356, 'HP', NULL, 'Himachal Pradesh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(632, 356, 'JK', NULL, 'Jammu and Kashmir', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(633, 356, 'JH', NULL, 'Jharkhand', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(634, 356, 'KA', NULL, 'Karnataka', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(635, 356, 'KL', NULL, 'Kerala', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(636, 356, 'LD', NULL, 'Lakshadweep', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(637, 356, 'MP', NULL, 'Madhya Pradesh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(638, 356, 'MH', NULL, 'Maharashtra', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(639, 356, 'MN', NULL, 'Manipur', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(640, 356, 'ML', NULL, 'Meghalaya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(641, 356, 'MZ', NULL, 'Mizoram', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(642, 356, 'NL', NULL, 'Nagaland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(643, 356, 'DL', NULL, 'National Capital Territory of Delhi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(644, 356, 'OR', NULL, 'Odisha', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(645, 356, 'PY', NULL, 'Puducherry', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(646, 356, 'PB', NULL, 'Punjab', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(647, 356, 'RJ', NULL, 'Rajasthan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(648, 356, 'SK', NULL, 'Sikkim', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(649, 356, 'TN', NULL, 'Tamil Nadu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(650, 356, 'TG', NULL, 'Telangana', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(651, 356, 'TR', NULL, 'Tripura', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(652, 356, 'UP', NULL, 'Uttar Pradesh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(653, 356, 'UT', NULL, 'Uttarakhand', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(654, 356, 'WB', NULL, 'West Bengal', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(655, 380, '65', NULL, 'Abruzzo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(656, 380, '23', NULL, 'Aosta Valley', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(657, 380, '75', NULL, 'Apulia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(658, 380, '77', NULL, 'Basilicata', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(659, 380, '78', NULL, 'Calabria', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(660, 380, '72', NULL, 'Campania', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(661, 380, '45', NULL, 'Emilia-Romagna', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(662, 380, '36', NULL, 'Friuli Venezia Giulia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(663, 380, '62', NULL, 'Lazio', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(664, 380, '42', NULL, 'Liguria', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(665, 380, '25', NULL, 'Lombardy', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(666, 380, '57', NULL, 'Marche', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(667, 380, '67', NULL, 'Molise', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(668, 380, '21', NULL, 'Piedmont', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(669, 380, '88', NULL, 'Sardinia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(670, 380, '82', NULL, 'Sicily', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(671, 380, '32', NULL, 'Trentino-South Tyrol', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(672, 380, '52', NULL, 'Tuscany', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(673, 380, '55', NULL, 'Umbria', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(674, 380, '34', NULL, 'Veneto', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(675, 388, '13', NULL, 'Clarendon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(676, 388, '09', NULL, 'Hanover', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(677, 388, '01', NULL, 'Kingston', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(678, 388, '12', NULL, 'Manchester', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(679, 388, '04', NULL, 'Portland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(680, 388, '02', NULL, 'Saint Andrew', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(681, 388, '06', NULL, 'Saint Ann', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(682, 388, '14', NULL, 'Saint Catherine', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(683, 388, '11', NULL, 'Saint Elizabeth', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(684, 388, '08', NULL, 'Saint James', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(685, 388, '05', NULL, 'Saint Mary', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(686, 388, '03', NULL, 'Saint Thomas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(687, 388, '07', NULL, 'Trelawny', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(688, 388, '10', NULL, 'Westmoreland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(689, 392, '23', NULL, 'Aiti', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(690, 392, '05', NULL, 'Akita', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(691, 392, '02', NULL, 'Aomori', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(692, 392, '38', NULL, 'Ehime', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(693, 392, '21', NULL, 'Gihu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(694, 392, '10', NULL, 'Gunma', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(695, 392, '34', NULL, 'Hirosima', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(696, 392, '01', NULL, 'Hokkaidô', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(697, 392, '18', NULL, 'Hukui', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(698, 392, '40', NULL, 'Hukuoka', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(699, 392, '07', NULL, 'Hukusima', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(700, 392, '28', NULL, 'Hyôgo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(701, 392, '08', NULL, 'Ibaraki', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(702, 392, '17', NULL, 'Isikawa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(703, 392, '03', NULL, 'Iwate', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(704, 392, '37', NULL, 'Kagawa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(705, 392, '46', NULL, 'Kagosima', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(706, 392, '14', NULL, 'Kanagawa ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(707, 392, '43', NULL, 'Kumamoto ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(708, 392, '26', NULL, 'Kyôto', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(709, 392, '39', NULL, 'Kôti', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(710, 392, '24', NULL, 'Mie', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(711, 392, '04', NULL, 'Miyagi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(712, 392, '45', NULL, 'Miyazaki', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(713, 392, '20', NULL, 'Nagano', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(714, 392, '42', NULL, 'Nagasaki', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(715, 392, '29', NULL, 'Nara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(716, 392, '15', NULL, 'Niigata', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(717, 392, '33', NULL, 'Okayama', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(718, 392, '47', NULL, 'Okinawa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(719, 392, '41', NULL, 'Saga', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(720, 392, '11', NULL, 'Saitama', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(721, 392, '25', NULL, 'Siga', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(722, 392, '32', NULL, 'Simane', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(723, 392, '22', NULL, 'Sizuoka', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(724, 392, '12', NULL, 'Tiba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(725, 392, '36', NULL, 'Tokusima', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(726, 392, '09', NULL, 'Totigi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(727, 392, '31', NULL, 'Tottori', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(728, 392, '16', NULL, 'Toyama', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(729, 392, '13', NULL, 'Tôkyô', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(730, 392, '30', NULL, 'Wakayama', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(731, 392, '06', NULL, 'Yamagata', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(732, 392, '35', NULL, 'Yamaguti', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(733, 392, '19', NULL, 'Yamanasi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(734, 392, '44', NULL, 'Ôita', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(735, 392, '27', NULL, 'Ôsaka', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(736, 404, '200', NULL, 'Central', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(737, 404, '300', NULL, 'Coast', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(738, 404, '400', NULL, 'Eastern', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(739, 404, '110', NULL, 'Nairobi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(740, 404, '500', NULL, 'North-Eastern', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(741, 404, '600', NULL, 'Nyanza', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(742, 404, '700', NULL, 'Rift Valley', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(743, 404, '800', NULL, 'Western', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(744, 116, '2', NULL, 'Baat Dambang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(745, 116, '1', NULL, 'Banteay Mean Chey', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(746, 116, '3', NULL, 'Kampong Chaam', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(747, 116, '4', NULL, 'Kampong Chhnang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(748, 116, '5', NULL, 'Kampong Spueu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(749, 116, '6', NULL, 'Kampong Thum', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(750, 116, '7', NULL, 'Kampot', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(751, 116, '8', NULL, 'Kandaal', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(752, 116, '9', NULL, 'Kaoh Kong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(753, 116, '10', NULL, 'Kracheh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(754, 116, '23', NULL, 'Krong Kaeb', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(755, 116, '24', NULL, 'Krong Pailin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(756, 116, '18', NULL, 'Krong Preah Sihanouk', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(757, 116, '11', NULL, 'Mondol Kiri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(758, 116, '22', NULL, 'Otdar Mean Chey', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(759, 116, '12', NULL, 'Phnom Penh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(760, 116, '15', NULL, 'Pousaat', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(761, 116, '13', NULL, 'Preah Vihear', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(762, 116, '14', NULL, 'Prey Veaeng', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(763, 116, '16', NULL, 'Rotanak Kiri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(764, 116, '17', NULL, 'Siem Reab', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(765, 116, '19', NULL, 'Stueng Traeng', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(766, 116, '20', NULL, 'Svaay Rieng', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(767, 116, '21', NULL, 'Taakaev', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(768, 116, '25', NULL, 'Tbong Khmum', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(769, 414, 'AH', NULL, 'Al Aḩmadī', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(770, 414, 'FA', NULL, 'Al Farwānīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(771, 414, 'JA', NULL, 'Al Jahrā’', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(772, 414, 'KU', NULL, 'Al Kuwayt (Al ‘Āşimah)', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(773, 414, 'MU', NULL, 'Mubārak al Kabīr', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(774, 414, 'HA', NULL, 'Ḩawallī', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(775, 422, 'AK', NULL, 'Aakkârâli', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(776, 422, 'BH', NULL, 'Baalbek-Hermel', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(777, 422, 'BA', NULL, 'Beyrouth', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(778, 422, 'BI', NULL, 'Béqaa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(779, 422, 'AS', NULL, 'Liban-Nordâli', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(780, 422, 'JA', NULL, 'Liban-Sudûbi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(781, 422, 'JL', NULL, 'Mont-Liban', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(782, 422, 'NA', NULL, 'Nabatîyé', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(783, 144, '52', NULL, 'Ampāra', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(784, 144, '71', NULL, 'Anurādhapura', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(785, 144, '81', NULL, 'Badulla', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(786, 144, '1', NULL, 'Basnāhira paḷāta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(787, 144, '3', NULL, 'Dakuṇu paḷāta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(788, 144, '12', NULL, 'Gampaha', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(789, 144, '31', NULL, 'Gālla', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(790, 144, '33', NULL, 'Hambantŏṭa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(791, 144, '13', NULL, 'Kaḷutara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(792, 144, '42', NULL, 'Kilinŏchchi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(793, 144, '61', NULL, 'Kuruṇægala', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(794, 144, '92', NULL, 'Kægalla', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(795, 144, '11', NULL, 'Kŏḷamba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(796, 144, '2', NULL, 'Madhyama paḷāta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(797, 144, '21', NULL, 'Mahanuvara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(798, 144, '43', NULL, 'Mannārama', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(799, 144, '51', NULL, 'Maḍakalapuva', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(800, 144, '45', NULL, 'Mulativ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(801, 144, '22', NULL, 'Mātale', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(802, 144, '32', NULL, 'Mātara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(803, 144, '82', NULL, 'Mŏṇarāgala', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(804, 144, '23', NULL, 'Nuvara Ĕliya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(805, 144, '5', NULL, 'Næ̆gĕnahira paḷāta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(806, 144, '62', NULL, 'Puttalama', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(807, 144, '72', NULL, 'Pŏḷŏnnaruva', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(808, 144, '91', NULL, 'Ratnapura', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(809, 144, '9', NULL, 'Sabaragamuva paḷāta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(810, 144, '53', NULL, 'Trikuṇāmalaya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(811, 144, '4', NULL, 'Uturu paḷāta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(812, 144, '7', NULL, 'Uturumæ̆da paḷāta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(813, 144, '44', NULL, 'Vavuniyāva', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(814, 144, '6', NULL, 'Vayamba paḷāta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(815, 144, '41', NULL, 'Yāpanaya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(816, 144, '8', NULL, 'Ūva paḷāta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(817, 484, 'AG', NULL, 'Aguascalientes', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(818, 484, 'BC', NULL, 'Baja California', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(819, 484, 'BS', NULL, 'Baja California Sur', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(820, 484, 'CM', NULL, 'Campeche', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(821, 484, 'CS', NULL, 'Chiapas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(822, 484, 'CH', NULL, 'Chihuahua', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(823, 484, 'MX', NULL, 'Coahuila', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(824, 484, 'CL', NULL, 'Colima', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(825, 484, 'DG', NULL, 'Durango', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(826, 484, 'DF', NULL, 'Federal District', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(827, 484, 'GT', NULL, 'Guanajuato', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(828, 484, 'GR', NULL, 'Guerrero', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(829, 484, 'HG', NULL, 'Hidalgo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(830, 484, 'JA', NULL, 'Jalisco', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(831, 484, 'ME', NULL, 'Mexico', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(832, 484, 'MI', NULL, 'Michoacán', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(833, 484, 'MO', NULL, 'Morelos', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(834, 484, 'NA', NULL, 'Nayarit', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(835, 484, 'NL', NULL, 'Nuevo León', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(836, 484, 'OA', NULL, 'Oaxaca', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(837, 484, 'PU', NULL, 'Puebla', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(838, 484, 'QE', NULL, 'Querétaro', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(839, 484, 'QR', NULL, 'Quintana Roo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(840, 484, 'SL', NULL, 'San Luis Potosí', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(841, 484, 'SI', NULL, 'Sinaloa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(842, 484, 'SO', NULL, 'Sonora', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(843, 484, 'TB', NULL, 'Tabasco', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(844, 484, 'TM', NULL, 'Tamaulipas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(845, 484, 'TL', NULL, 'Tlaxcala', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(846, 484, 'VE', NULL, 'Veracruz', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(847, 484, 'YU', NULL, 'Yucatán', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(848, 484, 'ZA', NULL, 'Zacatecas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(849, 458, '01', NULL, 'Johor', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(850, 458, '02', NULL, 'Kedah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(851, 458, '03', NULL, 'Kelantan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(852, 458, '04', NULL, 'Melaka', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(853, 458, '05', NULL, 'Negeri Sembilan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(854, 458, '06', NULL, 'Pahang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(855, 458, '08', NULL, 'Perak', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(856, 458, '09', NULL, 'Perlis', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(857, 458, '07', NULL, 'Pulau Pinang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(858, 458, '12', NULL, 'Sabah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(859, 458, '13', NULL, 'Sarawak', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(860, 458, '10', NULL, 'Selangor', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(861, 458, '11', NULL, 'Terengganu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(862, 458, '14', NULL, 'Wilayah Persekutuan Kuala Lumpur', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(863, 458, '15', NULL, 'Wilayah Persekutuan Labuan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(864, 458, '16', NULL, 'Wilayah Persekutuan Putrajaya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(865, 562, '1', NULL, 'Agadez', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(866, 562, '2', NULL, 'Diffa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(867, 562, '3', NULL, 'Dosso', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(868, 562, '4', NULL, 'Maradi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(869, 562, '8', NULL, 'Niamey', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(870, 562, '5', NULL, 'Tahoua', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(871, 562, '6', NULL, 'Tillabéri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(872, 562, '7', NULL, 'Zinder', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(873, 566, 'AB', NULL, 'Abia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(874, 566, 'FC', NULL, 'Abuja Capital Territory', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(875, 566, 'AD', NULL, 'Adamawa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(876, 566, 'AK', NULL, 'Akwa Ibom', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(877, 566, 'AN', NULL, 'Anambra', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(878, 566, 'BA', NULL, 'Bauchi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(879, 566, 'BY', NULL, 'Bayelsa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(880, 566, 'BE', NULL, 'Benue', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(881, 566, 'BO', NULL, 'Borno', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(882, 566, 'CR', NULL, 'Cross River', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(883, 566, 'DE', NULL, 'Delta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(884, 566, 'EB', NULL, 'Ebonyi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(885, 566, 'ED', NULL, 'Edo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(886, 566, 'EK', NULL, 'Ekiti', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(887, 566, 'EN', NULL, 'Enugu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(888, 566, 'GO', NULL, 'Gombe', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(889, 566, 'IM', NULL, 'Imo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(890, 566, 'JI', NULL, 'Jigawa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(891, 566, 'KD', NULL, 'Kaduna', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(892, 566, 'KN', NULL, 'Kano', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(893, 566, 'KT', NULL, 'Katsina', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(894, 566, 'KE', NULL, 'Kebbi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(895, 566, 'KO', NULL, 'Kogi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(896, 566, 'KW', NULL, 'Kwara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(897, 566, 'LA', NULL, 'Lagos', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(898, 566, 'NA', NULL, 'Nassarawa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(899, 566, 'NI', NULL, 'Niger', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(900, 566, 'OG', NULL, 'Ogun', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(901, 566, 'ON', NULL, 'Ondo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(902, 566, 'OS', NULL, 'Osun', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(903, 566, 'OY', NULL, 'Oyo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(904, 566, 'PL', NULL, 'Plateau', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(905, 566, 'RI', NULL, 'Rivers', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(906, 566, 'SO', NULL, 'Sokoto', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(907, 566, 'TA', NULL, 'Taraba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(908, 566, 'YO', NULL, 'Yobe', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(909, 566, 'ZA', NULL, 'Zamfara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(910, 528, 'AW', NULL, 'Aruba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(911, 528, 'BQ', NULL, 'Bonaire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(912, 528, 'CW', NULL, 'Curaçao', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(913, 528, 'DR', NULL, 'Drenthe', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(914, 528, 'FL', NULL, 'Flevoland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(915, 528, 'FR', NULL, 'Friesland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(916, 528, 'GD', NULL, 'Gelderland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(917, 528, 'GR', NULL, 'Groningen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(918, 528, 'LB', NULL, 'Limburg', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(919, 528, 'NB', NULL, 'Noord-Brabant', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(920, 528, 'NH', NULL, 'Noord-Holland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(921, 528, 'OV', NULL, 'Overijssel', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(922, 528, 'SX', NULL, 'Sint Maarten', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(923, 528, 'UT', NULL, 'Utrecht', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(924, 528, 'ZL', NULL, 'Zeeland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(925, 528, 'ZH', NULL, 'Zuid-Holland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(926, 524, 'BA', NULL, 'Bagmati', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(927, 524, 'BH', NULL, 'Bheri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(928, 524, 'DH', NULL, 'Dhawalagiri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(929, 524, 'GA', NULL, 'Gandaki', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(930, 524, 'JA', NULL, 'Janakpur', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(931, 524, 'KA', NULL, 'Karnali', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(932, 524, 'KO', NULL, 'Kosi [Koshi]', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(933, 524, 'LU', NULL, 'Lumbini', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(934, 524, '2', NULL, 'Madhya Pashchimanchal', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(935, 524, '1', NULL, 'Madhyamanchal', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(936, 524, 'MA', NULL, 'Mahakali', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(937, 524, 'ME', NULL, 'Mechi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(938, 524, 'NA', NULL, 'Narayani', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(939, 524, '3', NULL, 'Pashchimanchal', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(940, 524, '4', NULL, 'Purwanchal', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(941, 524, 'RA', NULL, 'Rapti', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(942, 524, 'SA', NULL, 'Sagarmatha', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(943, 524, 'SE', NULL, 'Seti', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(944, 524, '5', NULL, 'Sudur Pashchimanchal', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(945, 554, 'AUK', NULL, 'Auckland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(946, 554, 'BOP', NULL, 'Bay of Plenty', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(947, 554, 'CAN', NULL, 'Canterbury', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(948, 554, 'CIT', NULL, 'Chatham Islands Territory', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(949, 554, 'GIS', NULL, 'Gisborne District', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(950, 554, 'HKB', NULL, 'Hawkes\'s Bay', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(951, 554, 'MWT', NULL, 'Manawatu-Wanganui', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(952, 554, 'MBH', NULL, 'Marlborough District', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(953, 554, 'NSN', NULL, 'Nelson City', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(954, 554, 'NTL', NULL, 'Northland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(955, 554, 'OTA', NULL, 'Otago', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(956, 554, 'STL', NULL, 'Southland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(957, 554, 'TKI', NULL, 'Taranaki', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(958, 554, 'TAS', NULL, 'Tasman District', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(959, 554, 'WKO', NULL, 'Waikato', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(960, 554, 'WGN', NULL, 'Wellington', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(961, 554, 'WTC', NULL, 'West Coast', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(962, 512, 'DA', NULL, 'Ad Dākhilīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(963, 512, 'BU', NULL, 'Al Buraymī', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(964, 512, 'BA', NULL, 'Al Bāţinah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(965, 512, 'WU', NULL, 'Al Wusţá', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(966, 512, 'SH', NULL, 'Ash Sharqīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(967, 512, 'ZA', NULL, 'Aȥ Ȥāhirah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(968, 512, 'MA', NULL, 'Masqaţ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(969, 512, 'MU', NULL, 'Musandam', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(970, 512, 'ZU', NULL, 'Z̧ufār', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(971, 604, 'AMA', NULL, 'Amazonas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(972, 604, 'ANC', NULL, 'Ancash', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(973, 604, 'APU', NULL, 'Apurímac', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(974, 604, 'ARE', NULL, 'Arequipa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(975, 604, 'AYA', NULL, 'Ayacucho', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(976, 604, 'CAJ', NULL, 'Cajamarca', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(977, 604, 'CUS', NULL, 'Cusco', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(978, 604, 'CAL', NULL, 'El Callao', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(979, 604, 'HUV', NULL, 'Huancavelica', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(980, 604, 'HUC', NULL, 'Huánuco', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(981, 604, 'ICA', NULL, 'Ica', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(982, 604, 'JUN', NULL, 'Junín', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(983, 604, 'LAL', NULL, 'La Libertad', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(984, 604, 'LAM', NULL, 'Lambayeque', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(985, 604, 'LIM', NULL, 'Lima', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(986, 604, 'LOR', NULL, 'Loreto', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(987, 604, 'MDD', NULL, 'Madre de Dios', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(988, 604, 'MOQ', NULL, 'Moquegua', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(989, 604, 'LMA', NULL, 'Municipalidad Metropolitana de Lima', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(990, 604, 'PAS', NULL, 'Pasco', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(991, 604, 'PIU', NULL, 'Piura', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(992, 604, 'PUN', NULL, 'Puno', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(993, 604, 'SAM', NULL, 'San Martín', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(994, 604, 'TAC', NULL, 'Tacna', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(995, 604, 'TUM', NULL, 'Tumbes', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(996, 604, 'UCA', NULL, 'Ucayali', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(997, 608, '14', NULL, 'Autonomous Region in Muslim Mindanao', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(998, 608, '05', NULL, 'Bicol', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(999, 608, '02', NULL, 'Cagayan Valley', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1000, 608, '40', NULL, 'Calabarzon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1001, 608, '13', NULL, 'Caraga', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1002, 608, '03', NULL, 'Central Luzon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1003, 608, '07', NULL, 'Central Visayas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1004, 608, '15', NULL, 'Cordillera Administrative Region', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1005, 608, '11', NULL, 'Davao', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1006, 608, '08', NULL, 'Eastern Visayas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1007, 608, '01', NULL, 'Ilocos', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1008, 608, '41', NULL, 'Mimaropa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1009, 608, '00', NULL, 'National Capital', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1010, 608, '10', NULL, 'Northern Mindanao', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1011, 608, '12', NULL, 'Soccsksargen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1012, 608, '06', NULL, 'Western Visayas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1013, 608, '09', NULL, 'Zamboanga Peninsula', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1014, 586, 'JK', NULL, 'Azad Kashmir', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1015, 586, 'BA', NULL, 'Baluchistan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1016, 586, 'TA', NULL, 'Federally Administered Tribal Area', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1017, 586, 'GB', NULL, 'Gilgit-Baltistan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1018, 586, 'IS', NULL, 'Islamabad', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1019, 586, 'KP', NULL, 'Khyber Pakhtunkhwa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1020, 586, 'PB', NULL, 'Punjab', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1021, 586, 'SD', NULL, 'Sind', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1022, 634, 'DA', NULL, 'Ad Dawḩah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1023, 634, 'KH', NULL, 'Al Khawr wa adh Dhakhīrah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1024, 634, 'WA', NULL, 'Al Wakrah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1025, 634, 'RA', NULL, 'Ar Rayyān', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1026, 634, 'MS', NULL, 'Ash Shamāl', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1027, 634, 'ZA', NULL, 'Az̧ Z̧a‘āyin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1028, 634, 'US', NULL, 'Umm Şalāl', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1029, 643, 'ALT', NULL, 'Altayskiy kray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1030, 643, 'AMU', NULL, 'Amurskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1031, 643, 'ARK', NULL, 'Arkhangel\'skaya oblast', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1032, 643, 'AST', NULL, 'Astrakhanskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1033, 643, 'BEL', NULL, 'Belgorodskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1034, 643, 'BRY', NULL, 'Bryanskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1035, 643, 'CHE', NULL, 'Chelyabinskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1036, 643, 'CHU', NULL, 'Chukotskiy avtonomnyy okrug', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1037, 643, 'IRK', NULL, 'Irkutskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1038, 643, 'IVA', NULL, 'Ivanovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1039, 643, 'KGD', NULL, 'Kaliningradskaya oblast', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1040, 643, 'KLU', NULL, 'Kaluzhskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1041, 643, 'KAM', NULL, 'Kamchatskiy kray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1042, 643, 'KEM', NULL, 'Kemerovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1043, 643, 'KHA', NULL, 'Khabarovskiy kray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1044, 643, 'KHM', NULL, 'Khanty-Mansiyskiy avtonomnyy okrug-Yugra', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1045, 643, 'KIR', NULL, 'Kirovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1046, 643, 'KOS', NULL, 'Kostromskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1047, 643, 'KDA', NULL, 'Krasnodarskiy kray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1048, 643, 'KYA', NULL, 'Krasnoyarskiy kray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1049, 643, 'KGN', NULL, 'Kurganskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1050, 643, 'KRS', NULL, 'Kurskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1051, 643, 'LEN', NULL, 'Leningradskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1052, 643, 'LIP', NULL, 'Lipetskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1053, 643, 'MAG', NULL, 'Magadanskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1054, 643, 'MOS', NULL, 'Moskovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1055, 643, 'MOW', NULL, 'Moskva', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1056, 643, 'MUR', NULL, 'Murmanskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1057, 643, 'NEN', NULL, 'Nenetskiy avtonomnyy okrug', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1058, 643, 'NIZ', NULL, 'Nizbegorodskaya oblast', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1059, 643, 'NGR', NULL, 'Novgorodskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1060, 643, 'NVS', NULL, 'Novosibirskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1061, 643, 'OMS', NULL, 'Omskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1062, 643, 'ORE', NULL, 'Orenburgskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1063, 643, 'ORL', NULL, 'Orlovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1064, 643, 'PNZ', NULL, 'Penzenskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1065, 643, 'PER', NULL, 'Permskiy kray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1066, 643, 'PRI', NULL, 'Primorskiy kray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1067, 643, 'PSK', NULL, 'Pskovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1068, 643, 'ROS', NULL, 'Rostovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1069, 643, 'RYA', NULL, 'Ryazanskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1070, 643, 'SAK', NULL, 'Sakhalinskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1071, 643, 'SAM', NULL, 'Samarskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1072, 643, 'SPE', NULL, 'Sankt-Peterburg', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1073, 643, 'SAR', NULL, 'Saratovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1074, 643, 'SMO', NULL, 'Smolenskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1075, 643, 'STA', NULL, 'Stavropol\'skiy kray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1076, 643, 'SVE', NULL, 'Sverdlovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1077, 643, 'TAM', NULL, 'Tambovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1078, 643, 'TOM', NULL, 'Tomskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1079, 643, 'TUL', NULL, 'Tul\'skaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1080, 643, 'TVE', NULL, 'Tverskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1081, 643, 'TYU', NULL, 'Tyumenskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1082, 643, 'ULY', NULL, 'Ul\'yanovskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1083, 643, 'VLA', NULL, 'Vladimirskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52');
INSERT INTO `states` (`id`, `country_id`, `iso_code`, `iso_numeric`, `name`, `calling_code`, `active`, `created_at`, `updated_at`) VALUES
(1084, 643, 'VGG', NULL, 'Volgogradskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1085, 643, 'VLG', NULL, 'Vologodskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1086, 643, 'VOR', NULL, 'Voronezhskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1087, 643, 'YAN', NULL, 'Yamalo-Nenetskiy avtonomnyy okrug', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1088, 643, 'YAR', NULL, 'Yaroslavskaya oblast\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1089, 643, 'YEV', NULL, 'Yevreyskaya avtonomnaya oblast\'ug', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1090, 643, 'ZAB', NULL, 'Zabaykal\'skiy kray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1091, 682, '12', NULL, 'AI Jawf', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1092, 682, '11', NULL, 'Al Bāḩah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1093, 682, '3', NULL, 'Al Madīnah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1094, 682, '5', NULL, 'Al Qaşīm', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1095, 682, '8', NULL, 'Al Ḩudūd ash Shamālīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1096, 682, '1', NULL, 'Ar Riyāḑ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1097, 682, '4', NULL, 'Ash Sharqīyah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1098, 682, '14', NULL, 'Asīr', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1099, 682, '9', NULL, 'Jīzān', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1100, 682, '2', NULL, 'Makkah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1101, 682, '10', NULL, 'Najrān', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1102, 682, '7', NULL, 'Tabūk', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1103, 682, '6', NULL, 'Ḩā\'il', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1104, 690, '02', NULL, 'Anse Boileau', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1105, 690, '05', NULL, 'Anse Royale', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1106, 690, '01', NULL, 'Anse aux Pins', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1107, 690, '03', NULL, 'Anse Étoile', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1108, 690, '04', NULL, 'Au Cap', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1109, 690, '06', NULL, 'Baie Lazare', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1110, 690, '07', NULL, 'Baie Sainte-Anne', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1111, 690, '08', NULL, 'Beau Vallon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1112, 690, '09', NULL, 'Bel Air', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1113, 690, '10', NULL, 'Bel Ombre', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1114, 690, '11', NULL, 'Cascade', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1115, 690, '12', NULL, 'Glacis', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1116, 690, '13', NULL, 'Grand\' Anse Mahé', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1117, 690, '14', NULL, 'Grand\' Anse Praslin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1118, 690, '15', NULL, 'La Digue', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1119, 690, '16', NULL, 'La Rivière Anglaise', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1120, 690, '24', NULL, 'Les Mamelles', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1121, 690, '17', NULL, 'Mont Buxton', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1122, 690, '18', NULL, 'Mont Fleuri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1123, 690, '19', NULL, 'Plaisance', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1124, 690, '20', NULL, 'Pointe La Rue', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1125, 690, '21', NULL, 'Port Glaud', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1126, 690, '25', NULL, 'Roche Caïman', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1127, 690, '22', NULL, 'Saint Louis', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1128, 690, '23', NULL, 'Takamaka', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1129, 702, '01', NULL, 'Central Singapore', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1130, 702, '02', NULL, 'North East', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1131, 702, '03', NULL, 'North West', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1132, 702, '04', NULL, 'South East', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1133, 702, '05', NULL, 'South West', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1134, 764, '37', NULL, 'Amnat Charoen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1135, 764, '15', NULL, 'Ang Thong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1136, 764, '38', NULL, 'Bueng Kan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1137, 764, '31', NULL, 'Buri Ram', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1138, 764, '24', NULL, 'Chachoengsao', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1139, 764, '18', NULL, 'Chai Nat', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1140, 764, '36', NULL, 'Chaiyaphum', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1141, 764, '22', NULL, 'Chanthaburi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1142, 764, '50', NULL, 'Chiang Mai', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1143, 764, '57', NULL, 'Chiang Rai', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1144, 764, '20', NULL, 'Chon Buri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1145, 764, '86', NULL, 'Chumphon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1146, 764, '46', NULL, 'Kalasin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1147, 764, '62', NULL, 'Kamphaeng Phet', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1148, 764, '71', NULL, 'Kanchanaburi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1149, 764, '40', NULL, 'Khon Kaen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1150, 764, '81', NULL, 'Krabi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1151, 764, '52', NULL, 'Lampang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1152, 764, '51', NULL, 'Lamphun', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1153, 764, '42', NULL, 'Loei', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1154, 764, '16', NULL, 'Lop Buri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1155, 764, '58', NULL, 'Mae Hong Son', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1156, 764, '44', NULL, 'Maha Sarakham', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1157, 764, '49', NULL, 'Mukdahan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1158, 764, '26', NULL, 'Nakhon Nayok', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1159, 764, '73', NULL, 'Nakhon Pathom', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1160, 764, '48', NULL, 'Nakhon Phanom', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1161, 764, '30', NULL, 'Nakhon Ratchasima', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1162, 764, '60', NULL, 'Nakhon Sawan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1163, 764, '80', NULL, 'Nakhon Si Thammarat', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1164, 764, '55', NULL, 'Nan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1165, 764, '96', NULL, 'Narathiwat', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1166, 764, '39', NULL, 'Nong Bua Lam Phu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1167, 764, '43', NULL, 'Nong Khai', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1168, 764, '12', NULL, 'Nonthaburi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1169, 764, '13', NULL, 'Pathum Thani', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1170, 764, '94', NULL, 'Pattani', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1171, 764, '82', NULL, 'Phangnga', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1172, 764, '93', NULL, 'Phatthalung', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1173, 764, '56', NULL, 'Phayao', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1174, 764, '67', NULL, 'Phetchabun', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1175, 764, '76', NULL, 'Phetchaburi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1176, 764, '66', NULL, 'Phichit', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1177, 764, '65', NULL, 'Phitsanulok', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1178, 764, '14', NULL, 'Phra Nakhon Si Ayutthaya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1179, 764, '54', NULL, 'Phrae', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1180, 764, '83', NULL, 'Phuket', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1181, 764, '25', NULL, 'Prachin Buri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1182, 764, '77', NULL, 'Prachuap Khiri Khan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1183, 764, '85', NULL, 'Ranong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1184, 764, '70', NULL, 'Ratchaburi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1185, 764, '21', NULL, 'Rayong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1186, 764, '45', NULL, 'Roi Et', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1187, 764, '27', NULL, 'Sa Kaeo', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1188, 764, '47', NULL, 'Sakon Nakhon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1189, 764, '11', NULL, 'Samut Prakan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1190, 764, '74', NULL, 'Samut Sakhon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1191, 764, '75', NULL, 'Samut Songkhram', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1192, 764, '19', NULL, 'Saraburi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1193, 764, '91', NULL, 'Satun', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1194, 764, '33', NULL, 'Si Sa Ket', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1195, 764, '17', NULL, 'Sing Buri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1196, 764, '90', NULL, 'Songkhla', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1197, 764, '64', NULL, 'Sukhothai', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1198, 764, '72', NULL, 'Suphan Buri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1199, 764, '84', NULL, 'Surat Thani', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1200, 764, '32', NULL, 'Surin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1201, 764, '63', NULL, 'Tak', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1202, 764, '92', NULL, 'Trang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1203, 764, '23', NULL, 'Trat', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1204, 764, '34', NULL, 'Ubon Ratchathani', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1205, 764, '41', NULL, 'Udon Thani', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1206, 764, '61', NULL, 'Uthai Thani', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1207, 764, '53', NULL, 'Uttaradit', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1208, 764, '95', NULL, 'Yala', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1209, 764, '35', NULL, 'Yasothon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1210, 792, '1', NULL, 'Adana', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1211, 792, '2', NULL, 'Adiyaman', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1212, 792, '3', NULL, 'Afyon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1213, 792, '68', NULL, 'Aksaray', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1214, 792, '5', NULL, 'Amasya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1215, 792, '6', NULL, 'Ankara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1216, 792, '7', NULL, 'Antalya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1217, 792, '75', NULL, 'Ardahan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1218, 792, '8', NULL, 'Artvin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1219, 792, '9', NULL, 'Aydin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1220, 792, '4', NULL, 'Ağrı', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1221, 792, '10', NULL, 'Balikesir', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1222, 792, '74', NULL, 'Bartin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1223, 792, '72', NULL, 'Batman', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1224, 792, '69', NULL, 'Bayburt', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1225, 792, '11', NULL, 'Bilecik', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1226, 792, '12', NULL, 'Bingöl', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1227, 792, '13', NULL, 'Bitlis', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1228, 792, '14', NULL, 'Bolu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1229, 792, '15', NULL, 'Burdur', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1230, 792, '16', NULL, 'Bursa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1231, 792, '20', NULL, 'Denizli', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1232, 792, '21', NULL, 'Diyarbakir', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1233, 792, '81', NULL, 'Düzce', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1234, 792, '22', NULL, 'Edirne', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1235, 792, '23', NULL, 'Elazığ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1236, 792, '24', NULL, 'Erzincan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1237, 792, '25', NULL, 'Erzurum', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1238, 792, '26', NULL, 'Eskişehir', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1239, 792, '27', NULL, 'Gaziantep', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1240, 792, '28', NULL, 'Giresun', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1241, 792, '29', NULL, 'Gümüşhane', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1242, 792, '30', NULL, 'Hakkâri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1243, 792, '31', NULL, 'Hatay', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1244, 792, '33', NULL, 'Icel', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1245, 792, '32', NULL, 'Isparta', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1246, 792, '34', NULL, 'Istanbul', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1247, 792, '35', NULL, 'Izmir', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1248, 792, '76', NULL, 'Iğdır', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1249, 792, '46', NULL, 'Kahramanmaraş', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1250, 792, '78', NULL, 'Karabük', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1251, 792, '70', NULL, 'Karaman', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1252, 792, '36', NULL, 'Kars', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1253, 792, '37', NULL, 'Kastamonu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1254, 792, '38', NULL, 'Kayseri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1255, 792, '79', NULL, 'Kilis', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1256, 792, '71', NULL, 'Kirkkale', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1257, 792, '39', NULL, 'Kirklareli', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1258, 792, '41', NULL, 'Kocaeli', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1259, 792, '42', NULL, 'Konya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1260, 792, '43', NULL, 'Kütahya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1261, 792, '40', NULL, 'Kırşehir', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1262, 792, '44', NULL, 'Malatya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1263, 792, '45', NULL, 'Manisa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1264, 792, '47', NULL, 'Mardin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1265, 792, '48', NULL, 'Muğla', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1266, 792, '49', NULL, 'Muş', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1267, 792, '50', NULL, 'Nevşehir', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1268, 792, '51', NULL, 'Niğde', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1269, 792, '52', NULL, 'Ordu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1270, 792, '80', NULL, 'Osmaniye', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1271, 792, '53', NULL, 'Rize', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1272, 792, '54', NULL, 'Sakarya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1273, 792, '55', NULL, 'Samsun', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1274, 792, '56', NULL, 'Siirt', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1275, 792, '57', NULL, 'Sinop', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1276, 792, '58', NULL, 'Sivas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1277, 792, '59', NULL, 'Tekirdağ', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1278, 792, '60', NULL, 'Tokat', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1279, 792, '61', NULL, 'Trabzon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1280, 792, '62', NULL, 'Tunceli', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1281, 792, '64', NULL, 'Uşak', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1282, 792, '65', NULL, 'Van', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1283, 792, '77', NULL, 'Yalova', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1284, 792, '66', NULL, 'Yozgat', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1285, 792, '67', NULL, 'Zonguldak', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1286, 792, '17', NULL, 'Çanakkale', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1287, 792, '18', NULL, 'Çankırı', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1288, 792, '19', NULL, 'Çorum', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1289, 792, '63', NULL, 'Şanlıurfa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1290, 792, '73', NULL, 'Şırnak', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1291, 834, '01', NULL, 'Arusha', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1292, 834, '02', NULL, 'Dar es Salaam', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1293, 834, '03', NULL, 'Dodoma', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1294, 834, '27', NULL, 'Geita', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1295, 834, '04', NULL, 'Iringa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1296, 834, '05', NULL, 'Kagera', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1297, 834, '06', NULL, 'Kaskazini Pemba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1298, 834, '07', NULL, 'Kaskazini Unguja', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1299, 834, '28', NULL, 'Katavi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1300, 834, '08', NULL, 'Kigoma', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1301, 834, '09', NULL, 'Kilimanjaro', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1302, 834, '10', NULL, 'Kusini Pemba', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1303, 834, '11', NULL, 'Kusini Unguja', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1304, 834, '12', NULL, 'Lindi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1305, 834, '26', NULL, 'Manyara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1306, 834, '13', NULL, 'Mara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1307, 834, '14', NULL, 'Mbeya', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1308, 834, '15', NULL, 'Mjini Magharibi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1309, 834, '16', NULL, 'Morogoro', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1310, 834, '17', NULL, 'Mtwara', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1311, 834, '18', NULL, 'Mwanza', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1312, 834, '29', NULL, 'Njombe', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1313, 834, '19', NULL, 'Pwani Coast', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1314, 834, '20', NULL, 'Rukwa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1315, 834, '21', NULL, 'Ruvuma', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1316, 834, '22', NULL, 'Shinyanga', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1317, 834, '30', NULL, 'Simiyu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1318, 834, '23', NULL, 'Singida', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1319, 834, '31', NULL, 'Songwe', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1320, 834, '24', NULL, 'Tabora', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1321, 834, '25', NULL, 'Tanga', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1322, 840, 'AL', NULL, 'Alabama', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1323, 840, 'AK', NULL, 'Alaska', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1324, 840, 'AS', NULL, 'American Samoa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1325, 840, 'AZ', NULL, 'Arizona', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1326, 840, 'AR', NULL, 'Arkansas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1327, 840, 'CA', NULL, 'California', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1328, 840, 'CO', NULL, 'Colorado', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1329, 840, 'CT', NULL, 'Connecticut', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1330, 840, 'DE', NULL, 'Delaware', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1331, 840, 'DC', NULL, 'District Of Columbia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1332, 840, 'FM', NULL, 'Federated States Of Micronesia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1333, 840, 'FL', NULL, 'Florida', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1334, 840, 'GA', NULL, 'Georgia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1335, 840, 'GU', NULL, 'Guam', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1336, 840, 'HI', NULL, 'Hawaii', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1337, 840, 'ID', NULL, 'Idaho', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1338, 840, 'IL', NULL, 'Illinois', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1339, 840, 'IN', NULL, 'Indiana', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1340, 840, 'IA', NULL, 'Iowa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1341, 840, 'KS', NULL, 'Kansas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1342, 840, 'KY', NULL, 'Kentucky', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1343, 840, 'LA', NULL, 'Louisiana', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1344, 840, 'ME', NULL, 'Maine', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1345, 840, 'MH', NULL, 'Marshall Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1346, 840, 'MD', NULL, 'Maryland', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1347, 840, 'MA', NULL, 'Massachusetts', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1348, 840, 'MI', NULL, 'Michigan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1349, 840, 'MN', NULL, 'Minnesota', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1350, 840, 'MS', NULL, 'Mississippi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1351, 840, 'MO', NULL, 'Missouri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1352, 840, 'MT', NULL, 'Montana', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1353, 840, 'NE', NULL, 'Nebraska', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1354, 840, 'NV', NULL, 'Nevada', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1355, 840, 'NH', NULL, 'New Hampshire', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1356, 840, 'NJ', NULL, 'New Jersey', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1357, 840, 'NM', NULL, 'New Mexico', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1358, 840, 'NY', NULL, 'New York', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1359, 840, 'NC', NULL, 'North Carolina', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1360, 840, 'ND', NULL, 'North Dakota', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1361, 840, 'MP', NULL, 'Northern Mariana Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1362, 840, 'OH', NULL, 'Ohio', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1363, 840, 'OK', NULL, 'Oklahoma', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1364, 840, 'OR', NULL, 'Oregon', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1365, 840, 'PW', NULL, 'Palau', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1366, 840, 'PA', NULL, 'Pennsylvania', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1367, 840, 'PR', NULL, 'Puerto Rico', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1368, 840, 'RI', NULL, 'Rhode Island', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1369, 840, 'SC', NULL, 'South Carolina', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1370, 840, 'SD', NULL, 'South Dakota', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1371, 840, 'TN', NULL, 'Tennessee', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1372, 840, 'TX', NULL, 'Texas', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1373, 840, 'UT', NULL, 'Utah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1374, 840, 'VT', NULL, 'Vermont', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1375, 840, 'VI', NULL, 'Virgin Islands', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1376, 840, 'VA', NULL, 'Virginia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1377, 840, 'WA', NULL, 'Washington', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1378, 840, 'WV', NULL, 'West Virginia', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1379, 840, 'WI', NULL, 'Wisconsin', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1380, 840, 'WY', NULL, 'Wyoming', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1381, 704, '44', NULL, 'An Giang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1382, 704, '43', NULL, 'Ba Ria - Vung Tau', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1383, 704, '53', NULL, 'Bac Can', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1384, 704, '54', NULL, 'Bac Giang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1385, 704, '55', NULL, 'Bac Lieu', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1386, 704, '56', NULL, 'Bac Ninh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1387, 704, '50', NULL, 'Ben Tre', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1388, 704, '31', NULL, 'Binh Dinh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1389, 704, '57', NULL, 'Binh Duong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1390, 704, '58', NULL, 'Binh Phuoc', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1391, 704, '40', NULL, 'Binh Thuan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1392, 704, '59', NULL, 'Ca Mau', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1393, 704, 'CT', NULL, 'Can Tho', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1394, 704, '4', NULL, 'Cao Bang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1395, 704, 'DN', NULL, 'Da Nang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1396, 704, '60', NULL, 'Da Nang, thanh pho', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1397, 704, '33', NULL, 'Dac Lac', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1398, 704, '72', NULL, 'Dak Nong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1399, 704, '71', NULL, 'Dien Bien', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1400, 704, '39', NULL, 'Dong Nai', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1401, 704, '45', NULL, 'Dong Thap', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1402, 704, '30', NULL, 'Gia Lai', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1403, 704, '3', NULL, 'Ha Giang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1404, 704, '63', NULL, 'Ha Nam', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1405, 704, 'HN', NULL, 'Ha Noi', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1406, 704, '15', NULL, 'Ha Tay', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1407, 704, '23', NULL, 'Ha Tinh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1408, 704, '61', NULL, 'Hai Duong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1409, 704, 'HP', NULL, 'Hai Phong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1410, 704, '62', NULL, 'Hai Phong, thanh pho', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1411, 704, '73', NULL, 'Hau Giang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1412, 704, 'SG', NULL, 'Ho Chi Minh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1413, 704, '14', NULL, 'Hoa Binh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1414, 704, '66', NULL, 'Hung Yen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1415, 704, '34', NULL, 'Khanh Hoa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1416, 704, '47', NULL, 'Kien Giang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1417, 704, '28', NULL, 'Kon Tum', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1418, 704, '1', NULL, 'Lai Chau', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1419, 704, '35', NULL, 'Lam Dong', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1420, 704, '9', NULL, 'Lang Son', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1421, 704, '2', NULL, 'Lao Cai', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1422, 704, '41', NULL, 'Long An', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1423, 704, '67', NULL, 'Nam Dinh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1424, 704, '22', NULL, 'Nghe An', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1425, 704, '18', NULL, 'Ninh Binh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1426, 704, '36', NULL, 'Ninh Thuan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1427, 704, '68', NULL, 'Phu Tho', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1428, 704, '32', NULL, 'Phu Yen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1429, 704, '24', NULL, 'Quang Binh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1430, 704, '27', NULL, 'Quang Nam', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1431, 704, '29', NULL, 'Quang Ngai', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1432, 704, '13', NULL, 'Quang Ninh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1433, 704, '25', NULL, 'Quang Tri', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1434, 704, '52', NULL, 'Soc Trang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1435, 704, '5', NULL, 'Son La', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1436, 704, '37', NULL, 'Tay Ninh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1437, 704, '20', NULL, 'Thai Binh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1438, 704, '69', NULL, 'Thai Nguyen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1439, 704, '21', NULL, 'Thanh Hoa', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1440, 704, '26', NULL, 'Thua Thien-Hue', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1441, 704, '46', NULL, 'Tien Giang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1442, 704, '51', NULL, 'Tra Vinh', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1443, 704, '7', NULL, 'Tuyen Quang', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1444, 704, '49', NULL, 'Vinh Long', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1445, 704, '70', NULL, 'Vinh Yen', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1446, 704, '6', NULL, 'Yen Bai', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1447, 887, 'AD', NULL, '\'Adan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1448, 887, 'AM', NULL, '\'Amrān', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1449, 887, 'AB', NULL, 'Abyan', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1450, 887, 'BA', NULL, 'Al Bayḑā\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1451, 887, 'JA', NULL, 'Al Jawf', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1452, 887, 'MR', NULL, 'Al Mahrah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1453, 887, 'MW', NULL, 'Al Maḩwīt', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1454, 887, 'HU', NULL, 'Al Ḩudaydah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1455, 887, 'DA', NULL, 'Aḑ Ḑāli\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1456, 887, 'DH', NULL, 'Dhamār', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1457, 887, 'IB', NULL, 'Ibb', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1458, 887, 'LA', NULL, 'Laḩij', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1459, 887, 'MA', NULL, 'Ma\'rib', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1460, 887, 'RA', NULL, 'Raymah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1461, 887, 'SH', NULL, 'Shabwah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1462, 887, 'TA', NULL, 'Tāʻizz', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1463, 887, 'SN', NULL, 'Şanʻā\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1464, 887, 'SA', NULL, 'Şanʻā\'', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1465, 887, 'SD', NULL, 'Şāʻdah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1466, 887, 'HJ', NULL, 'Ḩajjah', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(1467, 887, 'HD', NULL, 'Ḩaḑramawt', NULL, 1, '2024-03-05 06:32:52', '2024-03-05 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `stripe_status` varchar(255) DEFAULT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `notification_sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) DEFAULT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `name` varchar(255) NOT NULL,
  `plan_id` varchar(255) NOT NULL,
  `best_for` varchar(255) DEFAULT NULL,
  `cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `transaction_fee` decimal(8,2) NOT NULL DEFAULT 0.00,
  `marketplace_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `order_per_month` int(11) DEFAULT NULL,
  `revenue_per_month` int(11) DEFAULT NULL,
  `team_size` int(11) NOT NULL DEFAULT 1,
  `inventory_limit` int(11) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`name`, `plan_id`, `best_for`, `cost`, `transaction_fee`, `marketplace_commission`, `order_per_month`, `revenue_per_month`, `team_size`, `inventory_limit`, `featured`, `order`, `deleted_at`, `created_at`, `updated_at`) VALUES
('Business', 'price_1GyyRyJewI4n8wVFSRWlMSHy', NULL, 29.00, 1.90, 2.50, NULL, NULL, 5, 200, 1, 2, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
('Individual', 'price_1H1HUQJewI4n8wVFTnjx77Ws', NULL, 9.00, 2.50, 3.00, NULL, NULL, 1, 20, 0, 1, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53'),
('Professional', 'price_1H1HW7JewI4n8wVFl8Ukknoz', NULL, 49.00, 1.00, 1.50, NULL, NULL, 10, 500, 0, 3, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

CREATE TABLE `systems` (
  `id` int(10) UNSIGNED NOT NULL,
  `maintenance_mode` tinyint(1) DEFAULT NULL,
  `install_verion` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Marketplace',
  `slogan` text DEFAULT NULL,
  `legal_name` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `worldwide_business_area` tinyint(1) DEFAULT 1,
  `timezone_id` int(11) NOT NULL DEFAULT 35,
  `currency_id` int(11) NOT NULL DEFAULT 148,
  `default_language` varchar(7) NOT NULL DEFAULT 'en',
  `vendor_can_view_customer_info` tinyint(1) DEFAULT 0,
  `can_use_own_catalog_only` tinyint(1) DEFAULT 0,
  `google_analytic_report` tinyint(1) DEFAULT 0,
  `required_card_upfront` tinyint(1) DEFAULT 1,
  `vendor_needs_approval` tinyint(1) DEFAULT 1,
  `vendor_order_cancellation_fee` decimal(20,2) DEFAULT 0.00,
  `show_merchant_info_as_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `trial_days` int(11) DEFAULT NULL,
  `ask_customer_for_email_subscription` tinyint(1) DEFAULT 1,
  `can_cancel_order_within` int(11) DEFAULT 0,
  `support_phone` varchar(255) DEFAULT NULL,
  `support_phone_toll_free` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) NOT NULL,
  `default_sender_email_address` varchar(255) DEFAULT NULL,
  `default_email_sender_name` varchar(255) DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `google_plus_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `pinterest_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `youtube_link` varchar(255) DEFAULT NULL,
  `social_auth` tinyint(1) NOT NULL DEFAULT 1,
  `length_unit` varchar(255) NOT NULL DEFAULT 'meter',
  `weight_unit` varchar(255) NOT NULL DEFAULT 'g',
  `valume_unit` varchar(255) NOT NULL DEFAULT 'liter',
  `decimals` enum('0','2','3','4','5','6') NOT NULL DEFAULT '2',
  `show_currency_symbol` tinyint(1) NOT NULL DEFAULT 1,
  `show_space_after_symbol` tinyint(1) NOT NULL DEFAULT 1,
  `coupon_code_size` int(11) NOT NULL DEFAULT 8,
  `gift_card_serial_number_size` int(11) NOT NULL DEFAULT 13,
  `gift_card_pin_size` int(11) NOT NULL DEFAULT 10,
  `active_theme` varchar(255) NOT NULL DEFAULT 'default',
  `selling_theme` varchar(255) NOT NULL DEFAULT 'default',
  `pagination` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `show_seo_info_to_frontend` tinyint(1) DEFAULT 1,
  `hide_out_of_stock_items` tinyint(1) DEFAULT 0,
  `hide_technical_details_on_product_page` tinyint(1) DEFAULT 0,
  `max_img_size_limit_kb` int(11) NOT NULL DEFAULT 5000,
  `max_number_of_inventory_imgs` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `show_item_conditions` tinyint(1) DEFAULT 1,
  `address_default_country` int(11) DEFAULT NULL,
  `address_default_state` int(11) DEFAULT NULL,
  `show_address_title` tinyint(1) DEFAULT NULL,
  `address_show_country` tinyint(1) DEFAULT NULL,
  `address_show_map` tinyint(1) DEFAULT NULL,
  `allow_guest_checkout` tinyint(1) DEFAULT 1,
  `auto_approve_order` tinyint(1) DEFAULT 0,
  `notify_when_vendor_registered` tinyint(1) DEFAULT 1,
  `notify_when_dispute_appealed` tinyint(1) DEFAULT 1,
  `notify_new_message` tinyint(1) DEFAULT NULL,
  `notify_new_ticket` tinyint(1) DEFAULT 1,
  `enable_chat` tinyint(1) DEFAULT 1,
  `digital_goods_only` tinyint(1) DEFAULT 0,
  `is_multi_vendor` tinyint(1) DEFAULT 1,
  `max_role_level` int(10) UNSIGNED NOT NULL DEFAULT 99,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `systems`
--

INSERT INTO `systems` (`id`, `maintenance_mode`, `install_verion`, `name`, `slogan`, `legal_name`, `email`, `worldwide_business_area`, `timezone_id`, `currency_id`, `default_language`, `vendor_can_view_customer_info`, `can_use_own_catalog_only`, `google_analytic_report`, `required_card_upfront`, `vendor_needs_approval`, `vendor_order_cancellation_fee`, `show_merchant_info_as_vendor`, `trial_days`, `ask_customer_for_email_subscription`, `can_cancel_order_within`, `support_phone`, `support_phone_toll_free`, `support_email`, `default_sender_email_address`, `default_email_sender_name`, `facebook_link`, `google_plus_link`, `twitter_link`, `pinterest_link`, `instagram_link`, `youtube_link`, `social_auth`, `length_unit`, `weight_unit`, `valume_unit`, `decimals`, `show_currency_symbol`, `show_space_after_symbol`, `coupon_code_size`, `gift_card_serial_number_size`, `gift_card_pin_size`, `active_theme`, `selling_theme`, `pagination`, `show_seo_info_to_frontend`, `hide_out_of_stock_items`, `hide_technical_details_on_product_page`, `max_img_size_limit_kb`, `max_number_of_inventory_imgs`, `show_item_conditions`, `address_default_country`, `address_default_state`, `show_address_title`, `address_show_country`, `address_show_map`, `allow_guest_checkout`, `auto_approve_order`, `notify_when_vendor_registered`, `notify_when_dispute_appealed`, `notify_new_message`, `notify_new_ticket`, `enable_chat`, `digital_goods_only`, `is_multi_vendor`, `max_role_level`, `created_at`, `updated_at`) VALUES
(1, NULL, '2.11.0', 'zCart', NULL, 'Zcart Inc.', 'notify@demo.com', 1, 35, 148, 'en', 0, 0, 0, NULL, 1, 0.00, 0, 13, 1, 0, '(+1) 84382648364', NULL, 'help.incevio@gmail.com', NULL, NULL, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.pinterest.com/', 'https://www.instagram.com/', 'https://www.youtube.com/', 1, 'cm', 'gm', 'liter', '2', 1, 0, 8, 13, 10, 'default', 'default', 10, 1, 0, 0, 5000, 10, 1, 840, 453, NULL, 1, 1, 1, 0, 1, 1, NULL, 1, 1, 0, 1, 99, '2024-03-05 06:32:52', '2024-03-05 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `taggable_id` int(10) UNSIGNED NOT NULL,
  `taggable_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `taxrate` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `state_id` int(10) UNSIGNED DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `shop_id`, `name`, `taxrate`, `country_id`, `state_id`, `public`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, '- No tax -', 0.000000, NULL, NULL, 1, 1, NULL, '2024-03-05 06:32:53', '2024-03-05 06:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_categories`
--

CREATE TABLE `ticket_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_categories`
--

INSERT INTO `ticket_categories` (`id`, `name`) VALUES
(1, 'General query'),
(2, 'Merchant support'),
(3, 'Technical support'),
(4, 'Webmaster');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `offset` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `utc` varchar(255) DEFAULT NULL,
  `dst` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `value`, `abbr`, `offset`, `text`, `utc`, `dst`, `created_at`, `updated_at`) VALUES
(1, 'Dateline Standard Time', 'DST', -12, '(UTC-12:00) International Date Line West', 'Etc/GMT+12', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(2, 'UTC-11', 'U', -11, '(UTC-11:00) Coordinated Universal Time-11', 'Pacific/Midway', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(3, 'Hawaiian Standard Time', 'HST', -10, '(UTC-10:00) Hawaii', 'Pacific/Honolulu', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(4, 'Alaskan Standard Time', 'AKDT', -8, '(UTC-09:00) Alaska', 'America/Anchorage', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(5, 'Pacific Standard Time (Mexico)', 'PDT', -7, '(UTC-08:00) Baja California', 'America/Santa_Isabel', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(6, 'Pacific Standard Time', 'PDT', -7, '(UTC-08:00) Pacific Time (US & Canada)', 'America/Los_Angeles', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(7, 'US Mountain Standard Time', 'UMST', -7, '(UTC-07:00) Arizona', 'America/Phoenix', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(8, 'Mountain Standard Time (Mexico)', 'MDT', -6, '(UTC-07:00) Chihuahua, La Paz, Mazatlan', 'America/Chihuahua', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(9, 'Mountain Standard Time', 'MDT', -6, '(UTC-07:00) Mountain Time (US & Canada)', 'America/Denver', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(10, 'Central America Standard Time', 'CAST', -6, '(UTC-06:00) Central America', 'America/Guatemala', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(11, 'Central Standard Time', 'CDT', -5, '(UTC-06:00) Central Time (US & Canada)', 'America/Chicago', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(12, 'Central Standard Time (Mexico)', 'CDT', -5, '(UTC-06:00) Guadalajara, Mexico City, Monterrey', 'America/Mexico_City', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(13, 'Canada Central Standard Time', 'CCST', -6, '(UTC-06:00) Saskatchewan', 'America/Regina', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(14, 'SA Pacific Standard Time', 'SPST', -5, '(UTC-05:00) Bogota, Lima, Quito', 'America/Lima', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(15, 'Eastern Standard Time', 'EDT', -4, '(UTC-05:00) Eastern Time (US & Canada)', 'America/New_York', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(16, 'US Eastern Standard Time', 'UEDT', -4, '(UTC-05:00) Indiana (East)', 'America/Indianapolis', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(17, 'Venezuela Standard Time', 'VST', -5, '(UTC-04:30) Caracas', 'America/Caracas', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(18, 'Paraguay Standard Time', 'PST', -4, '(UTC-04:00) Asuncion', 'America/Asuncion', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(19, 'Atlantic Standard Time', 'ADT', -3, '(UTC-04:00) Atlantic Time (Canada)', 'Atlantic/Bermuda', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(20, 'Central Brazilian Standard Time', 'CBST', -4, '(UTC-04:00) Cuiaba', 'America/Cuiaba', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(21, 'SA Western Standard Time', 'SWST', -4, '(UTC-04:00) Georgetown, La Paz, Manaus, San Juan', 'America/Aruba', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(22, 'Pacific SA Standard Time', 'PSST', -4, '(UTC-04:00) Santiago', 'America/Santiago', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(23, 'Newfoundland Standard Time', 'NDT', -3, '(UTC-03:30) Newfoundland', 'America/St_Johns', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(24, 'E. South America Standard Time', 'ESAST', -3, '(UTC-03:00) Brasilia', 'America/Sao_Paulo', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(25, 'Argentina Standard Time', 'AST', -3, '(UTC-03:00) Buenos Aires', 'America/Buenos_Aires', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(26, 'SA Eastern Standard Time', 'SEST', -3, '(UTC-03:00) Cayenne, Fortaleza', 'America/Cayenne', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(27, 'Greenland Standard Time', 'GDT', -2, '(UTC-03:00) Greenland', 'America/Godthab', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(28, 'Montevideo Standard Time', 'MST', -3, '(UTC-03:00) Montevideo', 'America/Montevideo', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(29, 'Bahia Standard Time', 'BST', -3, '(UTC-03:00) Salvador', 'America/Bahia', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(30, 'UTC-02', 'U', -2, '(UTC-02:00) Coordinated Universal Time-02', 'America/Noronha', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(31, 'Azores Standard Time', 'ADT', 0, '(UTC-01:00) Azores', 'Atlantic/Azores', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(32, 'Cape Verde Standard Time', 'CVST', -1, '(UTC-01:00) Cape Verde Is.', 'Atlantic/Cape_Verde', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(33, 'Morocco Standard Time', 'MDT', 1, '(UTC) Casablanca', 'Africa/Casablanca', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(34, 'UTC', 'CUT', 0, '(UTC) Coordinated Universal Time', 'America/Danmarkshavn', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(35, 'GMT Standard Time', 'GDT', 1, '(UTC) Dublin, Edinburgh, Lisbon, London', 'Europe/London', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(36, 'Greenwich Standard Time', 'GST', 0, '(UTC) Monrovia, Reykjavik', 'Africa/Monrovia', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(37, 'W. Europe Standard Time', 'WEDT', 2, '(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna', 'Europe/Amsterdam', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(38, 'Central Europe Standard Time', 'CEDT', 2, '(UTC+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague', 'Europe/Budapest', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(39, 'Romance Standard Time', 'RDT', 2, '(UTC+01:00) Brussels, Copenhagen, Madrid, Paris', 'Europe/Paris', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(40, 'Central European Standard Time', 'CEDT', 2, '(UTC+01:00) Sarajevo, Skopje, Warsaw, Zagreb', 'Europe/Warsaw', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(41, 'W. Central Africa Standard Time', 'WCAST', 1, '(UTC+01:00) West Central Africa', 'Africa/Lagos', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(42, 'Namibia Standard Time', 'NST', 1, '(UTC+01:00) Windhoek', 'Africa/Windhoek', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(43, 'GTB Standard Time', 'GDT', 3, '(UTC+02:00) Athens, Bucharest, Chisinau, Nicosia', 'Europe/Athens', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(44, 'Middle East Standard Time', 'MEDT', 3, '(UTC+02:00) Beirut', 'Asia/Beirut', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(45, 'Egypt Standard Time', 'EST', 2, '(UTC+02:00) Cairo', 'Africa/Cairo', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(46, 'Syria Standard Time', 'SDT', 3, '(UTC+02:00) Damascus', 'Asia/Damascus', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(47, 'South Africa Standard Time', 'SAST', 2, '(UTC+02:00) Harare, Pretoria, Johannesburg, Bujumbura', 'Africa/Harare', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(48, 'FLE Standard Time', 'FDT', 3, '(UTC+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius', 'Europe/Helsinki', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(49, 'Turkey Standard Time', 'TDT', 3, '(UTC+02:00) Istanbul', 'Europe/Istanbul', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(50, 'Israel Standard Time', 'JDT', 3, '(UTC+02:00) Jerusalem', 'Asia/Jerusalem', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(51, 'Libya Standard Time', 'LST', 2, '(UTC+02:00) Tripoli', 'Africa/Tripoli', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(52, 'Jordan Standard Time', 'JST', 3, '(UTC+03:00) Amman', 'Asia/Amman', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(53, 'Arabic Standard Time', 'AST', 3, '(UTC+03:00) Baghdad', 'Asia/Baghdad', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(54, 'Kaliningrad Standard Time', 'KST', 3, '(UTC+03:00) Kaliningrad, Minsk', 'Europe/Kaliningrad', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(55, 'Arab Standard Time', 'AST', 3, '(UTC+03:00) Aden, Bahrain, Kuwait, Riyadh, Qatar', 'Asia/Qatar', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(56, 'E. Africa Standard Time', 'EAST', 3, '(UTC+03:00) Nairobi, Comoro, Juba', 'Africa/Nairobi', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(57, 'Iran Standard Time', 'IDT', 5, '(UTC+03:30) Tehran', 'Asia/Tehran', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(58, 'Arabian Standard Time', 'AST', 4, '(UTC+04:00) Abu Dhabi, Muscat', 'Asia/Dubai', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(59, 'Azerbaijan Standard Time', 'ADT', 5, '(UTC+04:00) Baku', 'Asia/Baku', 1, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(60, 'Russian Standard Time', 'RST', 4, '(UTC+04:00) Samara, Moscow, St. Petersburg, Simferopol, Volgograd', 'Europe/Moscow', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(61, 'Mauritius Standard Time', 'MST', 4, '(UTC+04:00) Port Louis, Mauritius, Reunion, Mahe', 'Indian/Mauritius', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(62, 'Georgian Standard Time', 'GST', 4, '(UTC+04:00) Tbilisi', 'Asia/Tbilisi', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(63, 'Caucasus Standard Time', 'CST', 4, '(UTC+04:00) Yerevan', 'Asia/Yerevan', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(64, 'Afghanistan Standard Time', 'AST', 5, '(UTC+04:30) Kabul', 'Asia/Kabul', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(65, 'West Asia Standard Time', 'WAST', 5, '(UTC+05:00) Ashgabat, Dushanbe, Tashkent, Maldives', 'Asia/Tashkent', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(66, 'Pakistan Standard Time', 'PST', 5, '(UTC+05:00) Islamabad, Karachi', 'Asia/Karachi', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(67, 'India Standard Time', 'IST', 6, '(UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi', 'Asia/Calcutta', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(68, 'Sri Lanka Standard Time', 'SLST', 6, '(UTC+05:30) Sri Jayawardenepura', 'Asia/Colombo', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(69, 'Nepal Standard Time', 'NST', 6, '(UTC+05:45) Kathmandu', 'Asia/Katmandu', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(70, 'Central Asia Standard Time', 'CAST', 6, '(UTC+06:00) Astana, Dhaka, Thimphu', 'Asia/Dhaka', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(71, 'Ekaterinburg Standard Time', 'EST', 6, '(UTC+06:00) Ekaterinburg', 'Asia/Yekaterinburg', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(72, 'Myanmar Standard Time', 'MST', 7, '(UTC+06:30) Yangon (Rangoon), Cocos', 'Asia/Rangoon', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(73, 'SE Asia Standard Time', 'SAST', 7, '(UTC+07:00) Bangkok, Hanoi, Jakarta, Saigon', 'Asia/Bangkok', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(74, 'N. Central Asia Standard Time', 'NCAST', 7, '(UTC+07:00) Novosibirsk', 'Asia/Novosibirsk', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(75, 'China Standard Time', 'CST', 8, '(UTC+08:00) Beijing, Chongqing, Hong Kong, Macau, Shanghai, Urumqi', 'Asia/Shanghai', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(76, 'North Asia Standard Time', 'NAST', 8, '(UTC+08:00) Krasnoyarsk', 'Asia/Krasnoyarsk', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(77, 'Singapore Standard Time', 'MPST', 8, '(UTC+08:00) Kuala Lumpur, Singapore, Brunei, Makassar, Manila', 'Asia/Singapore', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(78, 'W. Australia Standard Time', 'WAST', 8, '(UTC+08:00) Perth', 'Australia/Perth', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(79, 'Taipei Standard Time', 'TST', 8, '(UTC+08:00) Taipei', 'Asia/Taipei', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(80, 'Ulaanbaatar Standard Time', 'UST', 8, '(UTC+08:00) Ulaanbaatar', 'Asia/Ulaanbaatar', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(81, 'North Asia East Standard Time', 'NAEST', 9, '(UTC+09:00) Irkutsk', 'Asia/Irkutsk', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(82, 'Tokyo Standard Time', 'TST', 9, '(UTC+09:00) Dili, Osaka, Palau, Sapporo, Tokyo', 'Asia/Tokyo', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(83, 'Korea Standard Time', 'KST', 9, '(UTC+09:00) Pyongyang, Seoul', 'Asia/Seoul', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(84, 'Cen. Australia Standard Time', 'CAST', 10, '(UTC+09:30) Adelaide', 'Australia/Adelaide', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(85, 'AUS Central Standard Time', 'ACST', 10, '(UTC+09:30) Darwin', 'Australia/Darwin', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(86, 'E. Australia Standard Time', 'EAST', 10, '(UTC+10:00) Brisbane', 'Australia/Brisbane', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(87, 'AUS Eastern Standard Time', 'AEST', 10, '(UTC+10:00) Canberra, Melbourne, Sydney', 'Australia/Sydney', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(88, 'West Pacific Standard Time', 'WPST', 10, '(UTC+10:00) Guam, Port Moresby', 'Pacific/Guam', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(89, 'Tasmania Standard Time', 'TST', 10, '(UTC+10:00) Hobart', 'Australia/Hobart', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(90, 'Yakutsk Standard Time', 'YST', 10, '(UTC+10:00) Yakutsk', 'Asia/Yakutsk', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(91, 'Central Pacific Standard Time', 'CPST', 11, '(UTC+11:00) Solomon Is., New Caledonia', 'Pacific/Guadalcanal', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(92, 'Vladivostok Standard Time', 'VST', 11, '(UTC+11:00) Vladivostok', 'Asia/Vladivostok', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(93, 'New Zealand Standard Time', 'NZST', 12, '(UTC+12:00) Auckland, Wellington', 'Antarctica/McMurdo', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(94, 'UTC+12', 'U', 12, '(UTC+12:00) Coordinated Universal Time+12', 'Pacific/Tarawa', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(95, 'Fiji Standard Time', 'FST', 12, '(UTC+12:00) Fiji', 'Pacific/Fiji', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(96, 'Magadan Standard Time', 'MST', 12, '(UTC+12:00) Magadan', 'Asia/Magadan', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51'),
(97, 'Samoa/Tonga/Kamchatka Standard Time', 'SST', 13, '(UTC+13:00) Samoa, Tongatapu, Fakaofo, Enderbury', 'Pacific/Apia', 0, '2024-03-05 06:32:51', '2024-03-05 06:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `name` varchar(255) DEFAULT NULL,
  `nice_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `last_visited_at` timestamp NULL DEFAULT NULL,
  `last_visited_from` varchar(45) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `read_announcements_at` timestamp NULL DEFAULT NULL,
  `verification_token` varchar(100) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `shop_id`, `role_id`, `name`, `nice_name`, `email`, `password`, `dob`, `sex`, `description`, `last_visited_at`, `last_visited_from`, `active`, `read_announcements_at`, `verification_token`, `api_token`, `fcm_token`, `email_verified_at`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Super Admin', 'SuperAdmin', 'superadmin@demo.com', '$2y$10$AtHVqs/ZivQ9FWmD7y6Z.epkZetjU2lLV92z7sQetWUeb646TgiHa', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-05 06:32:52', '2024-03-05 06:32:52'),
(2, 1, 3, NULL, NULL, 'merchant@demo.com', '$2y$10$GtWQmjnV4.0P.l8QaO/nR.6R03XYM24yyJ/1caXfaevW/mJXYX3jO', NULL, NULL, NULL, NULL, NULL, 1, NULL, '9UqJE4iYLa3j3Gg0ZNd3LPc3Ao4UJsYhE9Jbh1Gq', NULL, NULL, NULL, NULL, NULL, '2024-03-05 06:38:07', '2024-03-05 06:38:07'),
(3, 2, 3, NULL, NULL, 'merchant2@demo.com', '$2y$10$aZj.Fb6JGz42bUxB8nEd8e9.Qi.a20N5E/kmCmPOy9VpoxSfHnHnu', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'qUuBDwDp0Zps3vUJb5wNOGdzpzIjZD7avgFd4dsg', NULL, NULL, NULL, NULL, NULL, '2024-03-05 06:39:15', '2024-03-05 06:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_warehouse`
--

CREATE TABLE `user_warehouse` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `ip` varchar(45) NOT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `hits` mediumint(9) NOT NULL DEFAULT 0,
  `page_views` bigint(20) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `info` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`ip`, `mac`, `device`, `hits`, `page_views`, `country_code`, `info`, `deleted_at`, `created_at`, `updated_at`) VALUES
('127.0.0.1', NULL, NULL, 1, 2, NULL, NULL, NULL, '2024-03-05 06:33:09', '2024-03-05 06:33:55');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `incharge` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `opening_time` varchar(20) NOT NULL DEFAULT '0',
  `close_time` varchar(20) NOT NULL DEFAULT '0',
  `business_days` varchar(200) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_country_id_foreign` (`country_id`);

--
-- Indexes for table `address_types`
--
ALTER TABLE `address_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address_types_type_unique` (`type`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attributes_attribute_type_id_foreign` (`attribute_type_id`);

--
-- Indexes for table `attribute_categories`
--
ALTER TABLE `attribute_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_categories_attribute_id_foreign` (`attribute_id`),
  ADD KEY `attribute_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `attribute_inventory`
--
ALTER TABLE `attribute_inventory`
  ADD KEY `attribute_inventory_attribute_id_index` (`attribute_id`),
  ADD KEY `attribute_inventory_inventory_id_index` (`inventory_id`),
  ADD KEY `attribute_inventory_attribute_value_id_index` (`attribute_value_id`);

--
-- Indexes for table `attribute_types`
--
ALTER TABLE `attribute_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_types_type_unique` (`type`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `avg_feedback`
--
ALTER TABLE `avg_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_groups`
--
ALTER TABLE `banner_groups`
  ADD UNIQUE KEY `banner_groups_id_unique` (`id`),
  ADD UNIQUE KEY `banner_groups_name_unique` (`name`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_blog_id_foreign` (`blog_id`),
  ADD KEY `blog_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `cancellations`
--
ALTER TABLE `cancellations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancellations_order_id_foreign` (`order_id`),
  ADD KEY `cancellations_customer_id_foreign` (`customer_id`),
  ADD KEY `cancellations_cancellation_reason_id_foreign` (`cancellation_reason_id`);

--
-- Indexes for table `cancellation_reasons`
--
ALTER TABLE `cancellation_reasons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cancellation_reasons_detail_unique` (`detail`);

--
-- Indexes for table `carriers`
--
ALTER TABLE `carriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_shop_id_foreign` (`shop_id`),
  ADD KEY `carts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD KEY `cart_items_cart_id_index` (`cart_id`),
  ADD KEY `cart_items_inventory_id_index` (`inventory_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_category_sub_group_id_foreign` (`category_sub_group_id`);

--
-- Indexes for table `category_groups`
--
ALTER TABLE `category_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_groups_slug_unique` (`slug`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD KEY `category_product_category_id_index` (`category_id`),
  ADD KEY `category_product_product_id_index` (`product_id`);

--
-- Indexes for table `category_sub_groups`
--
ALTER TABLE `category_sub_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_sub_groups_slug_unique` (`slug`),
  ADD KEY `category_sub_groups_category_group_id_foreign` (`category_group_id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`shop_id`),
  ADD UNIQUE KEY `configs_shop_id_unique` (`shop_id`);

--
-- Indexes for table `config_cybersources`
--
ALTER TABLE `config_cybersources`
  ADD PRIMARY KEY (`shop_id`),
  ADD KEY `config_cybersources_shop_id_index` (`shop_id`);

--
-- Indexes for table `config_instamojo`
--
ALTER TABLE `config_instamojo`
  ADD PRIMARY KEY (`shop_id`),
  ADD KEY `config_instamojo_shop_id_index` (`shop_id`);

--
-- Indexes for table `config_manual_payments`
--
ALTER TABLE `config_manual_payments`
  ADD KEY `config_manual_payments_shop_id_index` (`shop_id`),
  ADD KEY `config_manual_payments_payment_method_id_index` (`payment_method_id`);

--
-- Indexes for table `config_paypals`
--
ALTER TABLE `config_paypals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `config_paypals_shop_id_index` (`shop_id`);

--
-- Indexes for table `config_paypal_express`
--
ALTER TABLE `config_paypal_express`
  ADD PRIMARY KEY (`shop_id`),
  ADD KEY `config_paypal_express_shop_id_index` (`shop_id`);

--
-- Indexes for table `config_stripes`
--
ALTER TABLE `config_stripes`
  ADD PRIMARY KEY (`shop_id`),
  ADD KEY `config_stripes_shop_id_index` (`shop_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_timezone_id_foreign` (`timezone_id`),
  ADD KEY `countries_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_customer`
--
ALTER TABLE `coupon_customer`
  ADD KEY `coupon_customer_coupon_id_index` (`coupon_id`),
  ADD KEY `coupon_customer_customer_id_index` (`customer_id`);

--
-- Indexes for table `coupon_shipping_zone`
--
ALTER TABLE `coupon_shipping_zone`
  ADD KEY `coupon_shipping_zone_coupon_id_index` (`coupon_id`),
  ADD KEY `coupon_shipping_zone_shipping_zone_id_index` (`shipping_zone_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_api_token_unique` (`api_token`);

--
-- Indexes for table `dashboard_configs`
--
ALTER TABLE `dashboard_configs`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_boys_email_unique` (`email`),
  ADD UNIQUE KEY `delivery_boys_api_token_unique` (`api_token`),
  ADD KEY `delivery_boys_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disputes_order_id_foreign` (`order_id`),
  ADD KEY `disputes_customer_id_foreign` (`customer_id`),
  ADD KEY `disputes_dispute_type_id_foreign` (`dispute_type_id`);

--
-- Indexes for table `dispute_types`
--
ALTER TABLE `dispute_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dispute_types_detail_unique` (`detail`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_topic_id_foreign` (`faq_topic_id`);

--
-- Indexes for table `faq_topics`
--
ALTER TABLE `faq_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedbacks_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gtin_types`
--
ALTER TABLE `gtin_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gtin_types_name_unique` (`name`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventories_slug_unique` (`slug`),
  ADD KEY `inventories_product_id_foreign` (`product_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_created_at_index` (`created_at`),
  ADD KEY `invoices_user_id_index` (`user_id`),
  ADD KEY `invoices_shop_id_index` (`shop_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `manufacturers_slug_unique` (`slug`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_items_order_id_index` (`order_id`),
  ADD KEY `order_items_inventory_id_index` (`inventory_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performance_indicators`
--
ALTER TABLE `performance_indicators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `performance_indicators_created_at_index` (`created_at`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`),
  ADD KEY `permissions_module_id_index` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refunds_order_id_foreign` (`order_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_rates`
--
ALTER TABLE `shipping_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_rates_shipping_zone_id_index` (`shipping_zone_id`);

--
-- Indexes for table `shipping_zones`
--
ALTER TABLE `shipping_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shops_slug_unique` (`slug`),
  ADD UNIQUE KEY `shops_email_unique` (`email`),
  ADD KEY `shops_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `shop_payment_methods`
--
ALTER TABLE `shop_payment_methods`
  ADD KEY `shop_payment_methods_payment_method_id_index` (`payment_method_id`),
  ADD KEY `shop_payment_methods_shop_id_index` (`shop_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_shop_id_stripe_status_index` (`shop_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`plan_id`),
  ADD UNIQUE KEY `subscription_plans_name_unique` (`name`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD KEY `taggables_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_category_id_foreign` (`category_id`);

--
-- Indexes for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_categories_name_unique` (`name`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_warehouse`
--
ALTER TABLE `user_warehouse`
  ADD KEY `user_warehouse_user_id_index` (`user_id`),
  ADD KEY `user_warehouse_warehouse_id_index` (`warehouse_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouses_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_inventory_id_foreign` (`inventory_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `address_types`
--
ALTER TABLE `address_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attribute_categories`
--
ALTER TABLE `attribute_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_types`
--
ALTER TABLE `attribute_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `avg_feedback`
--
ALTER TABLE `avg_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancellations`
--
ALTER TABLE `cancellations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancellation_reasons`
--
ALTER TABLE `cancellation_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_groups`
--
ALTER TABLE `category_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_sub_groups`
--
ALTER TABLE `category_sub_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_paypals`
--
ALTER TABLE `config_paypals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=895;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disputes`
--
ALTER TABLE `disputes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispute_types`
--
ALTER TABLE `dispute_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `faq_topics`
--
ALTER TABLE `faq_topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gtin_types`
--
ALTER TABLE `gtin_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `performance_indicators`
--
ALTER TABLE `performance_indicators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipping_rates`
--
ALTER TABLE `shipping_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_zones`
--
ALTER TABLE `shipping_zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1468;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `attributes_attribute_type_id_foreign` FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_types` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `attribute_categories`
--
ALTER TABLE `attribute_categories`
  ADD CONSTRAINT `attribute_categories_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_inventory`
--
ALTER TABLE `attribute_inventory`
  ADD CONSTRAINT `attribute_inventory_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_inventory_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_inventory_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cancellations`
--
ALTER TABLE `cancellations`
  ADD CONSTRAINT `cancellations_cancellation_reason_id_foreign` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cancellations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cancellations_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_category_sub_group_id_foreign` FOREIGN KEY (`category_sub_group_id`) REFERENCES `category_sub_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_sub_groups`
--
ALTER TABLE `category_sub_groups`
  ADD CONSTRAINT `category_sub_groups_category_group_id_foreign` FOREIGN KEY (`category_group_id`) REFERENCES `category_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `configs`
--
ALTER TABLE `configs`
  ADD CONSTRAINT `configs_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `config_cybersources`
--
ALTER TABLE `config_cybersources`
  ADD CONSTRAINT `config_cybersources_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `config_instamojo`
--
ALTER TABLE `config_instamojo`
  ADD CONSTRAINT `config_instamojo_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `config_manual_payments`
--
ALTER TABLE `config_manual_payments`
  ADD CONSTRAINT `config_manual_payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `config_manual_payments_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `config_paypals`
--
ALTER TABLE `config_paypals`
  ADD CONSTRAINT `config_paypals_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `config_paypal_express`
--
ALTER TABLE `config_paypal_express`
  ADD CONSTRAINT `config_paypal_express_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `config_stripes`
--
ALTER TABLE `config_stripes`
  ADD CONSTRAINT `config_stripes_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `countries_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `countries_timezone_id_foreign` FOREIGN KEY (`timezone_id`) REFERENCES `timezones` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `coupon_customer`
--
ALTER TABLE `coupon_customer`
  ADD CONSTRAINT `coupon_customer_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_customer_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_shipping_zone`
--
ALTER TABLE `coupon_shipping_zone`
  ADD CONSTRAINT `coupon_shipping_zone_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_shipping_zone_shipping_zone_id_foreign` FOREIGN KEY (`shipping_zone_id`) REFERENCES `shipping_zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD CONSTRAINT `delivery_boys_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disputes`
--
ALTER TABLE `disputes`
  ADD CONSTRAINT `disputes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disputes_dispute_type_id_foreign` FOREIGN KEY (`dispute_type_id`) REFERENCES `dispute_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disputes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_topic_id_foreign` FOREIGN KEY (`faq_topic_id`) REFERENCES `faq_topics` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `shipping_rates`
--
ALTER TABLE `shipping_rates`
  ADD CONSTRAINT `shipping_rates_shipping_zone_id_foreign` FOREIGN KEY (`shipping_zone_id`) REFERENCES `shipping_zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_payment_methods`
--
ALTER TABLE `shop_payment_methods`
  ADD CONSTRAINT `shop_payment_methods_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_payment_methods_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggables`
--
ALTER TABLE `taggables`
  ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `ticket_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_warehouse`
--
ALTER TABLE `user_warehouse`
  ADD CONSTRAINT `user_warehouse_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_warehouse_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
