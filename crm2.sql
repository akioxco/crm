-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: crm2
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'ZwZ0PCig2i1mWjcDvcwxeReWmIEcqw5e',1,'2019-11-28 08:56:11','2019-11-28 08:56:11','2019-11-28 08:56:11'),(2,2,'4ZcqPkP5WsiRWrJb5dCp6fi6qRZHC9rg',1,'2019-11-29 02:37:56','2019-11-29 02:37:56','2019-11-29 02:37:56'),(3,3,'gFW5UUZkzrfMa1SSoP0VFRcRm7Ond8qM',1,'2019-11-29 02:38:30','2019-11-29 02:38:30','2019-11-29 02:38:30'),(4,4,'WAHjgpofYP1vAcj61VXqHgt5tpdoT63k',1,'2019-11-29 15:00:58','2019-11-29 15:00:58','2019-11-29 15:00:58');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard__widgets`
--

DROP TABLE IF EXISTS `dashboard__widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard__widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `widgets` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard__widgets_user_id_foreign` (`user_id`),
  CONSTRAINT `dashboard__widgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard__widgets`
--

LOCK TABLES `dashboard__widgets` WRITE;
/*!40000 ALTER TABLE `dashboard__widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard__widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media__file_translations`
--

DROP TABLE IF EXISTS `media__file_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media__file_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_attribute` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media__file_translations_file_id_locale_unique` (`file_id`,`locale`),
  KEY `media__file_translations_locale_index` (`locale`),
  CONSTRAINT `media__file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `media__files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media__file_translations`
--

LOCK TABLES `media__file_translations` WRITE;
/*!40000 ALTER TABLE `media__file_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `media__file_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media__files`
--

DROP TABLE IF EXISTS `media__files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media__files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_folder` tinyint(1) NOT NULL DEFAULT '0',
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mimetype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media__files`
--

LOCK TABLES `media__files` WRITE;
/*!40000 ALTER TABLE `media__files` DISABLE KEYS */;
/*!40000 ALTER TABLE `media__files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media__imageables`
--

DROP TABLE IF EXISTS `media__imageables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media__imageables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media__imageables`
--

LOCK TABLES `media__imageables` WRITE;
/*!40000 ALTER TABLE `media__imageables` DISABLE KEYS */;
/*!40000 ALTER TABLE `media__imageables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu__menu_translations`
--

DROP TABLE IF EXISTS `menu__menu_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu__menu_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu__menu_translations_menu_id_locale_unique` (`menu_id`,`locale`),
  KEY `menu__menu_translations_locale_index` (`locale`),
  CONSTRAINT `menu__menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu__menu_translations`
--

LOCK TABLES `menu__menu_translations` WRITE;
/*!40000 ALTER TABLE `menu__menu_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu__menu_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu__menuitem_translations`
--

DROP TABLE IF EXISTS `menu__menuitem_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu__menuitem_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu__menuitem_translations_menuitem_id_locale_unique` (`menuitem_id`,`locale`),
  KEY `menu__menuitem_translations_locale_index` (`locale`),
  CONSTRAINT `menu__menuitem_translations_menuitem_id_foreign` FOREIGN KEY (`menuitem_id`) REFERENCES `menu__menuitems` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu__menuitem_translations`
--

