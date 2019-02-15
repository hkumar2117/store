-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 18, 2018 at 07:50 AM
-- Server version: 5.5.61-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emeds`
--

CREATE TABLE `emeds_categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `id_path` varchar(255) NOT NULL DEFAULT '',
  `owner_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `usergroup_ids` varchar(255) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT 'A',
  `product_count` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `app_position` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `is_op` char(1) NOT NULL DEFAULT 'N',
  `localization` varchar(255) NOT NULL DEFAULT '',
  `age_verification` char(1) NOT NULL DEFAULT 'N',
  `age_limit` tinyint(4) NOT NULL DEFAULT '0',
  `parent_age_verification` char(1) NOT NULL DEFAULT 'N',
  `parent_age_limit` tinyint(4) NOT NULL DEFAULT '0',
  `selected_layouts` text NOT NULL,
  `default_layout` varchar(50) NOT NULL DEFAULT '',
  `product_details_layout` varchar(50) NOT NULL DEFAULT '',
  `product_columns` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `show_as_new` char(1) DEFAULT 'N',
  `min_deal_percent` tinyint(4) NOT NULL DEFAULT '0',
  `billing_category` int(11) DEFAULT NULL,
  `is_meta` char(1) NOT NULL DEFAULT 'N',
  `show_feature` char(1) NOT NULL DEFAULT 'N',
  `show_to_vendor` char(1) DEFAULT 'Y',
  `show_product_listing` char(1) DEFAULT 'Y',
  `show_image_on_catalog` char(1) NOT NULL DEFAULT 'N',
  `show_seasonal_image_path` varchar(2000) NOT NULL,
  `have_option` varchar(1) NOT NULL DEFAULT 'N',
  `occasion_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `weight_type` smallint(6) DEFAULT '3',
  `is_nrh` enum('Y','N') NOT NULL DEFAULT 'N',
  `handling_time` int(10) NOT NULL DEFAULT '0',
  `is_deal_category` char(1) NOT NULL DEFAULT 'N',
  `is_retail_wholesale` tinyint(1) DEFAULT '1' COMMENT '1=retail,0=wholesale',
  `banner_html` mediumtext,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mobile_special` char(1) NOT NULL DEFAULT 'N',
  `seo_path` varchar(1000) DEFAULT NULL,
  `handover_estimate_options` varchar(150) NOT NULL DEFAULT '1,2,3,4,5,6,7,8,9',
  `target_customer` varchar(1) DEFAULT NULL,
  `target_gender` varchar(1) DEFAULT NULL,
  `is_clone_allowed` char(1) NOT NULL DEFAULT 'Y',
  `status_path` varchar(255) DEFAULT NULL,
  `restricted_category` char(1) DEFAULT 'N',
  `is_standardized` char(1) NOT NULL DEFAULT 'N',
  `max_shipping_percentage` smallint(6) NOT NULL DEFAULT '25',
  `shipping_check_threshold` bigint(20) NOT NULL DEFAULT '60',
  `sizing_image` varchar(255) DEFAULT NULL,
  `minimum_outlet_discount` tinyint(4) NOT NULL DEFAULT '0',
  `google_taxonomy` varchar(255) NOT NULL,
  `trigger_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `primary_color` char(6) NOT NULL,
  `offers_color` char(6) NOT NULL,
  `offer_background` char(6) NOT NULL,
  `icon_css` varchar(255) NOT NULL,
  `icon_classname` varchar(50) NOT NULL,
  `include_in_search` tinyint(4) NOT NULL DEFAULT '0',
  `pla_margin` int(3) NOT NULL DEFAULT '0',
  `show_low_inventory_alert` char(1) NOT NULL DEFAULT 'N',
  `low_inventory_group` varchar(255) NOT NULL,
  `low_inventory_quantity` int(10) NOT NULL,
  `marketplace_category_visibility` varchar(10) DEFAULT 'NRH' COMMENT 'for visibilty of category in marketplaces values FO/WS/NRH',
  `created_from` varchar(255) DEFAULT NULL,
  `deal_handover_time` int(11) NOT NULL DEFAULT '172800',
  `max_shipping_value` mediumint(8) NOT NULL,
  `min_shipping_value` mediumint(8) NOT NULL,
  `OSLA_cancel_time` int(11) DEFAULT '172800',
  `show_similar` tinyint(1) DEFAULT '0',
  `otm_category_offset` int(2) DEFAULT '10',
  `parent_canonical` varchar(500) DEFAULT NULL,
  `category_handover_shipping_estimation` int(11) DEFAULT '11',
  `is_wired` char(1) DEFAULT 'N',
  `rma_multiplication_factor` decimal(10,2) DEFAULT '1.50',
  `rma_percentage_factor_x` decimal(10,2) DEFAULT '20.00',
  `rma_percentage_factor_y` decimal(10,2) DEFAULT '40.00',
  `is_rma_exempted` char(1) DEFAULT 'N',
  `rma_threshold` decimal(10,2) DEFAULT '0.00',
  `threshold_value` decimal(10,2) DEFAULT '0.00',
  `meta_category_id` bigint(20) DEFAULT NULL COMMENT 'meta_category_id',
  `is_ra_category` tinyint(1) DEFAULT '0',
  `imei_required` tinyint(4) DEFAULT '0',
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `emeds_products`
--

