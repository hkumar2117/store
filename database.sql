-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: emeds_db
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_category`
--

DROP TABLE IF EXISTS `api_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `parent_tree` varchar(30) NOT NULL DEFAULT '>0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_configs`
--

DROP TABLE IF EXISTS `api_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(100) NOT NULL,
  `config_value` text NOT NULL,
  `config_description` text NOT NULL,
  `group_type` text NOT NULL,
  `status` varchar(9) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_multi_value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_key` (`config_key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_custom_rules`
--

DROP TABLE IF EXISTS `api_custom_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_custom_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `rule_type` varchar(250) NOT NULL,
  `rule_params` text NOT NULL,
  `rule_description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`,`rule_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_field_visibility`
--

DROP TABLE IF EXISTS `api_field_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_field_visibility` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL,
  `api_id` bigint(20) NOT NULL,
  `method` varchar(6) DEFAULT NULL,
  `field` text,
  `visibility` varchar(20) NOT NULL,
  `scope` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_manage_notifications`
--

DROP TABLE IF EXISTS `api_manage_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_manage_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `hook_id` int(11) NOT NULL,
  `notification_type` char(1) NOT NULL,
  `notification_source` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`,`notification_type`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_metering`
--

DROP TABLE IF EXISTS `api_metering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_metering` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_id` bigint(20) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `max_usage` int(10) NOT NULL,
  `throttle_type` varchar(255) NOT NULL,
  `counter` bigint(20) NOT NULL,
  `first_api_hit` int(11) NOT NULL,
  `last_api_hit` int(11) NOT NULL,
  `app_id` bigint(20) NOT NULL,
  `is_enable_subscription` enum('N','Y') NOT NULL,
  `api_weightage` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`),
  KEY `api_id` (`api_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_metering_history`
--

DROP TABLE IF EXISTS `api_metering_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_metering_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_id` bigint(20) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `hit_count` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `app_id` bigint(20) NOT NULL,
  `subscribe_hit_counts` bigint(20) NOT NULL,
  `subscribe_hit_count` int(11) NOT NULL,
  `consumed_credit_points` int(11) NOT NULL,
  `api_weightage` double NOT NULL DEFAULT '1',
  `success_hits` int(11) DEFAULT '0',
  `fail_hits` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id_2` (`app_id`,`api_id`,`client_id`,`date`,`api_weightage`),
  KEY `idx_api_id` (`api_id`),
  KEY `idx_client_id` (`client_id`),
  KEY `idx_date` (`date`),
  KEY `app_id` (`app_id`),
  KEY `api_id` (`api_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_metering_limit`
--

DROP TABLE IF EXISTS `api_metering_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_metering_limit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_id` bigint(20) NOT NULL,
  `app_id` bigint(20) NOT NULL,
  `max_usage` int(10) NOT NULL,
  `throttle_type` varchar(255) NOT NULL,
  `is_enable_subscription` enum('N','Y') NOT NULL,
  `api_weightage` double NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_id` (`api_id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_notification_hooks`
--

DROP TABLE IF EXISTS `api_notification_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_notification_hooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hook_name` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_registry`
--

DROP TABLE IF EXISTS `api_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `resource_url` varchar(255) DEFAULT NULL,
  `description` text,
  `status` enum('A','D') DEFAULT NULL,
  `approved_by` varchar(255) DEFAULT NULL,
  `developed_by` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `writable` enum('0','1') NOT NULL DEFAULT '0',
  `createdon` date NOT NULL,
  `doc_url` varchar(150) NOT NULL,
  `conditionable_fields` text NOT NULL,
  `api_server` varchar(255) NOT NULL,
  `sample_request` text NOT NULL,
  `sample_response` text NOT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `api_weightage` double NOT NULL,
  `type` char(1) NOT NULL,
  `domain_name` varchar(255) DEFAULT NULL,
  `domain_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_idx` (`resource`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_rule`
--

DROP TABLE IF EXISTS `api_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL,
  `api_id` bigint(20) NOT NULL,
  `api_query` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_keys`
--

DROP TABLE IF EXISTS `app_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL,
  `client_id` varchar(41) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`),
  KEY `app_key_client` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emeds_categories`
--

DROP TABLE IF EXISTS `emeds_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emeds_categories` (
  `category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_path` varchar(255) NOT NULL DEFAULT '',
  `owner_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `usergroup_ids` varchar(255) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT 'A',
  `product_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0',
  `app_position` smallint(5) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `is_op` char(1) NOT NULL DEFAULT 'N',
  `localization` varchar(255) NOT NULL DEFAULT '',
  `age_verification` char(1) NOT NULL DEFAULT 'N',
  `age_limit` tinyint(4) NOT NULL DEFAULT '0',
  `parent_age_verification` char(1) NOT NULL DEFAULT 'N',
  `parent_age_limit` tinyint(4) NOT NULL DEFAULT '0',
  `selected_layouts` text NOT NULL,
  `default_layout` varchar(50) NOT NULL DEFAULT '',
  `product_details_layout` varchar(50) NOT NULL DEFAULT '',
  `product_columns` tinyint(3) unsigned NOT NULL DEFAULT '0',
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
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`category_id`),
  KEY `c_status` (`usergroup_ids`,`status`,`parent_id`),
  KEY `position` (`position`),
  KEY `parent` (`parent_id`),
  KEY `localization` (`localization`),
  KEY `age_verification` (`age_verification`,`age_limit`),
  KEY `parent_age_verification` (`parent_age_verification`,`parent_age_limit`),
  KEY `p_category_id` (`category_id`,`usergroup_ids`,`status`),
  KEY `status` (`status`),
  KEY `billing` (`billing_category`),
  KEY `idx_csc_cat_idpa_st` (`id_path`,`status`),
  KEY `idx_meta_cat_id` (`meta_category_id`),
  KEY `idx_ra_category` (`is_ra_category`),
  KEY `idx_update_on` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emeds_custom_type_object_data_history`
--

DROP TABLE IF EXISTS `emeds_custom_type_object_data_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emeds_custom_type_object_data_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL,
  `new_data` varchar(255) DEFAULT NULL,
  `old_data` varchar(255) NOT NULL,
  `updated_by` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emeds_sessions`
--

DROP TABLE IF EXISTS `emeds_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emeds_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emeds_soa_subscription_manager`
--

DROP TABLE IF EXISTS `emeds_soa_subscription_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emeds_soa_subscription_manager` (
  `subscribe_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `total_amount` double NOT NULL,
  `subscribe_months` int(11) NOT NULL,
  `subscribe_date` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `app_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `credit_points` double NOT NULL,
  `status` enum('A','I','C') NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`subscribe_id`),
  KEY `plan_id` (`plan_id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emeds_soa_subscription_plans`
--

DROP TABLE IF EXISTS `emeds_soa_subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emeds_soa_subscription_plans` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) NOT NULL,
  `plan_descriptions` text NOT NULL,
  `daily_usage` bigint(20) DEFAULT NULL,
  `monthly_usage` bigint(20) DEFAULT NULL,
  `monthly_price` double DEFAULT NULL,
  `plan_type` enum('P','S') NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `status` enum('A','D') NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emeds_subscription_types`
--

DROP TABLE IF EXISTS `emeds_subscription_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emeds_subscription_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(10) DEFAULT NULL,
  `validity` varchar(10) NOT NULL,
  `usage_limit` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emeds_usergroup_links`
--

DROP TABLE IF EXISTS `emeds_usergroup_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emeds_usergroup_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `usergroup_id` mediumint(8) unsigned NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'D',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `user_id` (`user_id`,`usergroup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emeds_usergroup_privileges`
--

DROP TABLE IF EXISTS `emeds_usergroup_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emeds_usergroup_privileges` (
  `usergroup_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `privilege` varchar(32) NOT NULL DEFAULT '',
  `privileges_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`usergroup_id`,`privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_scopes`
--

DROP TABLE IF EXISTS `oauth_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL,
  KEY `idx_is_default` (`is_default`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharma_store`
--

DROP TABLE IF EXISTS `pharma_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharma_store` (
  `store_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `request_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
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
  `email_verified_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  KEY `zipcode_idx` (`zipcode`),
  KEY `email_idx` (`email`),
  KEY `phone_idx` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_users`
--

DROP TABLE IF EXISTS `pharmacy_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` char(1) NOT NULL DEFAULT 'P',
  `user_type` char(1) NOT NULL DEFAULT 'M',
  `user_login` varchar(255) NOT NULL DEFAULT '',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `fb_id` bigint(20) unsigned DEFAULT NULL,
  `is_root` char(1) NOT NULL DEFAULT 'N',
  `store_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(11) unsigned NOT NULL DEFAULT '0',
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
  `password_change_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
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
  `opt_in` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Column for double opt-in flags',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idx_user_verification_code` (`user_verification_code`),
  UNIQUE KEY `fb_id` (`fb_id`),
  KEY `user_login` (`user_login`),
  KEY `uname` (`title`,`firstname`,`lastname`),
  KEY `users_email` (`email`),
  KEY `store_idx` (`store_id`),
  KEY `idx_unity` (`user_id`,`user_type`),
  KEY `phone` (`phone`),
  KEY `idx_status` (`status`),
  KEY `idx_timestamp` (`timestamp`),
  KEY `timestamp_index` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=10000000653 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soa_app`
--

DROP TABLE IF EXISTS `soa_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soa_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `creationdate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `platform` varchar(10) NOT NULL,
  `returnurl` varchar(255) NOT NULL,
  `tech_email` varchar(100) DEFAULT NULL,
  `tech_phone` varchar(50) DEFAULT NULL,
  `tech_contact_person` varchar(100) NOT NULL,
  `tech_mobile` varchar(50) DEFAULT NULL,
  `business_email` varchar(100) DEFAULT NULL,
  `business_phone` varchar(50) DEFAULT NULL,
  `business_contact_person` varchar(100) NOT NULL,
  `business_mobile` varchar(50) DEFAULT NULL,
  `sc_email` varchar(100) DEFAULT NULL,
  `sc_phone` varchar(50) DEFAULT NULL,
  `sc_contact_person` varchar(100) NOT NULL,
  `sc_mobile` varchar(50) DEFAULT NULL,
  `sc_admin_person` varchar(100) DEFAULT NULL,
  `sc_admin_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fkapp_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_bank_details`
--

DROP TABLE IF EXISTS `store_bank_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_bank_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `is_pan_verified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_warehouse_location`
--

DROP TABLE IF EXISTS `store_warehouse_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_warehouse_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `is_tnc_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_idx` (`store_id`),
  KEY `warehouse_pin_idx` (`warehouse_pin`),
  KEY `idx_clues_ware` (`center_id`)
) ENGINE=InnoDB AUTO_INCREMENT=556580 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-20 16:26:48
