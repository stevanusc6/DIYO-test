
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB;

CREATE TABLE `inventories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventories`
--

LOCK TABLES `inventories` WRITE;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
INSERT INTO `inventories` VALUES (1,'Coca Cola',8000,200,'items','2023-06-02 00:22:26','2023-06-02 00:22:26'),(2,'Fanta',10000,20000,'items','2023-06-02 00:22:26','2023-06-02 00:22:26');
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_05_31_233346_create_inventories_table',2),(6,'2023_05_31_234256_create_products_table',3),(7,'2023_05_31_234701_create_sales_table',4),(8,'2023_06_01_125013_add_token_to_users',5);


--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;

INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth_token','cfd5cbac6f7d57309a3f53b8f246a2278011fd56b1cd280f8643f83ead499332','[\"*\"]','2023-06-01 06:34:20',NULL,'2023-06-01 06:33:08','2023-06-01 06:34:20'),(2,'App\\Models\\User',2,'auth_token','fcd505b65a305715091ed335eb2f2089504e92393a50f6bd04f49df55c012976','[\"*\"]',NULL,NULL,'2023-06-01 06:45:18','2023-06-01 06:45:18'),(3,'App\\Models\\User',3,'auth_token','25ed83e9e6c7cb427dd32afc2c9dcedcc64d3910c2b8ab1104ed16960087c2c0','[\"*\"]',NULL,NULL,'2023-06-01 06:47:05','2023-06-01 06:47:05'),(4,'App\\Models\\User',4,'auth_token','38e75708813c940cfd33ac673c0544555dc867b6a2e2fb7f1c011db247d72f27','[\"*\"]',NULL,NULL,'2023-06-01 06:47:30','2023-06-01 06:47:30'),(5,'App\\Models\\User',5,'auth_token','f631bf78b01e7ffbda21329e0d63ceb536d99a1302f007e78edc7d00536b0bc4','[\"*\"]',NULL,NULL,'2023-06-01 06:47:51','2023-06-01 06:47:51'),(6,'App\\Models\\User',6,'auth_token','02121f45b88ca64359d1311be30206881d42281f174af422b137e0b03ca1b4b7','[\"*\"]',NULL,NULL,'2023-06-01 07:18:53','2023-06-01 07:18:53');

UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `variants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;

INSERT INTO `products` VALUES (26,'Spagetti Algolio','spaghetti with olive and olive oil',10000,'[{\"name\":\"original\",\"additional_price\":0},{\"name\":\"beef\",\"additional_price\":10000}]','2023-06-01 09:19:38','2023-06-01 09:19:38'),(27,'Spagetti Bolognese','spaghetti with tomato pasta original recipe from italy',10000,'null','2023-06-01 09:20:25','2023-06-01 09:20:25'),(28,'Hamburger Beef','Original Burger with best wagyu beef',15000,'null','2023-06-01 09:22:01','2023-06-01 09:22:01'),(29,'Hamburger Beef Cheese','Original Burger with best wagyu beef and cheese',20000,'null','2023-06-01 15:44:15','2023-06-01 15:44:15'),(30,'Double Cheese Burger','Burger double patty and cheese',25000,'null','2023-06-01 15:46:31','2023-06-01 15:46:31'),(31,'Pizza','Thin Pizza crust and many topping',25000,'[{\"name\":\"original\",\"additional_price\":0},{\"name\":\"beef\",\"additional_price\":10000},{\"name\":\"tuna\",\"additional_price\":8000},\n{\"name\":\"cheese\",\"additional_price\":9000}]','2023-06-01 15:50:30','2023-06-01 15:50:30'),(32,'Hotdog','Hotdog with optional meat',20000,'[{\"name\":\"beef\",\"additional_price\":0},{\"name\":\"beef wagyu\",\"additional_price\":10000},{\"name\":\"chicken\",\"additional_price\":5000},{\"name\":\"fish\",\"additional_price\":4000}]','2023-06-01 15:54:14','2023-06-01 15:54:14'),(34,'Fried Rice','Fried Rice from grandma recipe',20000,'[{\"name\":\"orginal\",\"additional_price\":0},{\"name\":\"java\",\"additional_price\":3000},{\"name\":\"hong kong\",\"additional_price\":5000},{\"name\":\"singapore\",\"additional_price\":4000},{\"name\":\"salted fish\",\"additional_price\":2000}]','2023-06-01 15:57:46','2023-06-01 15:57:46'),(35,'Fried Noodle','Fried Noodle from grandma recipe',19000,'[{\"name\":\"orginal\",\"additional_price\":0},{\"name\":\"java\",\"additional_price\":3000},{\"name\":\"hong kong\",\"additional_price\":5000},{\"name\":\"singapore\",\"additional_price\":4000},{\"name\":\"salted fish\",\"additional_price\":2000}]','2023-06-01 15:58:34','2023-06-01 15:58:34'),(36,'Platter','Contains Nugget, French fries, saussage, and crispy Mushroom',20000,'null','2023-06-01 16:00:33','2023-06-01 16:00:33');

UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`cart`)),
  `total` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `sales_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;

INSERT INTO `sales` VALUES ('S-201007-171921','[{\"product_id\":26,\"price\":10000,\"variants\":[{\"variant_name\":\"beef\",\"price\":10000}]},{\"product_id\":27,\"price\":10000}]',30000,'2023-06-01 16:37:54','OVO','2023-06-01 16:37:54','2023-06-01 16:37:54');

UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;

INSERT INTO `users` VALUES (6,'admin3','admin3@admin.co43',NULL,'$2y$10$gBXTEBHXbBOEjKnm6f7oreBFGaYeNMoXU.G3VTRKvpTtXeoBJMUVu','Client-wxeqxizk2atvOTmohDTLWSswdBy93OOR3DNbYXN9',NULL,'2023-06-01 07:18:53','2023-06-01 07:18:53');
UNLOCK TABLES;

--
-- Dumping routines for database 'DIYO'
--