CREATE TABLE `emeds_products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_code` varchar(32) NOT NULL DEFAULT '',
  `product_type` char(1) NOT NULL DEFAULT 'P',
  `owner_id` bigint(20) DEFAULT NULL,
  `merchant_reference_number` varchar(255) NOT NULL,
  `manufacturer_reference_number` varchar(255) NOT NULL,
  `manufacturer_reference_type` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `store_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `list_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount` mediumint(8) NOT NULL DEFAULT '0',
  `weight` decimal(12,2) NOT NULL DEFAULT '0.00',
  `length` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `width` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `height` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `shipping_freight` decimal(12,2) NOT NULL DEFAULT '0.00',
  `low_avail_limit` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `edp_shipping` char(1) NOT NULL DEFAULT 'N',
  `unlimited_download` char(1) NOT NULL DEFAULT 'N',
  `tracking` char(1) NOT NULL DEFAULT 'B',
  `free_shipping` char(1) NOT NULL DEFAULT 'Y',
  `feature_comparison` char(1) NOT NULL DEFAULT 'N',
  `zero_price_action` char(1) NOT NULL DEFAULT 'R',
  `is_returnable` char(1) NOT NULL DEFAULT 'Y',
  `return_period` int(11) UNSIGNED NOT NULL DEFAULT '10',
  `avail_since` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `localization` varchar(255) NOT NULL DEFAULT '',
  `min_qty` smallint(5) NOT NULL DEFAULT '0',
  `max_qty` smallint(5) NOT NULL DEFAULT '0',
  `qty_step` smallint(5) NOT NULL DEFAULT '0',
  `list_qty_count` smallint(5) NOT NULL DEFAULT '0',
  `tax_ids` varchar(255) NOT NULL DEFAULT '',
  `age_verification` char(1) NOT NULL DEFAULT 'N',
  `age_limit` tinyint(4) NOT NULL DEFAULT '0',
  `options_type` char(1) NOT NULL DEFAULT 'P',
  `exceptions_type` char(1) NOT NULL DEFAULT 'F',
  `details_layout` varchar(50) NOT NULL DEFAULT '',
  `shipping_params` varchar(255) NOT NULL DEFAULT '',
  `out_of_stock_actions` char(1) NOT NULL DEFAULT 'N',
  `sdeep_rating_info` varchar(255) NOT NULL,
  `product_shipping_estimation` int(11) DEFAULT '11',
  `view_count` mediumint(8) NOT NULL DEFAULT '0',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` int(11) NOT NULL,
  `is_approved` varchar(1) NOT NULL DEFAULT 'N',
  `deals_index` int(10) DEFAULT '0',
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `special_offer_text` varchar(2000) DEFAULT NULL,
  `special_offer` varchar(2000) DEFAULT NULL,
  `short_text` varchar(255) DEFAULT NULL,
  `feature_index` int(11) DEFAULT '0',
  `is_cod` char(1) NOT NULL DEFAULT 'Y',
  `one_day_sale_start_datetime` timestamp NULL DEFAULT NULL,
  `one_day_sale_end_datetime` timestamp NULL DEFAULT NULL,
  `one_day_sale_short_text` varchar(2000) DEFAULT NULL,
  `promotion_id` bigint(20) UNSIGNED NOT NULL,
  `price_see_inside` tinyint(1) NOT NULL DEFAULT '0',
  `contest_icon_url` text NOT NULL,
  `contest_message` text NOT NULL,
  `special_offer_badge` tinyint(1) NOT NULL DEFAULT '0',
  `deal_inside_badge` tinyint(1) NOT NULL DEFAULT '0',
  `freebee_inside` tinyint(1) NOT NULL DEFAULT '0',
  `created_from` varchar(20) NOT NULL,
  `product_rating` decimal(3,2) DEFAULT NULL,
  `exempt_packingfee` varchar(10) NOT NULL DEFAULT 'N',
  `redhot` varchar(1) NOT NULL,
  `redhot_start_datetime` datetime NOT NULL,
  `redhot_end_datetime` datetime NOT NULL,
  `boost_index` bigint(20) NOT NULL DEFAULT '9999999999',
  `third_price` decimal(10,2) UNSIGNED NOT NULL,
  `is_shippable` char(1) NOT NULL DEFAULT 'Y',
  `freebie_promotion_id` mediumint(8) NOT NULL,
  `additional_offer` varchar(2000) DEFAULT NULL,
  `in_inventory` char(1) NOT NULL DEFAULT 'N',
  `override_shipping_estimation` tinyint(1) DEFAULT '0',
  `in_gmc` char(1) NOT NULL DEFAULT 'N',
  `adwords_labels` varchar(255) NOT NULL,
  `gmc_timestamp` int(11) NOT NULL,
  `is_wholesale_product` tinyint(1) NOT NULL DEFAULT '0',
  `override_min_qty` tinyint(1) NOT NULL DEFAULT '0',
  `wholesale_type` tinyint(1) NOT NULL DEFAULT '0',
  `is_factory_outlet_product` tinyint(4) NOT NULL DEFAULT '0',
  `outlet_brand_id` int(11) NOT NULL,
  `master_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `is_master` char(1) NOT NULL DEFAULT 'N',
  `show_size_chart` char(1) DEFAULT 'N',
  `why_buy_reason_1` varchar(255) NOT NULL,
  `why_buy_reason_2` varchar(255) NOT NULL,
  `mobile_boost_index` bigint(20) NOT NULL DEFAULT '9999999999',
  `trigger_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exclude_offer_section` tinyint(1) NOT NULL,
  `product_group` int(11) DEFAULT '0',
  `anniversary_tag` tinyint(1) NOT NULL DEFAULT '0',
  `marketplace_product_visibility` varchar(10) DEFAULT 'NRH' COMMENT 'for visibilty in marketplaces values FO/WS/NRH',
  `sub_state_id` int(11) DEFAULT NULL,
  `service_type` char(2) DEFAULT NULL,
  `prelaunch_flag` int(11) DEFAULT NULL,
  `prelaunch_cost` int(11) DEFAULT NULL,
  `default_quantity` mediumint(8) DEFAULT '0',
  `show_brand_image` smallint(10) NOT NULL DEFAULT '0',
  `exmept_from_cron` tinyint(1) NOT NULL,
  `popular_child_product_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `storefront_featured_product` tinyint(1) NOT NULL DEFAULT '0',
  `object_collate` int(11) DEFAULT '0' COMMENT 'To manage collation (<,>,=,etc) flags for various situations and in groups. Uses bitsync class.',
  `is_neighbourhood_cod` char(1) DEFAULT 'D',
  `neighbourhood_marketplace` tinyint(4) NOT NULL DEFAULT '1',
  `deal_handover_time` int(11) NOT NULL DEFAULT '172800',
  `is_dg` tinyint(4) NOT NULL DEFAULT '0',
  `vat_cst` decimal(10,2) DEFAULT NULL,
  `device_type_id` tinyint(1) DEFAULT NULL,
  `object_bundle` tinyint(4) DEFAULT '0' COMMENT 'Flag to tell if product is on bundle(1) or combo(2) or both(3). Uses bitmap class.',
  `dirty_bit` bigint(19) DEFAULT '0',
  `is_rma_exempted` char(1) NOT NULL DEFAULT 'N',
  `md5_content` varchar(255) DEFAULT NULL,
  `sponsored` enum('N','Y') NOT NULL DEFAULT 'N',
  `product_badge` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emeds_product_descriptions`
--

CREATE TABLE `emeds_product_descriptions` (
  `product_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lang_code` char(2) NOT NULL DEFAULT 'EN',
  `product` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `short_description` mediumtext NOT NULL,
  `full_description` mediumtext NOT NULL,
  `meta_keywords` varchar(255) NOT NULL DEFAULT '',
  `meta_description` varchar(255) NOT NULL DEFAULT '',
  `search_words` text NOT NULL,
  `page_title` varchar(255) NOT NULL DEFAULT '',
  `age_warning_message` text NOT NULL,
  `clean_short_description` mediumtext NOT NULL,
  `clean_full_description` mediumtext NOT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT '0',
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emeds_sessions`
--

