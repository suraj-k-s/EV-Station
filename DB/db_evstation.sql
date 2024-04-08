-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2024 at 10:13 AM
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
-- Database: `db_evstation`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_contact` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `booking_id` int(100) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_fordate` date NOT NULL,
  `booking_time` time(6) NOT NULL,
  `booking_type` varchar(100) NOT NULL,
  `port_id` int(100) NOT NULL,
  `booking_hour` time(6) NOT NULL,
  `booking_amount` varchar(100) NOT NULL,
  `booking_status` varchar(100) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(11, 'ev'),
(12, 'car'),
(13, 'two wheeler'),
(14, 'four wheeler');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chargingsport`
--

CREATE TABLE `tbl_chargingsport` (
  `port_id` int(100) NOT NULL,
  `port_name` varchar(100) NOT NULL,
  `port_details` varchar(100) NOT NULL,
  `port_watt` varchar(100) NOT NULL,
  `port_status` varchar(100) NOT NULL,
  `port_amount` varchar(100) NOT NULL,
  `cpo_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(100) NOT NULL,
  `complaint_date` date NOT NULL,
  `complaint_title` varchar(100) NOT NULL,
  `complaint_details` varchar(100) NOT NULL,
  `complaint_reply` varchar(100) NOT NULL,
  `complaint_status` varchar(100) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cpo`
--

CREATE TABLE `tbl_cpo` (
  `cpo_id` int(100) NOT NULL,
  `cpo_name` varchar(100) NOT NULL,
  `cpo_email` varchar(100) NOT NULL,
  `cpo_password` varchar(100) NOT NULL,
  `cpo_address` varchar(100) NOT NULL,
  `cpo_pin` varchar(100) NOT NULL,
  `cpo_photo` varchar(100) NOT NULL,
  `cpo_status` varchar(100) NOT NULL,
  `cpo_contact` varchar(100) NOT NULL,
  `cpo_proof` varchar(100) NOT NULL,
  `place_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(15, 'ERNAKULAM'),
(18, 'IDUKKI'),
(20, 'kozhikode');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `place_name` varchar(100) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `district_id`) VALUES
(6, 'kodugallor', 4),
(7, 'kothamangalam', 15),
(9, 'mukkam', 20),
(11, 'kothamangalm', 15),
(12, 'mukkam 2', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `review_id` int(100) NOT NULL,
  `review_date` date NOT NULL,
  `review_count` varchar(100) NOT NULL,
  `review_details` varchar(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `cpo_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shop`
--

CREATE TABLE `tbl_shop` (
  `shop_name` varchar(120) NOT NULL,
  `shop_contact` varchar(121) NOT NULL,
  `shop_email` varchar(121) NOT NULL,
  `shop_address` varchar(123) NOT NULL,
  `shop_photo` varchar(121) NOT NULL,
  `shop_password` varchar(123) NOT NULL,
  `place_id` int(120) NOT NULL,
  `shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shop`
--

INSERT INTO `tbl_shop` (`shop_name`, `shop_contact`, `shop_email`, `shop_address`, `shop_photo`, `shop_password`, `place_id`, `shop_id`) VALUES
('kulukki', '9876543210', 'ahsvdjgvhbj@gmail.com', 'ajdbckjbcds', 'UserPhoto_1072.jpg', 'abcd', 7, 1),
('jvkhbjn', '9876543210', 'khhgcfgx@gmail.com', 'hbbjknk', 'UserPhoto_1758.jpg', 'abcd', 7, 2),
('sajis', '8765432190', 'sajis@gmail.com', 'asxcvbgfd', 'UserPhoto_999.jpg', 'abcd', 7, 3),
('saji', '9876543210', 'sajis@gmail.com', 'sdfgbvc', 'UserPhoto_1035.jpg', 'abcd', 7, 4),
('ev123', '8765432190', 'ev@gmail.com', 'svdfv\r\n', 'UserPhoto_1274.jpg', 'ev12', 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_station`
--

CREATE TABLE `tbl_station` (
  `station_id` int(100) NOT NULL,
  `station_name` varchar(100) NOT NULL,
  `station_email` varchar(100) NOT NULL,
  `station_address` varchar(200) NOT NULL,
  `place_id` int(100) NOT NULL,
  `station_password` varchar(100) NOT NULL,
  `station_photo` varchar(100) NOT NULL,
  `station_contact` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_station`
--

INSERT INTO `tbl_station` (`station_id`, `station_name`, `station_email`, `station_address`, `place_id`, `station_password`, `station_photo`, `station_contact`) VALUES
(1, 'ev122', 'ev2@gmail.com', 'asxcvbgfd', 7, 'john', 'UserPhoto_1685.jpg', '09876543211'),
(2, 'ev122', 'ev2@gmail.com', 'gbgfb', 7, 'john', 'UserPhoto_1055.jpg', '09876543211'),
(3, 'ev00', 'ev2@gmail.com', 'dfbvfgb', 7, '321', 'UserPhoto_1287.jpg', '09876543211');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

CREATE TABLE `tbl_subcategory` (
  `subcategory_id` int(11) NOT NULL,
  `subcategory_name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_subcategory`
--

INSERT INTO `tbl_subcategory` (`subcategory_id`, `subcategory_name`, `category_id`) VALUES
(1, 'i dont know', 4),
(2, '.khi', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_pin` varchar(100) NOT NULL,
  `user_contact` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_photo` varchar(100) NOT NULL,
  `user_proof` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_userfirst`
--

CREATE TABLE `tbl_userfirst` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_contact` varchar(100) NOT NULL,
  `user_gender` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `place_id` int(11) NOT NULL,
  `user_photo` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_userfirst`
--

INSERT INTO `tbl_userfirst` (`user_id`, `user_name`, `user_contact`, `user_gender`, `user_email`, `user_address`, `place_id`, `user_photo`, `user_password`) VALUES
(1, 'SUraj k s', '8765432190', 'male', 'abhsiheknr120@gmail.com', 'tyuiofcgv', 7, 'UserPhoto_1280.jpg', '123'),
(2, 'johiiii', '1234567890', 'male', 'john345@gmail.com', 'dfavg', 7, 'UserPhoto_1726.jpg', '321'),
(6, 'mikr', '1234567890', 'male', 'mike@gmail.com', 'WDASDCDSCD', 7, 'UserPhoto_1819.jpg', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_chargingsport`
--
ALTER TABLE `tbl_chargingsport`
  ADD PRIMARY KEY (`port_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_cpo`
--
ALTER TABLE `tbl_cpo`
  ADD PRIMARY KEY (`cpo_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `tbl_shop`
--
ALTER TABLE `tbl_shop`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `tbl_station`
--
ALTER TABLE `tbl_station`
  ADD PRIMARY KEY (`station_id`);

--
-- Indexes for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD PRIMARY KEY (`subcategory_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_userfirst`
--
ALTER TABLE `tbl_userfirst`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `booking_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_chargingsport`
--
ALTER TABLE `tbl_chargingsport`
  MODIFY `port_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cpo`
--
ALTER TABLE `tbl_cpo`
  MODIFY `cpo_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `review_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shop`
--
ALTER TABLE `tbl_shop`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_station`
--
ALTER TABLE `tbl_station`
  MODIFY `station_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_userfirst`
--
ALTER TABLE `tbl_userfirst`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