LOCK TABLES `menu__menuitem_translations` WRITE;
/*!40000 ALTER TABLE `menu__menuitem_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu__menuitem_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu__menuitems`
--

DROP TABLE IF EXISTS `menu__menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu__menuitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page',
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu__menuitems_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu__menuitems_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu__menuitems`
--

LOCK TABLES `menu__menuitems` WRITE;
/*!40000 ALTER TABLE `menu__menuitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu__menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu__menus`
--

DROP TABLE IF EXISTS `menu__menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu__menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu__menus`
--

LOCK TABLES `menu__menus` WRITE;
/*!40000 ALTER TABLE `menu__menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu__menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_07_02_230147_migration_cartalyst_sentinel',1),(2,'2016_06_24_193447_create_user_tokens_table',1),(3,'2014_10_14_200250_create_settings_table',2),(4,'2014_10_15_191204_create_setting_translations_table',2),(5,'2015_06_18_170048_make_settings_value_text_field',2),(6,'2015_10_22_130947_make_settings_name_unique',2),(7,'2017_09_17_164631_make_setting_value_nullable',2),(8,'2014_11_03_160015_create_menus_table',3),(9,'2014_11_03_160138_create_menu-translations_table',3),(10,'2014_11_03_160753_create_menuitems_table',3),(11,'2014_11_03_160804_create_menuitem_translation_table',3),(12,'2014_12_17_185301_add_root_column_to_menus_table',3),(13,'2015_09_05_100142_add_icon_column_to_menuitems_table',3),(14,'2016_01_26_102307_update_icon_column_on_menuitems_table',3),(15,'2016_08_01_142345_add_link_type_colymn_to_menuitems_table',3),(16,'2016_08_01_143130_add_class_column_to_menuitems_table',3),(17,'2017_09_18_192639_make_title_field_nullable_menu_table',3),(18,'2014_10_26_162751_create_files_table',4),(19,'2014_10_26_162811_create_file_translations_table',4),(20,'2015_02_27_105241_create_image_links_table',4),(21,'2015_12_19_143643_add_sortable',4),(22,'2017_09_20_144631_add_folders_columns_on_files_table',4),(23,'2014_11_30_191858_create_pages_tables',5),(24,'2017_10_13_103344_make_status_field_nullable_on_page_translations_table',5),(25,'2018_05_23_145242_edit_body_column_nullable',5),(26,'2015_04_02_184200_create_widgets_table',6),(27,'2013_04_09_062329_create_revisions_table',7),(28,'2015_11_20_184604486385_create_translation_translations_table',7),(29,'2015_11_20_184604743083_create_translation_translation_translations_table',7),(30,'2015_12_01_094031_update_translation_translations_table_with_index',7),(31,'2016_07_12_181155032011_create_tag_tags_table',8),(32,'2016_07_12_181155289444_create_tag_tag_translations_table',8),(33,'2019_11_27_174410639585_create_pipelines_sources_table',9),(34,'2019_11_27_174411432065_create_pipelines_countries_table',9),(35,'2019_11_27_174412232669_create_pipelines_companies_table',9),(36,'2019_11_27_174412232671_create_pipelines_contacts_table',9),(37,'2019_11_27_174413857801_create_pipelines_typebusinesses_table',9),(38,'2019_11_27_174414720259_create_pipelines_businesses_table',9),(39,'2019_11_27_174415601874_create_pipelines_products_table',9),(40,'2019_11_27_174416422413_create_pipelines_detailbusinesses_table',9),(41,'2019_11_27_174417296914_create_pipelines_pipelines_table',9),(42,'2019_11_27_174418192401_create_pipelines_pipelinebusinesses_table',9),(43,'2019_11_27_174419030956_create_pipelines_phones_table',9),(44,'2019_11_27_174419910399_create_pipelines_emails_table',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page__page_translations`
--

DROP TABLE IF EXISTS `page__page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page__page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `body` text COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page__page_translations_page_id_locale_unique` (`page_id`,`locale`),
  KEY `page__page_translations_locale_index` (`locale`),
  CONSTRAINT `page__page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `page__pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page__page_translations`
--

LOCK TABLES `page__page_translations` WRITE;
/*!40000 ALTER TABLE `page__page_translations` DISABLE KEYS */;
INSERT INTO `page__page_translations` VALUES (1,1,'en','Home page','home','1','<p><strong>You made it!</strong></p>\n<p>You&#39;ve installed AsgardCMS and are ready to proceed to the <a href=\"/en/backend\">administration area</a>.</p>\n<h2>What&#39;s next ?</h2>\n<p>Learn how you can develop modules for AsgardCMS by reading our <a href=\"https://github.com/AsgardCms/Documentation\">documentation</a>.</p>\n','Home page',NULL,NULL,NULL,NULL,NULL,'2019-11-28 08:56:14','2019-11-28 08:56:14');
/*!40000 ALTER TABLE `page__page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page__pages`
--

DROP TABLE IF EXISTS `page__pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page__pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page__pages`
--

LOCK TABLES `page__pages` WRITE;
/*!40000 ALTER TABLE `page__pages` DISABLE KEYS */;
INSERT INTO `page__pages` VALUES (1,1,'home','2019-11-28 08:56:14','2019-11-28 08:56:14');
/*!40000 ALTER TABLE `page__pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistences`
--

DROP TABLE IF EXISTS `persistences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistences`
--

LOCK TABLES `persistences` WRITE;
/*!40000 ALTER TABLE `persistences` DISABLE KEYS */;
INSERT INTO `persistences` VALUES (1,1,'2ea4GI0qwE9ADHefcThqFlfEHepoDdR6','2019-11-28 08:58:43','2019-11-28 08:58:43'),(2,1,'xeweaoPiwxCDaOZqvP7AdbcS24FKH7mS','2019-11-28 08:59:46','2019-11-28 08:59:46'),(3,1,'110PQJhJRcwvW1Hs1pZmaNPtVIyOvGhz','2019-11-28 08:59:48','2019-11-28 08:59:48'),(4,1,'fAE8dFelcSglpLhC0bY7HFmhMBm8hb1w','2019-11-28 08:59:49','2019-11-28 08:59:49'),(5,1,'PTdthdikhbSpyLnKSda68hogBkQmxxww','2019-11-28 09:00:16','2019-11-28 09:00:16'),(6,1,'bZdCPpaQIkcq2LexprDeVmwKSYwWJQcu','2019-11-28 09:00:17','2019-11-28 09:00:17'),(7,1,'MXbCYdZ2n6DyumdbJ9pI3MV3VE39m9tu','2019-11-28 09:00:37','2019-11-28 09:00:37'),(8,1,'k4oCkRAbCwCYnbiEPqmbnIwW0aOonykw','2019-11-28 16:44:12','2019-11-28 16:44:12'),(9,1,'X6YBzuLkcertypbuck2Hnn0oFmxQmkSe','2019-11-28 17:03:42','2019-11-28 17:03:42'),(10,1,'IReWrJjRyDptZi6eTxmJryzwNgV0dd7Y','2019-11-28 17:03:44','2019-11-28 17:03:44'),(11,1,'xMW3iARQdHGnoEeMenvCFdFhUJBC0wG1','2019-11-28 17:03:44','2019-11-28 17:03:44'),(12,1,'4mwrN0S2ckiTLnuizeDCRoE3DIko3a5D','2019-11-28 17:04:52','2019-11-28 17:04:52'),(13,1,'2Y7aEB5vBa2McPOvkz0GSvhDuy5sDvvP','2019-11-28 17:04:53','2019-11-28 17:04:53'),(14,1,'6XA9mhYxRmfcWOoj4Bzn2qqHDh9DKgSO','2019-11-28 17:05:01','2019-11-28 17:05:01'),(15,1,'KMr6GS8CKeaC3TKkQeLX6ECXKaXa3nTn','2019-11-28 17:05:02','2019-11-28 17:05:02'),(16,1,'p8ZUqUAfln8b3BTlbT66wx1lXXXxLnt5','2019-11-28 17:05:20','2019-11-28 17:05:20'),(17,1,'RH9QU4HC4lFOv8XpiK7iliZy3rnbk9iE','2019-11-28 17:05:20','2019-11-28 17:05:20'),(18,1,'fMBRkGl4zu8UJkQGZkQkDt5RlBK4VMs1','2019-11-28 21:05:40','2019-11-28 21:05:40'),(19,1,'Rkk0dxeUnsyIq08Nw4RizoJbBLyuqz6o','2019-11-29 01:23:23','2019-11-29 01:23:23'),(20,1,'baLV0Ad9Vg4oO8YyLS8vhalLa0ogI9PA','2019-11-29 01:24:52','2019-11-29 01:24:52'),(21,1,'3gemJkDGKUP1QJiZkZHK6YATzyoAtwUy','2019-11-29 01:24:57','2019-11-29 01:24:57'),(22,1,'qB4Mh8uWLVCIbhtjDaHAloYFyYR9nRJd','2019-11-29 01:24:57','2019-11-29 01:24:57'),(23,1,'7Eib4UCsBBbfyblCsYxX8HYjL49IAtBr','2019-11-29 01:25:29','2019-11-29 01:25:29'),(24,1,'vadRLAvebXo3KarlrJ4olcGd1d4mrUJb','2019-11-29 01:26:05','2019-11-29 01:26:05'),(25,1,'9Wc2yhkz3T5kH6pB50JSBsNuxU2uCdH5','2019-11-29 01:26:06','2019-11-29 01:26:06'),(26,1,'e0CnIF8fFPgjDILd5Xz2jCTdjDCoezu0','2019-11-29 01:26:10','2019-11-29 01:26:10'),(27,1,'fd8XtNhAJZwdMQkiK8EI6vAzZw5wczQp','2019-11-29 01:26:10','2019-11-29 01:26:10'),(28,1,'kop58Y5V1yJ73liBxkApgj4q8d4qlYaS','2019-11-29 01:26:25','2019-11-29 01:26:25'),(29,1,'VYT7YTh2fYfYsJk2wEglJHnzwkytRAMa','2019-11-29 01:26:26','2019-11-29 01:26:26'),(30,1,'m9ADGjVZ7sJlquL37yhK0eWhgHqVexVH','2019-11-29 01:26:29','2019-11-29 01:26:29'),(31,1,'nK5iOg87VaZMAbIQG2XwL8dBa9RT3uPo','2019-11-29 01:26:37','2019-11-29 01:26:37'),(32,1,'8bXzbhdqvbR9NlOmIujvQoCwElu1jaGs','2019-11-29 01:26:37','2019-11-29 01:26:37'),(33,1,'sJDnNC5O2SH97Dja9fMMePOo3RH2a2EP','2019-11-29 01:26:55','2019-11-29 01:26:55'),(34,1,'IT13r82cjTzcF9AONbdSV4w8eixLi3Jq','2019-11-29 01:26:56','2019-11-29 01:26:56'),(35,1,'MiPlR0lQoW8vVnQiXWWGbRBP22cxDnHH','2019-11-29 01:26:59','2019-11-29 01:26:59'),(36,1,'Rt9yKq2CzWtBvxXKd9DB6TrEsEZ0SOLO','2019-11-29 01:30:16','2019-11-29 01:30:16'),(37,1,'0rDaOQxrSReQCZbaWmUD1gP4j5fyDE4m','2019-11-29 01:44:22','2019-11-29 01:44:22'),(38,1,'VDcTFFi6C2fwtRF2vARdvwNmpQ7aJIKY','2019-11-29 01:44:35','2019-11-29 01:44:35'),(39,1,'ElSAcBgLzNSYyFNT5nVwOVjLiZP5NURe','2019-11-29 01:44:41','2019-11-29 01:44:41'),(40,1,'1593627a2HAH6xDXVpU8zGaliI41EbH1','2019-11-29 01:44:41','2019-11-29 01:44:41'),(41,1,'tf7wog7jvzh00nAmAemcUbp3yV0SVxek','2019-11-29 01:44:41','2019-11-29 01:44:41'),(42,1,'OrwX8SrBcOTW2jKUHILpG6rAACrqHm8K','2019-11-29 02:02:32','2019-11-29 02:02:32'),(43,1,'r8rFm11TFgXIs6vtq0LSHk119R5IvSgi','2019-11-29 02:02:36','2019-11-29 02:02:36'),(44,1,'WZKK3PoMPs4XueCVVRC70KGYbEdfGPN4','2019-11-29 02:37:20','2019-11-29 02:37:20'),(45,1,'IFxtMsHBUjDjBTW3uXUWeF5kJG4gdq4H','2019-11-29 02:37:24','2019-11-29 02:37:24'),(46,1,'Hzpe5h1usgF60X0wr9ebFJXALRJLDybj','2019-11-29 02:37:24','2019-11-29 02:37:24'),(47,1,'iNCzhGbkCkju8XFfWO0MC2lfUPqTYVM4','2019-11-29 02:37:24','2019-11-29 02:37:24'),(48,1,'HAeEyDmO4H0B8HYGerLUALgjUDxmPmo2','2019-11-29 02:37:56','2019-11-29 02:37:56'),(49,1,'6AjjgaZalnkYwn3krLVQMHQubclpc1mt','2019-11-29 02:37:57','2019-11-29 02:37:57'),(50,1,'2ZvNMBfAo0Wa6aHAQPtMDnJpIcDWIHlb','2019-11-29 02:38:00','2019-11-29 02:38:00'),(51,1,'aGXe4F1AgUNQ1E11iHzpV9TInInLWE8X','2019-11-29 02:38:00','2019-11-29 02:38:00'),(52,1,'GwZxFtF8HPcGGQqydHxqJ7DfyLa6KSMX','2019-11-29 02:38:00','2019-11-29 02:38:00'),(53,1,'OEvT9HtvGnunWk1viRFTL0Zl5bkLdxll','2019-11-29 02:38:30','2019-11-29 02:38:30'),(54,1,'pqsSrngwNWz9AuozX5XMwEra35Jkx8AX','2019-11-29 02:38:31','2019-11-29 02:38:31'),(55,1,'aGrbzbF1z6yH7wxZ8q8fN7FamQBd4pgZ','2019-11-29 02:38:39','2019-11-29 02:38:39'),(56,1,'ctV6FXLc6DHZnvH4iGF1kjQBBZtYpYhg','2019-11-29 03:06:55','2019-11-29 03:06:55'),(57,1,'RlGSfB3hpTCXllfs4iJFXj1UmOI2mWeT','2019-11-29 03:06:58','2019-11-29 03:06:58'),(58,1,'blzfhoUuBTcuaX8s51rKTwr6LYHjKKjS','2019-11-29 03:07:06','2019-11-29 03:07:06'),(59,1,'vnHVkJVBSbP1pTYtDy0pZm2FqFylDoCa','2019-11-29 03:07:37','2019-11-29 03:07:37'),(60,1,'mwTuzhyHZ7SquTyVHvcUKhYizrpNNLiC','2019-11-29 03:52:31','2019-11-29 03:52:31'),(61,1,'jbvowGH2NgFgTtCVu21PeX7I1xjjklVf','2019-11-29 03:55:55','2019-11-29 03:55:55'),(63,1,'4mDjE4VfHF0tvdNFg3bYzq65hPJFGUT0','2019-11-29 12:00:15','2019-11-29 12:00:15'),(64,1,'z1z44imSF9sHbKIHgwBqNgzPM357qyj0','2019-11-29 12:00:21','2019-11-29 12:00:21'),(65,1,'T1nwAVCPmWlJEJDv0TYbiQB64Y43d336','2019-11-29 12:00:21','2019-11-29 12:00:21'),(66,1,'W9xzlXLMVmyzeGLSNLjzP5d3x8fmQ82p','2019-11-29 12:00:21','2019-11-29 12:00:21'),(67,1,'m59t3uJYxL9RIc3fiym6wGTWVGe0wdhH','2019-11-29 14:49:37','2019-11-29 14:49:37'),(68,1,'r6FgRn0F6LMyvflop2KrPXWEBWeskNcy','2019-11-29 14:49:39','2019-11-29 14:49:39'),(69,1,'YSsOQGKvFQMq6sokSZBmhWYEvIT2DkvD','2019-11-29 14:49:42','2019-11-29 14:49:42'),(70,1,'LttKsjns65zysFKkqsaaUEpuqd0FZUCV','2019-11-29 14:49:42','2019-11-29 14:49:42'),(71,1,'qw9afvU6pGPpfrOfh8fHsmIReGxDg9gD','2019-11-29 14:49:42','2019-11-29 14:49:42'),(72,1,'vVdoXt2T3g6sIBs6V1fdgwhKbiOvHIp3','2019-11-29 14:49:50','2019-11-29 14:49:50'),(73,1,'KAnTifC6V5FHnDVPKN6lZD01PyT4Z36o','2019-11-29 14:50:00','2019-11-29 14:50:00'),(74,1,'woz0S3fTQXF2RXZ10eyiipbhzfH1HPuc','2019-11-29 14:50:02','2019-11-29 14:50:02'),(75,1,'kW12Po4BxS6oIokH9spYpfsQPQ1pOLvD','2019-11-29 14:50:04','2019-11-29 14:50:04'),(76,1,'mGESC2Udse65f6uBo8mq61x95YmWZ4mf','2019-11-29 14:50:04','2019-11-29 14:50:04'),(77,1,'9jYbOIZBPjEK9trFk4xkS1FMPqg9N0q8','2019-11-29 14:50:04','2019-11-29 14:50:04'),(78,1,'SN3Z6z8WDjMxv2UzJqGZFLO5MApXNKrl','2019-11-29 14:50:09','2019-11-29 14:50:09'),(79,1,'VY9HYAaJJ34cGNP9oBczwslvbIyXnLi4','2019-11-29 14:50:11','2019-11-29 14:50:11'),(80,1,'758XPKbCBvYG55jLxJgBNqOvAKC5aOBb','2019-11-29 14:50:17','2019-11-29 14:50:17'),(81,1,'bX1j4zqHgm3pNTx2k6ir7LnmumqNKu1J','2019-11-29 14:50:20','2019-11-29 14:50:20'),(82,1,'FTRSyufaZXldxiqbsufiZPllFaBaCAQP','2019-11-29 14:50:20','2019-11-29 14:50:20'),(83,1,'xqvej2gKv7AvrejrUusyLJX7nQBI6W0n','2019-11-29 14:50:20','2019-11-29 14:50:20'),(84,1,'xZHmYUSuoqHfeYJ7mcqrj3D03qnBOQHg','2019-11-29 14:50:32','2019-11-29 14:50:32'),(85,1,'lFHMEJhejZWGryWAdvIj0Hvy7Nan2RTp','2019-11-29 14:50:35','2019-11-29 14:50:35'),(86,1,'53ydwRLaHrHNnEkyowPent8Pxs9yAvlM','2019-11-29 14:50:36','2019-11-29 14:50:36'),(87,1,'ggR14Rq9pkZ4fXCyoeirp3hVsgB3HjiV','2019-11-29 14:50:36','2019-11-29 14:50:36'),(88,1,'xlecKRhqm7qQ08A9fPEWrIvS8vmJbn3x','2019-11-29 14:51:13','2019-11-29 14:51:13'),(89,1,'0a5dPYGKWCFxPVkuhqeke6clnblycEOV','2019-11-29 14:51:28','2019-11-29 14:51:28'),(90,1,'ozcX8WkQ1AygUpvWb5QyZMANQ8hHzKPE','2019-11-29 14:51:31','2019-11-29 14:51:31'),(91,1,'ONAVBuXtzn6nGeobZ735hkvX4AVsk3DM','2019-11-29 14:51:31','2019-11-29 14:51:31'),(92,1,'hBUOFyk32opkeCcwq3fTNOoTK4bTM1lH','2019-11-29 14:51:54','2019-11-29 14:51:54'),(93,1,'lqHjvUeU6jZPPtBSb3op30M3JC7wRxQg','2019-11-29 14:51:58','2019-11-29 14:51:58'),(94,1,'M1wdScf4mjT3O8q2RoCQhvJ4uJEzMuXl','2019-11-29 14:51:58','2019-11-29 14:51:58'),(95,1,'p0K7aJrAk9bQSUd09eeryotnNtdhwX4k','2019-11-29 14:52:09','2019-11-29 14:52:09'),(96,1,'kENnnBwtd4ty5TqBRGE1PaRc23j0Zs48','2019-11-29 14:52:15','2019-11-29 14:52:15'),(97,1,'JCaFaQZdBUc5alax5cdTJPhQSulG7Vmd','2019-11-29 14:52:15','2019-11-29 14:52:15'),(98,1,'QovpxdXJ20yFRSIKEyVYmFG4YICDezik','2019-11-29 14:52:24','2019-11-29 14:52:24'),(99,1,'ScGIvrIyRaDw1ymtNUQykOH40aaIknGL','2019-11-29 14:52:24','2019-11-29 14:52:24'),(100,1,'DwijKIQuo7OJ8QQ1OPVXXDmCkfhwVJP0','2019-11-29 14:52:34','2019-11-29 14:52:34'),(101,1,'5Fu1FmIoElYpxuoukvjaXSPvZZYxnxjg','2019-11-29 14:52:44','2019-11-29 14:52:44'),(102,1,'lHDjPmDmChhxzmCPjyJMT3CJCjuG0aL0','2019-11-29 14:52:44','2019-11-29 14:52:44'),(103,1,'oZpyYPLGZkaeg7mFzk3XYDFjRE4T63vK','2019-11-29 14:52:44','2019-11-29 14:52:44'),(104,1,'wUhrUKEuVFv6ZfGngMKgSpdkzyz7aXpu','2019-11-29 14:52:50','2019-11-29 14:52:50'),(105,1,'TFeECZ5lEtn5oG4OSbfdVPY3vavZ4Qfj','2019-11-29 14:52:58','2019-11-29 14:52:58'),(106,1,'izIx9z4x4Yfr6C3asIUYXrMy6Z8hPFax','2019-11-29 14:53:05','2019-11-29 14:53:05'),(107,1,'oYUA0L80vYXyNmLpFdDBYg0ZOTtxy2PE','2019-11-29 14:53:30','2019-11-29 14:53:30'),(108,1,'mqSoViMVLiKsHrfUQGf0tuHVwjF5tz9z','2019-11-29 14:53:32','2019-11-29 14:53:32'),(109,1,'Iez707BVJZwjLdf7ApTgc7cPcpGaZWzM','2019-11-29 14:53:32','2019-11-29 14:53:32'),(110,1,'KJ7hCojUYlNdlTv99vCoeS4PcEQplxTJ','2019-11-29 14:53:32','2019-11-29 14:53:32'),(111,1,'lH1FbL3SE2WaIHP75ypEkfKe5trq1Vwz','2019-11-29 14:53:40','2019-11-29 14:53:40'),(112,1,'dEGdIra2CBesEpVsDvi24rYGvWPQvc3L','2019-11-29 14:53:45','2019-11-29 14:53:45'),(113,1,'YLEgtVI3BADE9HQTwA6R8jH84wAqQ59w','2019-11-29 14:53:57','2019-11-29 14:53:57'),(114,1,'u9lQcorWUCCIUHXChwZJSRfUsKwYQ9kO','2019-11-29 14:53:58','2019-11-29 14:53:58'),(115,1,'BL5QrSILMPKfeiHcmnciwXWZzKNdOXcn','2019-11-29 14:54:05','2019-11-29 14:54:05'),(116,1,'gxZK2pcyHVNQ0cDATRYGwIfocdwvoTVz','2019-11-29 14:54:05','2019-11-29 14:54:05'),(117,1,'2UK3TjKVeHemcEYngZs8QzE3ZxfiGREQ','2019-11-29 14:54:05','2019-11-29 14:54:05'),(118,1,'691cyo9Cx6P6DAfMMzka6slEjFpW0x78','2019-11-29 14:55:23','2019-11-29 14:55:23'),(119,1,'6pFVclbPjUk2E5rP5nROjYosKM1kMeBj','2019-11-29 14:55:26','2019-11-29 14:55:26'),(120,1,'nJoWaOkDTYfksAZW9yDjcqr7RPA7N12Q','2019-11-29 14:55:28','2019-11-29 14:55:28'),(121,1,'bfrMlv3KvlcYCcL8oE4cf9YTtCZGAYDQ','2019-11-29 14:55:37','2019-11-29 14:55:37'),(122,1,'pTiRbCq2hSKTI9HTj58FikqrOyfeg42e','2019-11-29 14:55:45','2019-11-29 14:55:45'),(123,1,'JMoiVcrYztSF6pi3O86n64hIz3Odwd3U','2019-11-29 14:56:12','2019-11-29 14:56:12'),(124,1,'LtRvdOnnxhJ1Slt53Kc6pf8G82G6f8Qw','2019-11-29 14:56:19','2019-11-29 14:56:19'),(125,1,'xxBzShCQAloBBoMjCU6IYPa642sWaF3l','2019-11-29 14:58:34','2019-11-29 14:58:34'),(126,1,'b7gmfIOi0h5sx7mBp2PuvZSpZll1qB6K','2019-11-29 14:58:46','2019-11-29 14:58:46'),(127,1,'yONPmZs0gbbdKCucanA9wDSBQEPL37Rt','2019-11-29 14:58:49','2019-11-29 14:58:49'),(128,1,'b9bJPI1CILWgZlH6H1pUzEWkKYejpSgs','2019-11-29 14:58:49','2019-11-29 14:58:49'),(129,1,'7lHYxX9e8agybRwgh0I3QTnclu3qXEpN','2019-11-29 14:58:56','2019-11-29 14:58:56'),(130,1,'Jy1GYtQe14qYerVmryY8dx26RLfCj65E','2019-11-29 14:58:56','2019-11-29 14:58:56'),(131,1,'OUxBVztjairmmX0xwHtRn7KjSoznRH8E','2019-11-29 14:59:39','2019-11-29 14:59:39'),(132,1,'iLHSNAEcyZooYZK6jGqLtJa320Ijv3Z3','2019-11-29 14:59:45','2019-11-29 14:59:45'),(133,1,'2rfzpQGvu25Sgx9guZdCFO9HuXhDSKOU','2019-11-29 14:59:45','2019-11-29 14:59:45'),(134,1,'LKvt9AmZ0Arg8AiLtPazVwPzEaKd4gFq','2019-11-29 14:59:45','2019-11-29 14:59:45'),(135,1,'slEbrJBi1hSkR9Rgrtf4NbTNEWfjsZJ1','2019-11-29 14:59:55','2019-11-29 14:59:55'),(136,1,'KIi8Onpd400IjeGzzS3ZVg5XaGRy8FJJ','2019-11-29 14:59:57','2019-11-29 14:59:57'),(137,1,'F1a9dWXQYX9CHgtAjsrmIUt24sLJtFhj','2019-11-29 15:00:20','2019-11-29 15:00:20'),(138,1,'SQnyKcCcELrus5HLCDizRli5IRjg8Np8','2019-11-29 15:00:20','2019-11-29 15:00:20'),(139,1,'Bo0YNLFcRardyshGzKc0kH4m2brKZfp5','2019-11-29 15:00:20','2019-11-29 15:00:20'),(140,1,'LnTVkCeVM2b4ofm8tHL3sVG9kEKx2Txy','2019-11-29 15:00:21','2019-11-29 15:00:21'),(141,1,'AEvLed6c8LQ9JiTpU48ssPH9KzkkOonj','2019-11-29 15:00:58','2019-11-29 15:00:58'),(142,1,'2bb9rQdClMOoKGI75j0iZ8C8pOrQmTI4','2019-11-29 15:00:59','2019-11-29 15:00:59'),(143,1,'jUHoTxxOJuHwiFOQdyQfAFtf0OIPdgAV','2019-11-29 15:01:03','2019-11-29 15:01:03'),(144,1,'XNXbQZOVCNngp8L17UTtW1h99YkNZMKP','2019-11-29 15:01:03','2019-11-29 15:01:03'),(145,1,'ozvAO1KGKviNEMvL5hGmuiwmJgb0UaMo','2019-11-29 15:01:03','2019-11-29 15:01:03'),(146,1,'N7Dco6GYksSMcSGlogYO2vTBXt62ZSzq','2019-11-29 15:01:11','2019-11-29 15:01:11'),(147,1,'UVvuuk69ReojfNQ9dds2FrvhLvRsjs4N','2019-11-29 15:01:15','2019-11-29 15:01:15'),(148,1,'X0UEJi8vk2YM4uAqxs6SDUDXf4q8M3nS','2019-11-29 15:01:18','2019-11-29 15:01:18'),(149,1,'7Ymr2ZBTuA9ElsOk22gxxxC7XhJnLG2Y','2019-11-29 15:01:20','2019-11-29 15:01:20'),(150,1,'hOC7zvFvwuL8cQPjwRuL8B2XnqXnfQcW','2019-11-29 15:01:23','2019-11-29 15:01:23'),(151,1,'TO0N7Wl4n2VE5PWLunn6ltucORHjhIsk','2019-11-29 15:01:23','2019-11-29 15:01:23'),(152,1,'myaJtEm5XmB5siTpiZHCf3gVImK4uTvC','2019-11-29 15:01:23','2019-11-29 15:01:23'),(153,1,'LPQcS3qCwxr9MWch6aHmQFNNb2Vb3wUH','2019-11-29 15:01:34','2019-11-29 15:01:34'),(154,1,'YKw2kVWk5R0H3A5CnCI7iS5BmojwV9qK','2019-11-29 15:01:45','2019-11-29 15:01:45'),(155,1,'peDXF4gXjLufXxCf20nvqpoHMJtitvN1','2019-11-29 15:02:20','2019-11-29 15:02:20'),(156,1,'OrxnsYJBsfTZXWYcqH0HFKU31XPyGoyK','2019-11-29 15:02:35','2019-11-29 15:02:35'),(157,1,'zakJtGpU8JBeudXsTDvClV7MnC89UUGw','2019-11-29 15:02:37','2019-11-29 15:02:37'),(158,1,'pZp9gTERpwAE3iw64dQijJPxH9F2IiEE','2019-11-29 15:02:37','2019-11-29 15:02:37'),(159,1,'vDBNcW0NYeqmDTwg6fVV0UGcUmR2H71Q','2019-11-29 15:02:37','2019-11-29 15:02:37'),(160,1,'UodQEbr7CKlGXVdnCCLwDlaSXJ7MLaAf','2019-11-29 15:03:03','2019-11-29 15:03:03'),(161,1,'yAbrQvoAJMjigJySJB4JCZUorRqXd6aH','2019-11-29 15:03:04','2019-11-29 15:03:04'),(162,1,'daAflO9bXNSzPaVwOGymBnclIszeFEW8','2019-11-29 15:03:04','2019-11-29 15:03:04'),(163,1,'1MAPhfCJhiRqGg3AtEFLAr6uSFF9Xdfe','2019-11-29 15:03:04','2019-11-29 15:03:04'),(164,1,'KwcT6u4Ja3ms9QF007A580mwdB0FZBl7','2019-11-29 15:03:10','2019-11-29 15:03:10'),(165,1,'Mq0bOEtdwJRJjnvihtWaFmNrVl4ajmfy','2019-11-29 15:03:12','2019-11-29 15:03:12'),(166,1,'9cpLnlOnT6PvyCWFnsOK7X1XrXT8KJmL','2019-11-29 15:03:12','2019-11-29 15:03:12'),(167,1,'AxA2nRxUWkyA1cm29A39pFftATAUtb3G','2019-11-29 15:04:21','2019-11-29 15:04:21'),(168,1,'eRVcbb1xlIDDbNDWA99zdvQ4LexxEffj','2019-11-29 15:04:21','2019-11-29 15:04:21'),(169,1,'Aksj2aAzbBOzLSa0ZhvEHtn28ZZPg0Qi','2019-11-29 15:04:25','2019-11-29 15:04:25'),(170,1,'EE04bdvCU867RJfTGyT1vlXZ1DfF1kUU','2019-11-29 15:04:34','2019-11-29 15:04:34'),(171,1,'FWm41nCSicLo2jCTDA4uH2moNlQUBvV5','2019-11-29 15:04:34','2019-11-29 15:04:34'),(172,1,'4rb0y4sv2dTfkV2Yb58NFIHdBFwC0Wtx','2019-11-29 15:04:34','2019-11-29 15:04:34'),(173,1,'6AKsGNJGyNPi5ZZEHS0ynzXGkPEgAicw','2019-11-29 15:04:43','2019-11-29 15:04:43'),(174,1,'G5oP2lrsYAkgFdzIsIkQXf2TmU6rZwRP','2019-11-29 15:04:52','2019-11-29 15:04:52'),(175,1,'0asx3r2Mrpl620G4JxuVwFCNSHx2BTyw','2019-11-29 15:05:04','2019-11-29 15:05:04'),(176,1,'vri8d0um6ExY3EbFtpDF3wVh5A0UWD8G','2019-11-29 15:05:15','2019-11-29 15:05:15'),(177,1,'i395z4FtrT5uyN1svsyeqXD4fxXmhoU2','2019-11-29 15:08:13','2019-11-29 15:08:13'),(178,1,'n9X5TuLP7OFp0EtOR2pPxSF3FEmrCUOz','2019-11-29 15:08:14','2019-11-29 15:08:14'),(179,1,'laqO66z1HTM7KHQ7Tdvslrsk5Qtayj6A','2019-11-29 15:10:27','2019-11-29 15:10:27'),(180,1,'Ckio626UcbGYNIcbTrE8UbzokcB1piCN','2019-11-29 15:10:27','2019-11-29 15:10:27'),(181,1,'QRFY4GWsVNjzi3ZQNKyEoZifObGGGqgl','2019-11-29 15:10:27','2019-11-29 15:10:27'),(182,1,'RtNdaLoMrvYTdVGqfFpZrS4jy5znJd07','2019-11-29 15:10:31','2019-11-29 15:10:31'),(183,1,'i6ZbC6QRc2LAZYXYuwBWOlNS0N7UQF1f','2019-11-29 15:10:34','2019-11-29 15:10:34'),(184,1,'YQm3UvmWAiIy0wHVU3daLdrP61a2v3AD','2019-11-29 15:10:34','2019-11-29 15:10:34'),(185,1,'Gm869DwyywYNmN7RcJpl1gdFM5EUHfDI','2019-11-29 15:10:34','2019-11-29 15:10:34'),(186,1,'SIv2uo30GPJXGW0VAuYekn7sgaFfHtKs','2019-11-29 15:10:37','2019-11-29 15:10:37'),(187,1,'SVPV23d3e1RFD2kkwMZvT13nMuDUT9Ov','2019-11-29 15:54:10','2019-11-29 15:54:10'),(188,1,'2YHg1mZjB5vWrEDTJgYNr3ary3wRw5Aw','2019-11-29 15:54:14','2019-11-29 15:54:14'),(189,1,'Lc6g0pzOawOMlvppWVHxGjkzLuQBR07b','2019-11-29 15:54:14','2019-11-29 15:54:14'),(190,1,'5uZLyjvVGbj2uk3LduhETfExteTWa2nM','2019-11-29 15:54:14','2019-11-29 15:54:14'),(191,1,'lXaOAraEdwnCM7N8RVJGVJy8VEsNDdRw','2019-11-29 15:54:20','2019-11-29 15:54:20'),(192,1,'2bIhlwCzWus05XfUiiCKk74NqOmGqJx2','2019-11-29 15:54:20','2019-11-29 15:54:20'),(193,1,'bOhCpujRaQrXrjG7zBVJpm86xYybWgKv','2019-11-29 15:55:56','2019-11-29 15:55:56'),(194,1,'Z5gAMS6wgs6AMuThvafGvySRYO6MUxbz','2019-11-29 15:55:56','2019-11-29 15:55:56'),(195,1,'EeZ0mCUfQeF18ym7iVAzcm7fmu5qV9nu','2019-11-29 15:55:56','2019-11-29 15:55:56');
/*!40000 ALTER TABLE `persistences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__businesses`
--

DROP TABLE IF EXISTS `pipelines__businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__businesses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipelines__businesses_type_id_foreign` (`type_id`),
  KEY `pipelines__businesses_contact_id_foreign` (`contact_id`),
  KEY `pipelines__businesses_seller_id_foreign` (`seller_id`),
  CONSTRAINT `pipelines__businesses_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `pipelines__contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pipelines__businesses_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pipelines__businesses_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `pipelines__typebusinesses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__businesses`
--

LOCK TABLES `pipelines__businesses` WRITE;
/*!40000 ALTER TABLE `pipelines__businesses` DISABLE KEYS */;
INSERT INTO `pipelines__businesses` VALUES (1,'Contacto test',1,1,4,'2019-11-28 17:09:32','2019-11-29 15:28:19'),(2,'Facebook test',NULL,2,1,'2019-11-28 17:43:48','2019-11-28 17:43:48');
/*!40000 ALTER TABLE `pipelines__businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__companies`
--

DROP TABLE IF EXISTS `pipelines__companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `type_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subdomain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipelines__companies_country_id_foreign` (`country_id`),
  KEY `pipelines__companies_source_id_foreign` (`source_id`),
  KEY `pipelines__companies_seller_id_foreign` (`seller_id`),
  CONSTRAINT `pipelines__companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `pipelines__countries` (`id`),
  CONSTRAINT `pipelines__companies_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pipelines__companies_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `pipelines__sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__companies`
--

LOCK TABLES `pipelines__companies` WRITE;
/*!40000 ALTER TABLE `pipelines__companies` DISABLE KEYS */;
INSERT INTO `pipelines__companies` VALUES (1,'Empresa','Cali',1,NULL,1,1,NULL,NULL,NULL,'test@test.com','12345678','2019-11-28 16:47:38','2019-11-28 16:47:38');
/*!40000 ALTER TABLE `pipelines__companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__contacts`
--

DROP TABLE IF EXISTS `pipelines__contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_wa` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `source_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `added_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipelines__contacts_company_id_foreign` (`company_id`),
  KEY `pipelines__contacts_country_id_foreign` (`country_id`),
  KEY `pipelines__contacts_source_id_foreign` (`source_id`),
  KEY `pipelines__contacts_seller_id_foreign` (`seller_id`),
  CONSTRAINT `pipelines__contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `pipelines__companies` (`id`),
  CONSTRAINT `pipelines__contacts_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `pipelines__countries` (`id`),
  CONSTRAINT `pipelines__contacts_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pipelines__contacts_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `pipelines__sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__contacts`
--

LOCK TABLES `pipelines__contacts` WRITE;
/*!40000 ALTER TABLE `pipelines__contacts` DISABLE KEYS */;
INSERT INTO `pipelines__contacts` VALUES (1,'Contacto','test','Contacto@Contacto.com',NULL,'1234567890',NULL,NULL,'Cali',1,3,1,1,'2019-11-28 17:09:32','2019-11-28 17:09:32'),(2,'Facebook 2','test','test@test.com','5454','1918289192192391923',1,NULL,'Cali',1,11,4,1,'2019-11-28 17:43:48','2019-11-29 15:10:41');
/*!40000 ALTER TABLE `pipelines__contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__countries`
--

DROP TABLE IF EXISTS `pipelines__countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__countries`
--

LOCK TABLES `pipelines__countries` WRITE;
/*!40000 ALTER TABLE `pipelines__countries` DISABLE KEYS */;
INSERT INTO `pipelines__countries` VALUES (1,'Afganistán','AF','2019-11-28 16:46:35','2019-11-28 16:46:35'),(2,'Islas Gland','AX',NULL,NULL),(3,'Albania','AL',NULL,NULL),(4,'Alemania','DE',NULL,NULL),(5,'Andorra','AD',NULL,NULL),(6,'Angola','AO',NULL,NULL),(7,'Anguilla','AI',NULL,NULL),(8,'Antártida','AQ',NULL,NULL),(9,'Antigua y Barbuda','AG',NULL,NULL),(10,'Antillas Holandesas','AN',NULL,NULL),(11,'Arabia Saudí','SA',NULL,NULL),(12,'Argelia','DZ',NULL,NULL),(13,'Argentina','AR',NULL,NULL),(14,'Armenia','AM',NULL,NULL),(15,'Aruba','AW',NULL,NULL),(16,'Australia','AU',NULL,NULL),(17,'Austria','AT',NULL,NULL),(18,'Azerbaiyán','AZ',NULL,NULL),(19,'Bahamas','BS',NULL,NULL),(20,'Bahréin','BH',NULL,NULL),(21,'Bangladesh','BD',NULL,NULL),(22,'Barbados','BB',NULL,NULL),(23,'Bielorrusia','BY',NULL,NULL),(24,'Bélgica','BE',NULL,NULL),(25,'Belice','BZ',NULL,NULL),(26,'Benin','BJ',NULL,NULL),(27,'Bermudas','BM',NULL,NULL),(28,'Bhután','BT',NULL,NULL),(29,'Bolivia','BO',NULL,NULL),(30,'Bosnia y Herzegovina','BA',NULL,NULL),(31,'Botsuana','BW',NULL,NULL),(32,'Isla Bouvet','BV',NULL,NULL),(33,'Brasil','BR',NULL,NULL),(34,'Brunéi','BN',NULL,NULL),(35,'Bulgaria','BG',NULL,NULL),(36,'Burkina Faso','BF',NULL,NULL),(37,'Burundi','BI',NULL,NULL),(38,'Cabo Verde','CV',NULL,NULL),(39,'Islas Caimán','KY',NULL,NULL),(40,'Camboya','KH',NULL,NULL),(41,'Camerún','CM',NULL,NULL),(42,'Canadá','CA',NULL,NULL),(43,'República Centroafricana','CF',NULL,NULL),(44,'Chad','TD',NULL,NULL),(45,'República Checa','CZ',NULL,NULL),(46,'Chile','CL',NULL,NULL),(47,'China','CN',NULL,NULL),(48,'Chipre','CY',NULL,NULL),(49,'Isla de Navidad','CX',NULL,NULL),(50,'Ciudad del Vaticano','VA',NULL,NULL),(51,'Islas Cocos','CC',NULL,NULL),(52,'Colombia','CO',NULL,NULL),(53,'Comoras','KM',NULL,NULL),(54,'República Democrática del Congo','CD',NULL,NULL),(55,'Congo','CG',NULL,NULL),(56,'Islas Cook','CK',NULL,NULL),(57,'Corea del Norte','KP',NULL,NULL),(58,'Corea del Sur','KR',NULL,NULL),(59,'Costa de Marfil','CI',NULL,NULL),(60,'Costa Rica','CR',NULL,NULL),(61,'Croacia','HR',NULL,NULL),(62,'Cuba','CU',NULL,NULL),(63,'Dinamarca','DK',NULL,NULL),(64,'Dominica','DM',NULL,NULL),(65,'República Dominicana','DO',NULL,NULL),(66,'Ecuador','EC',NULL,NULL),(67,'Egipto','EG',NULL,NULL),(68,'El Salvador','SV',NULL,NULL),(69,'Emiratos Árabes Unidos','AE',NULL,NULL),(70,'Eritrea','ER',NULL,NULL),(71,'Eslovaquia','SK',NULL,NULL),(72,'Eslovenia','SI',NULL,NULL),(73,'España','ES',NULL,NULL),(74,'Islas ultramarinas de Estados Unidos','UM',NULL,NULL),(75,'Estados Unidos','US',NULL,NULL),(76,'Estonia','EE',NULL,NULL),(77,'Etiopía','ET',NULL,NULL),(78,'Islas Feroe','FO',NULL,NULL),(79,'Filipinas','PH',NULL,NULL),(80,'Finlandia','FI',NULL,NULL),(81,'Fiyi','FJ',NULL,NULL),(82,'Francia','FR',NULL,NULL),(83,'Gabón','GA',NULL,NULL),(84,'Gambia','GM',NULL,NULL),(85,'Georgia','GE',NULL,NULL),(86,'Islas Georgias del Sur y Sandwich del Sur','GS',NULL,NULL),(87,'Ghana','GH',NULL,NULL),(88,'Gibraltar','GI',NULL,NULL),(89,'Granada','GD',NULL,NULL),(90,'Grecia','GR',NULL,NULL),(91,'Groenlandia','GL',NULL,NULL),(92,'Guadalupe','GP',NULL,NULL),(93,'Guam','GU',NULL,NULL),(94,'Guatemala','GT',NULL,NULL),(95,'Guayana Francesa','GF',NULL,NULL),(96,'Guinea','GN',NULL,NULL),(97,'Guinea Ecuatorial','GQ',NULL,NULL),(98,'Guinea-Bissau','GW',NULL,NULL),(99,'Guyana','GY',NULL,NULL),(100,'Haití','HT',NULL,NULL),(101,'Islas Heard y McDonald','HM',NULL,NULL),(102,'Honduras','HN',NULL,NULL),(103,'Hong Kong','HK',NULL,NULL),(104,'Hungría','HU',NULL,NULL),(105,'India','IN',NULL,NULL),(106,'Indonesia','ID',NULL,NULL),(107,'Irán','IR',NULL,NULL),(108,'Iraq','IQ',NULL,NULL),(109,'Irlanda','IE',NULL,NULL),(110,'Islandia','IS',NULL,NULL),(111,'Israel','IL',NULL,NULL),(112,'Italia','IT',NULL,NULL),(113,'Jamaica','JM',NULL,NULL),(114,'Japón','JP',NULL,NULL),(115,'Jordania','JO',NULL,NULL),(116,'Kazajstán','KZ',NULL,NULL),(117,'Kenia','KE',NULL,NULL),(118,'Kirguistán','KG',NULL,NULL),(119,'Kiribati','KI',NULL,NULL),(120,'Kuwait','KW',NULL,NULL),(121,'Laos','LA',NULL,NULL),(122,'Lesotho','LS',NULL,NULL),(123,'Letonia','LV',NULL,NULL),(124,'Líbano','LB',NULL,NULL),(125,'Liberia','LR',NULL,NULL),(126,'Libia','LY',NULL,NULL),(127,'Liechtenstein','LI',NULL,NULL),(128,'Lituania','LT',NULL,NULL),(129,'Luxemburgo','LU',NULL,NULL),(130,'Macao','MO',NULL,NULL),(131,'ARY Macedonia','MK',NULL,NULL),(132,'Madagascar','MG',NULL,NULL),(133,'Malasia','MY',NULL,NULL),(134,'Malawi','MW',NULL,NULL),(135,'Maldivas','MV',NULL,NULL),(136,'Malí','ML',NULL,NULL),(137,'Malta','MT',NULL,NULL),(138,'Islas Malvinas','FK',NULL,NULL),(139,'Islas Marianas del Norte','MP',NULL,NULL),(140,'Marruecos','MA',NULL,NULL),(141,'Islas Marshall','MH',NULL,NULL),(142,'Martinica','MQ',NULL,NULL),(143,'Mauricio','MU',NULL,NULL),(144,'Mauritania','MR',NULL,NULL),(145,'Mayotte','YT',NULL,NULL),(146,'México','MX',NULL,NULL),(147,'Micronesia','FM',NULL,NULL),(148,'Moldavia','MD',NULL,NULL),(149,'Mónaco','MC',NULL,NULL),(150,'Mongolia','MN',NULL,NULL),(151,'Montserrat','MS',NULL,NULL),(152,'Mozambique','MZ',NULL,NULL),(153,'Myanmar','MM',NULL,NULL),(154,'Namibia','NA',NULL,NULL),(155,'Nauru','NR',NULL,NULL),(156,'Nepal','NP',NULL,NULL),(157,'Nicaragua','NI',NULL,NULL),(158,'Níger','NE',NULL,NULL),(159,'Nigeria','NG',NULL,NULL),(160,'Niue','NU',NULL,NULL),(161,'Isla Norfolk','NF',NULL,NULL),(162,'Noruega','NO',NULL,NULL),(163,'Nueva Caledonia','NC',NULL,NULL),(164,'Nueva Zelanda','NZ',NULL,NULL),(165,'Omán','OM',NULL,NULL),(166,'Países Bajos','NL',NULL,NULL),(167,'Pakistán','PK',NULL,NULL),(168,'Palau','PW',NULL,NULL),(169,'Palestina','PS',NULL,NULL),(170,'Panamá','PA',NULL,NULL),(171,'Papúa Nueva Guinea','PG',NULL,NULL),(172,'Paraguay','PY',NULL,NULL),(173,'Perú','PE',NULL,NULL),(174,'Islas Pitcairn','PN',NULL,NULL),(175,'Polinesia Francesa','PF',NULL,NULL),(176,'Polonia','PL',NULL,NULL),(177,'Portugal','PT',NULL,NULL),(178,'Puerto Rico','PR',NULL,NULL),(179,'Qatar','QA',NULL,NULL),(180,'Reino Unido','GB',NULL,NULL),(181,'Reunión','RE',NULL,NULL),(182,'Ruanda','RW',NULL,NULL),(183,'Rumania','RO',NULL,NULL),(184,'Rusia','RU',NULL,NULL),(185,'Sahara Occidental','EH',NULL,NULL),(186,'Islas Salomón','SB',NULL,NULL),(187,'Samoa','WS',NULL,NULL),(188,'Samoa Americana','AS',NULL,NULL),(189,'San Cristóbal y Nevis','KN',NULL,NULL),(190,'San Marino','SM',NULL,NULL),(191,'San Pedro y Miquelón','PM',NULL,NULL),(192,'San Vicente y las Granadinas','VC',NULL,NULL),(193,'Santa Helena','SH',NULL,NULL),(194,'Santa Lucía','LC',NULL,NULL),(195,'Santo Tomé y Príncipe','ST',NULL,NULL),(196,'Senegal','SN',NULL,NULL),(197,'Serbia y Montenegro','CS',NULL,NULL),(198,'Seychelles','SC',NULL,NULL),(199,'Sierra Leona','SL',NULL,NULL),(200,'Singapur','SG',NULL,NULL),(201,'Siria','SY',NULL,NULL),(202,'Somalia','SO',NULL,NULL),(203,'Sri Lanka','LK',NULL,NULL),(204,'Suazilandia','SZ',NULL,NULL),(205,'Sudáfrica','ZA',NULL,NULL),(206,'Sudán','SD',NULL,NULL),(207,'Suecia','SE',NULL,NULL),(208,'Suiza','CH',NULL,NULL),(209,'Surinam','SR',NULL,NULL),(210,'Svalbard y Jan Mayen','SJ',NULL,NULL),(211,'Tailandia','TH',NULL,NULL),(212,'Taiwán','TW',NULL,NULL),(213,'Tanzania','TZ',NULL,NULL),(214,'Tayikistán','TJ',NULL,NULL),(215,'Territorio Británico del Océano Índico','IO',NULL,NULL),(216,'Territorios Australes Franceses','TF',NULL,NULL),(217,'Timor Oriental','TL',NULL,NULL),(218,'Togo','TG',NULL,NULL),(219,'Tokelau','TK',NULL,NULL),(220,'Tonga','TO',NULL,NULL),(221,'Trinidad y Tobago','TT',NULL,NULL),(222,'Túnez','TN',NULL,NULL),(223,'Islas Turcas y Caicos','TC',NULL,NULL),(224,'Turkmenistán','TM',NULL,NULL),(225,'Turquía','TR',NULL,NULL),(226,'Tuvalu','TV',NULL,NULL),(227,'Ucrania','UA',NULL,NULL),(228,'Uganda','UG',NULL,NULL),(229,'Uruguay','UY',NULL,NULL),(230,'Uzbekistán','UZ',NULL,NULL),(231,'Vanuatu','VU',NULL,NULL),(232,'Venezuela','VE',NULL,NULL),(233,'Vietnam','VN',NULL,NULL),(234,'Islas Vírgenes Británicas','VG',NULL,NULL),(235,'Islas Vírgenes de los Estados Unidos','VI',NULL,NULL),(236,'Wallis y Futuna','WF',NULL,NULL),(237,'Yemen','YE',NULL,NULL),(238,'Yibuti','DJ',NULL,NULL),(239,'Zambia','ZM',NULL,NULL),(240,'Zimbabue','ZW',NULL,NULL);
/*!40000 ALTER TABLE `pipelines__countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__detailbusinesses`
--

DROP TABLE IF EXISTS `pipelines__detailbusinesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__detailbusinesses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `value` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipelines__detailbusinesses_business_id_foreign` (`business_id`),
  KEY `pipelines__detailbusinesses_product_id_foreign` (`product_id`),
  CONSTRAINT `pipelines__detailbusinesses_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `pipelines__businesses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pipelines__detailbusinesses_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pipelines__products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__detailbusinesses`
--

LOCK TABLES `pipelines__detailbusinesses` WRITE;
/*!40000 ALTER TABLE `pipelines__detailbusinesses` DISABLE KEYS */;
INSERT INTO `pipelines__detailbusinesses` VALUES (1,1,1,9,199.00,'2019-11-28 22:36:41','2019-11-28 22:36:41'),(2,2,1,10,1999.00,'2019-11-28 22:37:34','2019-11-28 22:37:34'),(3,1,1,5,2000.00,'2019-11-29 01:34:25','2019-11-29 01:34:25');
/*!40000 ALTER TABLE `pipelines__detailbusinesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__emails`
--

DROP TABLE IF EXISTS `pipelines__emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipelines__emails_company_id_foreign` (`company_id`),
  CONSTRAINT `pipelines__emails_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `pipelines__companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__emails`
--

LOCK TABLES `pipelines__emails` WRITE;
/*!40000 ALTER TABLE `pipelines__emails` DISABLE KEYS */;
INSERT INTO `pipelines__emails` VALUES (1,'test2@test.com',1,'2019-11-28 16:47:58','2019-11-28 16:47:58');
/*!40000 ALTER TABLE `pipelines__emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__phones`
--

DROP TABLE IF EXISTS `pipelines__phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__phones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipelines__phones_company_id_foreign` (`company_id`),
  CONSTRAINT `pipelines__phones_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `pipelines__companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__phones`
--

LOCK TABLES `pipelines__phones` WRITE;
/*!40000 ALTER TABLE `pipelines__phones` DISABLE KEYS */;
INSERT INTO `pipelines__phones` VALUES (1,'0909809809',1,'2019-11-28 16:53:10','2019-11-28 16:53:10');
/*!40000 ALTER TABLE `pipelines__phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__pipelinebusinesses`
--

DROP TABLE IF EXISTS `pipelines__pipelinebusinesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__pipelinebusinesses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned DEFAULT NULL,
  `pipeline_id` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipelines__pipelinebusinesses_business_id_foreign` (`business_id`),
  KEY `pipelines__pipelinebusinesses_pipeline_id_foreign` (`pipeline_id`),
  CONSTRAINT `pipelines__pipelinebusinesses_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `pipelines__businesses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pipelines__pipelinebusinesses_pipeline_id_foreign` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines__pipelines` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__pipelinebusinesses`
--

LOCK TABLES `pipelines__pipelinebusinesses` WRITE;
/*!40000 ALTER TABLE `pipelines__pipelinebusinesses` DISABLE KEYS */;
INSERT INTO `pipelines__pipelinebusinesses` VALUES (1,1,1,NULL,NULL,'2019-11-28 17:09:32','2019-11-28 17:09:32'),(2,2,1,NULL,NULL,'2019-11-28 17:43:48','2019-11-28 17:43:48'),(3,1,2,'hlaksjdlkasd','2019-11-28','2019-11-28 22:36:25','2019-11-28 22:36:25'),(4,2,3,'Hi','2019-11-30','2019-11-28 22:45:31','2019-11-28 22:45:31'),(5,2,3,'tes test','2019-11-30','2019-11-29 15:28:47','2019-11-29 15:28:47'),(6,2,4,'tes test test segumiento','2019-11-30','2019-11-29 15:29:55','2019-11-29 15:29:55');
/*!40000 ALTER TABLE `pipelines__pipelinebusinesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__pipelines`
--

DROP TABLE IF EXISTS `pipelines__pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__pipelines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__pipelines`
--

LOCK TABLES `pipelines__pipelines` WRITE;
/*!40000 ALTER TABLE `pipelines__pipelines` DISABLE KEYS */;
INSERT INTO `pipelines__pipelines` VALUES (1,'Sin Contactar','2019-11-28 17:02:00','2019-11-28 17:02:00'),(2,'1 Contacto','2019-11-28 17:02:13','2019-11-28 17:02:13'),(3,'DEMO Agendado','2019-11-28 17:02:23','2019-11-28 17:02:23'),(4,'En Seguimiento','2019-11-28 17:02:34','2019-11-28 17:02:34'),(5,'Aplazado','2019-11-28 17:02:56','2019-11-28 17:02:56'),(6,'Ganado','2019-11-28 17:03:07','2019-11-28 17:03:07'),(7,'Perdido','2019-11-28 17:03:16','2019-11-28 17:03:16');
/*!40000 ALTER TABLE `pipelines__pipelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__products`
--

DROP TABLE IF EXISTS `pipelines__products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__products`
--

LOCK TABLES `pipelines__products` WRITE;
/*!40000 ALTER TABLE `pipelines__products` DISABLE KEYS */;
INSERT INTO `pipelines__products` VALUES (1,'Usuario Financial',1000.00,'2019-11-28 17:00:32','2019-11-28 17:00:32'),(2,'Usuario Internal',1000.00,'2019-11-28 17:00:48','2019-11-28 17:00:48'),(3,'Almacenamiento',1200.00,'2019-11-28 17:01:05','2019-11-28 17:01:05'),(4,'Capacitación',88.00,'2019-11-28 17:01:20','2019-11-28 17:01:20'),(5,'Evento',1200.00,'2019-11-28 17:01:35','2019-11-28 17:01:35');
/*!40000 ALTER TABLE `pipelines__products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__sources`
--

DROP TABLE IF EXISTS `pipelines__sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__sources`
--

LOCK TABLES `pipelines__sources` WRITE;
/*!40000 ALTER TABLE `pipelines__sources` DISABLE KEYS */;
INSERT INTO `pipelines__sources` VALUES (1,'Facebook','2019-11-28 16:46:18','2019-11-28 16:46:18'),(2,'Facebook Ads','2019-11-28 16:56:28','2019-11-28 16:56:28'),(3,'SEO','2019-11-28 16:56:41','2019-11-28 16:56:41'),(4,'Google Ads','2019-11-28 16:56:54','2019-11-28 16:56:54'),(5,'Google Display','2019-11-28 16:57:05','2019-11-28 16:57:05'),(6,'Linkedin','2019-11-28 16:57:19','2019-11-28 16:57:19'),(7,'Linkedin Ads','2019-11-28 16:57:35','2019-11-28 16:57:35'),(8,'YouTube','2019-11-28 16:57:46','2019-11-28 16:57:46'),(9,'Twitter','2019-11-28 16:57:57','2019-11-28 16:57:57'),(10,'Instagram','2019-11-28 16:58:13','2019-11-28 16:58:13'),(11,'EMMA','2019-11-28 16:58:27','2019-11-28 16:58:27'),(12,'Referidos','2019-11-28 16:58:37','2019-11-28 16:58:37'),(13,'Nos llamaron','2019-11-28 16:58:47','2019-11-28 16:58:47'),(14,'Llamada en frío','2019-11-28 16:58:58','2019-11-28 16:58:58'),(15,'Evento Presencial','2019-11-28 16:59:09','2019-11-28 16:59:09'),(16,'Webinar','2019-11-28 16:59:20','2019-11-28 16:59:20');
/*!40000 ALTER TABLE `pipelines__sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines__typebusinesses`
--

DROP TABLE IF EXISTS `pipelines__typebusinesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines__typebusinesses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines__typebusinesses`
--

LOCK TABLES `pipelines__typebusinesses` WRITE;
/*!40000 ALTER TABLE `pipelines__typebusinesses` DISABLE KEYS */;
INSERT INTO `pipelines__typebusinesses` VALUES (1,'Nuevo','2019-11-28 16:59:43','2019-11-28 16:59:43'),(2,'Renovación','2019-11-28 16:59:52','2019-11-28 16:59:52'),(3,'Ampliación','2019-11-28 17:00:02','2019-11-28 17:00:02');
/*!40000 ALTER TABLE `pipelines__typebusinesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
INSERT INTO `role_users` VALUES (1,1,'2019-11-28 08:56:11','2019-11-28 08:56:11'),(2,3,'2019-11-29 15:54:20','2019-11-29 15:54:20'),(3,4,'2019-11-29 15:08:13','2019-11-29 15:08:13'),(4,4,'2019-11-29 15:00:58','2019-11-29 15:00:58');
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"core.sidebar.group\":true,\"dashboard.index\":true,\"dashboard.update\":true,\"dashboard.reset\":true,\"media.medias.index\":true,\"media.medias.create\":true,\"media.medias.edit\":true,\"media.medias.destroy\":true,\"media.folders.index\":true,\"media.folders.create\":true,\"media.folders.edit\":true,\"media.folders.destroy\":true,\"menu.menus.index\":false,\"menu.menus.create\":false,\"menu.menus.edit\":true,\"menu.menus.destroy\":true,\"menu.menuitems.index\":true,\"menu.menuitems.create\":true,\"menu.menuitems.edit\":true,\"menu.menuitems.destroy\":true,\"page.pages.index\":false,\"page.pages.create\":false,\"page.pages.edit\":true,\"page.pages.destroy\":true,\"pipelines.sources.index\":true,\"pipelines.sources.create\":true,\"pipelines.sources.edit\":true,\"pipelines.sources.destroy\":true,\"pipelines.countries.index\":true,\"pipelines.countries.create\":true,\"pipelines.countries.edit\":true,\"pipelines.countries.destroy\":true,\"pipelines.contacts.index\":true,\"pipelines.contacts.create\":true,\"pipelines.contacts.edit\":true,\"pipelines.contacts.destroy\":true,\"pipelines.companies.index\":true,\"pipelines.companies.create\":true,\"pipelines.companies.edit\":true,\"pipelines.companies.destroy\":true,\"pipelines.typebusinesses.index\":true,\"pipelines.typebusinesses.create\":true,\"pipelines.typebusinesses.edit\":true,\"pipelines.typebusinesses.destroy\":true,\"pipelines.businesses.index\":true,\"pipelines.businesses.create\":true,\"pipelines.businesses.edit\":true,\"pipelines.businesses.destroy\":true,\"pipelines.products.index\":true,\"pipelines.products.create\":true,\"pipelines.products.edit\":true,\"pipelines.products.destroy\":true,\"pipelines.detailbusinesses.index\":true,\"pipelines.detailbusinesses.create\":true,\"pipelines.detailbusinesses.edit\":true,\"pipelines.detailbusinesses.destroy\":true,\"pipelines.pipelines.index\":true,\"pipelines.pipelines.create\":true,\"pipelines.pipelines.edit\":true,\"pipelines.pipelines.destroy\":true,\"pipelines.pipelinebusinesses.index\":true,\"pipelines.pipelinebusinesses.create\":true,\"pipelines.pipelinebusinesses.edit\":true,\"pipelines.pipelinebusinesses.destroy\":true,\"pipelines.phones.index\":true,\"pipelines.phones.create\":true,\"pipelines.phones.edit\":true,\"pipelines.phones.destroy\":true,\"pipelines.emails.index\":true,\"pipelines.emails.create\":true,\"pipelines.emails.edit\":true,\"pipelines.emails.destroy\":true,\"setting.settings.index\":true,\"setting.settings.edit\":true,\"tag.tags.index\":false,\"tag.tags.create\":false,\"tag.tags.edit\":true,\"tag.tags.destroy\":true,\"translation.translations.index\":false,\"translation.translations.edit\":false,\"translation.translations.import\":true,\"translation.translations.export\":true,\"user.users.index\":true,\"user.users.create\":true,\"user.users.edit\":true,\"user.users.destroy\":true,\"user.roles.index\":true,\"user.roles.create\":true,\"user.roles.edit\":true,\"user.roles.destroy\":true,\"account.api-keys.index\":true,\"account.api-keys.create\":true,\"account.api-keys.destroy\":true,\"workshop.sidebar.group\":true,\"workshop.modules.index\":false,\"workshop.modules.show\":false,\"workshop.modules.update\":true,\"workshop.modules.disable\":true,\"workshop.modules.enable\":true,\"workshop.modules.publish\":true,\"workshop.themes.index\":false,\"workshop.themes.show\":false,\"workshop.themes.publish\":true}','2019-11-28 08:55:44','2019-11-29 01:26:55'),(2,'user','User',NULL,'2019-11-28 08:55:44','2019-11-28 08:55:44'),(3,'qualifier','calificador','{\"core.sidebar.group\":false,\"dashboard.index\":false,\"dashboard.update\":false,\"dashboard.reset\":false,\"media.medias.index\":false,\"media.medias.create\":false,\"media.medias.edit\":false,\"media.medias.destroy\":false,\"media.folders.index\":false,\"media.folders.create\":false,\"media.folders.edit\":false,\"media.folders.destroy\":false,\"menu.menus.index\":false,\"menu.menus.create\":false,\"menu.menus.edit\":false,\"menu.menus.destroy\":false,\"menu.menuitems.index\":false,\"menu.menuitems.create\":false,\"menu.menuitems.edit\":false,\"menu.menuitems.destroy\":false,\"page.pages.index\":false,\"page.pages.create\":false,\"page.pages.edit\":false,\"page.pages.destroy\":false,\"pipelines.sources.index\":false,\"pipelines.sources.create\":false,\"pipelines.sources.edit\":false,\"pipelines.sources.destroy\":false,\"pipelines.countries.index\":false,\"pipelines.countries.create\":false,\"pipelines.countries.edit\":false,\"pipelines.countries.destroy\":false,\"pipelines.contacts.index\":false,\"pipelines.contacts.create\":false,\"pipelines.contacts.edit\":false,\"pipelines.contacts.destroy\":false,\"pipelines.companies.index\":false,\"pipelines.companies.create\":false,\"pipelines.companies.edit\":false,\"pipelines.companies.destroy\":false,\"pipelines.typebusinesses.index\":false,\"pipelines.typebusinesses.create\":false,\"pipelines.typebusinesses.edit\":false,\"pipelines.typebusinesses.destroy\":false,\"pipelines.businesses.index\":false,\"pipelines.businesses.create\":false,\"pipelines.businesses.edit\":false,\"pipelines.businesses.destroy\":false,\"pipelines.products.index\":false,\"pipelines.products.create\":false,\"pipelines.products.edit\":false,\"pipelines.products.destroy\":false,\"pipelines.detailbusinesses.index\":false,\"pipelines.detailbusinesses.create\":false,\"pipelines.detailbusinesses.edit\":false,\"pipelines.detailbusinesses.destroy\":false,\"pipelines.pipelines.index\":false,\"pipelines.pipelines.create\":false,\"pipelines.pipelines.edit\":false,\"pipelines.pipelines.destroy\":false,\"pipelines.pipelinebusinesses.index\":false,\"pipelines.pipelinebusinesses.create\":false,\"pipelines.pipelinebusinesses.edit\":false,\"pipelines.pipelinebusinesses.destroy\":false,\"pipelines.phones.index\":false,\"pipelines.phones.create\":false,\"pipelines.phones.edit\":false,\"pipelines.phones.destroy\":false,\"pipelines.emails.index\":false,\"pipelines.emails.create\":false,\"pipelines.emails.edit\":false,\"pipelines.emails.destroy\":false,\"setting.settings.index\":false,\"setting.settings.edit\":false,\"tag.tags.index\":false,\"tag.tags.create\":false,\"tag.tags.edit\":false,\"tag.tags.destroy\":false,\"translation.translations.index\":false,\"translation.translations.edit\":false,\"translation.translations.import\":false,\"translation.translations.export\":false,\"user.users.index\":false,\"user.users.create\":false,\"user.users.edit\":false,\"user.users.destroy\":false,\"user.roles.index\":false,\"user.roles.create\":false,\"user.roles.edit\":false,\"user.roles.destroy\":false,\"account.api-keys.index\":false,\"account.api-keys.create\":false,\"account.api-keys.destroy\":false,\"workshop.sidebar.group\":false,\"workshop.modules.index\":false,\"workshop.modules.show\":false,\"workshop.modules.update\":false,\"workshop.modules.disable\":false,\"workshop.modules.enable\":false,\"workshop.modules.publish\":false,\"workshop.themes.index\":false,\"workshop.themes.show\":false,\"workshop.themes.publish\":false}','2019-11-28 17:04:52','2019-11-29 14:52:24'),(4,'salesman','vendedor','{\"core.sidebar.group\":false,\"dashboard.index\":false,\"dashboard.update\":false,\"dashboard.reset\":false,\"media.medias.index\":false,\"media.medias.create\":false,\"media.medias.edit\":false,\"media.medias.destroy\":false,\"media.folders.index\":false,\"media.folders.create\":false,\"media.folders.edit\":false,\"media.folders.destroy\":false,\"menu.menus.index\":false,\"menu.menus.create\":false,\"menu.menus.edit\":false,\"menu.menus.destroy\":false,\"menu.menuitems.index\":false,\"menu.menuitems.create\":false,\"menu.menuitems.edit\":false,\"menu.menuitems.destroy\":false,\"page.pages.index\":false,\"page.pages.create\":false,\"page.pages.edit\":false,\"page.pages.destroy\":false,\"pipelines.sources.index\":false,\"pipelines.sources.create\":false,\"pipelines.sources.edit\":false,\"pipelines.sources.destroy\":false,\"pipelines.countries.index\":false,\"pipelines.countries.create\":false,\"pipelines.countries.edit\":false,\"pipelines.countries.destroy\":false,\"pipelines.contacts.index\":false,\"pipelines.contacts.create\":false,\"pipelines.contacts.edit\":false,\"pipelines.contacts.destroy\":false,\"pipelines.companies.index\":false,\"pipelines.companies.create\":false,\"pipelines.companies.edit\":false,\"pipelines.companies.destroy\":false,\"pipelines.typebusinesses.index\":false,\"pipelines.typebusinesses.create\":false,\"pipelines.typebusinesses.edit\":false,\"pipelines.typebusinesses.destroy\":false,\"pipelines.businesses.index\":false,\"pipelines.businesses.create\":false,\"pipelines.businesses.edit\":false,\"pipelines.businesses.destroy\":false,\"pipelines.products.index\":false,\"pipelines.products.create\":false,\"pipelines.products.edit\":false,\"pipelines.products.destroy\":false,\"pipelines.detailbusinesses.index\":false,\"pipelines.detailbusinesses.create\":false,\"pipelines.detailbusinesses.edit\":false,\"pipelines.detailbusinesses.destroy\":false,\"pipelines.pipelines.index\":false,\"pipelines.pipelines.create\":false,\"pipelines.pipelines.edit\":false,\"pipelines.pipelines.destroy\":false,\"pipelines.pipelinebusinesses.index\":false,\"pipelines.pipelinebusinesses.create\":false,\"pipelines.pipelinebusinesses.edit\":false,\"pipelines.pipelinebusinesses.destroy\":false,\"pipelines.phones.index\":false,\"pipelines.phones.create\":false,\"pipelines.phones.edit\":false,\"pipelines.phones.destroy\":false,\"pipelines.emails.index\":false,\"pipelines.emails.create\":false,\"pipelines.emails.edit\":false,\"pipelines.emails.destroy\":false,\"setting.settings.index\":false,\"setting.settings.edit\":false,\"tag.tags.index\":false,\"tag.tags.create\":false,\"tag.tags.edit\":false,\"tag.tags.destroy\":false,\"translation.translations.index\":false,\"translation.translations.edit\":false,\"translation.translations.import\":false,\"translation.translations.export\":false,\"user.users.index\":false,\"user.users.create\":false,\"user.users.edit\":false,\"user.users.destroy\":false,\"user.roles.index\":false,\"user.roles.create\":false,\"user.roles.edit\":false,\"user.roles.destroy\":false,\"account.api-keys.index\":false,\"account.api-keys.create\":false,\"account.api-keys.destroy\":false,\"workshop.sidebar.group\":false,\"workshop.modules.index\":false,\"workshop.modules.show\":false,\"workshop.modules.update\":false,\"workshop.modules.disable\":false,\"workshop.modules.enable\":false,\"workshop.modules.publish\":false,\"workshop.themes.index\":false,\"workshop.themes.show\":false,\"workshop.themes.publish\":false}','2019-11-28 17:05:20','2019-11-28 17:05:20');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting__setting_translations`
--

DROP TABLE IF EXISTS `setting__setting_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting__setting_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting__setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  KEY `setting__setting_translations_locale_index` (`locale`),
  CONSTRAINT `setting__setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `setting__settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting__setting_translations`
--

LOCK TABLES `setting__setting_translations` WRITE;
/*!40000 ALTER TABLE `setting__setting_translations` DISABLE KEYS */;
INSERT INTO `setting__setting_translations` VALUES (1,3,'en',NULL,NULL),(2,4,'en',NULL,NULL),(3,5,'en',NULL,NULL),(4,3,'es','AUDITCRM',NULL),(5,4,'es','auditcrm',NULL),(6,5,'es','CRM',NULL),(7,7,'es',NULL,NULL),(8,8,'es',NULL,NULL);
/*!40000 ALTER TABLE `setting__setting_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting__settings`
--

DROP TABLE IF EXISTS `setting__settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting__settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plainValue` text COLLATE utf8mb4_unicode_ci,
  `isTranslatable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting__settings_name_unique` (`name`),
  KEY `setting__settings_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting__settings`
--

LOCK TABLES `setting__settings` WRITE;
/*!40000 ALTER TABLE `setting__settings` DISABLE KEYS */;
INSERT INTO `setting__settings` VALUES (1,'core::template','Flatly',0,'2019-11-28 08:56:14','2019-11-28 08:56:14'),(2,'core::locales','[\"es\"]',0,'2019-11-28 08:56:14','2019-11-28 08:59:16'),(3,'core::site-name',NULL,1,'2019-11-28 08:59:15','2019-11-28 08:59:15'),(4,'core::site-name-mini',NULL,1,'2019-11-28 08:59:15','2019-11-28 08:59:15'),(5,'core::site-description',NULL,1,'2019-11-28 08:59:16','2019-11-28 08:59:16'),(6,'core::analytics-script',NULL,0,'2019-11-28 08:59:16','2019-11-28 08:59:16'),(7,'dashboard::welcome-title',NULL,1,'2019-11-29 01:23:49','2019-11-29 01:23:49'),(8,'dashboard::welcome-description',NULL,1,'2019-11-29 01:23:49','2019-11-29 01:23:49'),(9,'dashboard::welcome-enabled','1',0,'2019-11-29 01:23:49','2019-11-29 01:23:49');
/*!40000 ALTER TABLE `setting__settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag__tag_translations`
--

DROP TABLE IF EXISTS `tag__tag_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag__tag_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag__tag_translations_tag_id_locale_unique` (`tag_id`,`locale`),
  KEY `tag__tag_translations_locale_index` (`locale`),
  CONSTRAINT `tag__tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tag__tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag__tag_translations`
--

LOCK TABLES `tag__tag_translations` WRITE;
/*!40000 ALTER TABLE `tag__tag_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag__tag_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag__tagged`
--

DROP TABLE IF EXISTS `tag__tagged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag__tagged` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag__tagged_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag__tagged`
--

LOCK TABLES `tag__tagged` WRITE;
/*!40000 ALTER TABLE `tag__tagged` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag__tagged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag__tags`
--

DROP TABLE IF EXISTS `tag__tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag__tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag__tags`
--

LOCK TABLES `tag__tags` WRITE;
/*!40000 ALTER TABLE `tag__tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag__tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `throttle`
--

DROP TABLE IF EXISTS `throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `throttle`
--

LOCK TABLES `throttle` WRITE;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translation__translation_translations`
--

DROP TABLE IF EXISTS `translation__translation_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translation__translation_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translation_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_trans_id_locale_unique` (`translation_id`,`locale`),
  KEY `translation__translation_translations_locale_index` (`locale`),
  CONSTRAINT `translation__translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translation__translations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation__translation_translations`
--

LOCK TABLES `translation__translation_translations` WRITE;
/*!40000 ALTER TABLE `translation__translation_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation__translation_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translation__translations`
--

DROP TABLE IF EXISTS `translation__translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translation__translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translation__translations_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation__translations`
--

LOCK TABLES `translation__translations` WRITE;
/*!40000 ALTER TABLE `translation__translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation__translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_tokens_access_token_unique` (`access_token`),
  KEY `user_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `user_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
INSERT INTO `user_tokens` VALUES (1,1,'25b6bf37-81de-4031-afaa-599798e374f9','2019-11-28 08:56:11','2019-11-28 08:56:11'),(2,2,'4df024a8-d7e1-4524-8793-31e8fef54bdf','2019-11-29 02:37:56','2019-11-29 02:37:56'),(3,3,'14106ce6-315f-4938-9837-fdb90a25fe6f','2019-11-29 02:38:30','2019-11-29 02:38:30'),(4,4,'757e8da5-cde4-483d-b284-bd4a1445b4d0','2019-11-29 15:00:58','2019-11-29 15:00:58');
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'audicrm18@gmail.com','$2y$10$t8Vcylf9o1KsuN2m0wAN2uAS5GFUFGpj2zN9bwbZClfwOF6gxPzR2',NULL,'2019-11-29 15:55:56','admin','user','2019-11-28 08:56:11','2019-11-29 15:55:56'),(2,'test@adi.com','$2y$10$Z5naxljX4zEeETriPha/KuLs77x952LpQLi1imR.QAQbZWwBsrTU.','',NULL,'Calificador','Calificador','2019-11-29 02:37:56','2019-11-29 02:37:56'),(3,'testvendedor@gmail.com','$2y$10$3FkIILj0HNMVHiYoB5GtKecUION1XlaOdQooaiWmpcyd1F0GXQ5nu','',NULL,'Test vendedor','Test vendedor','2019-11-29 02:38:30','2019-11-29 02:38:30'),(4,'audi@gmail.com','$2y$10$vwtbyrcJN4dfQcyp2yD/bOlABIxshjgvbuiRdb4GGI668RbeQXSn.','',NULL,'Cesar','Test','2019-11-29 15:00:58','2019-11-29 15:00:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'crm2'
--

--
-- Dumping routines for database 'crm2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-29 11:23:29