CREATE TABLE `emeds_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

-- Table structure for table `pharmacy_users`
--

CREATE TABLE `pharmacy_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'P',
  `user_type` char(1) NOT NULL DEFAULT 'M',
  `user_login` varchar(255) NOT NULL DEFAULT '',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `fb_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_root` char(1) NOT NULL DEFAULT 'N',
  `store_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `last_login` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `card_name` varchar(255) NOT NULL DEFAULT '',
  `card_type` varchar(16) NOT NULL DEFAULT '',
  `card_number` varchar(42) NOT NULL DEFAULT '',
  `card_expire` varchar(4) NOT NULL DEFAULT '',
  `card_cvv2` char(3) NOT NULL DEFAULT '',
  `title` varchar(24) NOT NULL DEFAULT '',
  `firstname` varchar(128) NOT NULL DEFAULT '',
  `lastname` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `gender` char(1) NOT NULL,
  `location` varchar(100) NOT NULL,
  `phone` varchar(32) NOT NULL DEFAULT '',
  `p_verify` char(1) NOT NULL DEFAULT '0',
  `fax` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `tax_exempt` char(1) NOT NULL DEFAULT 'N',
  `lang_code` char(2) NOT NULL DEFAULT 'EN',
  `purchase_timestamp_from` int(11) NOT NULL DEFAULT '0',
  `purchase_timestamp_to` int(11) NOT NULL DEFAULT '0',
  `credit_value` decimal(12,2) NOT NULL DEFAULT '0.00',
  `responsible_email` varchar(80) NOT NULL DEFAULT '',
  `credit_used` decimal(12,2) NOT NULL DEFAULT '0.00',
  `last_passwords` varchar(255) NOT NULL DEFAULT '',
  `password_change_timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `janrain_identifier` varchar(32) NOT NULL DEFAULT '',
  `email_verification_code` varchar(255) DEFAULT NULL,
  `carrier_id` varchar(250) DEFAULT NULL,
  `pin` varchar(4) DEFAULT '0000',
  `total_orders` int(10) DEFAULT NULL,
  `orders_rejected` int(10) DEFAULT NULL,
  `user_auth_code` varchar(255) NOT NULL,
  `user_verification_code` varchar(255) DEFAULT NULL,
  `adult_acceptance` char(1) DEFAULT 'N',
  `app_agreement` varchar(1) DEFAULT NULL,
  `is_affiliate` varchar(1) NOT NULL DEFAULT 'N',
  `email_verify` bit(1) DEFAULT NULL,
  `manager_email` varchar(50) DEFAULT NULL,
  `opt_in` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Column for double opt-in flags'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacy_users`

