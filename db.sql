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
-- Table structure for table `iztiw_ak_profiles`
--

DROP TABLE IF EXISTS `iztiw_ak_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_ak_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `configuration` longtext,
  `filters` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_ak_stats`
--

DROP TABLE IF EXISTS `iztiw_ak_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_ak_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `comment` longtext,
  `backupstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') NOT NULL DEFAULT 'run',
  `origin` varchar(30) NOT NULL DEFAULT 'backend',
  `type` varchar(30) NOT NULL DEFAULT 'full',
  `profile_id` bigint(20) NOT NULL DEFAULT '1',
  `archivename` longtext,
  `absolute_path` longtext,
  `multipart` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(255) DEFAULT NULL,
  `backupid` varchar(255) DEFAULT NULL,
  `filesexist` tinyint(3) NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) DEFAULT NULL,
  `total_size` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fullstatus` (`filesexist`,`status`),
  KEY `idx_stale` (`status`,`origin`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_ak_storage`
--

DROP TABLE IF EXISTS `iztiw_ak_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_ak_storage` (
  `tag` varchar(255) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_akeeba_common`
--

DROP TABLE IF EXISTS `iztiw_akeeba_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_akeeba_common` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_assets`
--

DROP TABLE IF EXISTS `iztiw_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_associations`
--

DROP TABLE IF EXISTS `iztiw_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_banner_clients`
--

DROP TABLE IF EXISTS `iztiw_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_banner_tracks`
--

DROP TABLE IF EXISTS `iztiw_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_banners`
--

DROP TABLE IF EXISTS `iztiw_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_categories`
--

DROP TABLE IF EXISTS `iztiw_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_class365_codes`
--

DROP TABLE IF EXISTS `iztiw_class365_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_class365_codes` (
  `product_id` int(11) NOT NULL,
  `external_code` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_class365_settings`
--

DROP TABLE IF EXISTS `iztiw_class365_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_class365_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_contact_details`
--

DROP TABLE IF EXISTS `iztiw_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_content`
--

DROP TABLE IF EXISTS `iztiw_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_content_frontpage`
--

DROP TABLE IF EXISTS `iztiw_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_content_rating`
--

DROP TABLE IF EXISTS `iztiw_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_core_log_searches`
--

DROP TABLE IF EXISTS `iztiw_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_extensions`
--

DROP TABLE IF EXISTS `iztiw_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_filters`
--

DROP TABLE IF EXISTS `iztiw_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links`
--

DROP TABLE IF EXISTS `iztiw_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms0`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms1`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms2`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms3`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms4`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms5`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms6`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms7`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms8`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_terms9`
--

DROP TABLE IF EXISTS `iztiw_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_termsa`
--

DROP TABLE IF EXISTS `iztiw_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_termsb`
--

DROP TABLE IF EXISTS `iztiw_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_termsc`
--

DROP TABLE IF EXISTS `iztiw_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_termsd`
--

DROP TABLE IF EXISTS `iztiw_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_termse`
--

DROP TABLE IF EXISTS `iztiw_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_links_termsf`
--

DROP TABLE IF EXISTS `iztiw_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_taxonomy`
--

DROP TABLE IF EXISTS `iztiw_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `iztiw_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_terms`
--

DROP TABLE IF EXISTS `iztiw_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB AUTO_INCREMENT=14095 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_terms_common`
--

DROP TABLE IF EXISTS `iztiw_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_tokens`
--

DROP TABLE IF EXISTS `iztiw_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `iztiw_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_finder_types`
--

DROP TABLE IF EXISTS `iztiw_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments`
--

DROP TABLE IF EXISTS `iztiw_jcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_id` int(11) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `object_group` varchar(255) NOT NULL DEFAULT '',
  `object_params` text NOT NULL,
  `lang` varchar(255) NOT NULL DEFAULT '',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `homepage` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isgood` smallint(5) NOT NULL DEFAULT '0',
  `ispoor` smallint(5) NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `source` varchar(255) NOT NULL DEFAULT '',
  `source_id` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_userid` (`userid`),
  KEY `idx_source` (`source`),
  KEY `idx_email` (`email`),
  KEY `idx_lang` (`lang`),
  KEY `idx_subscribe` (`subscribe`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_object` (`object_id`,`object_group`,`published`,`date`),
  KEY `idx_path` (`path`,`level`),
  KEY `idx_thread` (`thread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_blacklist`
--

DROP TABLE IF EXISTS `iztiw_jcomments_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_blacklist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reason` tinytext NOT NULL,
  `notes` tinytext NOT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_custom_bbcodes`
--

DROP TABLE IF EXISTS `iztiw_jcomments_custom_bbcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_custom_bbcodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `simple_pattern` varchar(255) NOT NULL DEFAULT '',
  `simple_replacement_html` text NOT NULL,
  `simple_replacement_text` text NOT NULL,
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `replacement_html` text NOT NULL,
  `replacement_text` text NOT NULL,
  `button_acl` text NOT NULL,
  `button_open_tag` varchar(16) NOT NULL DEFAULT '',
  `button_close_tag` varchar(16) NOT NULL DEFAULT '',
  `button_title` varchar(255) NOT NULL DEFAULT '',
  `button_prompt` varchar(255) NOT NULL DEFAULT '',
  `button_image` varchar(255) NOT NULL DEFAULT '',
  `button_css` varchar(255) NOT NULL DEFAULT '',
  `button_enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_mailq`
--

DROP TABLE IF EXISTS `iztiw_jcomments_mailq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_mailq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `created` datetime NOT NULL,
  `attempts` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) NOT NULL DEFAULT '0',
  `session_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_priority` (`priority`),
  KEY `idx_attempts` (`attempts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_objects`
--

DROP TABLE IF EXISTS `iztiw_jcomments_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_objects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `object_group` varchar(255) NOT NULL DEFAULT '',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `expired` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_object` (`object_id`,`object_group`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=1953 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_reports`
--

DROP TABLE IF EXISTS `iztiw_jcomments_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commentid` int(11) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reason` tinytext NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_settings`
--

DROP TABLE IF EXISTS `iztiw_jcomments_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_settings` (
  `component` varchar(50) NOT NULL DEFAULT '',
  `lang` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`component`,`lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_smilies`
--

DROP TABLE IF EXISTS `iztiw_jcomments_smilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_smilies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(39) NOT NULL DEFAULT '',
  `alias` varchar(39) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_subscriptions`
--

DROP TABLE IF EXISTS `iztiw_jcomments_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_subscriptions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `object_group` varchar(255) NOT NULL DEFAULT '',
  `lang` varchar(255) NOT NULL DEFAULT '',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `hash` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `source` varchar(255) NOT NULL DEFAULT '',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_object` (`object_id`,`object_group`),
  KEY `idx_lang` (`lang`),
  KEY `idx_source` (`source`),
  KEY `idx_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_version`
--

DROP TABLE IF EXISTS `iztiw_jcomments_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_version` (
  `version` varchar(16) NOT NULL DEFAULT '',
  `previous` varchar(16) NOT NULL DEFAULT '',
  `installed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jcomments_votes`
--

DROP TABLE IF EXISTS `iztiw_jcomments_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jcomments_votes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commentid` int(11) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_comment` (`commentid`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jhackguard_bot_scout`
--

DROP TABLE IF EXISTS `iztiw_jhackguard_bot_scout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jhackguard_bot_scout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip_address` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `expires` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jhackguard_input_filters`
--

DROP TABLE IF EXISTS `iztiw_jhackguard_input_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jhackguard_input_filters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `rule_action` text NOT NULL,
  `core_id` int(11) NOT NULL DEFAULT '0',
  `core_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jhackguard_ip_filters`
--

DROP TABLE IF EXISTS `iztiw_jhackguard_ip_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jhackguard_ip_filters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `expires` date NOT NULL,
  `rule_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jhackguard_logs`
--

DROP TABLE IF EXISTS `iztiw_jhackguard_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jhackguard_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `severity` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jhackguard_output_filters`
--

DROP TABLE IF EXISTS `iztiw_jhackguard_output_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jhackguard_output_filters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `regex` varchar(255) NOT NULL,
  `replacement` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jhackguard_scan_files`
--

DROP TABLE IF EXISTS `iztiw_jhackguard_scan_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jhackguard_scan_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_jhackguard_scan_hits`
--

DROP TABLE IF EXISTS `iztiw_jhackguard_scan_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_jhackguard_scan_hits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` text CHARACTER SET utf8 NOT NULL,
  `score` int(4) NOT NULL,
  `details` text CHARACTER SET utf8 NOT NULL,
  `scan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_joomly_callback`
--

DROP TABLE IF EXISTS `iztiw_joomly_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_joomly_callback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `call_time` varchar(100) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `page` text NOT NULL,
  `ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_languages`
--

DROP TABLE IF EXISTS `iztiw_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_menu`
--

DROP TABLE IF EXISTS `iztiw_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_menu_types`
--

DROP TABLE IF EXISTS `iztiw_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_messages`
--

DROP TABLE IF EXISTS `iztiw_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_messages_cfg`
--

DROP TABLE IF EXISTS `iztiw_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_mi_iptable`
--

DROP TABLE IF EXISTS `iztiw_mi_iptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_mi_iptable` (
  `ip` bigint(20) NOT NULL COMMENT 'ip to long',
  `firsthacktime` datetime NOT NULL,
  `lasthacktime` datetime NOT NULL,
  `hackcount` int(11) NOT NULL DEFAULT '1',
  `autodelete` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_modules`
--

DROP TABLE IF EXISTS `iztiw_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_modules_menu`
--

DROP TABLE IF EXISTS `iztiw_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_newsfeeds`
--

DROP TABLE IF EXISTS `iztiw_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_overrider`
--

DROP TABLE IF EXISTS `iztiw_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3260 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_redirect_links`
--

DROP TABLE IF EXISTS `iztiw_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB AUTO_INCREMENT=12725 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_schemas`
--

DROP TABLE IF EXISTS `iztiw_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_session`
--

DROP TABLE IF EXISTS `iztiw_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_slogin_users`
--

DROP TABLE IF EXISTS `iztiw_slogin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_slogin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `slogin_id` varchar(150) NOT NULL,
  `provider` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `slogin_id` (`slogin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_template_styles`
--

DROP TABLE IF EXISTS `iztiw_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_update_categories`
--

DROP TABLE IF EXISTS `iztiw_update_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_update_sites`
--

DROP TABLE IF EXISTS `iztiw_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_update_sites_extensions`
--

DROP TABLE IF EXISTS `iztiw_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_updates`
--

DROP TABLE IF EXISTS `iztiw_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=893 DEFAULT CHARSET=utf8 COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_user_notes`
--

DROP TABLE IF EXISTS `iztiw_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_user_profiles`
--

DROP TABLE IF EXISTS `iztiw_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_user_usergroup_map`
--

DROP TABLE IF EXISTS `iztiw_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_usergroups`
--

DROP TABLE IF EXISTS `iztiw_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_users`
--

DROP TABLE IF EXISTS `iztiw_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_viewlevels`
--

DROP TABLE IF EXISTS `iztiw_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_adminmenuentries`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_adminmenuentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_adminmenuentries` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` tinyint(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The ID of the VM Module, this Item is assigned to',
  `parent_id` tinyint(11) unsigned NOT NULL DEFAULT '0',
  `name` char(64) NOT NULL DEFAULT '0',
  `link` char(64) NOT NULL DEFAULT '0',
  `depends` char(64) NOT NULL DEFAULT '' COMMENT 'Names of the Parameters, this Item depends on',
  `icon_class` char(96) DEFAULT NULL,
  `ordering` int(2) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `tooltip` char(128) DEFAULT NULL,
  `view` char(32) DEFAULT NULL,
  `task` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='Administration Menu Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_calc_categories`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_calc_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_calc_categories` (
  `id` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_category_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_calc_countries`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_calc_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_calc_countries` (
  `id` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_country_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_calc_manufacturers`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_calc_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_calc_manufacturers` (
  `id` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_manufacturer_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_calc_shoppergroups`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_calc_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_calc_shoppergroups` (
  `id` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_calc_states`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_calc_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_calc_states` (
  `id` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_state_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_state_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_calcs`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_calcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_calcs` (
  `virtuemart_calc_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Belongs to vendor',
  `calc_jplugin_id` int(11) NOT NULL DEFAULT '0',
  `calc_name` char(64) NOT NULL DEFAULT '' COMMENT 'Name of the rule',
  `calc_descr` char(128) NOT NULL DEFAULT '' COMMENT 'Description',
  `calc_kind` char(16) NOT NULL DEFAULT '' COMMENT 'Discount/Tax/Margin/Commission',
  `calc_value_mathop` char(8) NOT NULL DEFAULT '' COMMENT 'the mathematical operation like (+,-,+%,-%)',
  `calc_value` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'The Amount',
  `calc_currency` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Currency of the Rule',
  `calc_shopper_published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Visible for Shoppers',
  `calc_vendor_published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Visible for Vendors',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Startdate if nothing is set = permanent',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Enddate if nothing is set = permanent',
  `for_override` tinyint(1) NOT NULL DEFAULT '0',
  `calc_params` varchar(18000) DEFAULT NULL,
  `ordering` int(2) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_calc_id`),
  KEY `i_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_categories`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_categories` (
  `virtuemart_category_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `category_template` char(128) DEFAULT NULL,
  `category_layout` char(64) DEFAULT NULL,
  `category_product_layout` char(64) DEFAULT NULL,
  `products_per_row` tinyint(2) DEFAULT NULL,
  `limit_list_step` char(32) DEFAULT NULL,
  `limit_list_initial` smallint(1) unsigned DEFAULT NULL,
  `hits` int(1) unsigned NOT NULL DEFAULT '0',
  `metarobot` char(40) NOT NULL DEFAULT '',
  `metaauthor` char(64) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_category_id`),
  KEY `idx_category_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='Product Categories are stored here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_categories_ru_ru`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_categories_ru_ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_categories_ru_ru` (
  `virtuemart_category_id` int(1) unsigned NOT NULL,
  `category_name` char(180) NOT NULL DEFAULT '',
  `category_description` varchar(19000) NOT NULL DEFAULT '',
  `metadesc` varchar(400) NOT NULL DEFAULT '',
  `metakey` varchar(400) NOT NULL DEFAULT '',
  `customtitle` char(255) NOT NULL DEFAULT '',
  `slug` char(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_category_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_category_categories`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_category_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_category_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_parent_id` int(1) unsigned NOT NULL DEFAULT '0',
  `category_child_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_category_parent_id` (`category_parent_id`,`category_child_id`),
  KEY `category_child_id` (`category_child_id`)
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='Category child-parent relation list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_category_medias`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_category_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_category_medias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_category_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_media_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_category_id` (`virtuemart_category_id`,`virtuemart_media_id`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_configs`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_configs` (
  `virtuemart_config_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `config` text,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Holds configuration settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_countries`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_countries` (
  `virtuemart_country_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_worldzone_id` tinyint(11) NOT NULL DEFAULT '1',
  `country_name` char(64) DEFAULT NULL,
  `country_3_code` char(3) DEFAULT NULL,
  `country_2_code` char(2) DEFAULT NULL,
  `ordering` int(2) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_country_id`),
  KEY `idx_country_3_code` (`country_3_code`),
  KEY `idx_country_2_code` (`country_2_code`)
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COMMENT='Country records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_coupons`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_coupons` (
  `coupon_used` varchar(200) NOT NULL DEFAULT '',
  `virtuemart_coupon_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_code` char(32) NOT NULL DEFAULT '',
  `percent_or_total` enum('percent','total') NOT NULL DEFAULT 'percent',
  `coupon_type` enum('gift','permanent') NOT NULL DEFAULT 'gift',
  `coupon_value` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `coupon_start_date` datetime DEFAULT NULL,
  `coupon_expiry_date` datetime DEFAULT NULL,
  `coupon_value_valid` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_coupon_id`),
  KEY `idx_coupon_code` (`coupon_code`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='Used to store coupon codes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_currencies`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_currencies` (
  `virtuemart_currency_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '1',
  `currency_name` char(64) DEFAULT NULL,
  `currency_code_2` char(2) DEFAULT NULL,
  `currency_code_3` char(3) DEFAULT NULL,
  `currency_numeric_code` int(4) DEFAULT NULL,
  `currency_exchange_rate` decimal(10,5) DEFAULT NULL,
  `currency_symbol` char(4) DEFAULT NULL,
  `currency_decimal_place` char(4) DEFAULT NULL,
  `currency_decimal_symbol` char(4) DEFAULT NULL,
  `currency_thousands` char(4) DEFAULT NULL,
  `currency_positive_style` char(64) DEFAULT NULL,
  `currency_negative_style` char(64) DEFAULT NULL,
  `ordering` int(2) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_currency_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `idx_currency_code_3` (`currency_code_3`),
  KEY `idx_currency_numeric_code` (`currency_numeric_code`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='Used to store currencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_customs`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_customs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_customs` (
  `virtuemart_custom_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `custom_parent_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_vendor_id` smallint(11) NOT NULL DEFAULT '1',
  `custom_jplugin_id` int(11) NOT NULL DEFAULT '0',
  `custom_element` char(50) NOT NULL DEFAULT '',
  `admin_only` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:Display in admin only',
  `custom_title` char(255) NOT NULL DEFAULT '' COMMENT 'field title',
  `show_title` tinyint(1) NOT NULL DEFAULT '1',
  `custom_tip` char(255) NOT NULL DEFAULT '' COMMENT 'tip',
  `custom_value` char(255) DEFAULT NULL COMMENT 'defaut value',
  `custom_field_desc` char(255) DEFAULT NULL COMMENT 'description or unit',
  `field_type` char(1) NOT NULL DEFAULT '0' COMMENT 'S:string,I:int,P:parent, B:bool,D:date,T:time,H:hidden',
  `is_list` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'list of values',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:hidden',
  `is_cart_attribute` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Add attributes to cart',
  `layout_pos` char(24) DEFAULT NULL COMMENT 'Layout Position',
  `custom_params` text,
  `shared` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'valide for all vendors?',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_custom_id`),
  KEY `idx_custom_plugin_virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `idx_custom_plugin_element` (`custom_element`),
  KEY `idx_custom_plugin_ordering` (`ordering`),
  KEY `idx_custom_parent_id` (`custom_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='custom fields definition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_invoices`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_invoices` (
  `virtuemart_invoice_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '1',
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `invoice_number` char(64) DEFAULT NULL,
  `order_status` char(2) DEFAULT NULL,
  `xhtml` text,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_invoice_id`),
  UNIQUE KEY `idx_invoice_number` (`invoice_number`,`virtuemart_vendor_id`),
  KEY `idx_virtuemart_order_id` (`virtuemart_order_id`),
  KEY `idx_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='custom fields definition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_manufacturer_medias`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_manufacturer_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_manufacturer_medias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_manufacturer_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_media_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_manufacturer_id` (`virtuemart_manufacturer_id`,`virtuemart_media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_manufacturercategories`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_manufacturercategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_manufacturercategories` (
  `virtuemart_manufacturercategories_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_manufacturercategories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Manufacturers are assigned to these categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_manufacturercategories_ru_ru`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_manufacturercategories_ru_ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_manufacturercategories_ru_ru` (
  `virtuemart_manufacturercategories_id` int(1) unsigned NOT NULL,
  `mf_category_name` char(180) NOT NULL DEFAULT '',
  `mf_category_desc` varchar(19000) NOT NULL DEFAULT '',
  `slug` char(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_manufacturercategories_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_manufacturers`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_manufacturers` (
  `virtuemart_manufacturer_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_manufacturercategories_id` int(11) DEFAULT NULL,
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Manufacturers are those who deliver products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_manufacturers_ru_ru`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_manufacturers_ru_ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_manufacturers_ru_ru` (
  `virtuemart_manufacturer_id` int(1) unsigned NOT NULL,
  `mf_name` char(180) NOT NULL DEFAULT '',
  `mf_email` char(255) NOT NULL DEFAULT '',
  `mf_desc` varchar(19000) NOT NULL DEFAULT '',
  `mf_url` char(255) NOT NULL DEFAULT '',
  `slug` char(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_manufacturer_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_medias`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_medias` (
  `virtuemart_media_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(11) NOT NULL DEFAULT '1',
  `file_title` char(126) NOT NULL DEFAULT '',
  `file_description` char(254) NOT NULL DEFAULT '',
  `file_meta` char(254) NOT NULL DEFAULT '',
  `file_mimetype` char(64) NOT NULL DEFAULT '',
  `file_type` char(32) NOT NULL DEFAULT '',
  `file_url` varchar(900) NOT NULL DEFAULT '',
  `file_url_thumb` varchar(900) NOT NULL DEFAULT '',
  `file_is_product_image` tinyint(1) NOT NULL DEFAULT '0',
  `file_is_downloadable` tinyint(1) NOT NULL DEFAULT '0',
  `file_is_forSale` tinyint(1) NOT NULL DEFAULT '0',
  `file_params` varchar(17500) DEFAULT NULL,
  `file_lang` varchar(500) NOT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_media_id`),
  KEY `i_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2344 DEFAULT CHARSET=utf8 COMMENT='Additional Images and Files which are assigned to products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_migration_oldtonew_ids`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_migration_oldtonew_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_migration_oldtonew_ids` (
  `id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `cats` longblob,
  `catsxref` blob,
  `manus` longblob,
  `mfcats` blob,
  `shoppergroups` longblob,
  `products` longblob,
  `products_start` int(1) DEFAULT NULL,
  `orderstates` blob,
  `orders` longblob,
  `attributes` longblob,
  `relatedproducts` longblob,
  `orders_start` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='xref table for vm1 ids to vm2 ids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_modules`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_modules` (
  `module_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` char(255) DEFAULT NULL,
  `module_description` varchar(21000) DEFAULT NULL,
  `module_perms` char(255) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `is_admin` enum('0','1') NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`module_id`),
  KEY `idx_module_name` (`module_name`),
  KEY `idx_module_ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='VirtueMart Core Modules, not: Joomla modules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_order_calc_rules`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_order_calc_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_order_calc_rules` (
  `virtuemart_order_calc_rule_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` int(11) DEFAULT NULL,
  `virtuemart_order_id` int(11) DEFAULT NULL,
  `virtuemart_vendor_id` smallint(11) NOT NULL DEFAULT '1',
  `virtuemart_order_item_id` int(11) DEFAULT NULL,
  `calc_rule_name` char(64) NOT NULL DEFAULT '' COMMENT 'Name of the rule',
  `calc_kind` char(16) NOT NULL DEFAULT '' COMMENT 'Discount/Tax/Margin/Commission',
  `calc_mathop` char(16) NOT NULL DEFAULT '' COMMENT 'Discount/Tax/Margin/Commission',
  `calc_amount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `calc_result` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `calc_value` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `calc_currency` smallint(1) DEFAULT NULL,
  `calc_params` varchar(18000) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_order_calc_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5236 DEFAULT CHARSET=utf8 COMMENT='Stores all calculation rules which are part of an order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_order_histories`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_order_histories` (
  `virtuemart_order_history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned NOT NULL DEFAULT '0',
  `order_status_code` char(1) NOT NULL DEFAULT '0',
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `comments` varchar(21000) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_order_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5442 DEFAULT CHARSET=utf8 COMMENT='Stores all actions and changes that occur to an order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_order_items`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_order_items` (
  `delivery_date` varchar(200) DEFAULT NULL,
  `virtuemart_order_item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(11) DEFAULT NULL,
  `virtuemart_vendor_id` smallint(11) NOT NULL DEFAULT '1',
  `virtuemart_product_id` int(11) DEFAULT NULL,
  `order_item_sku` char(64) NOT NULL DEFAULT '',
  `order_item_name` char(255) NOT NULL DEFAULT '',
  `product_quantity` int(11) DEFAULT NULL,
  `product_item_price` decimal(15,5) DEFAULT NULL,
  `product_priceWithoutTax` decimal(15,5) DEFAULT NULL,
  `product_tax` decimal(15,5) DEFAULT NULL,
  `product_basePriceWithTax` decimal(15,5) DEFAULT NULL,
  `product_discountedPriceWithoutTax` decimal(15,5) DEFAULT NULL,
  `product_final_price` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `product_subtotal_discount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `product_subtotal_with_tax` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_item_currency` int(11) DEFAULT NULL,
  `order_status` char(1) DEFAULT NULL,
  `product_attribute` text,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `product_item_weight` float DEFAULT NULL COMMENT 'platon',
  PRIMARY KEY (`virtuemart_order_item_id`),
  KEY `virtuemart_product_id` (`virtuemart_product_id`),
  KEY `idx_order_item_virtuemart_order_id` (`virtuemart_order_id`),
  KEY `idx_order_item_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13025 DEFAULT CHARSET=utf8 COMMENT='Stores all items (products) which are part of an order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_order_userinfos`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_order_userinfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_order_userinfos` (
  `virtuemart_order_userinfo_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `address_type` char(2) DEFAULT NULL,
  `address_type_name` varchar(255) DEFAULT NULL,
  `company` char(64) DEFAULT NULL,
  `title` char(32) DEFAULT NULL,
  `last_name` char(48) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` char(48) DEFAULT NULL,
  `phone_1` varchar(255) DEFAULT NULL,
  `phone_2` char(32) DEFAULT NULL,
  `fax` char(32) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` char(64) NOT NULL DEFAULT '',
  `virtuemart_state_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_country_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `zip` char(16) NOT NULL DEFAULT '',
  `email` char(128) DEFAULT NULL,
  `agreed` tinyint(1) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `address3_DELETED_1426590492` varchar(255) DEFAULT NULL,
  `phone_3` varchar(255) DEFAULT NULL,
  `address_3` varchar(255) DEFAULT NULL,
  `ordercomment_DELETED_1446786723` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`virtuemart_order_userinfo_id`),
  KEY `i_virtuemart_order_id` (`virtuemart_order_id`),
  KEY `i_virtuemart_user_id` (`virtuemart_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2633 DEFAULT CHARSET=utf8 COMMENT='Stores the BillTo and ShipTo Information at order time';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_orders`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_orders` (
  `virtuemart_order_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `order_number` varchar(11) DEFAULT NULL,
  `customer_number` char(32) DEFAULT NULL,
  `order_pass` char(8) DEFAULT NULL,
  `order_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_salesPrice` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_billTaxAmount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_billTax` varchar(400) DEFAULT NULL,
  `order_billDiscountAmount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_discountAmount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_subtotal` decimal(15,5) DEFAULT NULL,
  `order_tax` decimal(10,5) DEFAULT NULL,
  `order_shipment` decimal(10,2) DEFAULT NULL,
  `order_shipment_tax` decimal(10,5) DEFAULT NULL,
  `order_payment` decimal(10,2) DEFAULT NULL,
  `order_payment_tax` decimal(10,5) DEFAULT NULL,
  `coupon_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `coupon_code` char(32) DEFAULT NULL,
  `order_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `order_currency` smallint(1) DEFAULT NULL,
  `order_status` char(1) DEFAULT NULL,
  `user_currency_id` smallint(1) DEFAULT NULL,
  `user_currency_rate` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `virtuemart_shipmentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `customer_note` varchar(20000) DEFAULT NULL,
  `delivery_date` varchar(200) DEFAULT NULL,
  `order_language` char(7) DEFAULT NULL,
  `ip_address` char(15) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `groupid` int(11) NOT NULL,
  `unum` int(11) NOT NULL,
  PRIMARY KEY (`virtuemart_order_id`),
  KEY `idx_orders_virtuemart_user_id` (`virtuemart_user_id`),
  KEY `idx_orders_virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `idx_orders_order_number` (`order_number`),
  KEY `idx_orders_virtuemart_paymentmethod_id` (`virtuemart_paymentmethod_id`),
  KEY `idx_orders_virtuemart_shipmentmethod_id` (`virtuemart_shipmentmethod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2628 DEFAULT CHARSET=utf8 COMMENT='Used to store all orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_orderstates`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_orderstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_orderstates` (
  `virtuemart_orderstate_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(11) NOT NULL DEFAULT '1',
  `order_status_code` char(1) NOT NULL DEFAULT '',
  `order_status_name` char(64) DEFAULT NULL,
  `order_status_description` varchar(20000) DEFAULT NULL,
  `order_stock_handle` char(1) NOT NULL DEFAULT 'A',
  `ordering` int(2) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_orderstate_id`),
  KEY `idx_order_status_ordering` (`ordering`),
  KEY `idx_order_status_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='All available order statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_payment_plg_moneybookers_wlt`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_payment_plg_moneybookers_wlt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_payment_plg_moneybookers_wlt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `order_number` char(64) DEFAULT NULL,
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `payment_name` varchar(5000) DEFAULT NULL,
  `payment_order_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `payment_currency` char(3) DEFAULT NULL,
  `cost_per_transaction` decimal(10,2) DEFAULT NULL,
  `cost_percent_total` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(1) DEFAULT NULL,
  `user_session` varchar(255) DEFAULT NULL,
  `mb_pay_to_email` varchar(50) DEFAULT NULL,
  `mb_pay_from_email` varchar(50) DEFAULT NULL,
  `mb_merchant_id` int(10) unsigned DEFAULT NULL,
  `mb_transaction_id` varchar(15) DEFAULT NULL,
  `mb_rec_payment_id` int(10) unsigned DEFAULT NULL,
  `mb_rec_payment_type` varchar(16) DEFAULT NULL,
  `mb_amount` decimal(19,2) DEFAULT NULL,
  `mb_currency` char(3) DEFAULT NULL,
  `mb_status` tinyint(1) DEFAULT NULL,
  `mb_md5sig` char(32) DEFAULT NULL,
  `mb_sha2sig` char(64) DEFAULT NULL,
  `mbresponse_raw` varchar(512) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Payment Moneybookers Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_payment_plg_paypal`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_payment_plg_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_payment_plg_paypal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `order_number` char(64) DEFAULT NULL,
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `payment_name` varchar(5000) DEFAULT NULL,
  `payment_order_total` decimal(15,5) NOT NULL,
  `payment_currency` smallint(1) DEFAULT NULL,
  `email_currency` smallint(1) DEFAULT NULL,
  `cost_per_transaction` decimal(10,2) DEFAULT NULL,
  `cost_percent_total` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(1) DEFAULT NULL,
  `paypal_custom` varchar(255) DEFAULT NULL,
  `paypal_method` varchar(200) DEFAULT NULL,
  `paypal_response_mc_gross` decimal(10,2) DEFAULT NULL,
  `paypal_response_mc_currency` char(10) DEFAULT NULL,
  `paypal_response_invoice` char(32) DEFAULT NULL,
  `paypal_response_protection_eligibility` char(128) DEFAULT NULL,
  `paypal_response_payer_id` char(13) DEFAULT NULL,
  `paypal_response_tax` decimal(10,2) DEFAULT NULL,
  `paypal_response_payment_date` char(28) DEFAULT NULL,
  `paypal_response_payment_status` char(50) DEFAULT NULL,
  `paypal_response_pending_reason` char(50) DEFAULT NULL,
  `paypal_response_mc_fee` decimal(10,2) DEFAULT NULL,
  `paypal_response_payer_email` char(128) DEFAULT NULL,
  `paypal_response_last_name` char(64) DEFAULT NULL,
  `paypal_response_first_name` char(64) DEFAULT NULL,
  `paypal_response_business` char(128) DEFAULT NULL,
  `paypal_response_receiver_email` char(128) DEFAULT NULL,
  `paypal_response_transaction_subject` char(128) DEFAULT NULL,
  `paypal_response_residence_country` char(2) DEFAULT NULL,
  `paypal_response_txn_id` char(32) DEFAULT NULL,
  `paypal_response_txn_type` char(32) DEFAULT NULL,
  `paypal_response_parent_txn_id` char(32) DEFAULT NULL,
  `paypal_response_case_creation_date` char(32) DEFAULT NULL,
  `paypal_response_case_id` char(32) DEFAULT NULL,
  `paypal_response_case_type` char(32) DEFAULT NULL,
  `paypal_response_reason_code` char(32) DEFAULT NULL,
  `paypalresponse_raw` varchar(512) DEFAULT NULL,
  `paypal_fullresponse` text,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='PayPal Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_payment_plg_robokassa`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_payment_plg_robokassa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_payment_plg_robokassa` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(11) unsigned DEFAULT NULL,
  `order_number` char(32) DEFAULT NULL,
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `payment_name` char(255) NOT NULL DEFAULT '',
  `payment_order_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `payment_currency` char(3) DEFAULT NULL,
  `cost_per_transaction` decimal(10,2) DEFAULT NULL,
  `cost_percent_total` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(11) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Payment Robokassa Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_payment_plg_standard`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_payment_plg_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_payment_plg_standard` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `order_number` char(64) DEFAULT NULL,
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `payment_name` varchar(5000) DEFAULT NULL,
  `payment_order_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `payment_currency` char(3) DEFAULT NULL,
  `email_currency` char(3) DEFAULT NULL,
  `cost_per_transaction` decimal(10,2) DEFAULT NULL,
  `cost_percent_total` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(1) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2565 DEFAULT CHARSET=utf8 COMMENT='Payment Standard Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_payment_plg_yandex_http`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_payment_plg_yandex_http`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_payment_plg_yandex_http` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(11) unsigned DEFAULT NULL,
  `order_number` char(32) DEFAULT NULL,
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `payment_name` varchar(5000) NOT NULL DEFAULT '',
  `payment_order_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `payment_currency` char(3) DEFAULT NULL,
  `cost_per_transaction` decimal(10,2) DEFAULT NULL,
  `cost_percent_total` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(11) DEFAULT NULL,
  `invoice_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Payment Ynadex Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_payment_plg_yandexapi`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_payment_plg_yandexapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_payment_plg_yandexapi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(11) unsigned DEFAULT NULL,
  `order_number` char(32) DEFAULT NULL,
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `payment_name` char(255) NOT NULL DEFAULT '',
  `payment_order_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `payment_currency` char(3) DEFAULT NULL,
  `cost_per_transaction` decimal(10,2) DEFAULT NULL,
  `cost_percent_total` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(11) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Payment YandexApi Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_paymentmethod_shoppergroups`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_paymentmethod_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_paymentmethod_shoppergroups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_paymentmethod_id` mediumint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_paymentmethod_id` (`virtuemart_paymentmethod_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='xref table for paymentmethods to shoppergroup';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_paymentmethods`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_paymentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_paymentmethods` (
  `virtuemart_paymentmethod_id` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(11) NOT NULL DEFAULT '1',
  `payment_jplugin_id` int(11) NOT NULL DEFAULT '0',
  `payment_element` char(50) NOT NULL DEFAULT '',
  `payment_params` varchar(19000) DEFAULT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'valide for all vendors?',
  `ordering` int(2) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_paymentmethod_id`),
  KEY `idx_payment_jplugin_id` (`payment_jplugin_id`),
  KEY `idx_payment_method_ordering` (`ordering`),
  KEY `idx_payment_element` (`payment_element`,`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='The payment methods of your store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_paymentmethods_ru_ru`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_paymentmethods_ru_ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_paymentmethods_ru_ru` (
  `virtuemart_paymentmethod_id` int(1) unsigned NOT NULL,
  `payment_name` char(180) NOT NULL DEFAULT '',
  `payment_desc` varchar(19000) NOT NULL DEFAULT '',
  `slug` char(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_paymentmethod_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_permgroups`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_permgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_permgroups` (
  `virtuemart_permgroup_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '1',
  `group_name` char(128) DEFAULT NULL,
  `group_level` int(11) DEFAULT NULL,
  `ordering` int(2) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_permgroup_id`),
  KEY `i_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Holds all the user groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_product_categories`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_product_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_category_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11175 DEFAULT CHARSET=utf8 COMMENT='Maps Products to Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_product_customfields`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_product_customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_product_customfields` (
  `virtuemart_customfield_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'field id',
  `virtuemart_product_id` int(11) NOT NULL DEFAULT '0',
  `virtuemart_custom_id` int(11) NOT NULL DEFAULT '1' COMMENT 'custom group id',
  `custom_value` varchar(8000) DEFAULT NULL COMMENT 'field value',
  `custom_price` decimal(15,5) DEFAULT NULL COMMENT 'price',
  `custom_param` varchar(12800) DEFAULT NULL COMMENT 'Param for Plugins',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) unsigned NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) unsigned NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_customfield_id`),
  KEY `idx_virtuemart_product_id` (`virtuemart_product_id`),
  KEY `idx_virtuemart_custom_id` (`virtuemart_custom_id`),
  KEY `idx_custom_value` (`custom_value`(333))
) ENGINE=MyISAM AUTO_INCREMENT=4179 DEFAULT CHARSET=utf8 COMMENT='custom fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_product_manufacturers`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_product_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_product_manufacturers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(11) DEFAULT NULL,
  `virtuemart_manufacturer_id` smallint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maps a product to a manufacturer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_product_medias`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_product_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_product_medias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_media_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_media_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3018 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_product_prices`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_product_prices` (
  `virtuemart_product_price_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` int(11) DEFAULT NULL,
  `product_price` decimal(15,5) DEFAULT NULL,
  `override` tinyint(1) DEFAULT NULL,
  `product_override_price` decimal(15,5) DEFAULT NULL,
  `product_tax_id` int(11) DEFAULT NULL,
  `product_discount_id` int(11) DEFAULT NULL,
  `product_currency` smallint(1) DEFAULT NULL,
  `product_price_publish_up` datetime DEFAULT NULL,
  `product_price_publish_down` datetime DEFAULT NULL,
  `price_quantity_start` int(11) unsigned DEFAULT NULL,
  `price_quantity_end` int(11) unsigned DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_product_price_id`),
  KEY `idx_product_price_product_id` (`virtuemart_product_id`),
  KEY `idx_product_price_virtuemart_shoppergroup_id` (`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2957 DEFAULT CHARSET=utf8 COMMENT='Holds price records for a product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_product_relations`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_product_relations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `related_products` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_product_id` (`virtuemart_product_id`,`related_products`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_product_shoppergroups`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_product_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_product_shoppergroups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maps Products to Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_products`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_products` (
  `virtuemart_product_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '1',
  `product_parent_id` int(1) unsigned NOT NULL DEFAULT '0',
  `product_sku` char(64) DEFAULT NULL,
  `product_weight` decimal(10,4) DEFAULT NULL,
  `product_weight_uom` char(7) DEFAULT NULL,
  `product_length` decimal(10,4) DEFAULT NULL,
  `product_width` decimal(10,4) DEFAULT NULL,
  `product_height` decimal(10,4) DEFAULT NULL,
  `product_lwh_uom` char(7) DEFAULT NULL,
  `product_url` char(255) DEFAULT NULL,
  `product_in_stock` int(1) NOT NULL DEFAULT '0',
  `product_ordered` int(1) NOT NULL DEFAULT '0',
  `low_stock_notification` int(1) unsigned NOT NULL DEFAULT '0',
  `product_available_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_availability` char(32) DEFAULT NULL,
  `product_special` tinyint(1) DEFAULT NULL,
  `product_sales` int(1) unsigned NOT NULL DEFAULT '0',
  `product_unit` varchar(8) DEFAULT NULL,
  `product_packaging` decimal(8,4) unsigned DEFAULT NULL,
  `product_params` varchar(2000) DEFAULT NULL,
  `hits` int(11) unsigned DEFAULT NULL,
  `intnotes` varchar(18000) DEFAULT NULL,
  `metarobot` varchar(400) DEFAULT NULL,
  `metaauthor` varchar(400) DEFAULT NULL,
  `layout` char(16) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `pordering` mediumint(2) unsigned NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_product_id`),
  KEY `idx_product_virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `idx_product_product_parent_id` (`product_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2923 DEFAULT CHARSET=utf8 COMMENT='All products are stored here.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_products_ru_ru`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_products_ru_ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_products_ru_ru` (
  `virtuemart_product_id` int(1) unsigned NOT NULL,
  `product_s_desc` varchar(2000) NOT NULL DEFAULT '',
  `product_desc` varchar(18400) NOT NULL DEFAULT '',
  `product_name` char(180) NOT NULL DEFAULT '',
  `metadesc` varchar(400) NOT NULL DEFAULT '',
  `metakey` varchar(400) NOT NULL DEFAULT '',
  `customtitle` char(255) NOT NULL DEFAULT '',
  `slug` char(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_product_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_rating_reviews`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_rating_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_rating_reviews` (
  `virtuemart_rating_review_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(18000) DEFAULT NULL,
  `review_ok` tinyint(1) NOT NULL DEFAULT '0',
  `review_rates` int(1) unsigned NOT NULL DEFAULT '0',
  `review_ratingcount` int(1) unsigned NOT NULL DEFAULT '0',
  `review_rating` decimal(10,2) NOT NULL DEFAULT '0.00',
  `review_editable` tinyint(1) NOT NULL DEFAULT '1',
  `lastip` char(50) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_rating_review_id`),
  UNIQUE KEY `i_virtuemart_product_id` (`virtuemart_product_id`,`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_rating_votes`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_rating_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_rating_votes` (
  `virtuemart_rating_vote_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL DEFAULT '0',
  `lastip` char(50) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_rating_vote_id`),
  UNIQUE KEY `i_virtuemart_product_id` (`virtuemart_product_id`,`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all ratings for a product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_ratings`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_ratings` (
  `virtuemart_rating_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `rates` int(11) NOT NULL DEFAULT '0',
  `ratingcount` int(1) unsigned NOT NULL DEFAULT '0',
  `rating` decimal(10,1) NOT NULL DEFAULT '0.0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_rating_id`),
  UNIQUE KEY `i_virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_rating_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all ratings for a product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_shipment_plg_weight_countries`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_shipment_plg_weight_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_shipment_plg_weight_countries` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(11) unsigned DEFAULT NULL,
  `order_number` char(32) DEFAULT NULL,
  `virtuemart_shipmentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `shipment_name` varchar(5000) DEFAULT NULL,
  `order_weight` decimal(10,4) DEFAULT NULL,
  `shipment_weight_unit` char(3) DEFAULT 'KG',
  `shipment_cost` decimal(10,2) DEFAULT NULL,
  `shipment_package_fee` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(1) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2611 DEFAULT CHARSET=utf8 COMMENT='Shipment Weight Countries Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_shipmentmethod_shoppergroups`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_shipmentmethod_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_shipmentmethod_shoppergroups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_shipmentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `virtuemart_shoppergroup_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_shipmentmethod_id` (`virtuemart_shipmentmethod_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='xref table for shipment to shoppergroup';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_shipmentmethods`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_shipmentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_shipmentmethods` (
  `virtuemart_shipmentmethod_id` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(11) NOT NULL DEFAULT '1',
  `shipment_jplugin_id` int(11) NOT NULL DEFAULT '0',
  `shipment_element` char(50) NOT NULL DEFAULT '',
  `shipment_params` varchar(19000) DEFAULT NULL,
  `ordering` int(2) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_shipmentmethod_id`),
  KEY `idx_shipment_jplugin_id` (`shipment_jplugin_id`),
  KEY `idx_shipment_method_ordering` (`ordering`),
  KEY `idx_shipment_element` (`shipment_element`,`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Shipment created from the shipment plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_shipmentmethods_ru_ru`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_shipmentmethods_ru_ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_shipmentmethods_ru_ru` (
  `virtuemart_shipmentmethod_id` int(1) unsigned NOT NULL,
  `shipment_name` char(180) NOT NULL DEFAULT '',
  `shipment_desc` varchar(19000) NOT NULL DEFAULT '',
  `slug` char(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_shipmentmethod_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_shoppergroups`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_shoppergroups` (
  `virtuemart_shoppergroup_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(11) NOT NULL DEFAULT '1',
  `shopper_group_name` int(11) DEFAULT NULL,
  `shopper_group_desc` char(128) DEFAULT NULL,
  `custom_price_display` tinyint(1) NOT NULL DEFAULT '0',
  `price_display` blob,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_shoppergroup_id`),
  KEY `idx_shopper_group_virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `idx_shopper_group_name` (`shopper_group_name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Shopper Groups that users can be assigned to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_states`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_states` (
  `virtuemart_state_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '1',
  `virtuemart_country_id` smallint(1) unsigned NOT NULL DEFAULT '1',
  `virtuemart_worldzone_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `state_name` char(64) DEFAULT NULL,
  `state_3_code` char(3) DEFAULT NULL,
  `state_2_code` char(2) DEFAULT NULL,
  `ordering` int(2) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_state_id`),
  UNIQUE KEY `idx_state_3_code` (`virtuemart_country_id`,`state_3_code`),
  UNIQUE KEY `idx_state_2_code` (`virtuemart_country_id`,`state_2_code`),
  KEY `i_virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `i_virtuemart_country_id` (`virtuemart_country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=730 DEFAULT CHARSET=utf8 COMMENT='States that are assigned to a country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_userfield_values`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_userfield_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_userfield_values` (
  `virtuemart_userfield_value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_userfield_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `fieldtitle` char(255) NOT NULL DEFAULT '',
  `fieldvalue` char(255) NOT NULL DEFAULT '',
  `sys` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_userfield_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='Holds the different values for dropdown and radio lists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_userfields`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_userfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_userfields` (
  `virtuemart_userfield_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '1',
  `userfield_jplugin_id` int(11) NOT NULL DEFAULT '0',
  `name` char(255) NOT NULL DEFAULT '',
  `title` char(255) NOT NULL DEFAULT '',
  `description` mediumtext,
  `type` char(70) NOT NULL DEFAULT '',
  `maxlength` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `cols` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `value` char(255) DEFAULT NULL,
  `default` char(255) DEFAULT NULL,
  `registration` tinyint(1) NOT NULL DEFAULT '0',
  `shipment` tinyint(1) NOT NULL DEFAULT '0',
  `account` tinyint(1) NOT NULL DEFAULT '1',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `calculated` tinyint(1) NOT NULL DEFAULT '0',
  `sys` tinyint(4) NOT NULL DEFAULT '0',
  `params` varchar(17500) DEFAULT NULL,
  `ordering` int(2) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_userfield_id`),
  KEY `i_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='Holds the fields for the user information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_userinfos`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_userinfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_userinfos` (
  `virtuemart_userinfo_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `address_type` char(2) NOT NULL DEFAULT '',
  `address_type_name` varchar(255) DEFAULT NULL,
  `name` char(64) DEFAULT NULL,
  `company` char(64) DEFAULT NULL,
  `title` char(32) DEFAULT NULL,
  `last_name` char(48) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` char(48) DEFAULT NULL,
  `phone_1` varchar(255) DEFAULT NULL,
  `phone_2` char(32) DEFAULT NULL,
  `fax` char(32) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` char(64) NOT NULL DEFAULT '',
  `virtuemart_state_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_country_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `zip` char(32) NOT NULL DEFAULT '',
  `agreed` tinyint(1) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  `address3_DELETED_1426590492` varchar(255) DEFAULT NULL,
  `phone_3` varchar(255) DEFAULT NULL,
  `groups` text NOT NULL,
  `address_3` varchar(255) DEFAULT NULL,
  `ordercomment_DELETED_1446786723` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`virtuemart_userinfo_id`),
  KEY `idx_userinfo_virtuemart_user_id` (`virtuemart_userinfo_id`,`virtuemart_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1375 DEFAULT CHARSET=utf8 COMMENT='Customer Information, BT = BillTo and ST = ShipTo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_vendor_medias`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_vendor_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_vendor_medias` (
  `id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_media_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_vendor_id` (`virtuemart_vendor_id`,`virtuemart_media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_vendors`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_vendors` (
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_name` char(64) DEFAULT NULL,
  `vendor_currency` int(11) DEFAULT NULL,
  `vendor_accepted_currencies` varchar(1536) NOT NULL DEFAULT '',
  `vendor_params` varchar(17000) DEFAULT NULL,
  `metarobot` char(20) DEFAULT NULL,
  `metaauthor` char(64) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_vendor_id`),
  KEY `idx_vendor_name` (`vendor_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Vendors manage their products in your store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_vendors_ru_ru`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_vendors_ru_ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_vendors_ru_ru` (
  `virtuemart_vendor_id` int(1) unsigned NOT NULL,
  `vendor_store_desc` text NOT NULL,
  `vendor_terms_of_service` text NOT NULL,
  `vendor_legal_info` text NOT NULL,
  `vendor_letter_css` text NOT NULL,
  `vendor_letter_header_html` varchar(8000) NOT NULL DEFAULT '<h1>{vm:vendorname}</h1><p>{vm:vendoraddress}</p>',
  `vendor_letter_footer_html` varchar(8000) NOT NULL DEFAULT '<p>{vm:vendorlegalinfo}<br />Page {vm:pagenum}/{vm:pagecount}</p>',
  `vendor_store_name` char(180) NOT NULL DEFAULT '',
  `vendor_phone` char(26) NOT NULL DEFAULT '',
  `vendor_url` char(255) NOT NULL DEFAULT '',
  `metadesc` varchar(400) NOT NULL DEFAULT '',
  `metakey` varchar(400) NOT NULL DEFAULT '',
  `customtitle` char(255) NOT NULL DEFAULT '',
  `slug` char(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_vendor_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_vmuser_shoppergroups`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_vmuser_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_vmuser_shoppergroups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_virtuemart_user_id` (`virtuemart_user_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='xref table for users to shopper group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_vmusers`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_vmusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_vmusers` (
  `virtuemart_user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `user_is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `customer_number` char(32) DEFAULT NULL,
  `perms` char(40) NOT NULL DEFAULT 'shopper',
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `virtuemart_shipmentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `agreed` tinyint(1) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_user_id`),
  UNIQUE KEY `i_virtuemart_user_id` (`virtuemart_user_id`,`virtuemart_vendor_id`),
  KEY `i_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3126 DEFAULT CHARSET=utf8 COMMENT='Holds the unique user data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_waitingusers`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_waitingusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_waitingusers` (
  `virtuemart_waitinguser_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `notify_email` char(150) NOT NULL DEFAULT '',
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `notify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ordering` int(2) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_waitinguser_id`),
  KEY `virtuemart_product_id` (`virtuemart_product_id`),
  KEY `notify_email` (`notify_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores notifications, users waiting f. products out of stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_virtuemart_worldzones`
--

DROP TABLE IF EXISTS `iztiw_virtuemart_worldzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_virtuemart_worldzones` (
  `virtuemart_worldzone_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` smallint(1) DEFAULT NULL,
  `zone_name` char(255) DEFAULT NULL,
  `zone_cost` decimal(10,2) DEFAULT NULL,
  `zone_limit` decimal(10,2) DEFAULT NULL,
  `zone_description` varchar(18000) DEFAULT NULL,
  `zone_tax_rate` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_worldzone_id`),
  KEY `i_virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The Zones managed by the Zone Shipment Module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_weblinks`
--

DROP TABLE IF EXISTS `iztiw_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_wf_profiles`
--

DROP TABLE IF EXISTS `iztiw_wf_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_wf_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `users` text NOT NULL,
  `types` text NOT NULL,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `device` varchar(255) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_widgetkit_widget`
--

DROP TABLE IF EXISTS `iztiw_widgetkit_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_widgetkit_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `style` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_yandex_maps_categories`
--

DROP TABLE IF EXISTS `iztiw_yandex_maps_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_yandex_maps_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(256) DEFAULT NULL COMMENT 'Название',
  `alias` varchar(256) DEFAULT NULL COMMENT 'Псевдоним',
  `description` text COMMENT 'Описание',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'Категория',
  `howtocenter` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Как центровать',
  `lat` decimal(18,14) DEFAULT NULL COMMENT 'Широта',
  `lan` decimal(18,14) DEFAULT NULL COMMENT 'Долгота',
  `zoom` int(10) unsigned DEFAULT NULL COMMENT 'Высота',
  `created_time` int(10) unsigned NOT NULL COMMENT 'Дата создания',
  `modified_time` int(10) unsigned NOT NULL COMMENT 'Дата редоктирования',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Сортировка',
  `create_by` int(10) unsigned NOT NULL COMMENT 'Автор',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Включен',
  `params` text NOT NULL COMMENT 'Настройки',
  PRIMARY KEY (`id`),
  KEY `lat` (`lat`),
  KEY `lan` (`lan`),
  KEY `active` (`active`),
  KEY `ordering` (`ordering`),
  KEY `create_by` (`create_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_yandex_maps_category_to_map`
--

DROP TABLE IF EXISTS `iztiw_yandex_maps_category_to_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_yandex_maps_category_to_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL COMMENT 'ID Категории',
  `map_id` int(10) unsigned NOT NULL COMMENT 'ID карты',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`,`map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_yandex_maps_maps`
--

DROP TABLE IF EXISTS `iztiw_yandex_maps_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_yandex_maps_maps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `description` text COMMENT 'Описание',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Псевдоним',
  `lat` decimal(18,14) NOT NULL COMMENT 'Широта',
  `lan` decimal(18,14) NOT NULL COMMENT 'Долгота',
  `zoom` int(10) unsigned NOT NULL DEFAULT '10' COMMENT 'Масштаб карты',
  `maxZoom` smallint(5) unsigned NOT NULL DEFAULT '23' COMMENT 'Максимальный масштаб',
  `minZoom` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'минимальный масштаб',
  `type` varchar(50) NOT NULL DEFAULT 'yandex#map' COMMENT 'Тип карты',
  `width` varchar(20) NOT NULL DEFAULT 'auto' COMMENT 'Ширина карты',
  `height` varchar(20) NOT NULL DEFAULT '450px' COMMENT 'Высота карты',
  `behaviors` text COMMENT 'Behabviors',
  `controls` text NOT NULL COMMENT 'Элементы управления',
  `created_time` int(10) unsigned NOT NULL COMMENT 'Дата создания',
  `modified_time` int(10) unsigned NOT NULL COMMENT 'Дата редоктирования',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Сортировка',
  `create_by` int(10) unsigned NOT NULL COMMENT 'Автор',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL COMMENT 'Настройки',
  PRIMARY KEY (`id`),
  KEY `ordering` (`ordering`),
  KEY `create_by` (`create_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_yandex_maps_object_to_category`
--

DROP TABLE IF EXISTS `iztiw_yandex_maps_object_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_yandex_maps_object_to_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL COMMENT 'ID Объекта',
  `category_id` int(10) unsigned NOT NULL COMMENT 'ID Категории',
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`,`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=842 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_yandex_maps_objects`
--

DROP TABLE IF EXISTS `iztiw_yandex_maps_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_yandex_maps_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(256) DEFAULT NULL COMMENT 'Название',
  `alias` varchar(256) DEFAULT NULL COMMENT 'Псевдоним',
  `description` text COMMENT 'Описание',
  `type` enum('placemark','circle','polygon','polyline') NOT NULL DEFAULT 'placemark' COMMENT 'Тип объекта',
  `lat` decimal(18,14) DEFAULT NULL COMMENT 'Широта по умолчанию',
  `lan` decimal(18,14) DEFAULT NULL COMMENT 'Долгота по умолчанию',
  `zoom` int(11) NOT NULL DEFAULT '10' COMMENT 'Высота',
  `created_time` int(10) unsigned NOT NULL COMMENT 'Дата создания',
  `modified_time` int(10) unsigned NOT NULL COMMENT 'Дата редоктирования',
  `coordinates` text,
  `options` text,
  `properties` text,
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Сортировка',
  `create_by` int(10) unsigned NOT NULL COMMENT 'Автор',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Включен',
  `params` text NOT NULL COMMENT 'Настройки',
  `metadata` text COMMENT 'Meta информация',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата начала публикации',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата конца публикации',
  PRIMARY KEY (`id`),
  KEY `lat` (`lat`),
  KEY `lan` (`lan`),
  KEY `active` (`active`),
  KEY `ordering` (`ordering`),
  KEY `create_by` (`create_by`),
  KEY `publish_up` (`publish_up`),
  KEY `publish_down` (`publish_down`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iztiw_yandex_maps_organizations`
--

DROP TABLE IF EXISTS `iztiw_yandex_maps_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iztiw_yandex_maps_organizations` (
  `organization_object_id` int(10) unsigned NOT NULL COMMENT 'ID объекта',
  `organization_name` varchar(255) DEFAULT NULL COMMENT 'Название огранизаии',
  `organization_form` varchar(10) DEFAULT NULL COMMENT 'Форма организации: ООО, ЗАО и т.д.',
  `organization_lider_fio` varchar(255) DEFAULT NULL COMMENT 'ФИО руководителя',
  `organization_lider_position` varchar(255) DEFAULT NULL COMMENT 'Должность руководителя',
  `organization_acting_basis` tinyint(1) DEFAULT NULL COMMENT ' Действует на основании',
  `organization_acting_basis_date` int(11) DEFAULT NULL COMMENT 'Дата доверенности',
  `organization_acting_basis_number` varchar(50) DEFAULT NULL COMMENT 'Номер доверенности',
  `organization_type` varchar(50) DEFAULT NULL COMMENT 'Тип организации',
  `organization_trademark` varchar(255) DEFAULT NULL COMMENT 'Торговая марка',
  `organization_contact_fio` varchar(255) DEFAULT NULL COMMENT 'ФИО контактного лица',
  `organization_contact_position` varchar(60) DEFAULT NULL COMMENT 'Должность контактного лица',
  `organization_contact_phone` varchar(50) DEFAULT NULL COMMENT 'Номер телефона контактного лица',
  `organization_address_legal` text COMMENT 'Адрес юридический',
  `organization_address` text COMMENT 'Адрес фактический',
  `organization_phone` varchar(50) DEFAULT NULL COMMENT 'Телефон для справок',
  `organization_email` varchar(50) DEFAULT NULL COMMENT 'Электронный адрес',
  `organization_website` varchar(100) DEFAULT NULL COMMENT 'Вебсайт',
  `organization_image` varchar(50) DEFAULT NULL COMMENT 'Логотип',
  `organization_shedule_24` tinyint(1) DEFAULT '0' COMMENT 'Круглосуточно',
  `organization_shedule_days` varchar(20) DEFAULT NULL COMMENT 'Дни работы',
  `organization_start_in` tinyint(2) DEFAULT NULL COMMENT 'Начало работы в выходные',
  `organization_end_in` tinyint(2) DEFAULT NULL COMMENT 'Конец работы в выходные',
  `organization_service_delivery` tinyint(1) DEFAULT NULL COMMENT 'Услуги по доставке',
  `organization_service_delivery_variants` tinyint(1) DEFAULT NULL COMMENT 'доставка по городу/ доставка по России',
  `organization_license_number` varchar(50) DEFAULT NULL COMMENT 'Номер лицензии',
  `organization_license_date` int(11) DEFAULT NULL COMMENT 'Дата выдачи лицензии',
  `organization_bank_inn` varchar(50) DEFAULT NULL COMMENT 'ИНН банка',
  `organization_bank_kpp` varchar(50) DEFAULT NULL COMMENT 'КПП банка',
  `organization_bank_rs` varchar(50) DEFAULT NULL COMMENT 'Р/С банка',
  `organization_bank_name` varchar(255) DEFAULT NULL COMMENT 'Название банка',
  `organization_bank_ks` varchar(50) DEFAULT NULL COMMENT 'К/С банка',
  `organization_bank_bik` varchar(50) DEFAULT NULL COMMENT 'БИК банка',
  `organization_info` text COMMENT 'Дополнительная информация',
  PRIMARY KEY (`organization_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Организации';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

