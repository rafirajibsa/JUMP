-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 24, 2019 at 08:12 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jump`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(3) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `admin_email` varchar(30) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `nama`, `username`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'rafi rajibsa', 'rafirajibsa', 'rafirajibsa@gmail.com', 'cab32b15e923a938c21e5cfeea33ce4d');

-- --------------------------------------------------------

--
-- Table structure for table `all_settings`
--

CREATE TABLE `all_settings` (
  `all_id` int(3) NOT NULL,
  `all_name_settings` varchar(60) DEFAULT NULL,
  `all_value_settings` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `all_settings`
--

INSERT INTO `all_settings` (`all_id`, `all_name_settings`, `all_value_settings`) VALUES
(1, 'footer', 'Copyright Â© Atom Studio'),
(2, 'site_name', 'Shop Online');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `gro_id` tinyint(1) NOT NULL,
  `gro_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`gro_id`, `gro_name`) VALUES
(1, 'admin'),
(2, 'c_admin'),
(3, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(16) NOT NULL,
  `data` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `status` enum('paid','confirmed','unpaid','canceled','expired') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `data`, `due_date`, `user_id`, `status`) VALUES
(10001001, '2015-05-06 08:13:09', '2015-05-07 08:13:09', 2, 'confirmed'),
(10001002, '2015-05-06 08:17:15', '2015-05-07 08:17:15', 3, 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(16) NOT NULL,
  `invoice_id` int(16) DEFAULT NULL,
  `product_id` int(16) DEFAULT NULL,
  `product_type` varchar(60) DEFAULT NULL,
  `product_title` varchar(60) DEFAULT NULL,
  `qty` int(3) DEFAULT NULL,
  `price` int(9) DEFAULT NULL,
  `options` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_id`, `product_id`, `product_type`, `product_title`, `qty`, `price`, `options`) VALUES
(10001001, 10001001, 1, 'PC', 'Dell', 1, 25000, ''),
(10001002, 10001002, 5, 'Mobile', 'Iphone 6', 1, 46000, '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pro_id` int(16) NOT NULL,
  `pro_name` varchar(50) DEFAULT NULL,
  `pro_title` varchar(20) DEFAULT NULL,
  `pro_description` text,
  `pro_price` int(9) DEFAULT NULL,
  `pro_stock` int(3) DEFAULT NULL,
  `pro_image` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_title`, `pro_description`, `pro_price`, `pro_stock`, `pro_image`) VALUES
(1, 'PC', 'Dell', 'Dell INSPIRON N5111\r\nRAM 2GB\r\nCORE i5\r\nAVG 1Gb\r\nCPU 3000', 25000, 3, 'Dell_Computer.jpg'),
(2, 'Laptop', 'Toshiba', 'RAM 1GB\r\nCORE i7\r\nAVG 2Gb\r\nCPU 3500', 50000, 5, 'prod_satA205-OFTWH_300-01.jpg'),
(3, 'PC', 'HP', 'HP 300 \r\nram 2 gb\r\navg 2\r\ncpu 3500\r\ndvd\r\ncam 16 px\r\n', 75000, 1, 'images.jpg'),
(4, 'Mobile', 'HTC sensation XL', 'htc', 45000, 1, 'htc_sensation_xl_28.jpg'),
(5, 'Mobile', 'Iphone 6', 'Iphone 6', 46000, 1, 'aabffb1c6425f95fd26db8595ee28c0e_png.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `rep_id` int(9) NOT NULL,
  `rep_name` varchar(60) DEFAULT NULL,
  `rep_id_product` int(9) DEFAULT NULL,
  `rep_title_product` varchar(60) DEFAULT NULL,
  `rep_usr_name` varchar(60) DEFAULT NULL,
  `rep_usr_group` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`rep_id`, `rep_name`, `rep_id_product`, `rep_title_product`, `rep_usr_name`, `rep_usr_group`) VALUES
(3, 'PC', 1, 'Dell', '', '0'),
(4, 'Laptop', 2, 'Toshiba', '', '0'),
(5, 'Mobile', 4, 'HTC sensation XL', 'test', '3'),
(6, 'Laptop', 2, 'Toshiba', 'test', '3'),
(7, 'PC', 3, 'HP', 'Gost', 'Gost'),
(8, 'PC', 1, 'Dell', 'hichamtest', '3');

-- --------------------------------------------------------

--
-- Table structure for table `shop_session`
--

CREATE TABLE `shop_session` (
  `id` int(40) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `timestamp` int(10) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_session`
--

INSERT INTO `shop_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
(5, '::1', 1566471620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536363437313632303b),
(7, '::1', 1566471752, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536363437313735323b),
(11, '::1', 1430886198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838353930363b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b),
(2147483647, '::1', 1430885736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313433303838353630353b757365726e616d657c733a363a2268696368616d223b67726f75707c733a313a2233223b);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usr_id` int(10) NOT NULL,
  `usr_name` varchar(25) DEFAULT NULL,
  `usr_password` varchar(60) DEFAULT NULL,
  `usr_group` tinyint(1) DEFAULT NULL,
  `stuts` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usr_id`, `usr_name`, `usr_password`, `usr_group`, `stuts`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1),
(2, 'hicham', '21232f297a57a5a743894a0e4a801fc3', 3, 1),
(3, 'dyaa', '21232f297a57a5a743894a0e4a801fc3', 3, 1),
(4, 'rafi', 'e10adc3949ba59abbe56e057f20f883e', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(3) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `lat` varchar(30) NOT NULL,
  `lng` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `nama`, `user_name`, `user_email`, `user_password`, `lat`, `lng`) VALUES
(1, 'tomi firman cahyadi', 'tomifirman', 'tomi@gmail.com', '08767d10c94125f26f95eaadb5ebb98a', '0.527044', '101.458866');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `all_settings`
--
ALTER TABLE `all_settings`
  ADD PRIMARY KEY (`all_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`gro_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`rep_id`);

--
-- Indexes for table `shop_session`
--
ALTER TABLE `shop_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usr_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `all_settings`
--
ALTER TABLE `all_settings`
  MODIFY `all_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `gro_id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001003;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001003;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `rep_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_session`
--
ALTER TABLE `shop_session`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483647;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usr_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
