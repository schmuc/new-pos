-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2022 at 12:29 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_enabled` int(11) NOT NULL,
  `account_active` int(11) NOT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `time_created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `image`, `firstname`, `lastname`, `username`, `password`, `account_enabled`, `account_active`, `date_created`, `time_created`) VALUES
(1, 'no-profile.png', 'super', 'admin', 'superadmin', 'ac497cfaba23c4184cb03b97e8c51e0a', 1, 1, NULL, NULL),
(5, 'dwayne.jpg', 'sean', 'caldit', 'sean@gmail.com', '698d51a19d8a121ce581499d7b701668', 1, 1, '07-29-2022', '06:16pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_accessibility`
--

CREATE TABLE `tbl_admin_accessibility` (
  `admin_accessibility_id` int(11) NOT NULL,
  `notification` int(11) NOT NULL,
  `side_bar` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `accounts` int(11) NOT NULL,
  `settings` int(11) NOT NULL,
  `reports` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin_accessibility`
--

INSERT INTO `tbl_admin_accessibility` (`admin_accessibility_id`, `notification`, `side_bar`, `product`, `sales`, `accounts`, `settings`, `reports`, `admin_id`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1),
(5, 1, 1, 1, 1, 1, 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `time_created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category`, `date_created`, `time_created`) VALUES
(8, 'Breakfast', '07-29-2022', '05:07pm'),
(9, 'Fast Food', '07-29-2022', '05:07pm'),
(10, 'Main Dish', '07-29-2022', '05:07pm'),
(11, 'Drinks', '07-29-2022', '05:08pm'),
(12, 'Snacks', '07-29-2022', '06:08pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `employee_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `account_enabled` int(11) NOT NULL,
  `account_active` int(11) NOT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `time_created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`employee_id`, `image`, `firstname`, `lastname`, `email`, `password`, `gender`, `phone_number`, `address`, `account_enabled`, `account_active`, `date_created`, `time_created`) VALUES
(3, 'usain.webp', 'patrick', 'clemente', 'pat@gmail.com', '698d51a19d8a121ce581499d7b701668', 'male', '09152829721', 'sadasdasdsa', 1, 1, '07-29-2022', '06:22pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ingredient`
--

CREATE TABLE `tbl_ingredient` (
  `ingredient_id` int(11) NOT NULL,
  `ingredient` varchar(255) NOT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `time_created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ingredient`
--

INSERT INTO `tbl_ingredient` (`ingredient_id`, `ingredient`, `supplier`, `stock`, `price`, `date_created`, `time_created`) VALUES
(20, 'Burger', 'mcdo', 100, '10.00', '07-29-2022', '06:13pm'),
(21, 'Onion', 'jollibee', 100, '10.00', '07-29-2022', '06:13pm'),
(22, 'Tomato', 'chowking', 100, '10.00', '07-29-2022', '06:13pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `orders_id` int(11) NOT NULL,
  `orders` varchar(255) NOT NULL,
  `bill` varchar(255) NOT NULL,
  `tax` varchar(255) NOT NULL,
  `expenses` varchar(255) NOT NULL,
  `order_text` varchar(255) NOT NULL,
  `price_text` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_hide` int(11) NOT NULL,
  `order_successful` int(11) NOT NULL,
  `date_ordered` varchar(255) DEFAULT NULL,
  `time_ordered` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`orders_id`, `orders`, `bill`, `tax`, `expenses`, `order_text`, `price_text`, `user_id`, `employee_hide`, `order_successful`, `date_ordered`, `time_ordered`) VALUES
(1, '[\"{\"productID\":\"11\",\"productQnty\":\"1\"}\"]', '255.00', '5.00', '30.00', '1 Small burger 01\r\n', '250.00\r\n', 3, 1, 1, '07-29-2022', '06:21pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `volume` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `cost` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `ingredient` varchar(255) NOT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `time_created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product`, `image`, `category`, `size`, `volume`, `price`, `cost`, `stock`, `ingredient`, `date_created`, `time_created`) VALUES
(11, 'burger 01', 'hamburger.jpg', 'Fast Food', 'Small', '12.oz', '250.00', '30', 9, 'Burger\nOnion\nTomato\n', '07-29-2022', '06:14pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `sales_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `date_accepted` varchar(255) DEFAULT NULL,
  `time_accepted` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_sales`
--

INSERT INTO `tbl_sales` (`sales_id`, `orders_id`, `date_accepted`, `time_accepted`) VALUES
(1, 1, '07-29-2022', '06:23pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_size`
--

CREATE TABLE `tbl_size` (
  `size_id` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `time_created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_size`
--

INSERT INTO `tbl_size` (`size_id`, `size`, `date_created`, `time_created`) VALUES
(5, 'Small', '07-29-2022', '05:05pm'),
(6, 'Medium', '07-29-2022', '05:05pm'),
(14, 'Large', '07-29-2022', '05:07pm'),
(15, 'Extra Large', '07-29-2022', '05:38pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `account_enabled` int(11) NOT NULL,
  `account_active` int(11) NOT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `time_created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `image`, `firstname`, `lastname`, `email`, `password`, `gender`, `phone_number`, `address`, `account_enabled`, `account_active`, `date_created`, `time_created`) VALUES
(3, 'elon.jpg', 'marwin', 'imperial', 'test@gmail.com', '698d51a19d8a121ce581499d7b701668', 'male', '09152829721', 'asdasda', 1, 1, '07-29-2022', '06:20pm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tbl_admin_accessibility`
--
ALTER TABLE `tbl_admin_accessibility`
  ADD PRIMARY KEY (`admin_accessibility_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category` (`category`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tbl_ingredient`
--
ALTER TABLE `tbl_ingredient`
  ADD PRIMARY KEY (`ingredient_id`),
  ADD UNIQUE KEY `ingredient` (`ingredient`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product` (`product`);

--
-- Indexes for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `tbl_size`
--
ALTER TABLE `tbl_size`
  ADD PRIMARY KEY (`size_id`),
  ADD UNIQUE KEY `size` (`size`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_admin_accessibility`
--
ALTER TABLE `tbl_admin_accessibility`
  MODIFY `admin_accessibility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_ingredient`
--
ALTER TABLE `tbl_ingredient`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_size`
--
ALTER TABLE `tbl_size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