-- --------------------------------------------------------

--
-- Table structure for table `pharma_orders`
--

CREATE TABLE `pharma_orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `is_parent_order` char(1) NOT NULL DEFAULT 'N',
  `parent_order_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `subtotal_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `payment_surcharge` decimal(12,2) NOT NULL DEFAULT '0.00',
  `shipping_ids` varchar(255) NOT NULL DEFAULT '',
  `shipping_cost` decimal(12,2) NOT NULL DEFAULT '0.00',
  `timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(4) NOT NULL DEFAULT 'O',
  `notes` text NOT NULL,
  `details` text NOT NULL,
  `promotions` text NOT NULL,
  `promotion_ids` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `store_name` varchar(255) NOT NULL DEFAULT '',
  `b_title` varchar(32) NOT NULL DEFAULT '',
  `b_firstname` varchar(128) NOT NULL DEFAULT '',
  `b_lastname` varchar(128) NOT NULL DEFAULT '',
  `b_address` varchar(255) NOT NULL DEFAULT '',
  `b_address_2` varchar(255) NOT NULL DEFAULT '',
  `b_city` varchar(64) NOT NULL DEFAULT '',
  `b_county` varchar(32) NOT NULL DEFAULT '',
  `b_state` varchar(32) NOT NULL DEFAULT '',
  `b_country` char(2) NOT NULL DEFAULT '',
  `b_zipcode` varchar(32) NOT NULL DEFAULT '',
  `b_phone` varchar(32) NOT NULL DEFAULT '',
  `s_title` varchar(32) NOT NULL DEFAULT '',
  `s_firstname` varchar(128) NOT NULL DEFAULT '',
  `s_lastname` varchar(128) NOT NULL DEFAULT '',
  `s_address` varchar(255) NOT NULL DEFAULT '',
  `s_address_2` varchar(255) NOT NULL DEFAULT '',
  `s_city` varchar(64) NOT NULL DEFAULT '',
  `s_county` varchar(32) NOT NULL DEFAULT '',
  `s_state` varchar(32) NOT NULL DEFAULT '',
  `s_country` char(2) NOT NULL DEFAULT '',
  `s_zipcode` varchar(32) NOT NULL DEFAULT '',
  `s_phone` varchar(32) NOT NULL DEFAULT '',
  `phone` varchar(32) NOT NULL DEFAULT '',
  `fax` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `payment_id` mediumint(8) NOT NULL,
  `tax_exempt` char(1) NOT NULL DEFAULT 'N',
  `lang_code` char(2) NOT NULL DEFAULT 'EN',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `repaid` int(11) NOT NULL DEFAULT '0',
  `validation_code` varchar(20) NOT NULL DEFAULT '',
  `localization_id` mediumint(8) NOT NULL,
  `rating_info` text NOT NULL,
  `is_verified` char(1) DEFAULT 'n',
  `label_printed` char(1) DEFAULT 'n',
  `coupon_codes` varchar(255) DEFAULT NULL,
  `payment_option_id` int(11) DEFAULT NULL,
  `billing_done` char(1) DEFAULT 'N',
  `emi_id` int(11) NOT NULL DEFAULT '0',
  `emi_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `billing_advance_done` char(1) DEFAULT 'N',
  `reverse_billing_done` char(1) DEFAULT 'N',
  `reverse_advance_done` char(1) DEFAULT 'N',
  `gift_it` char(1) DEFAULT 'N',
  `gifting_charge` decimal(12,2) DEFAULT '0.00',
  `emedswallet_used` decimal(12,2) DEFAULT '0.00',
  `cod_fee` decimal(12,2) DEFAULT '0.00',
  `cod_eligible` tinyint(4) DEFAULT '0',
  `dss_carrier_id` mediumint(8) NOT NULL DEFAULT '0',
  `dss_cost` float(10,2) NOT NULL DEFAULT '0.00',
  `exempt_from_billing` tinyint(1) DEFAULT '0',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `credit_used` decimal(12,2) DEFAULT NULL,
  `payment_reference_id` varchar(100) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pharma_order_details`
--

CREATE TABLE `pharma_order_details` (
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `product_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `product_name` varchar(255) DEFAULT NULL,
  `product_options` varchar(255) DEFAULT NULL,
  `product_code` varchar(32) NOT NULL DEFAULT '',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `extra` text NOT NULL,
  `selling_price` decimal(12,2) DEFAULT '0.00',
  `exempt_packingfee` varchar(10) NOT NULL DEFAULT 'N',
  `priority_level_id` int(8) DEFAULT '1',
  `m_discount` decimal(12,2) DEFAULT NULL,
  `m_promotion_ids` varchar(255) DEFAULT NULL,
  `is_freebie` char(1) NOT NULL DEFAULT 'N',
  `shipping_cost` decimal(12,2) DEFAULT NULL,
  `list_price` decimal(12,2) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_type` char(2) DEFAULT NULL,
  `delivery_type` int(11) DEFAULT NULL,
  `service_type` int(11) DEFAULT NULL,
  `sc_discount` decimal(12,2) DEFAULT NULL,
  `mrp` decimal(12,2) DEFAULT NULL,
  `warranty_type` varchar(100) DEFAULT NULL,
  `prescription_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pharma_store`
--

CREATE TABLE `pharma_store` (
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'P',
  `store_name` varchar(255) NOT NULL,
  `lang_code` char(2) NOT NULL DEFAULT 'EN',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `key_email` varchar(40) NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `url` varchar(128) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `logos` text NOT NULL,
  `commission` decimal(12,2) NOT NULL DEFAULT '0.00',
  `commission_type` char(1) NOT NULL DEFAULT 'A',
  `request_user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `request_account_name` varchar(255) NOT NULL DEFAULT '',
  `request_account_data` text NOT NULL,
  `sdeep_rating` decimal(12,2) NOT NULL,
  `icon_url` varchar(255) NOT NULL,
  `terms` text NOT NULL,
  `sdeep_features` varchar(255) NOT NULL,
  `is_trm` char(1) NOT NULL DEFAULT 'N',
  `show_as_new` char(1) DEFAULT 'N',
  `fulfillment_id` bigint(20) NOT NULL,
  `business_type` text,
  `sell_online` tinyint(1) DEFAULT '0',
  `user_accepted_name` varchar(255) DEFAULT NULL,
  `user_accepted_date` varchar(40) DEFAULT NULL,
  `request_approval_date` int(11) DEFAULT NULL,
  `approved_timestamp` int(11) DEFAULT NULL,
  `is_cod` int(10) DEFAULT '1',
  `shipping_time` int(10) NOT NULL,
  `free_shipping` varchar(1) NOT NULL,
  `legal_name` varchar(255) DEFAULT NULL,
  `referer` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dispatch_otp_required` int(1) NOT NULL DEFAULT '0',
  `is_clone_allowed` char(1) NOT NULL DEFAULT 'Y',
  `response_time` smallint(4) DEFAULT '1',
  `response_percentage` decimal(5,2) DEFAULT '1.00',
  `exempt_billing` varchar(1) DEFAULT 'N',
  `store_type` varchar(1) NOT NULL DEFAULT 'E',
  `chat_status` tinyint(1) NOT NULL DEFAULT '0',
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `geolocation_flag` tinyint(2) NOT NULL DEFAULT '0',
  `zone_type` int(11) DEFAULT '0',
  `neighbourhood_marketplace` int(10) DEFAULT '2',
  `is_mobile_verified` tinyint(1) DEFAULT '0',
  `is_email_verified` tinyint(1) DEFAULT '0',
  `phone_verified_time` timestamp NULL DEFAULT NULL,
  `email_verified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharma_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `prescription` varchar(255) DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `user_id`, `prescription`, `time`) VALUES
(1, 1, 'assets/images/coming_soon.jpg', '00:00:00');

-- --------------------------------------------------------

--


-- --------------------------------------------------------

--
-- Table structure for table `store_bank_details`
--

CREATE TABLE `store_bank_details` (
  `id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `branch_address` varchar(255) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `account_type` varchar(10) NOT NULL,
  `ifsc_code` varchar(15) NOT NULL,
  `vat_cst_number` varchar(40) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `annual_turnover` varchar(50) DEFAULT NULL,
  `PAN` varchar(255) NOT NULL,
  `name_on_pan` varchar(255) NOT NULL,
  `pan_doc` varchar(255) DEFAULT NULL,
  `aadhar_certificate` varchar(255) DEFAULT NULL,
  `dob_on_pan` date NOT NULL,
  `tin` varchar(30) DEFAULT NULL,
  `tin_available` varchar(255) NOT NULL,
  `tin_number` varchar(255) NOT NULL,
  `declration_format` varchar(255) NOT NULL,
  `paypal_id` varchar(200) DEFAULT NULL,
  `company_address_proof` varchar(255) NOT NULL,
  `registration_certificate` varchar(255) NOT NULL,
  `partner_detail` varchar(255) NOT NULL,
  `pan_application` varchar(255) NOT NULL,
  `address_proof` varchar(255) NOT NULL,
  `declaration_letter` varchar(255) NOT NULL,
  `cancelled_cheque` varchar(255) NOT NULL,
  `declaring_brand` varchar(255) NOT NULL,
  `brand_document` varchar(255) NOT NULL,
  `others_declaration` varchar(255) NOT NULL,
  `check_document` int(50) NOT NULL DEFAULT '0',
  `nodal_noc_accepted` tinyint(1) DEFAULT '0',
  `nodal_noc_accepted_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `business_entity_type` int(11) NOT NULL,
  `is_pan_verified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_bank_details`
--

INSERT INTO `store_bank_details` (`id`, `store_id`, `account_name`, `bank_name`, `branch_address`, `city`, `state`, `zipcode`, `account_number`, `account_type`, `ifsc_code`, `vat_cst_number`, `creation_date`, `last_updated_date`, `annual_turnover`, `PAN`, `name_on_pan`, `pan_doc`, `aadhar_certificate`, `dob_on_pan`, `tin`, `tin_available`, `tin_number`, `declration_format`, `paypal_id`, `company_address_proof`, `registration_certificate`, `partner_detail`, `pan_application`, `address_proof`, `declaration_letter`, `cancelled_cheque`, `declaring_brand`, `brand_document`, `others_declaration`, `check_document`, `nodal_noc_accepted`, `nodal_noc_accepted_time`, `business_entity_type`, `is_pan_verified`) VALUES
(1, 1, '', '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00', '2018-10-14 09:56:06', NULL, '', '', NULL, NULL, '0000-00-00', NULL, '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `store_warehouse_location`
--

CREATE TABLE `store_warehouse_location` (
  `id` bigint(20) NOT NULL,
  `center_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `warehouse_address1` varchar(200) DEFAULT NULL,
  `warehouse_address2` varchar(200) NOT NULL,
  `warehouse_city` varchar(100) NOT NULL,
  `warehouse_state` varchar(100) NOT NULL,
  `warehouse_pin` mediumint(8) NOT NULL,
  `warehouse_pcontact_name` varchar(100) NOT NULL,
  `warehouse_pcontact_phone` varchar(100) NOT NULL,
  `warehouse_pcontact_email` varchar(100) NOT NULL,
  `warehouse_scontact_name` varchar(100) NOT NULL,
  `warehouse_scontact_phone` varchar(100) NOT NULL,
  `warehouse_scontact_email` varchar(100) NOT NULL,
  `region_code` mediumint(8) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `from_time` time NOT NULL DEFAULT '10:00:00',
  `to_time` time NOT NULL DEFAULT '19:00:00',
  `gstin` varchar(20) DEFAULT NULL,
  `gstin_cert` varchar(255) DEFAULT NULL,
  `is_tnc_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `is_tnc_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_warehouse_location`
--



-- Indexes for table `emeds_products`
--
ALTER TABLE `emeds_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `emeds_product_descriptions`
--
ALTER TABLE `emeds_product_descriptions`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `emeds_sessions`
--
ALTER TABLE `emeds_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-
--
-- Indexes for table `pharmacy_users`
--
ALTER TABLE `pharmacy_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `idx_user_verification_code` (`user_verification_code`),
  ADD UNIQUE KEY `fb_id` (`fb_id`),
  ADD KEY `user_login` (`user_login`),
  ADD KEY `uname` (`title`,`firstname`,`lastname`),
  ADD KEY `users_email` (`email`),
  ADD KEY `store_idx` (`store_id`),
  ADD KEY `idx_unity` (`user_id`,`user_type`),
  ADD KEY `phone` (`phone`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_timestamp` (`timestamp`),
  ADD KEY `timestamp_index` (`timestamp`);

--
-- Indexes for table `pharma_orders`
--
ALTER TABLE `pharma_orders`
  ADD PRIMARY KEY (`order_id`,`status`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `promotion_ids` (`promotion_ids`),
  ADD KEY `shipping_ids` (`shipping_ids`),
  ADD KEY `email` (`email`),
  ADD KEY `parent_order_id` (`parent_order_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `b_zipcode` (`b_zipcode`),
  ADD KEY `is_parent_order_idx` (`is_parent_order`),
  ADD KEY `par_stat_idx` (`parent_order_id`,`status`),
  ADD KEY `pay_sta_tim_Ord_idx` (`payment_id`,`status`,`timestamp`,`order_id`),
  ADD KEY `status` (`status`),
  ADD KEY `payment_option_idx` (`payment_option_id`),
  ADD KEY `idx_tatis` (`status`,`timestamp`,`is_parent_order`),
  ADD KEY `idx_ostacom` (`store_id`,`status`,`order_id`),
  ADD KEY `idx_statm` (`status`,`timestamp`),
  ADD KEY `idx_phone` (`phone`),
  ADD KEY `idx_tim_stat` (`timestamp`,`status`),
  ADD KEY `b_phone` (`b_phone`),
  ADD KEY `s_phone` (`s_phone`);

--
-- Indexes for table `pharma_order_details`
--
ALTER TABLE `pharma_order_details`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `o_k` (`order_id`,`product_id`),
  ADD KEY `exempt_packingfee_idx` (`exempt_packingfee`),
  ADD KEY `idx_pro_ord` (`product_id`,`order_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `idx_last_update` (`last_update`);

--
-- Indexes for table `pharma_store`
--
ALTER TABLE `pharma_store`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `zipcode_idx` (`zipcode`),
  ADD KEY `email_idx` (`email`),
  ADD KEY `phone_idx` (`phone`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`);

--

-- Indexes for table `store_bank_details`
--
ALTER TABLE `store_bank_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `store_id` (`store_id`);

--
-- Indexes for table `store_warehouse_location`
--
ALTER TABLE `store_warehouse_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_idx` (`store_id`),
  ADD KEY `warehouse_pin_idx` (`warehouse_pin`),
  ADD KEY `idx_clues_ware` (`center_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_category`
--

ALTER TABLE `pharma_store`
  MODIFY `store_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALter table pharma_orders Add prescription_id int default 0 after order_id; 

--
#Execute till here 
--

