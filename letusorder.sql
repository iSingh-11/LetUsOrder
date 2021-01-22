-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2021 at 01:53 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `letusorder`
--

-- --------------------------------------------------------

--
-- Table structure for table `allorders`
--

CREATE TABLE `allorders` (
  `OrderID` varchar(20) NOT NULL,
  `SoldBy` varchar(50) NOT NULL,
  `OrderedBy` varchar(50) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `SubCategory` varchar(30) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(11,2) NOT NULL,
  `PaymentMethod` varchar(30) NOT NULL,
  `OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allorders`
--

INSERT INTO `allorders` (`OrderID`, `SoldBy`, `OrderedBy`, `ProductName`, `SubCategory`, `Quantity`, `Price`, `PaymentMethod`, `OrderDate`) VALUES
('LUO_#1', 'Tendies', 'guriqbal.singh11@yahoo.in', 'Allen Solly Mens Regular Fit Casual Shirt', 'topwear', 5, '4998.00', 'Cash On Delivery', '2021-01-19'),
('LUO_#2', 'RS Electronics', 'guriqbal.singh11@yahoo.in', 'Apple iPhone 12 Pro Max', 'smartphones', 3, '305969.40', 'Cash On Delivery', '2021-01-19'),
('LUO_#3', 'Gulati Electronics', 'guriqbal.singh11@yahoo.in', 'Apple Watch Series 3', 'smartwatches', 1, '21318.00', 'Cash On Delivery', '2021-01-19'),
('LUO_#4', 'Dhawan Electronics', 'guriqbal.singh11@yahoo.in', 'One Plus Nord', 'smartphones', 2, '57117.96', 'Cash On Delivery', '2021-01-19');

-- --------------------------------------------------------

--
-- Table structure for table `beautyandhygiene`
--

CREATE TABLE `beautyandhygiene` (
  `ImageLink` varchar(250) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `Price` varchar(50) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `SubCategory` varchar(50) NOT NULL,
  `Availability` varchar(500) NOT NULL,
  `SoldBy` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `beautyandhygiene`
--

INSERT INTO `beautyandhygiene` (`ImageLink`, `ProductName`, `Price`, `Description`, `SubCategory`, `Availability`, `SoldBy`) VALUES
('https://cdn.shopify.com/s/files/1/0459/6563/9834/products/pc_1.7906eea27264_5000x.jpg?v=1603282171', 'Complete Hair Nourish Value Pack', '1170', 'Get the Avocado Non Sticky Hair Oil for frizz-free, moisturized hair, all day.\r\nAvocado Oil’s super effective composition of vitamins, minerals, biotin, and antioxidants nourish your hair.\r\nGrapeseed Oil’s Omega 6 fatty acids and Vitamin E fight frizz, roughness and eliminates split ends.\r\nOnion & Egg Hair Mask with Wheat Proteins and Macadamia Nut Oil keep your hair shiny and strong.', 'BeautyAndHygiene', 'Panchkula, Rajpura, Patiala, Chandigarh', 'Sonakshi Skincare, Beauty Love, Fashion Point, The Style, M.A.C, Karuna Cosmetics'),
('https://cdn.shopify.com/s/files/1/0459/6563/9834/products/WebsiteCombo_DFH_TSF_PSB_2000x.jpg?v=1605857438', 'Defender For Her Womens Razor-3 in 1', '1024', 'Engineered with optimal blade gaps, Defender For Her’s independently suspended blades pivot both ways allowing you to confidently and freely glide it along the contours of your body.\r\nComes pre-installed with a sensitive blade cartridge and a protective blade cover for longevity.\r\nIncludes Turmeric Shaving Foam with Sandalwood and Kesar.\r\nTurmeric\'s anti-inflammatory and antibacterial benefits help reduce redness.', 'BeautyAndHygiene', 'Panchkula, Rajpura, Patiala', 'Sonakshi Skincare, Beauty Love, Fashion Point, The Style'),
('https://i0.wp.com/www.glossypolish.com/wp-content/uploads/Himalaya-Wipes-Moisturizing-Aloe-Vera-1.jpg?fit=800600&ssl=1', 'Himalaya Moisturizing Aloe Vera Facial Wipes', '160', 'Quantity: 25 Count\r\nPacked with the goodness of aloe Vera, Himalaya moisturizing aloe Vera facial wipes help moisturize and soothe your skin while effectively removing dirt\r\nEnriched with natural ingredients, facial wipes help cleanse your skin gently\r\nThe convenient, resealable, packaging prevents the wipes from drying, locks-in moisture and helps retain freshness', 'BeautyAndHygiene', 'Mohali, Chandigarh', 'The Body Shop, Pasion Cosmetics Shoppe, Beauty Centre'),
('https://cdn2.stylecraze.com/wp-content/uploads/2013/08/Olay-Moisturizing-Cream.jpg', 'Olays Natural White Cream', '499', 'Olay Natural White Day Glowing Fairness cream nourishes and helps protect your skin with 7 benefits in just 1 bottle. Powered with a tri-Vitamin boost of B3, pro-B5 and E and SPF 24/PA++, for your natural glowing skin. Avoid contact with eyes. If contact occurs, rinse eyes thoroughly with water.', 'BeautyAndHygiene', 'Panchkula, Chandigarh', 'Navkar Cosmetics, Beauty Centre, Flaunt With Shehnaaz'),
('https://images-na.ssl-images-amazon.com/images/I/41D9AsFarKL.jpg\r\n', 'TYA Makeup Kit', '1500', 'combo set of Face and Body Foundation , Loose Powder, Compact, Blusher, Kajal, Blender Puff, 1 Makeup Brush, Concealer, 2 Lipstick, 3 In 1 (mascara, Eyeliner, Eyebrow Pencil)\r\nA creamy semi-matte lipstick, Leaves lips with a luminous shine and rich full coverage, This formula moisturizes and comforts lips\r\nThe trendy and stylish, makeup set for traveling or everyday use for all makeup enthusiasts.', 'BeautyAndHygiene', 'Kurukshetra, Chandigarh', 'The Bangles, Flaunt With Shehnaaz, The Bazaar');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryName`) VALUES
('Clothing'),
('Electronics'),
('Gadgets'),
('Groceries'),
('HomeAndDecors');

-- --------------------------------------------------------

--
-- Table structure for table `clothing`
--

CREATE TABLE `clothing` (
  `Types` varchar(40) NOT NULL,
  `MainCategory` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clothing`
--

INSERT INTO `clothing` (`Types`, `MainCategory`) VALUES
('BottomWear', 'clothing'),
('FestiveWear', 'clothing'),
('InnerWear', 'clothing'),
('SleepWear', 'clothing'),
('TopWear', 'clothing');

-- --------------------------------------------------------

--
-- Table structure for table `electronics`
--

CREATE TABLE `electronics` (
  `Types` varchar(40) NOT NULL,
  `MainCategory` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `electronics`
--

INSERT INTO `electronics` (`Types`, `MainCategory`) VALUES
('Appliances', 'Electronics'),
('Laptops', 'Electronics'),
('Lights', 'Electronics'),
('Smartphones', 'Electronics'),
('SmartTV', 'Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `gadgets`
--

CREATE TABLE `gadgets` (
  `Types` varchar(40) NOT NULL,
  `MainCategory` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gadgets`
--

INSERT INTO `gadgets` (`Types`, `MainCategory`) VALUES
('Cameras', 'Gadgets & Accessories'),
('EarWears', 'Gadgets & Accessories'),
('FitnessBands', 'Gadgets & Accessories'),
('Smartwatches', 'Gadgets & Accessories'),
('Speakers', 'Gadgets & Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `groceries`
--

CREATE TABLE `groceries` (
  `Types` varchar(50) NOT NULL,
  `MainCategory` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groceries`
--

INSERT INTO `groceries` (`Types`, `MainCategory`) VALUES
('BeautyAndHygiene', 'Groceries'),
('CleaningAndHousehold', 'Groceries'),
('FruitsAndVegetables', 'Groceries'),
('MasksAndGloves', 'Groceries'),
('Snacks', 'Groceries');

-- --------------------------------------------------------

--
-- Table structure for table `guriqbal.singh11@yahoo.in`
--

CREATE TABLE `guriqbal.singh11@yahoo.in` (
  `CartImage` varchar(500) NOT NULL,
  `CartItem` varchar(70) NOT NULL,
  `ItemType` varchar(40) NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `guriqbal.singh11@yahoo.inorders`
--

CREATE TABLE `guriqbal.singh11@yahoo.inorders` (
  `OrderID` varchar(20) NOT NULL,
  `SoldBy` varchar(50) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `SubCategory` varchar(30) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(11,2) NOT NULL,
  `PaymentMethod` varchar(30) NOT NULL,
  `OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guriqbal.singh11@yahoo.inorders`
--

INSERT INTO `guriqbal.singh11@yahoo.inorders` (`OrderID`, `SoldBy`, `ProductName`, `SubCategory`, `Quantity`, `Price`, `PaymentMethod`, `OrderDate`) VALUES
('LUO_#1', 'Tendies', 'Allen Solly Mens Regular Fit Casual Shirt', 'topwear', 5, '4998.00', 'Cash On Delivery', '2021-01-19'),
('LUO_#2', 'RS Electronics', 'Apple iPhone 12 Pro Max', 'smartphones', 3, '305969.40', 'Cash On Delivery', '2021-01-19'),
('LUO_#3', 'Gulati Electronics', 'Apple Watch Series 3', 'smartwatches', 1, '21318.00', 'Cash On Delivery', '2021-01-19'),
('LUO_#4', 'Dhawan Electronics', 'One Plus Nord', 'smartphones', 2, '57117.96', 'Cash On Delivery', '2021-01-19');

-- --------------------------------------------------------

--
-- Table structure for table `homeanddecors`
--

CREATE TABLE `homeanddecors` (
  `Types` varchar(50) NOT NULL,
  `MainCategory` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `homeanddecors`
--

INSERT INTO `homeanddecors` (`Types`, `MainCategory`) VALUES
('HomeGarden', 'Home&Decors'),
('Spiritual', 'Home&Decors'),
('TableDecor', 'Home&Decors'),
('WallAccents', 'Home&Decors'),
('WallArt', 'Home&Decors');

-- --------------------------------------------------------

--
-- Table structure for table `laptops`
--

CREATE TABLE `laptops` (
  `ImageLink` varchar(500) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `Price` int(11) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `SubCategory` varchar(40) NOT NULL,
  `Availability` varchar(500) NOT NULL,
  `SoldBy` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laptops`
--

INSERT INTO `laptops` (`ImageLink`, `ProductName`, `Price`, `Description`, `SubCategory`, `Availability`, `SoldBy`) VALUES
('https://images-na.ssl-images-amazon.com/images/I/61tPumNRo4L._SL1486_.jpg', 'Acer Swift 3 SF314-52 14-inch Laptop ', 41043, '2.70GHz Intel Core i3 7th Gen processor\r\n4GB DDR4 RAM\r\n256GB hard drive\r\n14-inch screen, Intel integrated Graphics\r\nLinux operating system\r\n1.6kg laptop\r\nCountry of Origin: China', 'Laptops', 'Chandigarh, Panchkula', 'Sahni Sales, Kuldeep Electricals, Rana Electronics'),
('https://images-na.ssl-images-amazon.com/images/I/61%2BWdmg%2BruL._SL1280_.jpg', 'Dell Inspiron 3593 15.6-inch FHD Laptop', 38590, 'Processor:10th Generation Intel Core i3-1005G1 Processor (4MB Cache, 1.2 GHz to 3.4 GHz)\r\nMemory & Storage:8GB RAM Single Channel DDR4 2666 MHz |1TB 5400 RPM 2.5\" Hard Disk Drive\r\nDisplay:15.6-inch FHD (1920 x 1080) Anti-Glare LED-Backlit Display\r\nGraphics: Intel UHD Graphics with shared graphics memory', 'Laptops', 'Chandigarh', 'Shreeram Electrical & Parts'),
('https://images-na.ssl-images-amazon.com/images/I/71t-J3VJtEL._SL1500_.jpg', 'HP 15 core i5 10th Gen 15.6 inch FHD Lap', 56990, '1.6GHz Intel i5-10210U processor\r\n4GB DDR4 RAM\r\n1TB 5400rpm hard drive + 256GB SSD\r\n15.6-inch screen, Intel UHD Graphics\r\nWindows 10 Home operating system\r\n1.85kg laptop', 'Laptops', 'Chandigarh, Rajpura', 'Sahni Sales, Navdeep Electronics, AllClear Electronics'),
('https://images-na.ssl-images-amazon.com/images/I/712rmwd8XGL._SL1500_.jpg', 'HP Pavilion x360 14-cd0050TX Convertible', 65990, 'Fingerprint Reader, Convertible, Full HD Touchscreen, Inking Pen, Backlit keyboard, Bluetooth, Solid State Hybrid Drive (SSHD), MS Office Home & Student 2016\r\n14 inch diagonal FHD IPS Micro-Edge WLED-backlit multitouch-enabled (1920 x 1080) Touchscreen Display\r\n8th Gen Intel Core i3-8130U (2.2 GHz base frequency, up to 3.4 GHz with Intel Turbo Boost Technology, 4 MB cache, 2 cores)', 'Laptops', 'Mohali, Ambala', 'Gulati Electronics, Navi Communication, Fibre Electronics, Yash Electricals, RS Electronics'),
('https://images-na.ssl-images-amazon.com/images/I/71hfs3%2BFRCL._AC_SL1500_.jpg', 'MacBook Air MDQ32HN/A 13-inch Display', 86399, 'macOS High Sierra OS\r\n1.8 GHz dual-core Intel Core i5 Processor\r\nIntel HD Graphics 6000\r\n720p FaceTime HD Camera', 'Laptops', 'Ambala, Mohali, Kurukshetra', 'Fibre Electronics, Yash Electricals, Hans Electricals, Param E-store, Gada electronics');

-- --------------------------------------------------------

--
-- Table structure for table `random`
--

CREATE TABLE `random` (
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shopinfo`
--

CREATE TABLE `shopinfo` (
  `ShopName` varchar(100) NOT NULL,
  `ShopCity` varchar(50) NOT NULL DEFAULT '',
  `ShopAddress` varchar(500) NOT NULL DEFAULT '',
  `ShopOwner` varchar(300) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopinfo`
--

INSERT INTO `shopinfo` (`ShopName`, `ShopCity`, `ShopAddress`, `ShopOwner`, `Category`, `Location`) VALUES
('A&A Furnishing Showroom', 'Patiala', 'SCO- 7-8, Bhupindra Rd, Bank Colony', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.345374,76.367598'),
('AllClear Electronics', 'Rajpura', '#Arya Samaj Rd, Chabra Tent House, near Central bank Of India', 'guriqbal.singh11@yahoo.in', 'Electronics', '31.34792,75.56488'),
('Aristocat Clothing', 'Chandigarh', 'Shop Number 46, Main Market, Sector 63, 160062', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.70777,76.72759'),
('Aura Decor', 'Mohali', 'BOOTH NO. 6, Sector 68, Sahibzada Ajit Singh Nagar', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.68721,76.72071'),
('Beauty Centre', 'Chandigarh', 'SCF -45 Phase -7', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.70196,76.72903'),
('Beauty Love', 'Rajpura', 'Shop no 16, Near Mahavir Mandir', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.47333,76.57841'),
('BigLife', 'Mohali', '1861, Mohali Stadium Rd, Sector 59, Sahibzada Ajit Singh Nagar, 160059', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.6953,76.73308'),
('Chumbak Home Decor', 'Chandigarh', 'S.C.O. 292, 1st Floor, Sector 20', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.719402,76.764655'),
('ChunMun', 'Mohali', 'Booth No. 14, Phase 1 Mohali, Mohali Sas Nagar, mohali - 160055,', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.71114,76.72129'),
('Decor Cart', 'Ambala', 'NH-1, Kalka Chowk', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.36927,76.76852'),
('Decor India', 'Mohali', 'Phase 3B1, Sector 68, Kumbra', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.69567,76.72371'),
('Dhawan Electronics', 'Chandigarh', 'SCR 1684, Main Bazar, Paschim Marg, Sector 38 West, Daddu Majra Colony', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.74586,76.74076'),
('Family Hut', 'Ambala', 'Maharaja Agrasen Chowk, SCO 9-13, Wholesale Textile Market, Sector 7', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.384367,76.770421'),
('Fantastic 58', 'Panchkula', ' SCF-73 Sector-10 , Panchkula, BEL Factory Rd, Sector 10', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.69334,76.84946'),
('Fashion Fort', 'Panchkula', 'Shopping Plaza, Panchkula Sector 20', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.66828,76.85706'),
('Fashion Point', 'Patiala', 'SCO 3, Bhupindra Rd, Bhupindra Nagar, Model Town', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.34692,76.37664'),
('Fibre Electronics', 'Ambala', 'NH-1, Kalka Chowk', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.36927,76.76852'),
('Flaunt With Shehnaaz', 'Chandigarh', 'S.C.F. 130 , Sarovar Path, Phase 7, Sector 61', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.70161,76.72867'),
('Gada electronics', 'Mohali', 'Shop No.6, Franco Hotel Road, Opp. Gurudwara Sahib, Phase 1, Mohali Village', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.728768,76.713808'),
('Gulati Electronics', 'Mohali', 'SCF 41, phase 9', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.70681,76.70693'),
('Hans Electricals', 'Kurukshetra', 'Opp. Circuit House Sector 8 chownk, Kurukshetra', 'guriqbal.singh11@yahoo.in', 'Electronics', '29.96008,76.87336'),
('Jagdish Store', 'Mohali', 'Shop No.6, Franco Hotel Road, Opp. Gurudwara Sahib, Phase 1, Mohali Village', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.728768,76.713808'),
('Kalra Home Decor', 'Panchkula', 'SCO 37, Amartex Rd, Sector 11', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.68707,76.85029'),
('Karuna Cosmetics', 'Rajpura', '#Arya Samaj Rd, Chabra Tent House, near Central bank Of India', 'guriqbal.singh11@yahoo.in', 'Groceries', '31.34792,75.56488'),
('Kiran Decors', 'Kurukshetra', 'SHOP NO 170P, HUDA Market Rd, Sector 3', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '29.97433,76.86878'),
('Kuldeep Electricals', 'Panchkula', 'SCO 37, Amartex Rd, Sector 11', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.68707,76.85029'),
('M.A.C', 'Chandigarh', 'S.C.O. 292, 1st Floor, Sector 20', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.7234,76.7849'),
('Mehta Furnishers', 'Mohali', 'BOOTH NO. 2, Sector 68, Sahibzada Ajit Singh Nagar', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.7139,76.71859'),
('MI Furnishers', 'Chandigarh', 'S.C.F. 137 , Sarovar Path, Phase 7, Sector 61', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.73461,76.79668'),
('Mohini Home Furnishing', 'Chandigarh', 'Shop 201, Elante Mall, Purv Marg, Industrial Area Phase I, Chandigarh', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.70809,76.80044'),
('Navdeep Electronics', 'Chandigarh', 'S.C.O. 292, 1st Floor, Sector 20', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.7234,76.7849'),
('Navi Communication', 'Ambala', 'Shop No 1466-67, Ward No-1, Kaith Mapri, Hissar Road, Hissar Road', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.384367,76.770421'),
('Navkar Cosmetics', 'Panchkula', 'SCO 37, Amartex Rd, Sector 11', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.68707,76.85029'),
('Nayyar Smartphones', 'Panchkula', 'DSS - 379, Near Gopal Sweets, Sector 8, 134109', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.70005,76.8492'),
('Param E-store', 'Kurukshetra', '710/10, Mohan Nagar, Sirsla Road', 'guriqbal.singh11@yahoo.in', 'Electronics', '29.97679,76.85211'),
('Pasion Cosmetics Shoppe', 'Mohali', 'BOOTH NO. 2, Sector 68, Sahibzada Ajit Singh Nagar', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.7139,76.71859'),
('Rain And Peacock', 'Ambala', 'Shop No 1466-67, Ward No-1, Kaith Mapri, Hissar Road, Hissar Road', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.384367,76.770421'),
('Rana Electronics', 'Panchkula', 'Booth No 229, BEL Colony, Sector 14', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.68104,76.84323'),
('Royal Home Decor', 'Rajpura', '#Arya Samaj Rd, Chabra Tent House, near Central bank Of India', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '31.34792,75.56488'),
('RS Electronics', 'Mohali', 'BOOTH NO. 2, Sector 68, Sahibzada Ajit Singh Nagar', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.7139,76.71859'),
('Sahni Sales', 'Chandigarh', 'S.C.F. 130, Sarovar Path, Phase 7, Sector 61', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.70161,76.72867'),
('Sajawat Home Decor Store', 'Mohali', 'Plot No.255, Sector 66A, Industrial Area, Industrial Area Mohali Phase 9', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.70681,76.70693'),
('Selection Point', 'Panchkula', 'DSS - 379, Near Gopal Sweets, Sector 8, 134109', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.70005,76.8492'),
('Shreeram Electrical & Parts', 'Chandigarh', 'SCF -45 Phase -7', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.70196,76.72903'),
('Singla Furnishers', 'Kurukshetra', '710/10, Mohan Nagar, Sirsla Road', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '29.97679,76.85211'),
('Sonakshi Skincare', 'Panchkula', 'Booth No 229, BEL Colony, Sector 14', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.68104,76.84323'),
('SouthHall', 'Rajpura', 'MLA Rd, opp. Ravindra Showroom, Neelpur, Rajpura', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.46893,76.58441'),
('Tendies', 'Rajpura', '12,13 City Center Kanika Garden, Patiala Rd, Rajpura Town', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.47412,76.58764'),
('The Bangles', 'Kurukshetra', '710/10, Mohan Nagar, Sirsla Road', 'guriqbal.singh11@yahoo.in', 'Groceries', '29.97679,76.85211'),
('The Bazaar', 'Kurukshetra', 'SHOP NO 170P, HUDA Market Rd, Sector 3', 'guriqbal.singh11@yahoo.in', 'Groceries', '29.97433,76.86878'),
('The Body Shop', 'Mohali', 'Shop No.6, Franco Hotel Road, Opp. Gurudwara Sahib, Phase 1, Mohali Village', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.728768,76.713808'),
('The Carpenter Shop', 'Rajpura', 'Shop No 16, Near Mahavir Mandir', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.47333,76.57841'),
('The Decor Store', 'Patiala', 'SCO 3, Bhupindra Rd, Bhupindra Nagar, Model Town', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.34692,76.37664'),
('The Decors', 'Panchkula', 'Booth No 229, BEL Colony, Sector 14', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.68104,76.84323'),
('The Style', 'Patiala', 'SCO- 7-8, Bhupindra Rd, Bank Colony', 'guriqbal.singh11@yahoo.in', 'Groceries', '30.345374,76.367598'),
('The Woods', 'Mohali', 'Sector 90, Sahibzada Ajit Singh Nagar', 'guriqbal.singh11@yahoo.in', 'HomeAndDecors', '30.71549,76.7289'),
('Wardrobe', 'Rajpura', 'NH 64, Dalima Vihar, Rajpura-Patiala Highway, Kharajpur, 140401', 'guriqbal.singh11@yahoo.in', 'Clothing', '30.46703,76.58475'),
('Yash Electricals', 'Mohali', 'Phase 3B1, Sector 68, Kumbra', 'guriqbal.singh11@yahoo.in', 'Electronics', '30.69,76.72371');

-- --------------------------------------------------------

--
-- Table structure for table `smartphones`
--

CREATE TABLE `smartphones` (
  `ImageLink` varchar(500) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `Price` int(11) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `SubCategory` varchar(40) NOT NULL,
  `Availability` varchar(100) NOT NULL,
  `SoldBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smartphones`
--

INSERT INTO `smartphones` (`ImageLink`, `ProductName`, `Price`, `Description`, `SubCategory`, `Availability`, `SoldBy`) VALUES
('https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6009/6009739_sd.jpg', 'Apple iPhone 12 Pro Max', 99990, 'iPhone 12 Pro Max smartphone was launched on 13th October 2020. The phone comes with a 6.70-inch touchscreen display with a resolution of 1284x2778 pixels at a pixel density of 458 pixels per inch (ppi). ... The iPhone 12 Pro Max measures 160.80 x 78.10 x 7.40mm (height x width x thickness) and weighs 228.00 grams.', 'Smartphones', 'Mohali, Rajpura', 'Gada Electronics, RS Electronics, AllClear Electronics'),
('https://static.toiimg.com/photo/78184734/OnePlus-Nord-N10-5G.jpg', 'One Plus Nord', 27999, 'The smartphone features a 48 MP (wide) + 8 MP (ultrawide) + 5MP (depth) + 2 MP (macro) cameras at the back. The front camera is a 32 MP (wide) + 8 MP (ultrawide). There is no 3.5mm jack featured on the smartphone. The OnePlus Nord is fueled with Non-removable Li-Po 4115 mAh battery + Fast charging 30W, 70% in 30 min.', 'Smartphones', 'Chandigarh', 'Dhawan Electronics'),
('https://static.digit.in/default/26af91b06c0e70e2de1d0ea6dd5aca991b81bb28.jpeg?tr=1200', 'Realme 7 pro', 19999, 'The Realme 7 Pro is the spiritual successor to the Realme 6 Pro, boasting of big upgrades such as an AMOLED display, stereo speakers, and 65W fast charging. The Realme 7 Pro features the same mirror-split design on its back as the Realme 7, but it\'s a lot slimmer (8.7mm) and lighter (182g), even compared to the Realme 6 Pro.', 'Smartphones', 'Chandigarh', 'Shreeram Electrical & Parts'),
('https://static.digit.in/default/cc533e2c683b95c061080240c957c3f76397eca5.jpeg?tr=1200', 'Samsung Galaxy M51', 21999, ' The Samsung Galaxy M51 is the first smartphone from the company to pack in a massive 7,000mAh battery. The Galaxy M51 also gets a bigger 6.7-inch SuperAMOLED display with a full-HD+ resolution. Samsung has opted for the 20:9 aspect ratio which makes the device tall and narrow.\r\nRelease date: 31st August 2020\r\nWeight (g): 213.00\r\nBattery capacity (mAh): 7000\r\nColours: Electric Blue, Celestial Black', 'Smartphones', 'Chandigarh, Panchkula', 'Dhawan Electronics, Nayyar Smartphones'),
('https://thumbs.dreamstime.com/b/online-order-online-order-icon-146783797.jpg', 'Testing', 32, 'A Test Description', 'Smartphones', '', ''),
('https://www.gizmochina.com/wp-content/uploads/2020/09/vivo-1-600x600.jpg', 'Vivo v20 Se', 21000, 'The phone comes with a 6.44-inch touchscreen display with a resolution of 1080x2400 pixels and an aspect ratio of 20:9. Vivo V20 SE is powered by an octa-core Qualcomm Snapdragon 665 processor. It comes with 8GB of RAM. The Vivo V20 SE runs Android 10 and is powered by a 4100mAh removable battery.', 'Smartphones', 'Mohali, Chandigarh', 'Gada Electronics, Shreeram Electrical & Parts');

-- --------------------------------------------------------

--
-- Table structure for table `smarttv`
--

CREATE TABLE `smarttv` (
  `ImageLink` varchar(500) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `Price` int(11) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `SubCategory` varchar(40) NOT NULL,
  `Availability` varchar(500) NOT NULL,
  `SoldBy` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smarttv`
--

INSERT INTO `smarttv` (`ImageLink`, `ProductName`, `Price`, `Description`, `SubCategory`, `Availability`, `SoldBy`) VALUES
('https://thumbs.dreamstime.com/b/online-order-online-order-icon-146783797.jpg', 'Testing', 32, 'A Test Description', 'SmartTV', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `smartwatches`
--

CREATE TABLE `smartwatches` (
  `ImageLink` varchar(500) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `Price` int(10) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `SubCategory` varchar(40) NOT NULL,
  `Availability` varchar(100) NOT NULL,
  `SoldBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smartwatches`
--

INSERT INTO `smartwatches` (`ImageLink`, `ProductName`, `Price`, `Description`, `SubCategory`, `Availability`, `SoldBy`) VALUES
('https://images-na.ssl-images-amazon.com/images/I/51Qy8XMDPWL._SL1024_.jpg', 'Apple Watch Series 3', 20900, 'Apple Watch Series 3 42mm has 1.66 Inch (4.22 cm) OLED Display display for apps and other functions of the smartwatch. ... It has other features like Waterproof, Call Function, Upto 1 Day battery life, Rectangular, Curved Dial Design, 1.66 Inch (4.22 cm) OLED Display.', 'Smartwatches', 'Mohali, Ambala', 'Gulati Electronics, Navi Communication'),
('https://images-na.ssl-images-amazon.com/images/I/6113mS%2BxhyL._SL1500_.jpg', 'Noise ColorFit Pro 2', 3000, 'The ColorFit Pro 2 from Noise is a smartwatch that flaunts a stylish new design that features a gorgeous 3.3 cm (1.3) full-touch colour display. It also has interesting health and activity tracking features. ... Noise has designed this smartwatch to be super-light by using an impact-resistant polycarbonate body.', 'Smartwatches', 'Ambala, Mohali', 'Fibre Electronics, Yash Electricals'),
('https://i.gadgets360cdn.com/large/oppo_Watch_body_1583501305752.jpg', 'Oppo Watch 46MM', 19990, 'OPPO Watch is dressed to impress, with a dual-curved flexible AMOLED screen, crisp image quality, and colors that pop. A 3D curved back design keeps your watch looking good from different angles. ... Note:OPPO Watch 46mm has a 1.91-inch flexible AMOLED dual-curved screen. OPPO Watch 41mmhas a 1.6-inch rigid AMOLED screen.', 'Smartwatches', 'Chandigarh', 'Shreeram Electrical & Parts'),
('https://i.gadgets360cdn.com/products/large/realme-watch-670x800-1590388807.jpg', 'Realme Smartwatch', 3999, 'Product description Featuring a large 3.5 cm (1.4) touchscreen, this smartwatch from realme is a must-have accessory. It will help you keep track of your fitness endeavours with its set of features such as heart rate monitor, 14 sports modes, and blood oxygen level monitor.\r\nStanding screen display size: 1.4 Inches\r\nModel Name: Realme Smart Watch\r\nModel: RMA161\r\nModel Year: 2020', 'Smartwatches', 'Chandigarh, Panchkula', 'Sahni Sales, Kuldeep Electricals'),
('https://gloimg.gbtcdn.com/images/pdm-product-pic/Electronic/2020/01/10/source-img/20200110151549_5e1824a54067a.jpg_500x500.jpg', 'Xiaomi mi SmartWatch', 10999, 'Xiaomi Mi Watch has 1.78 Inch (4.52 cm) AMOLED Display display for apps and other functions of the smartwatch. On the wear-ability side, this smartwatch weighs . It has other features like Waterproof, Fitness Tracking, 570 mAh battery capacity, Rectangular, Flat Dial Design, 1.78 Inch (4.52 cm) AMOLED Display.', 'Smartwatches', 'Chandigarh, Rajpura', 'Navdeep Electronics, AllClear Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `spiritual`
--

CREATE TABLE `spiritual` (
  `ImageLink` varchar(500) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `Price` int(11) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `SubCategory` varchar(40) NOT NULL,
  `Availability` varchar(500) NOT NULL,
  `SoldBy` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spiritual`
--

INSERT INTO `spiritual` (`ImageLink`, `ProductName`, `Price`, `Description`, `SubCategory`, `Availability`, `SoldBy`) VALUES
('https://ii1.pepperfry.com/media/catalog/product/b/l/568x625/blue-traditional-47x27-inches-velvet-prayer-mat-by-the-home-talk-blue-traditional-47x27-inches-velve-6mnnm6.jpg', 'Blue Traditional Velvet Prayer Mat', 699, 'Brand: The Home Talk\r\nColour: Blue\r\nAssembly: No Assembly Required\r\nSet Content: 1 Prayer Mat\r\nMaterial: Velvet\r\nDimensions: 47 x 27 Inches', 'Spiritual', 'Panchkula, Mohali, Kurukshetra', 'The Decors, Mehta Furnishers, The Woods, Kiran Decors, Singla Furnishers'),
('https://ii1.pepperfry.com/media/catalog/product/s/o/568x625/solid-wood-pooja-mandir-for-home---office-in-copper-colour-by-d-dass-solid-wood-pooja-mandir-for-hom-ecezgk.jpg', 'Copper Sheesham Wood & MDF Pooja Mandir ', 5840, 'Material: Sheesham Wood & MDF\r\nDimensions: Height: 30, Width: 24,Depth: 12 Inches\r\nWeight: 7 Kgs\r\nColour: Copper\r\nPack Content: Wooden temple, Insence stick\r\nDoor: With Door\r\nDome: With Dome', 'Spiritual', 'Rajpura, Chandigarh', 'Royal Home Decor, MI Furnishers'),
('https://ii1.pepperfry.com/media/catalog/product/o/f/1100x1210/off-white-resin-ganesha-carved-in-resin-with-arch-backdrop-idol-by-handicrafts-paradise-off-white-re-hosrkl.jpg', 'Off White Resin Ganesha', 2000, 'Brand: Handicrafts Paradise\r\nAssembly: No Assembly Required\r\nMaterial: Resin\r\nDimensions: Length:3.3; Width:3; Height:4.5\r\nWeight: 350 Gms\r\nPhoto Size: 1', 'Spiritual', 'Panchkula', 'Kalra Home Decor'),
('https://ii1.pepperfry.com/media/catalog/product/p/u/568x625/purple-resin-feng-shui-pyramid-prism-by-golden-peacock-purple-resin-feng-shui-pyramid-prism-by-golde-mk33ix.jpg', 'Purple Resin Feng Shui Pyramid Prism', 1999, 'Brand: Golden Peacock\r\nAssembly: No Assembly Required\r\nDimensions: Depth:2.8; Width:2.8; Height:2.4\r\nWeight: 70 Gms\r\nColour: Purple', 'Spiritual', 'Mohali, Rajpura', 'Mehta Furnishers, The Woods, The Carpenter Shop'),
('https://ii1.pepperfry.com/media/catalog/product/w/h/568x625/white-pine-wood---mdf-shelf-style-temple-for-home---office-by-d-dass-white-pine-wood---mdf-shelf-sty-fepjrm.jpg', 'White Pine Wood Pooja Mandir', 1700, 'Material: Pine Wood\r\nDimensions: Height: 16, Width: 8,Depth: 6 Inches\r\nWeight: 4 Kg\r\nColour: White\r\nPack Content: 1 Wooden temple & Insence stick\r\nDoor: Without Door', 'Spiritual', 'Mohali, Panchkula', 'Sajawat Home Decor Store, Kalra Home Decor');

-- --------------------------------------------------------

--
-- Table structure for table `tabledecor`
--

CREATE TABLE `tabledecor` (
  `Image` varchar(500) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `Price` varchar(50) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `SubCategory` varchar(50) NOT NULL,
  `Availability` varchar(500) NOT NULL,
  `SoldBy` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabledecor`
--

INSERT INTO `tabledecor` (`Image`, `ProductName`, `Price`, `Description`, `SubCategory`, `Availability`, `SoldBy`) VALUES
('https://ii1.pepperfry.com/media/catalog/product/b/l/568x625/black-metal-street-pole-stand-victoria-station-dual-clock-by-exim-decor-black-metal-street-pole-stan-eo4u17.jpg', ' Black Metal Analog Table ClockBlack Metal Analog ', '1851', 'Brand: Exim Decor\r\nAssembly: No Assembly Required\r\nMaterial: Metal\r\nDimensions: Height: 14 x Width: 8 x Length: 5 Inches\r\nWeight: 0.58 Kgs\r\nColor: Black\r\nPack Content: 1 Table Clock\r\nDisplay: Analog\r\nShape: Abstract\r\nBattery Included: No\r\nWarranty: No warranty\r\nAlarm: No', 'TableDecor', 'Ambala, Mohali', 'Rain And Peacock, Decor India, Decor Cart'),
('https://ii1.pepperfry.com/media/catalog/product/a/l/800x880/aluminium-boat-platter-big-by-rishan-lifestyle-aluminium-boat-platter-big-by-rishan-lifestyle-pxruzy.jpg', 'Aluminium Boat Platter BigAluminium Boat Platter', '1223', 'Brand: Rishan Lifestyle\r\nColour: Silver\r\nAssembly: No Assembly Required\r\nMaterial: Aluminium\r\nDimensions: Length: 13, Width: 7, Height: 3\r\nWeight: 730 Grams\r\nPack Content: 1 Platter\r\nMicrowave Safe: No\r\nOven Safe: No', 'TableDecor', 'Patiala', 'The Decor Store, A&A Furnishing Showroom'),
('https://ii1.pepperfry.com/media/catalog/product/b/r/568x625/brown-aluminum-decorative-photo-frame-by-house-of-sajja-brown-aluminum-decorative-photo-frame-by-hou-ocytdh.jpg', 'Brown aluminum Decorative Photo Frame', '631', 'Brand: House of Sajja\r\nAssembly: No Assembly Required\r\nMaterial: Metal\r\nDimensions: Length:6.7 Width: 0.8 Height: 7 Inches\r\nWeight: 0.23\r\nPhoto Size: 6x4 Inches\r\nColour: Brown\r\nPack Content: 1 photo frame\r\nMount Type: Table\r\nCover Material: Glass', 'TableDecor', 'Patiala, Mohali, Chandigarh', 'The Decor Store, A&A Furnishing Showroom, Aura Decor, Mohini Home Furnishing'),
('https://ii1.pepperfry.com/media/catalog/product/o/r/800x880/orange-wrought-iron-human-figurine-set-of-3-by-godeccor-orange-wrought-iron-human-figurine-set-of-3--wfr5ag.jpg', 'Orange Wrought Iron Human Figurine Set Of 3', '2321', 'Brand: Godeccor\r\nAssembly: No Assembly Required\r\nMaterial: Wrought Iron\r\nDimensions: Height: 18 x Width: 5 x Length: 5 Inches\r\nWeight: 1.5 Kg\r\nColour: Orange\r\nPack Content: 3 Piece Musical Showpiece\r\nHand crafted: Yes', 'TableDecor', 'Mohali, Chandigarh', 'Jagdish Store, Chumbak Home Decor'),
('https://ii1.pepperfry.com/media/catalog/product/r/e/1100x1210/red-table-terracotta-vases--set-of-3--by-aakriti-art-creations-red-table-terracotta-vases--set-of-3--md5xt8.jpg', 'Red Table Terracotta Vases (Set Of 3)', '1399', 'Brand: Aakriti Art Creations\r\nAssembly: No Assembly Required\r\nMaterial: Terracotta\r\nDimensions: H 6 x W 3 x D 3 (all dimensions in inches)\r\nWeight: 0.55\r\nColor: Red', 'TableDecor', 'Mohali, Chandigarh', 'Jagdish Store, Decor India, Chumbak Home Decor');

-- --------------------------------------------------------

--
-- Table structure for table `topwear`
--

CREATE TABLE `topwear` (
  `ImageLink` varchar(500) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `Price` int(10) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `SubCategory` varchar(40) NOT NULL,
  `Availability` varchar(100) NOT NULL,
  `SoldBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topwear`
--

INSERT INTO `topwear` (`ImageLink`, `ProductName`, `Price`, `Description`, `SubCategory`, `Availability`, `SoldBy`) VALUES
('https://images-na.ssl-images-amazon.com/images/I/618CdresuCL._UL1500_.jpg', 'Allen Solly Mens Regular Fit Casual Shirt', 980, 'Colour: Navy\r\nCare Instructions: Machine Wash\r\nFit Type: Regular Fit\r\nColor Name: Navy\r\n100% Cotton\r\nLong sleeve\r\nRegular fit\r\nClassic collar\r\nMachine wash\r\nMade in India', 'TopWear', 'Rajpura', 'Tendies, Wardrobe, SouthHall'),
('https://images-na.ssl-images-amazon.com/images/I/815dJlDU28L._UL1500_.jpg', 'Arrow Grey Hooded Color Block Sweatshirt', 1440, 'Colour: GREY\r\nCare Instructions: machine wash\r\nColor: GREY\r\n100% Cotton\r\nHooded neck\r\nLong sleeve\r\nCasual Wear\r\nMachine wash', 'TopWear', 'Panchkula', 'Fashion Fort, Selection Point'),
('https://images-na.ssl-images-amazon.com/images/I/71dT9Q9qmbL._UL1500_.jpg', 'Denim Light Blue Jacket for Women & Girl', 950, 'Care Instructions: Machine Wash\r\nFit Type: Regular Fit\r\nCOLOR-LIGHT BLUE\r\nFABRIC-DENIM\r\nCARE-MACHINE WASH , HAND WASH', 'TopWear', 'Ambala, Mohali', 'Family Hut, ChunMun, BigLife'),
('https://images-na.ssl-images-amazon.com/images/I/61nEzv1cZLL._UL1500_.jpg', 'Monte Carlo Navy Blue Polyester Jacket', 3880, 'Size: 42 Size Chart\r\nCare Instructions: Dry Clean Only\r\nFit Type: Regular Fit\r\nFabric: Polyester\r\nPattern: Solid\r\nFit: Regular Fit', 'TopWear', 'Ambala, Chandigarh', 'Family Hut, Aristocat Clothing'),
('https://images-na.ssl-images-amazon.com/images/I/817Rki3OANL._UL1500_.jpg', 'Park Avenue Mens Notch Lapel Slim Fit Business Wear', 3100, 'Care Instructions: Dry Clean Only\r\nFit Type: Slim\r\nColor: Dark Blue\r\nMaterial: 65% Poly and 35% wool\r\nFit type: slim fit\r\nStyle: notch lapel\r\nBusiness Wear\r\nCare instruction: Dry clean only', 'TopWear', 'Panchkula', 'Fantastic 58, Selection Point, Fashion Fort');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `DP` mediumblob NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Pass` varchar(15) NOT NULL,
  `Contact` bigint(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`DP`, `Name`, `Username`, `Pass`, `Contact`, `Address`, `City`, `Location`) VALUES
(0xffd8ffe000104a46494600010100004800480000ffe1004c4578696600004d4d002a00000008000187690004000000010000001a000000000003a00100030000000100010000a002000400000001000001a5a003000400000001000001a500000000ffc000110801a501a503012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffdb004300020202020202030202030503030305060505050506080606060606080a0808080808080a0a0a0a0a0a0a0a0c0c0c0c0c0c0e0e0e0e0e0f0f0f0f0f0f0f0f0f0fffdb00430102020204040407040407100b090b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010ffdd0004001bffda000c03010002110311003f00fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd0fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd1fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a64922448d2cac111012cc4e0003a924f6a0690fa2be47f88dfb69fc14f03a4f65a1ea63c5bac460edb6d34f990ee04afcf75830a8dc083b4bb0c1f94d7e7ef8d3f6cdf8f7e2cbdb86d1f558bc2fa7cbf2a5b58c113b2a0cf59e64790b9c8cb2141c0c2af39f9ecc38a309877cae5ccfb2d7fe01fa4f0ef8519c660b9f93d9c7bceeafe8acdfe09799fb7559d7babe93a6eefed1bd82d76aef3e6c8a984e7e63b88e383cfb57f3bfaa78efe257893cd4d7bc5bac6a293a8478e7d42e248d97fba519cae3db18ae167d31249a416a145dc9b7cc9ca862a060753d5b030b9c81c1208c03f3f538ed7d8a5f7bff807e8985fa3f3debe33ee87eae4bf23fa0bd73f681f823e1db13a86a5e38d25a2040db6d751ddca7240f962b7324840cf242903a9e2b89d2bf6c1fd9c758ddf64f18a45b739fb4d9dedaf4c74f3e04cf5edefe86bf102df4cb7b65222400b1cb1ee4e31927a9381d4d4cd6887b571cf8df117f7611b7cff00cd1efd1f01b2b51b54af51beeb952fbb95fe67f401a4fc6cf839ae49e4e91e39d12ea6ef126a36e651d7aa6fdc3ee9ea3a0cd7a647224a8b2c4c1d1c02ac0e4107a10476afe6a5ec23230545615cf8a35cf02b245e06bdbad3f57b97df0ad85c496adbc7fcb466859480b9e4e7db35d3478e677b4e97dcff00e01e5637c01a36be1f16d7f8a29fe29afc99fd3b515f961fb357edb76fa0782e0f0b7ed077f7b7dadc33c8c3568adfce89a095c15497cb3e6968f7360ac5ca281f7861bf44bc11f147e1dfc48b6fb4f81bc4365ace137b4704a0cf1ae76e6484e248f9fefa8ea3d457d8e0338c3e252f67357edd7ee3f13e22e0acc72ca92588a4f913f8927cafe7fa3d4ef68a28af4cf930a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd2fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a64922448d2cac111012cc4e0003a924f6ae6bc63e35f09fc3ed027f1478d3548348d2edb01e79db68dcdc2a281967763c2aa82c4f001afc56fda53f6adf13fc66d4af3c35e19b89b4af040cc42d87c925fae7992e71c956ed1676818dc0b74f133acfa8e0a179eb27b2ebff00011f75c15c038cceaada9fbb4d6f36b45e4bbbf2fbda3ef1f8bffb767c2ef87d3cfa1f82e26f1aeb31a9f9ace545d3a39338db25d7cd923ae22493d09535f989f153f680f8b9f1b2e1ecfc65ac9874a94e5749b0060b154cf0654dc5e6e9c79ace33ca80338f15454853cc233c80abfde63d077fc7d064d6dd8c1e52977c191f96206327f5e3b0f6afcbf30e21c562eea72b47b2fd7b9fd57c31e1e65794a53a34f9aa7f3cb57f2e91f92bf9b2d5ad9c3026d8d40f5f73eb5a31c409a890e6a6693cb01472edd2bc95147db390f7623f730f0c7a9fee8ff1a9a28921408831fe351c29b07a93c93ea6ac039ab489b8b451591ae6b563a069b3ea9a83848605c9f527b01ee4f4a7ca272b6acc8f1778a6d7c3362ae54cf7972c22b6813efcb2b70001e992327fae0566786fc3fa85909357d6e713ead7b8f378cc712672228fb803b9fe23c9ce06307c1b1cfad5eb78e7c47098ee2e86db057e521b73c02be8ef9ea792bd382457a89e7915a544a2b956fd4c29c9cdf3bdba7f9ff5ff000d98e89d255f2c9f5e57b743f53819c13e950790f6f3a5d5bb3433c27724884aba91dd586083f4ad73d2aa9882ff00ab3b474dbd57f2edf862b99c51d3ce7bff0080ff006bbf8f7f0fe58637d78f8974f8db2f6dab8fb4960786c5ce45c038fbb990a83ced3c83f707c34ff82817c33f10c16f65f12ece6f086a6cc2379406bbd3ce41c389514488091f3078f09b87cec0330fc97740782369f4ea3f03597736e08208af6705c478cc3e919dd767affc1fc4f86cf7c36c9b314dd4a2a12fe687baff00c9fcd33fa66d1f59d1fc45a5db6b7e1fbe8353d3af104905cdacab3412a1e8c92212ac3dc1c56957f363f0cbe2cfc44f823af7fc241f0f3526b50cc5ee2c262efa7dd92bb7fd22dd5d03103187055c630180c8afd78fd9e3f6d8f017c67b8b6f09789a25f0a78ce7731c562eed2dbde6d5ceeb7b828ab93cfee9f0e3a2ef03757dfe4dc5987c5354e7eecfb3ebe8cfe77e32f0931f962957c3fef692d5b4b55eb1d745dd5d75763ed6a28a2bea8fc9828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00fffd3fddca28a2800a28a2800a28a2800a28a2800a28a2800af11f8f5f1ebc13fb3ef8264f16f8b65f3ae66dd169fa7c4c05c5f5c0190880e70ab9064908c20f562aadd87c4ef893e15f849e08d53c7de32bb5b4d3b4c899f9601e69307643183f7a491be5503bfb64d7f371f133e2df8d3e3ef8fae3e20f8e640b295f2ad2d2327c8b2b604948231d4f5cbb1e589c9eb81f37c479fc7054bddd66f6ff33f53f0cfc3c96715dd6c469420f5ef27fcabf57d179b3a8f891f16fc7ff1bbc51278cbe20deb3c878b5b088b2d958c7d364311270c7f89ce59bb9c715c9c29bc802b320e70055b9bf7acb60b8218665ebf77b2ff00c0bbfb718e735f8dd4af3ab3752a3bb67f61e1b0b4a8538d1a31518c74496892346cc9b993ed1c8887118231c7763df9fe58e01cd6fc7d2b36dd42a851d2b4e2000dc7a56b0469265a0c235dcd52441893249cb1fd07a5548ff7ade61fba3eeff8d5e5f4ad52209c1a901a841ed4ece2a85716599218da491b6aa8c927b0af1ab681fe267883fb46f6327c37a5484428df76ee75e0b11dd17f23d39f9804f1d6b37be20d4a3f00f87a40b35c0dd77281b8430f7c81dce7a67b81919cd77da4e953f8774e82c2c079f6d6e81421c09001df3c0627a9e9f8d6ebdc8f3757fd5ce394d549f2745bff0097f99d2b2ab295201078c76aa06096df9b4395ef1b1e3fe027b7d3a7d2ac5bddc372098db95e0a9e181f420f22a723bd73b3b342947711cc4a728e3aab7047f9f5a730a27823986d9074e847047d0d532f3dbffadccb1ff780f987d477fa8fcaa58c91c678359f282071c8f4357f7248bbd08607d2aa4a2a645231678d581c572f7f68afcf219486520e0ab0e410472083d08aeb675ee383eb58f7003655bad725585f6dcd232b1f7d7ecbff00b7a6a3e0c6d3fe1b7c769e4d43452560b4f103b97b8b5c9c2a5ee72648c67026077201f3070772fecb5bdc5bdddbc577692acd04caaf1c88c191d18643291c1047208eb5fca5dfdb2bab2bae41e083debed4fd8e7f6c5d4be0c6b569f0c3e275fbdcf806f9c476b773b33be8f2118500f24db31c064e91fdf5c0dc1beff8578b5b6b0d8a7e8ffccfc17c4bf0a215e32cc32a85aa6f282da5e715d1f92dfa6bbfef35150dbdc5bdddbc577692acd04caaf1c88c191d1865595870411c823ad4d5fa69fcbad5b46145145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd4fddca28a2800a28a2800a28a2800a28a2800a28af9b7f6b0f8dedf003e0b6afe39b229fdaf2b258e982455910dece18a1646742c15559c8524e149da40359d6aaa9c1ce5b23bb2dcbeae2f110c3515794da4be67e4e7fc142be3e5e7c4bf8b327c24d06ebcdf0b781e5513c6982b71ac287595cb75fdc073060fdd7121e4115f1bd8a08d428ff39fceb88d1cdc5dc925fdecaf71713bb4b24923177791ce59999b924e724e79279aef2c50bb002bf05cff001d2c4621cd9fdefc3d92d2cbb074f0747682b7abeadf9b7a9b69325ac2677e4f455fef31e83fcf41cd5cb08d946f94ee91cee63ea4ff004f4f41c5637986e6eb03fd4c1955ebcb7f11fe83f1f5adfb6ea2b820fa1eb366dc0338ab65bcc6110fba3aff0085520fe5a00396356e01b47bff005aec4437d4d04e062a707bd5556a9d5ab5445c9eb86f1df8ba1f0b68ef703e7b993e4893d58ff41d6ba9bfbfb7d3ed25bbb97091c4a5998f40057ce9a5db5cfc4df163eaf7a87fb2acd8ac284f0c41cf23d3b9f5381ce08ae8c3d2527796cb738b1989708a51f89ec7ae7c3ef0d3e8ba6bdeea4de6eaba89f3ae9c907e639da808eca0fe64e38c63d0eb8f1a66a7a2203a53b5ddb2f58246fde2ff00b8e7afd1bf3ed5afa6eb369a829f2d8aba9c32302aea7d194f20fd6b19d4727766f469a8c54517ee6ca1b86f341314c3a489c37d0fa8f622aa8bb9ad0f97a801b32009547ca73ea3f84e7d78e9ce6b4c107a50402307906a2c6a4470c320e4542ddeab9b492d5b7589c27788fddff80fa7d3a7d3ad3e39d26caf2aebf794f047e1fd6a5a2ee55920c319213e5b9e4fa1fa8aac65dc7cb946c7fd0fd0d68b8aa532ab8dac3229058ce9d6b16e1720d6cc85a3e1be64f5ee3ebeb59b3a82323906b0a9129339e98e06d6e47eb5ccea5691cf1346e32ad5d55c2d61ce300f71e95e7f3352b9aad0fd38ff00827afed62d6b3587ecdbf122eb95de9e1ebe99fa8fbc2c1d8fe3e4127d211ff2cd6bf636bf90fd521b889e2d434f95e0bab575922963628e8c8721958721811904720d7f45ff00b187ed256bfb43fc2e8a6d5a68d7c5fe1f096bab40a7e6738c457407f76700938e03865e8067f63e13cf3dbd3546a3d56c7f3078c9c091a13fed6c247dc93f7d2e927f6bd1f5f3f53ec1a28a2bed0fc0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00fffd5fddca28a2800a28a2800a28a2800a28a2800afc06ff829e7c5997c5ff1974df853a74ecda7f832dd5a78c1211b50be55918918018a43e58072769670304b0afdedd4750b4d274fbad535093cab5b389e695f05b6c71a966385049c0078009afe477c65e31bcf89bf13bc49f10b50dcb36bda8dd5f946666f2d67919922058b1db1a90aa32700003815f2fc558bf67439175fd3fe09fb7781b932ab9854c64d694d69eb2ff809fde59d32210c491f52073f5ef5d4f9860b6088712cf955c7503bb7e1fcc8ac1d3937b0ad4898cf3b4e4fcbc2a0f451fe3d6bf16ad2f79c8feae46d59c6b146a8830070057496a38dc7a0ac1b519c0adbce008c7e35ae1d69726668c4dbdb79e9dab411ab32338ab88d5d68cd9a0ad536fc0cd5256ae3fc6fe288bc37a2cb75906671b631eac7fc3ad6b04dbb2339cd45393d8f34f8a9e2c7d46fa1f08e9b2ed123a89dc7bf63f4ea6bd87c1ba75868fa4c1696606d45033c73ea78ee4f27debe39d2749bef12ea125d4849dec58b77249c9af64d2af3c4be12c64b6a166a3257fe5aa81e9fdeafaac4f0f6223878ca9abaddaea7e5b84f11b2c96653c3d7a9cb25a26fe1f4bf47def65d2e7d34a411c5656a3a35a6a0c273982e9061268f8703d0f623d8e47e3589e1df1569dadc01eda505870ca78653e847ad760ac186457cab5d19fa9464a4ae8e5d750bdd21845aca8317016e107c873fde1fc07ebc7a1cd7471cc92a8642083533aaba9461b9586083e95ce3e9571a713368e731f536ec7e5ff8013f77e9d3e94b619d05559a149865b2187461c11f8d55b3d4a2bb0c9ca48870c8c30ca7dc55e278a0ab944bc919d93f23b38e87ebe951482aebf2083cd5074317dce53d3d3e9532434ca328eb58f3028495e9dc56d49861b979159338e4d61328c898070596b06e17ad6e4e0a92c9c1aca9f0e09e847515c15975469176d19cc5c8233e95e97fb38fc70d47f670f8c3a7f8f2d90dc68d783ec7aadb827f79672b2972a3fbf190244f52bb7a135e7774bd6b95d4a1568d837dd3fa1f5af5f29c54a954538bd4e3cc3034b1346787af1bc249a6bd4febd74ed42c756d3edb55d3274bab3bd89268658cee4922914323a91d4302083e9572bf2ebfe0997f1f2e3c6be05d43e0af89eebcdd67c18ab2e9e5c8dd2e92e42041dcfd9a421493c0492351d0d7ea2d7ee982c546b528d48f53f83389b22a996e3aae0ea7d97a3eeb74fe6bf1d028a28aea3c20a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd6fddca28a2800a28a2800a28a2800a28a2803e61fdb3bc647c0bfb2ff00c43d6e391a3967d35b4f8ca637efd49d6cc15c95e479bbb20e40048048c57f309a0c7b559fd6bf793fe0aa9e227d33f67dd1b4185d43eb7afdb2480804986082795b1ce411208f903a707a8afc27d123c46a07735f9d718d6f7f97b2ff00827f58f81f81f6795cab5b59c9fdcacbf46763192902c6bd65e0fb2f7ff0ad8b7180056059b79ce663f74f0bfee8e9cfbf5fc6ba0b61b980afcc3111d6c7ed699d1da0089bcf6ad088e7e63d4d65abfdd8c741d6b4236ae9a7a2b1937d4d246ab68d59c8d5695b15d316496a59d218da47380a33cd7ca5e32d62e7c67e241656849b684ed5f4c6793f8d7a97c4bf141d3b4ffeccb46ff48baf978ea01e0ff85711e16d3ac743b417da8cab1cb20dcc58818fcebec785329f6d53db4d7ba8fc93c55e30597e17eaf49fef27b792ee765e1fd1a0d22cd624501b1cd748003c1ae8fc29f0fbe25f8ea38e7f06784356d5ede641225c456922db3ab10015b870b11ce7230fd327a026bddbc3bfb17fed2de20466b9d0ac7c3d8cedfed3d4223b87cb838b2174467278201f94e474cfe9153174a1a4a491fc9d0c2d6a8eea2d9f295ce8f1c937db6ca436778a3e5953eb9c32e4061f5fc08aeab45f16dcd9c8963afa88d8e02ceb9f29f9c0e7f849e383f866bee5d2bfe09d5f116f2d51b5bf1de9ba65c90bb92dac66bd45247cd86796d89c1ce3e5191cf1d2bb197fe09c1a5ff67347a978e2fafe5312ab086d60b78d9f1f31db279e7693d17248f535f2f9ce1b03894e57b4fba5f9f73f4fe0ce31cdb2b6a935cf4bf95bdbfc2fa7a6de47c690cf1cca190820d4f5df78dbf660f885f0a54cbe1a9a7f1269f19c3c13045b945c9cb238d88e07f7300e3a16385af26d3757b5d4632d0b7cc84aba9186565382ac0f2083c107906bf3baf879537691fd4391f1061b30a7ed284b5eabaaf55faede658bcd3e1bbc48731cc9f7645fbc3fc47b1aa11dd5c5b38b7bf0013c2c83ee37f81f6fe75b65aabcc91cc8d1caa195b820d73d8f6d91960c322a07359ee26b0391992dff00364fafa8ab0255914321c8352d82657994e772f07bfa1acc9b0c323a8ed5a921acd9467a706b39a2cc59c561dc03d4704574338dd9ec6b0ae4726bcec42b1ac5dcc49fe7073c30ae7aee3dc8ca7bd743703bfa563cf86cfaf7adb0d2b09f63affd9dfe32df7c06f8cda0fc4384b35a5acdf67d4624eb3e9f3e1675c77651f3a0e9bd57d2bfab0b3bcb5d42ce0bfb2904d6f731acb1baf47471b9587b10735fc736b1098e52e3bd7f46dff04f1f8c327c53fd9eb4ed2f55bc173ad783643a4dc027f79f678c66d1d877062c206fe228ddf35fac709e337a4f67aafd4fe7bf1d387d4a952cca9ad63eecbd1edf73d3e67dd9451457db1fcd014514500145145001451450014514500145145001451450014514500145145007ffd7fddca28a2800a28a2800a28a2800a28a2803f19ffe0ae7abc820f85fa046ff00bb91f56ba953e6eb18b548cff74fdf7f523db3cfe45d8968ed9029daef851ebcf520fa81935fa3bff0559f11d8ea5f1a7c29e18b5f9ae348d1bcd9d81e035dcee5531d8858c31f6615f9c969832803a4631f89ebfa63f3afcb38a2a736225fd6c7f6af85986f6591e1e2faa6fef6dfea7536dc2802ba2b4c28321ed5ce5af240add570004afcfeb6923f456cd685ce771ea6b4e36ac589ab4a16aba52219aa8d51dfdf45636925c4adb5514927e94d8db1cd6143e1fd53e25f8c34cf875a1e77df386b9753cc56c84798ff005c7418e4e057a187a4e7251470e3b190c3d2956a8ec92b9d77c03fd9faefe3ef88a4f137885e7b7d1fcc296de4b2ab4814b2b1c90d80a460639273d873fb55f0b7f678f84bf0c2186e7c39e18b28b5348f61bd92213dded2a032f9f2ee9006c0c80d82792334ef837f0cb49f87fe1bb4b0b2b7584451aaaaaa800003d00af748abece8ce5187b38bb2ec7f2ae79983c6e2a58aa8b57b792e88b31ad5d45aaf1d5c8ea91e5b250314ec1a075a7d599b663ea7a358ea90986f220e08c74af87be38fec83a578ba47f12783e54d135c0c1dae2288325c0000297080a97f9400af90cbc755054fdf3511008c1e951529c64ad247665f98d6c35455a84b964baa3f9e8d52cbc45e13d6a6f0c78d34e9749d5202c36c8a7cb9954e3cc8242009633d997a7438604037823835fb49f19fe067837e31f86a5d0f5e85a2941f32dee60c2dc5b4c07cb244e41018742082ac386041c57e3cfc57f877e29f819e278fc3fe2d26e74bbe6234ed4c2ed8a7c7262907212651fc39c30f997b85f9fc5e01c3de8eabf23f7fe13e3ba58eb50afeed5fc25e9e7e5f71ce3b562cd03db319ad4650f2d1ff0055ff000abe250e32a722a276af299fa11512749d3721ce6a094d32e2160e67b7e1fbaf66ff00ebd40970b329c7047041ea0d43634caf38cd625cf391d08ada9bbd63dd571d75a1a239fb81d6b16707a8eb5bd3f391d0d624e2a70ecb7a9cd6a7089e125472bcd7e84ffc12c7e20dcf87be376b3f0f27b875b1f15698f2a459250de58912236029c1f25a5e7728ec72768af80ee54fdf519f51eb5e97fb32f8decfe177ed1be03f1ade922c6db5158a66071b21bc46b591ba8e1565248cf2057d9f0fe2bd9d58b6fa9f27c6b95fd732bc461d2bb7176f55aafc6c7f565451457ebc7f0785145140051451400514514005145140051451400514514005145140051451401fffd0fddca28a2800a28a2800a28a2800a28a2803f98afdbbbc4737897f6b7f1c4b2b38874d96d6ca24720ec5b6b5895b18ecd26f71fef57cd1607f761cf05fe6eb9ebfe15dc7ed0fa8b6abfb42fc4fbef33cd59bc4babaa3636e6317722a7181fc007519f5e6b89b6ec2bf1fce65cd524fbb67f7c70bd054b2fa149748c57dc91d4d9ff7ab4a37cb66b2e13b631ea6aec6d5f1f5a37773e80d889ab4a26ac589ab5216ac693d6c264f7d7d1d8d9c97121c0404fe55fa2dfb11fc16baf0ff0086ee3e22f8aed5a0d5bc47209162954abc36b19221420f42d9321e870ca08cad7c35f0a7c0ff00f0b5fe2be8be07701ec62cdfdf8e3fe3d6dcae410caea43bb22904608246457ee6e9715bd85ac5676a8b1430a85555000000c0000e95f5b9450b47da3ea7e33e2767afddc0537e72fd17ebf71d940e14003802b46390573914f5a11dc0f5af6933f1c68e8e37157637ae7e29c7ad684738356893641ee29dbab3d66e3ad38ce3d6aee43896cb0ef503ca2aa3ce3d6aa3dc7bd2722944b924b5c178e7c17e17f883a0dd786fc59a741a9e9f76a0490ce824438395383d0a900ab0e54804104035a5acf88f47d0ad5af759bd8ace04eaf2b051fad7cb9e32fdb13e18f87a492d347171addc212330a058b3fefb91fa03550a5297c284eb283bdec7e7afc78f82fe20fd9f75b6bd8966d43c0b7720582f0e5df4f6738586e5bba12408e53d78563bb05bcba3b98e741246c1948c822bebdf18fed89e22f12db5ce9b068164967382bb67ccd953d99480a7e95f9f57d7b75e16d466bb58557459e42de5440edb4dc73850493e50f4cfcbf4e9e666191d4517529af55fe47ec9c13e2442aca382c6cb5d949f5f27e7e7d7aebbfa2bb5665cc458f9d11db20fc88f434e82f21bb856685c3a38c820f041a6bbd7ca499fb31516e04a0ab0dac3a83542e0e41a9ae9779de876c83a1f5f6359fe7f980ab0c30ea2b96a32e2ccfb8ea6b1e6e73eb5b13d635c67a8a8a05b32a5ae5f538460ff0075ba7b1ffebd7512107fad606a4bba235ee60e5692224ae7f505fb227c504f8b9fb3d783fc532ce936a105a2e9f7e15da465bab2fdcb990bfcdbdc2ac8739fbe392304fd295f8c7ff0499f891248be38f84b7d765bc9f2759b2819b38527c8ba651b7819306ecb75230bf78d7ece57ed196623dad08c9ee7f0af1d650b039ad7a11f86f75e8f5fc2f6f90514515de7c9051451400514514005145140051451400514514005145140051451401fffd1fddca28a2800a28a2800a28a2800a28a2803f912f8ca73f1bfc7e3b7fc245ab7fe95c958167cb2d76bfb43d81d27f688f8996263f2962f136ae5173bb11b5e4ac9ce4ff091d79f5e6b87d3db9dc4f4afc7b358da523fbff23a8a784a525d62bf23a747e40f4ab88d5951377f5abe8dc57cb5481ec235626ad0f3d6189a46380066b2226acfd7277921874c88e1ef6458b82010a7ef1c9f45cff856386a12a955538eece7c662614694aacdd94536fe47ea17ec45e058f48f015e7c46be85d352f16cc4c66452a56c6d999210a093c3b6f937606e0cbd40527ee88a75181b857e34cff1cbe22bd85a693a66a5fd95a7d8c4905bdbd9a2c491c51a8544181c055000c573737c48f1e4c4b49e21bec9ebb6e245ff00d048afd3e9e50d24afb1fc7f9ae7ef13889e224b593bff0097dcb43f7323b81eb5712e87ad7e1b58fc5cf891a6e3ec7e23bc4c7aca5bff0042cd7ad781bf6a3f897a4eb56316b9a88d4ec1e58d2659d46ef2cb00c430c6081cf4aa965b34b467047308bdd1fafb15e7bd68c7783d6bccecf594b88639d1b2b22861f42335b905feeef5e7291df63bc5bbf7a5377ef5cb25de7bd3dae4e3355cc4f29b925e81debe67fda3be34ea9f0afc33692e850ac97fa94a614773f2c4a1492d8c1c9e800af67b8bd233ce2bc2fe32780b4ff89fe1b3a45d3f95710b799049fdc7f5ad28ce2a6b9b622ac65caf9773f2dbc57e3ff1678d2f5efbc4faadc5fc8c7204923145f654ced51f415c9a3c93384894b331c00064935f60f863f656586e8dc78c3540d0a9e228382c07ab1f5f6e9ea6be9df08f83bc0be078c47e1ed36182400033101a56c7ab9cb7eb5ead4cc69c15a3a9e653c05496b2d0f803c37f02be29f89d565b4d164b689f9125cfee9483e99e7f4af50b3fd8dfe21dfc65354d434eb78d86301e491b9f6d8a3f5afbdedf598cf00d6f5b6a08f8e6b8a599cdec75c72e82dcfc67f89bfb3cfc41f8068dadb85d5bc28c7f7d2db824d9963f7990f22227bf214f5c0c57011dd477112cb13065719047715fbb1ab695a5788f4abad1b57b78eeecaf6278668a450e8f1c8a559594f043024107822bf1b3e3b7c0bd5bf67dd78df694b2de78135093104cd976d3e473c412b1c93193feadcffbac7772df3399e0bda5ead35af55dff00e09fb9701f19dd47058b96bb45bfc9fe8cf3491ab26e4163bd0e187ebed56fce59103a1c8354e56af91a923f624523309149e8475159f39a9ae72a7cd8fa8ea3d4553691645dc2b7a50ea869f432ee72a4b2fe55917589616c7715b1707bd73f72de4beefe06ebec6bd8c32bd84dd8fa6bf60df18cbe0cfdabfc14fe7f916dad4b3e973fdf21d6ee2658d0843ce6611e376541c31e991fd4057f297fb277d913f6a3f8666f50c91ff6e5a8017aef2d88cf51c07da4fb7af4afead2bf55e1a95e8b5e67f2878dd454732a725d63fab0a28a2be88fc6028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00fffd2fddca28a2800a28a2800a28a2800a28a2803f957fdb22dad2cbf6a8f8930d967cb3ab3c8770c1f32545793bb71bd8e39e9d8741e196526171dcd7bc7edad04f69fb57fc488a75d8c7520e0641f964863753c7aa906be79b493a7b57e539ac2f525eacfef1e13a97c050ff0c7f2475d0c9902b4227ac0865ad38a4cd7cb56a67d25cdb8daaef827c2faef8f7c6cd65a0da3ddc9689b14052555e4eac5bb00a307ebf9e0cb702081e56380a09afd3dfd923c016de15f855a7ebd716e8baaf8973a84d2004b18a5398064f6f2b69c0c0c93d7a9efc8a9f254759adb6f53f3cf12b1fecf2f7462ece6edf2ddff0097ccf32d17f648f14dd22c9aceb16f640e32b1a34adee3aa81fafd2bae6fd9174c54f9bc4532b7fd71561fcc57d94ee11735ce6a1a8f9791bb15f4f2cc6af73f9da380a7d8f8daf7f64e923ff8f4f12ab7b3db11fca4355742fd99f53b0d76d2eaff00538a7b485c3b055218e0e7a64ff9ef5f50ddea849387ac57d4ee50e54e697f6955dae57f67d2ec7b558de2430c70c670b1a851f8715d4d85eee239af9fb4ff00113070921af56d12fd27552a735c6a573a6503d5ade62c055c66e2b16c1b728adb29f2d6a8cce7efe42a0d703ab6abe42919e6bbad5b288cd5e2fabb3cf3b2d449970466dcea93cee7078ace97545b7059dfa7a9ae7bc63e26d17c17a0de6bfaf5cada58d8c66496463c003b0f524f000e49e2b89f0bfc1ef107c56f094df19bf683d6ae3e1cfc2a1089ed34c85fc9d4b5381d432493ca32d1248a41544f9cf72057560b0152bcad1fbce7c663e9d08de5bf619e23fda43e197842e9ac355f105b8bc4c66de16334dc9c01e5c619b27e954f4ffdb17e19dbf9736a12df5a5b4a4ec9a6b19e38dc2f2c54b28c81dc8e077ae02d7f6bdf87df0f4368bfb33fc1ed2f44d32dd98c7a85ec09f6b99c8da6472373b16503969338e38aedbc33ff00052ef8bda6b887e22783b4bd7b4c738996d54c4de5fa0572e09f76623d875af4960b0519724ab6a78f2ccf14d73469e87d3ff0dbe3afc2cf89398bc25e26b2bf9d31ba15902caa4f628d86fd2bd6fc41e1cd27c51a35d687aeda477d617b1b472c32a874747182083d41af3cd3be0ffec6bfb71784dbc75e13d153c33e270de64ba868e174cd5ecee7183e7187024e4f3bc303c107906bc9a5bff89bfb25f89ad7c1ff001a75aff849fc13abdc1874af10f9062316ec6c82ed417547ea370210fa0e01bc5e48e11e7a6ee8783ced4e5cb35667e777c6ef841a97c02f1847a47efae7c29ab1274cbc939f2df92d6b2303f7d060a9206e5e9921b1e5ced919afdd5f1ff83fc29f13bc1f77e1dd7e04d4349d522c1c632a7f8648dbf85d0f2ac390457e22f8f7c0de20f84fe32bbf02f89332042d2d85d672b776849d8f9c0f9d47cb22e38607195c13f9fe6f96dff7d0f9afd7fccfe96e02e2ff00acc161310fdf5b3eebfcd7e272d29e6b12e0981cc8bf70f51fd6b5646acd98820835e550d0fd2e45099c30c8ac6bac152a7a1ab12b981fcb3f71ba7f8550b87c826bd9a14ecc972ba3a2f84daec5e19f8bbe08f11dcb948f47d774cbb6655dcc160ba8e4242f7202f4ef5fd7f57f178f77358ddc57b6cdb2681d5d1b00e194e41c1e3823b8afeceacaea3beb382f610425c46b2286ea038c8ce33cf35fa4f0cbf766bd3f53f993c72a7fbec3cfca4bff0049b1668a28afa83f070a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803fffd3fddca28a2800a28a2800a28a2800a28a2803f99bff00828f787ae741fdae3c4f7d3208e1d76d74dbe831b40282d63b663f293c99207ce4024f38c609f8b2d9f15fadff00f0574f061b7f14fc3df8890c6c45eda5de953bf1b57ecb22cf0a9e01cb79f291f311f29c01ceefc8685b0057e759d51e5af35e7f99fd9de1be60abe55425da297fe03a7e874b04bdab5e19335cbc32d6c412d7cb57a47e8b73acd1f459fc59e20d1fc276c242facde416a4c432ca92380efd0f0ab9624f00024f02bf75b48b182cece1b3b4411c3022c71a8e8a883000fa015f93ff00b26f87a3d7be2dff006bdcc2248340b3926462785b89888a3f97232761908382063b1da6bf427e357c59b6f841e039f5e4413ea131586d61cf2f2c876a00392493c01dce077af432fc3be5518eecfc13c4fcc94b16a9b7a417e2f5fcac27c5ef8dbe02f84b6f043e24d407f695e9096b6308f32e6673c00a839e4f1935e5ba3e87fb5ffc55b66d7b40f04597817c3f90c977e29b86b592442090cb028f340c6392b8248c647cc3e8dfd9abf655d17e14d95f7ed19fb47341affc46b889af6596e555edb4589558886d03e76b056c34879ec31ce7e58f19ea9fb4cfedebaa6b9aa7c34b4b98fe1f6832bc114297496515d3e32a8de6bc62491970707214302e5772d7d9c72aa3460a5553937d11f8854cdead5938d37ca9752d4be09f8bda65fa585ffc52f87977a84a5b65919eeedddf07808fb65249e727cbc0c77ea347531f147c0b66754f88be1678b454da4eb5a4ce9aa69414a172ef2c3fbd85136b07925891148e5b054b7e44789fc73a1f84fc4da9f833c45e1fb9b6bcd1ae66b2bb8e561e645716ee6395197b157520f3d457d77fb377ed2fe24f85d7d1eb9e11d464d6bc2d29116a1a4dd12e823230c1518e14e38f4238f4239674283b2ad49c2fb3ff00335a58eaebf87514add0fb6ecafecf55b68ef6c6559639543a3a10caca790411c106bd1bc21aab25c082435b3f10be11787efbc1f67fb457ecf9063c33ab442fb56d0e2501204740d25cda22f08f19c99e151b5f9750ae1849e5da2ea31fda60b985c3249821872083c822bc7c76027879f2cb6e8cf7b038e86221cd1dd6e8fb1b453e622915da25b9295e7de109c4f0467ae40af60b6b70d166b386a693d0f33f10405626af12bc50b23b57d15e25b6c40f81dabe79d5159647c7bd673dcd299e3de00f8670fed1ff00b432687e20513f80fe19982fb51b66198eff00559958db40e41fb908c48548018e4738e307f6def1fdb7c47fda37c29f01b5cd57fb17c07a5dc587f6b4ab22448893cc1659599c6c510a64fcc368232410057dbbfb1ef868786fe1cea3abdc83f6ef126b7a8dfcec7a90263044bd3a2c7181df9cfd07e47fedb7e18bdd37f691f19c139612f88ace3b9859ba7cd088c01f8a64fd6bebebc7d8602f0f2bfccf8b753db631f374bd8f62ff0082a6fc09f80df07fe08f86b5ef872abe16f104da9c5676f6905d4d29d46cfca91a52d1c9231fdd1d8c661ea11892e98fc30f0ff8f7c4fe1cba8e7b2bd91e353f3452317461dc10735cd6a105e59ddc9637db84b6c4c655b3f2e0f419e82a980588551927a57b9f53a2e1cbcaacfc8f19e22a295f99dcfd88fd93fe2d6a5e00f883e16f1ff86329a678867b7b4d42d8b109b27711bb10382d1862467ffaf5fd087c41f08f867e27783350f097896d96f34bd62dd9181fbcbbd7e5743d55d739561820d7f3c9fb36fc04f899aa7c3cf0d4761a2dd4925cdc25c2dc792de4c08d2060cce76afc8a338dc0923039c57f422babcb0585bdbc70ec648901dc7386039181d47e35e1e598da74a13a739689b4bd0f6b1d81a952509c23ab5a9f15fc2ed3fc45e1fd2b56f05f8837493f872fe6d3d66618f3e18806866c76df1907fce2bcabf689f84b6ff157c1971a5c2447acd81373a6cc58a84b955202b119f9241f2b0c1f5ea057db5adda2cad24ec03cb21dcec46199b18c923d00007a0005790eaf6f19661b76b0ed5f2d8a9c5d46e3b1f659756a9479269da4adaf99f80f1cd7492dc69fa9426d6fec257b7b985fef45344c55d4fb8208aaf338afb2bf6c0f850fa7dfc7f177c3b6ecc18241ac468063628db1dce3ae4708e79e369c0c313f1334eb2287539079af9bc4e0942778eccfe9fe1acfa38fc32aabe25a35d994ef3122153582666c18dfef0ad4b897ad605d360ef1d7bd77e161a599ed569d95c7d868fa878935ab0f0ee911f9b7daa5c456b6e9fde96770883f1622bfb2fd3ad3ec1a7db58eff0033ecf1247bb18ddb140ce39c6715fca97ec75e1f1e29fdaa3e196986279fc9d621beda87047f6786bbddf45f2b730ee0115fd5cd7e83c394ed4e523f97bc69c6f362a8d15d137f7bb7e81451457d19f8a051451400514514005145140051451400514514005145140051451401ffd4fddca28a2800a28a2800a28a2800a28a2803e04ff82947c3e97c71fb2eeadaa59c0d3de7846f2d757454196f2d09b79cf1fc290ccf2376c267b0afe6c616f9457f657e29f0ee9de2ff000c6afe13d62313586b5677163708d92af0dcc6d13a9c10705588e08fa8afe3d3c65e15d4bc05e32d73c0fac737ba05f5c58cc76b2067b790c6580601806c64647422be4b88e87bd19aea7f44782f9bde855c249eb1775e8ffe0afc4ce8df15ad6d2560a355e8a4c024d7c756a7747f4253a9747e927ec61a6fd97c37abeb72c611f52bdd8ad81978add005e73d03b3803b1cfad7d19e1ff0a2fc4ffdaabc2d1eaf33b699e0bb59b5436aa640af2b7eee077da42919ea1b2082571f3578ff00ecbf63269bf0cf438e600c970259ced39e2695dd7d39da467debeecf871a469ba178aee7c6689baeef2d12ca41819f2d1f7821bfa77f5e2bd5caaa4215973ec7f2a71b549e23115e50d7de76f9688b1fb77f88e7d0bf660f14bc0db7edbf67b47c7f72e2558ba8f761ec4641e0d7e507c1bff8283eb1fb1cf86a4f00a782e1f16e95ac31d4a23f6d6b0960b974585cb3f93389119634c2ed52082771ce07eccfc64d0f4bf8b1f0bfc43e0070c24d52d4a432151b525ea8dc9fe12335f8d3e25ff82727c74f1f7866ce094e95a76ad64004335d96420f55631c6ffa57d26371b4d6269548caf1d53b799f9e61b0355d09c1c5a7a1f95bf14fe22ebdf177e23f893e27789c46baa789afa7be9d2105628cccc488e30493b1170ab924e00c92726bbafd9e2eaebfe13e8b4b425adef6291644ec70320e3d88afaf2e3fe0939fb54431f9904be1fba39fbb1ea1203ff8fc0a3f5af69f807ff04f9f8bff000c2e2ffc57f107460da80431db43692c77585c72d9899b93d3a5746699850961e714ef746797e5d5d578b71b1fa9dfb006a2eff06efbc3d265adf4abf9a10ac32bfbc0242307a83bff009d7897c4af87cbf0e3c7ba8683a6c6d1e952c86eac060054b79c96f2900e02c2fba351d76aae7ae6beb0fd9cfc2bff000ac3e17dae97ac235b6a3792bdd5cc6518b46d2b6563242f2541e7ae0e792306b90f8cd6c9e25d7edef522016d62f255ff0089c6edd93e8324e07e3df15c19b4a9bc1c23292e656ff827a594c6a47172718be577333e1ecacd690eef415f4669c9ba015e0de0cd3cdac51a118c57d07a42fee466be6e91f47559ccebf686485801dabc1352d15a4b875c7535f50ea36eaea4579e5ee90a662ea295488e1227f85125be87e18b6f0eb9f2e4b79672a18e3ccf3a579b2beb8dc411d4633d315e13fb5d7ecf365f1cf46b1d7fc37711dbf8c741de2db27e59e37c068a4c670328307b1cfd0fd0da65b228f2d862baa86d63400ad7bd0ce5ba2a8ca09e963c29e4cbdb3aaa76d6e7e47786bfe097ba378f9edb5ff8cd7e74aba3b5a5b6d21c195c7076c933a9453d8ed47f6615f7ff00c2dfd91ff672f8389149e04f0269d6f7b09dcb7b751fdb6f431ea56e2e4c922e7d1182fa015f4023ede2ad2b8c579b1ab3e4e4e676ec7a0f0f052e6515718e99159772a02935ab2380326b06f65c82056323789c76af26720579aea96e250d9eb5e957d097cd71f7b6dc1cd734ce881e0de31d12cb58d2af348d4e213da5e44f0cd1b0c874914ab03f506bf12be217836efe18f8d350f065cc8d3410625b499f00cb6d2728c71c641ca9e9f303c62bf77bc4508f2debf30ff6ceb2d2859685aac88575085e75475e3317c9b94f6201208f4e71d4d550c2cabcbd9456acfaae19e278e575bdad67fbb7a4bf47f23e219e5cf7ac899f83ef4f138910303906a8dc4b806b3a545a763f7fc4e322e9f3c5dd33f44bfe0971e149fc41fb4e8d785b8920f0c6917b746570d88e49f6daa0560080ecb33e0311950e474c57f47f5f943ff04a9f827aa7833e1b6b7f17f5fb7114be3968534f0c4f98b6366f2a9728546d12c84907736e554600020b7eaf57e8794d1e4a0afd753f8f3c43ccd627339b8bba8a51fbb7fc5b0a28a2bd33e1c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00fffd5fddca28a2800a28a2800a28a2800a28a2800afe6f3fe0a77f0f2e3c19fb4ac9e2b8e36161e35b0b7bd4930db7ed16ebf669a3dcc4e594468e7180048a31dcff4875f1dfedb9fb387fc3477c1bb8d2347545f14f87ddb50d21d87df9554892d89ecb3afcbe81c213c0af3f33c37b5a4d2dd6a7d8f02e7ab019846a4dda32f75fcfafdf63f9798dfa55adf843f4ace68ae6cee65b2bd89edee2ddda3963914a3a3a9c32b29c104118208c8353b3fee9be95f9f54a76763fb0b098b5285d1fb13f04a096cbc0be1cb5906d963b0b55619070c225dc3238e0d7d8de19ba01113d2be47f848777867493e96b0ff00e802be9bd09994ae2b9d1fcd3899734e527d59ef5a700ea39aebed22e98af35d22ed942e4d7a2e9f76a40e6ba2070c91d2444a0ab42552306a82ccbb6a9cf78230768c9add33368b97d2c4b1924f35e45ad40b7739661c035dc4ed3dc02cff002ad72baa6d85198f18ac6a3b9a40c8b39e1b3709dc575d6fe2068d76ab62bc3acf529754d764b680e5623827debd7f4ed119d0120935945be86924ba9a72ebcec0ee6a2d6fe3ba3827359da8e8cf1c44818af3eb6d5a5d2f52104e7e563c53e669ea2515d0f6e8adc360af06af2a5da7dcf9aa8691769710ab83d6ba78cae38ade262cce4fb61fbc9569166f4c55ddea29a6741deb422efb159e3761cd66cb6f9eb5ae678cf7aa923a91c1a965239cb9b61835c7ea7085538aeeee99706b86d5e55dad58c8d22cf1af1210038afc8bfdb53588df5ad3b47424b410976e7806463c63d70a0fe22bf59bc4f38cbd7e15fed31e2b1e26f895aa4d139682de43047918c2c5f274f7209fc7a0e95edf0cd1e6c473f65f9e878fc495b970fcbddffc13c1ec2eced6898fdde9f4af7efd9c7e076b3fb45fc5dd27e1b6966586d25cdcea5750aa3b5a5844ca259b0eca3ef32a0e4fccc386e87e6dd361babcd4a2b3b189ee2e2e19638e38d4bbc8ec42aaaa8e4924e001c935fd3ffec05fb2bbfecf3f0cdbc43e2c80c7e39f184714da8c6c437d8a18cbb416abc02182bee9bd64f97242293ea57cb14f18dadb77fd799f6997f1c4f0fc3d04dfef15e31f975f44bf43eedd374eb3d1f4eb5d274e8fcab4b2892085325b6c71a855196249c00064927d6aed1457d11f8ab6dbbb0a82eaeadac6da5bcbc956182152eeee70aaa392493d054f5f21fc54f1bb78abc56de0fd35d974ed1652970caff25c5c7ca482a3b42415e4fdecf1c035c198e3961e9f3bdfa1dd97605e22a722dba9e857bf11759f115c341e1c1f61b156204c4069a65c119c30c2039c8e37700e4722920d335790acef7f72655180e6672c07a6739acbf0c5b470c49c74aeceeb538ad62e3b57c355c4d4aaf9aa4ae7dc51c2d3a4b969c4cc4d7bc4de1c1e63dcfdba05eb1dc12c79393893ef038e0649033d2bd6342d72c3c45a645aae9ac5a197230c30caca70ca47a8231c647a1c57c89e3cf1a3436d280f8001af70f80f6d7b17c33d36f2fd0472ea2d35d01c64c72c84c4c48273ba3dac3d8807a57b590e2ea4aaba6ddd58f173ec1d28d25552b3b9ec5451457d71f24145145001451450014514500145145007ffd6fddca28a2800a28a2800a28a2800a28a2800a28a2803f037fe0a67fb2a3f833c4937ed17e07b70ba1ebf3aaeb96f1a8516da84a702e4018f92e4fdfc8c89b2c49f3405fc9969c2c0ce790a09fcabfb3df12786f41f186837fe17f145843a9e93a9c4d05cdb4ea1e39637182ac0fe87a83c8e6bf960fdadff0065df14feccbe3f9b47bd4377e14d69e69345bf1c8920079864f49a20ca1c7f170cbc1c0f97cd32e519aaa969d4fde38038c65570d2c0d497ef127cafbe9a7cd7e5f33ef0f811a8c5a87843479e36dc0db44b9f7550a7d3b8afaf74487214d7e71fec8be215bff00da404fcd6723447ff0042cfeb5fa43e1c955e3435f338ea3ecebce1d9b3e57055bda5184fba47a1d846c318aedf4f5380335cad8edc0aeb2d180c56712e474f126e5e4d4e63894671cd66c770a075a592e863ad6b7321b74ea01af2ff0018ea02dac2770790a4d75fa86a0a808cf35e65e23492face653d181aca6cd608e0be10dd437d0cba8cad969669327e8c457d6ba6de59c712f4e95f987a5f8c6f3e196bf77a66a08df629e53246c3a2eeea2bde74ff008f5e1e6b552d7414e3a1ace9554b735a94dbd8fb0f55bdb230316c57c89f13bc416fa7eb1670dab7cf2bf415c8789bf689d3d2068ac18ccf8e31d2bcabc26de20f88be2b8f57bd563044d91fdd03d052a955376414e935ab3ef5f085f4f269f13f53806bbe8f5591461d4d79ee8725ae9568893c817000c753fa54d7be2b38296717fc09bfc2ba69c256396a4d5cef24d6d1473c5634fe258149f9f15e47aa6a7aa5dab6e99b9ec381f90af11f162f8c6d91aef4c8e5982f385ce71ed5b3a5e666aaf91f5bb78950b7caf56a1d7cbf04d7c3fe12f1d6b9732f93745d5d4e0abfff005ebd66f3e2cf82bc2c91278bf58b6d267954ba24d200cea3ab2a8cb63b74ebc54fb09b768ab8fdb42dae87d153ea41d4f35c4eaf7bf2b735e3f27ed15f0696dbed1ff096d96cf4dedbbae3eee377e9efd2be79f893fb667c3dd2ec644f07799ad5eb0f919e3682dd4e71f31902c878e400bcf722b4a797622a3e58c1fdc675330a105794d1b5fb44fc4fb2f01784ef1a3b954d5af6368ed501f9c13c349df0101c824609c0ef5f85de20d41afaf66b827ef138fa57aefc54f8a1aef8f757b8d5f5aba371713f04f45551d1117a2a8ec3f139249af02b994b127d6beef2acb561a9f2eedee7c3e6b98bc4d4e6e8b63f56bfe0921f0cf43f17fc64f1378ef5cd352fdbc1b6103594920256daf2f64654900dc177f971ca172a71cb0c3006bfa2bafc8bff00823ef827fb27e0bf8c3c79347b26f116b4b6a84ae0bdbe9d029560d9e4799712a818182a7939e3f5d2bb65b9c4a4da49b0a28a2a40e5bc6fe20ff8457c1dad78902976d3ad269d147059d109419c3632d8192081d48afcf5f014ec2359ae1da49643bdddc966666e496279249e4935f5d7ed3374f6bf05f5c78d8aef92c90907076b5dc591c7a8e0fb57c93e0fd8f6b1151d857c5712556eb461d97e7ff0c7daf0dd24a84a7ddfe47d1ba5ea68b0000f6acdd6f582226c357316d3bc698ac1d7afd92d9b9ed5e139687ba96a70efa4ea1f11bc69a6f82ac59916fe5ff48957ac36c9f34af9c10085042e782c5477afd29b4b4b7b0b486c6d104505ba2c71a0e8a8830a07d00af8fbf660f0d417faaf883c7d74a1e481c69b6c73f738596738f520c601c703701d4d7d935f63c3b85e4a4eabde5f91f1dc458ae6aaa9ada3f98514515f427cf051451400514514005145140051451401ffd7fddca28a2800a28a2800a28a2800a28a2800a28a2800af2df8cbf083c1df1d3e1e6a9f0dfc6f6fe6d86a29f24a8aa66b59d73e5dc40ce182c884f071c8254e54907d4a8a528a6accd68d69539aa90766b547f323f0834abff821f1bfc69f0335cb9134ba3df4d047318da2f3fc96cc722a37204b11de0648c11824727f4f3c25aa068539af833fe0a6de0cbff855fb4fe8ff0015f47536f69e34b18e7f3542affa7e9fb609d405009c4460725b24973d857b1fc0df8b1a4f8eb45867b6982dec2aa2e21cf2adfde03ba9ec7f0af91e22cb9a92c44367b9f59c3f98a9a7467bddb5f33ef3d3ef14a8e6ba786f82a8e6bc8349d4f722f35d843765875af998b3e8a48ecdb5554ea6b9fd4fc63656994797e6fee8e4d709e22d6678835b5a1f9b1f330eded5e0babea1a8c32cb753bf956b00679657385445e4b313d8574c29e9791cf2a9ada3b9f45b78c2399b2916ef766a6c9e20170bb5a0e0fa1af9874bf8dbf0a10989fc4d0cef1f0c2205f07f4ae9c7c78f859028297b2dc1f45551fcda9b952d8d2387aef6476be25f07691e298996ead37376e706bc52efe05db094f90278d7d9811fcabb36fda3bc0100cdbdacb21edba78d47e80ff3acdb8fda9f41b7ff008f6d3ed87a79b3b1ff00d04ad43f63d8d96171233c3ff02ac92712dcc4d301ce643903f0e057d23e1df0a47a55b8b7b38f8503e545c0fc857ca773fb4af8ab510ffd85631a26320c36c64e0903867073d7b7b9e80d71da8f8f3e30f8a4794c2e446dd04b36c4efd163ddfd2bae8d093fe1d37f71cd5a318ff1aaa5f3fd0fbb350d4343d2016d6353b6b303b3c8a5bfef95c9fcebcbbc45f1d3e17787158bddcb7aebd02011a9fc5b93f957c96bf0efc73ac1f3355be78d4ff0c236e79eec7713f86296ebe19693a05a3ea1ab4d1dbaafde966700f3d8bb9feb5e952ca2bcbe36a3f8ff005f79e5d6cdf074fe0bcdfdcbfcff0003adf16fed6ba9c89241e0ed1a2b35e7134e0bb7d46ec7f2c57cd5a67883e297c6ef897a2f87eeb569ee6279d649d43324314287e67d8a40047014ff007b15cdeafe2cf0b6bbe2383c13f0f83f8975ab966022b31be3895182b4934a70891a93cb127d812403fa31fb3bfc1eb5f02db2cb3ed9b56bfdad752ae71c7f0ae7f857240e0139278ce2b4c661a861e9b4fde93eff00d7dc182c5623113534b9211edd7cafbbf3e87b3f8a3e1c59dbc16bae5942237744f340f5c75afc08f887e3cbff001578fbc43aecf79f6c8e7bd9c5bb839416c8e56154c71b420007af53c926bfa3cf8c5e21b4f077c28f11f896e376dd2b4f9e6509f78ba212817dcb600cf19ebc57f2e7345e42915ddc334fe393f43c9e25a9ac62bd4bd71ad5c1ce1cd605d6a32b83b98d57964e6b26e26c035f54d9f2c52bd9cb13cd60cad56a79371afa73f62bf82fff000bdff68ff0a783efac3fb4343b29bfb4f5746388fec16643bacbc13b2572909007264032b9dc21b03fa5ff00d923e19afc22fd9c3c03e0778845776fa645737800208bbbdcdcce0ee2c49592465ce7a0180a30a3e8ca28ae766e145145007877ed25025c7c13f13a48480b1dbc831eb1dcc4e3d7b8af8f3e1f032d9459f415f63fed0fab2e99f0a358b655579f55f2ec62562064cec3763904958c3b6067a7a648f953c05a5c9696d1238c600af88e2269e257a2fcd9f71c3a9ac33f5fd11e95f623e56715c1789609040e00ed5ecd05b87885731af69b1bc4c31d45787389ed45ea7aff00ecf36a6dbe15e9acc4ee9a6bb7209e9fe90eb8fc941af6daf11f811a8a3f852e3416204ba55c380a073e54e4c8ac4f4e58b8fc3e95edd5fa1e5524f0f0b763f3ccd22d62277ee1451457a070051451400514514005145140051451401fffd0fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2803e04ff8290fc1487e2e7ecd9ac6b1616be7f883c0dff138b16504bf951605e47c024868373ed039744ce00cd7f349e14f186aba05cc577a6dd496d3c2728f1b94653ea197041fa57f6ad5fca0feddff00b399fd9bbe3adf58e8b0f97e14f14799aa68fb576c70c52487cdb45ffaf763b57bf96509e4d6907d1912d1dd1d37873f6cdf8a3a3daa5bcb2dadf94180f710fcc7d3263299c7ff00aeb4351fdb3fe30eaadb6df558f4d8ce7e5b6b78c7518fbce1db8ed86fe98f84adaeb20735ab1ce7d6b9d65b874efecd7dc753ccb10d72fb47f79fa2bf0aff006acf12e9badc69e3cbb6d6347ba60b2b32a89adf240322945cb003aa1ebdb07afeb7e8de14d235cf09dcdec291dd4776aad19e19248c80c3eaac0fe20d7f349a4df98dc063c57ed7fec23f1b8788bc2b71f0ab5e9d4df68e824b06620196cf1831e3b984f7feeb018f9493e367d974553f6b4d5adb9ece4598cbda7b3a8efd8f8ebf682fd91f5bd03c6cff00173e0b402eae84af2df692ec23f3b78c486263c076c92cadc13f32f3f29f15d3fe2ff81f4fb88ec3c6b6f75e1dbd276bc17d6724722367043614e3d79c704138afdc0f1ce8b224f25ed981b9bef29e8d5f2c78efe187c34f89b18b1f1ce856f7b2c4ac88d326d9a30dc37972ae1d41ff006587383d40af1f039d382e4a8ae8fa3c5e4b0aef9e9be597e0cf92747f897f005d15eeb5b81b3cff00a891bf9257a15afc68fd9cf48db347aa79cf8c621b498923d0fc80572baa7ec33e0a86532f85f55bbb2889c88a6db731a8f45fb8ff00f7d3b7e5c5665afec92f6736d964827887f165d58ffc07691fad7a6f39a7d0e6a5c2b297c73fc4f4e9bf6b5f81ba48234fd1f52d4187431c11c6a4e3fe9a48a719e3a7e06b92d4ff006de2c5a1f07f8193273b5eeae0b1f62638d3f4dd5a967fb326811a812c0ae7fddc8fd457a6e81f033c3fa62a04b14723aee5e3f0c62b39e70ba1e853e11a0be39fe7ff0000f9435bfda37f68ff0015abae9cd0685036eff8f4b555201ff6a6f318103b823f9630f40fd9cfe2efc60d420bff001feb176b64a47ef6f6479a62b9e4451b9f973ea7039c8dd5fa3da47c3ad0f4c75b96b78d1d3a310323e9d87e15dad9a99dc5ae931fca3ef49d87d2bcfaf9bceda6875c72ac2d2f851c2fc26f833e09f853a62691e14b0549a4c19666f9e799bfbd249d4fd3803a281d2bec3f07e9fe415761f3570ba0e88b6a016f99cf56352fc4ef8b1e1cf829e08b9f14eb4e925ced64b2b42fb5eea7c6551701881dd9b0428f7c03e4c79eacd25ab64622bc6316de891f33ff00c144fe2b5ae95e09d37e13d9b87bdd71d2f6ed73feaed2d9f31e4020e6499415c82311b700e08fc4ed426ce4fad7a9fc50f88de26f897e29bdf15f8aaf0dddf5db727a2220fbb1c6bfc28a38007d4e4924f8bdf4d938afd272ec1fb0a2a1d7afa9f99e638cf6f55cfa7433e693ad62dccb9ab53cb80699a2c56b79afe9b697c035b4f730a4a092a0a3380d92304719e6baa72b26d9cb08dda47e94fecb7fb1b785fc41e1fb3f1efc5ab696f1f504325b696ecf0c7147bb31c92946566660321090a15b0c09e07e9f7813e1df853e1e095be1e69b07861ee576cada6c6b68d20241c3b4214b0c81d73d07a0af3af06eb3691d8dbc106d48e3455555c0000180001d857b3e99a8a381cd7e5d8acc2ad69b94a5ff0000fd3b0d97d2a30e58c4e96defbc7163bdb4ef10de8320c1f3a5370303d3cedfb7eab8352a7c46f8b5a4b3b3dcdbea6adda685576f39e3cb09d7a727e956ad2747c574b69a7477bc102a218aad1f866fef654f0b45fc504fe48668ff001eef9542789bc3b2a32a8cc968eadb9b23388dc8c0c64f2e7d3be475dab7c6df0cd9dbbb6956d73a95c60ec409e5216e7019df040e392158f3d0f35cadd78494e595735cdbe84b14a5192bbe39d62a2adcdf81c12c970b277e5fc4e03c4fe22f1378f6fe3b9d7f096d6ec5a0b68f2228f3df9e59b1c6e3ef8001c56be93008028db8c5766ba220e882ac2690139c5799394a527293bb3d38c6318a8c5591259ba9518aada95b89109ad48ecc20e05477109294dec072be13d71fc1be2a86fdce2caeb105d6490046c4624f4ca1e7383f2ee03ad7d7aacaea1d086561904720835f1eea96225460466bd7fe11f8a56ef4ff00f844ef988bbd357f7258ff00ac833c01ef1f0b8feeedf7c7bfc3f8ee597b093d1edea7cff106079a3ede3badfd0f65a28a2bec4f8f0a28a2800a28a2800a28a2800a28a2803fffd1fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800af993f6b3fd9bb44fda7be11df7812f248ecb59b63f6bd22f9d73f66bc4076862016f2a41f24a1413b4ee00b2ad7d3745080fe233c4be1af11f80fc4da9783fc5b612697ace8f3bdb5ddb4a0078a58ce181c6411dc302430c104820d450dc640afe8f7fe0a17fb11b7ed03a27fc2d3f872823f1ef87ed591ad4280bab5ac79610e40cfda139f258f0dfeadb00ab27f35f225d585d4b657b13dbdc5bbb47247229474743865653c8208c107906b78bb98b563acb5b8da4735eb9f0f3e206b5e05f1169fe23d0ee4db5ee9f209219000db4f4390782082411dc122bc1e0b8e95d1da5ce40e6aac9ab304da7747f44ff0a3e3b783fe36f87209adae22b4d7021fb4e9ed20f303281b9e30705e3e786038ce1b06aeebfe19b6bb24489f423a8fa1afc06f0d78b359f0ddfc3a968d792d95cc077472c32347221c632aca4107071c1afd13f863fb6e07b68349f899646e362aa0beb5c79a7000ccb1310ac4f24b2b2fb213cd7c5667c3938b73a1aaedd4fb3cb78862d72d7d1f7e87d453e8bafe98c5ac27f3e31ff2ce5e7f26eb4f8354d453e5bdd35f77729861fd0fe95936ff00b41fc18d4ad85d45e238a2cf05668a58d81fa3273f5191ef5f227c6ffdae668b50b6d17e10dd05b7552d737cf6ff00333e46d489661c0001dc593272318c1cf9185cab13527c8a2d7aa763ddaf9e51a70e7724fd2cd9f76dbde3cbf72ce41f55ad12ba914de9008d78cb4876819afc73baf8fdf167518cc7378a2fd158e488a768bae78f90af1cf4e95c8ea3e34f136b7ff217d4ee6f79cfefe57939e79f989f53f9d7bb0e19aafe2a897a23c6a9c5f1fb307fd7de7ed769f1e91ac5e0b49758b6bb9f9ff47866463f2f5f94316e3bd7a769da6c16ca12140a07a57f3d906a57f0dcc57304ef1cb0baba3ab156565390548e410790457adde7c6af89ba8d8a58df78a7529614529b4dd4a03023077e186fe3fbd9efea68a9c292bfbb53ef4611e2a4d3e787e27ead7c55fda53c01f0a6ce6b4b79d35bd7972ab676ee0ac6d8ce679064201fdd197391f2e3247e437c4ff8a3e2af899e20b8f10f8a6f5ae67958948c1221850f48e24c9088001c753d5896249e16f6fde4ce5b8ae72e27eb935ef65d94d2c32bc757dcf0330cd6a621fbda2ec53bc9f00f35c85d4d9635ab7b71c1ae56e26c935e93679a882796bbcf839f0abc67f1bfe25e89f0dbc07099355d56751e69c88ed6153996e6561cac712e5988e4e30a0b15078ff0ff00877c41e33f10587853c296136ababeab32dbdadac0a5e49647380aa07ea7a01c9e335fd287c08f817a2fec57f096cf45b34b7bbf899e2d4dfaaea231208828198e0628a7c9849011580dee5a4390360e4c5e2a3469ba93d91d184c34ead454e1b9e41f133e1a78c3e01eab0d9dc3cfab682d1c620d50c781238501d65dbf2c6fbb385cf2304679025f0d7c4b81c22bc983ee6bd7f5ad32ebc4de63eb57735f34c433f9d23480b0e01c31238e83d3b57986a5f06f4a9d8c96b11b56fef407677cf4e57ff1de9f863f2aaed39b953565d8fd5685d412a8eefb9eb5a478deda50b8907e75ed7e17f135b488096eb5f055c7817c63a0b1934cbafb4a2b70b22943b7ea0b027a7619f6e95ec9f0e5bc53756e7ed76ed0bc6c54e7956c7753dc52849dc7382b1f71dbea76d3a0c11599750433cc19715e5da73eb30801d4915dc69d2dd311e6835d3cd7399c6c7429668169ad68074157e16ca8cd4ad8aa24c17b6c5509a1e0835d1c882b3a68f352d1499c7de5a820f15c6dc8bcd26fe0d674c611ddda3ef8d88c8c8e0823d08241f635e99710e41ae66fad832906b2774ee8d16ba33e90d0359b5f10e8f6bac5a70972818ae7251ba321f753907e95b15f357c2ed78685e2497c3d74db6d756f9a2cf45b841fa6f518f72140eb5f4ad7e8796637dbd2537bf53f3dccf05ec2ab82dba0514515e81e78514514005145140051451401ffd2fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800afcc8fdb6bfe09e7e1ff00da0bcff88ff0c1adbc3de3f8919a742812d357c7204e571e5cff00dd9f0dbbeec831b5e3fd37a29a6268fe21fc43e1ef10f82fc437fe14f15d84da56afa54cd05d5acea5248a54382ac0fe8470472320d456977b58735fd5cfed57fb17fc2ffda7fc3f3bea16d0e87e33853fd0f5e82106e14a80163b90a54cf0e0602b9ca7250a9273fccbfc76f805f12ff66ff1c3f817e255924372504b6d776e5a4b3bc84ffcb4b795950b007860caaca78651c56b195cc9c6c72b05c6e00e6b521b965c60d70b657bfc2c6b7e2b8cd689899d8c7a8ca176ee38aa72bf98db8f5ac98e7f7a984c2a80d68e52062adacdef584b354a2e31408df49bd6a6373c57382eb1de9ad798ef40cd59ee3be6b0ee2e38eb55e6bccf7ac6b9bc001c9a4d8223bdb8ea3350e81e1ff1078cbc4161e14f0a584daaeb1aaccb05adac0bbe49657380aa07ea4f007270326bd33e0bfc09f8a7fb4678b4f847e17692d7f34403dd5cc87cbb3b38db387b89882101c1daa32cd821558835fd287ec9bfb11fc34fd97f4b8f568106bbe38bb8152f7579d4128483be3b352330c47383fc6e00de780a33948a51b9c87ec3ff00b0ff0087ff00666d013c59e2c48755f88daac38baba1878ec2371936d6a4fe5249d5cf030a307a5fda4351bed3be22e946eb7ad8cda72880927cb32acd279a17b6e00c7bbdb6d7dbf5e47f187e12e95f163c3f1d8dcced63a969e5e4b2bb500f94eeb82ae3bc6f85dc01078041e2bc5ce30d3ad41c61bee7b193e2a346ba94f6d8f8e74fd721900f98576763796d3632457c6faaeade22f02eb13e89e200864b67f2fce82459ede438ce5254255b8ea3391d180208aec744f8910b6ddd263f1afce14ececcfd1b92eae8fac4da5a4c32541aea342d151d330a802be7bd2fc7504c17120e7debdf7c1de28b66897730e6b68b57329a67731e992c3d4569c116de6a37d76d245fbc29915fc2e72a78adee6163690e050cf540dda91c5426e41ef45c2c5e67154e47155da7f7aa72cf49b1a43e66158178c39ab335c75ac3ba9f83cd67265a38dd6ae66b2b88752b3205c59c8934448c80f1b0652477e457d9da56a36fabe9969aada1261bd86399370c1db2286191d8e0f4af8935e94794f9f4afa7be0edf3ea1f0db459dcb12ab2c43736e3886678c73e985e0761c57d0f0d557ed250eeaff00d7de7cff0012d24e9c27e76febee3d328a28afb13e3828a28a0028a28a0028a28a00ffd3fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ae17e23fc33f027c5df08de7813e23e8f0eb9a1df6d32dbcc597e643957478cac91ba9e8e8cac3b1aeea8a00fe78ff00692ff8253fc40f064d77e2bfd9fee7fe12bd14bb39d2266f2f52b75773b56263fbbb84452324b249c70adc91f94b7316a5a2dec9a5eb569358de43b77c3711b45226e0186e47008c8208c8e4106bfb76af0bf8c5fb357c11f8f1a64d61f133c2967a94f27297c89e45fc4fb42868eea2db28c055f94b146daa1958002b453ee4381fc834778a475ab4b743d6bf69fe28ff00c11dece4926bef82be3c7b607263b1d762f3141da481f6bb60081bf031f676214e72c570df10f897fe09b1fb64f872774b5f07c1aedba004cfa7ea566ca4962b80934b14a4f46e23c608c9c8205a9227959f1e2dc83de9ff0069f7af791fb15fed743fe6976b1ff7ed3ff8baea349ff827f7ed9bacc914707c38b8b75902b6fb9bdb1b75552472de64ea7233cae3775e38a7cc163e5a6ba03bd5396f947535fa55e10ff824bfed29af3c32f8b358d0bc336efb0c8ad712dddca02d8601218fcb62ab938f38027033c923ec7f871ff0482f847a2ac373f13fc5ba9f8aae5486786d1134db53ca9d84666948e194b0914907202919a4e683959f833e1dd17c4fe37d72dfc33e0cd2aeb5bd5af0ed86d6ce179e673ec8809c0ee7a0ea6bf583f67cff00824e78d3c49359f89bf688d4c787b4ecac8745b1759afa55ebb269d731420f708646c719435fb51f0a7e06fc24f81fa43e89f0abc2f67e1eb797fd6bc2acf71363a79b712979a4c76deed8ed5eaf59b9f62940e33c03f0f3c11f0b7c316be0cf87ba2db683a2d9e4c76d6c9b57737de76272ceedfc4ec4b1ee4d767451505857827c7af13cda6e8b65e18b6251b5d328958123f7106c2eb9041f9cba8230415dc0f5af7baf90ff006aafed1d347863c4c9117d36d5ee6dae241c88de7f28c45bd036c6193c6703a915e567539470d371feb53d4c961196260a5fd68780df785ecaf232a63041ed8cd7966b1f092ca4779ec035a39e7f75c2e7fdce807d31fcf3eb5a5f88ed2ee352ae0e7deba78a7b69bb835f9e5933f45e66b63e4597c2de31d0a426de45b98d4646728c7db0723ff1eaf42f0778d752544cab800e0e410411d6be82fecbb2bae1d4106ba0b4f04e932a2916ea31819c7a5254fb09d4ee6068be209af91773106bd0ec6ee6400eecd360f05dac003c2bb6b4934930f03b56dcacc5b46b4178ce2aeace7ad64244631f4a94c98155724d26b8aa52dcf5e6a8c9718ef59935cfbd2721a45d9ae7af358b7572003cd569eefdeb9fbdbd014f352d949187e23be096f21271806bebbf82d66d63f0bf408d893e742f7033e97123cc3b0ecfff00d73d4fc27ab8d47c41a8da7873465f36fb539560887380ce71b9b00e157ab1c70013dabf4bb4bd3adb47d32d349b25d96f650c7046be891a8551f90afa2e19a4dd49cfa256fbff00e18f9ee26aa9538d3f3bfddff0e5ea28a2bec8f8d0a28a2800a28a2800a28a2803ffd4fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800aa1aa697a76b5a75c693ab5ba5dd9dda3472c52286474618208357e8a4d26acc69b4ee8fc9ff008d3f0d749f863e235b1f86faccfa8a9cb5c594d8736849c85f3c603641e11977281966248af2fb0f88fa8e9ae21d5617858607cc38e7a60f4edeb5ed9a75e47ad5d5e5f5f28171757134b2a96df8791cb30dc724f27af7ab57be0ed3afd49318c9f6afcaab3529b94159763f55a29c60a33777dce5349f89b673053e60cfd6be8cf0378c34ed56d9434a323debe50d67e135b7cd2d9466ddb920c276fd3e5e571f402b9bd274cf1c787b5074b05965801e1ce077e8403d40efdff4a8526b72e504f63f4c639ed1e3052453f8d519a78b24715f24687e30f1344152f637522bd434ff0013dc5c2032e4135bfb4b987b3b1ead2cd1d65cd70bd8d72dfdaccc39355df52cf7a4d8729b935c8f5ac79eefaf35933ea2a33cd60ddeaa8a0fcd52d9491b1737a003cd717abeaeb146cc5b18acbd4b5f8e3524b533c05e05d7be31eb8da7e9eed69a3da30fb6dee32101e7cb8f3c348c3a0e8a393d8121094e4a31576c2738c22e527648f65fd9abc1d278875bbbf88fa9441acec59ad6c7780774d81e6480321e1410aaeac39dc39e6beddacad0b45d3fc39a358e81a547e5d9e9d0c7044a4e4848d428c9ee78e4f73cd6ad7e8d96e0950a4a1d7afa9f9d6658d75eab9f4e9e8145145779c01451450014514500145145007fffd5fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803f3e3e357c27f167823c497fe37f0b5bcbaae83aa4e679e38c992e2dee2e2425c796065a32cc3691923386e0027cd7c3fe3cd3efa352b2839f7afd51af0df1f7ecf3f0dbc7a25bb92c8e91aabe08bdb0222932aaaa03260c6eb85030cb9033b4a924d7c9e3f875b939d07f27fa1f5997f10a5150aebe6bf53e62b7d56cee541dc0e6baad260b094e081f375ae7f5dfd96fe27e812bcde0dd72d75ab55662b15ceeb6b8dbc6d5c8df1b375049641c038e703cf9ed7e2d7850f97e22f0aea36f8247991426e62c838e64837a0c9e9cf3db35f3d5b095a9ff120d7f5dcfa1a38ba3517eee69ff5d8fa12e341d28c7b8a2d7297969636c4f96715e1927c66015ede59823c64ab2b1c302382083ce7dab0a4f8993ea1bcd94725d6ce1bca467c67d700e2b95d44752a6cf6cb9be48b386e2b06e75e48f39715e7096bf1475a2bfd97e11d5e757ce1c58ce138ce7e72a14743d4f5e3ad74d65f00bf681d7e45597468b4b89f1fbcbbba880008ce4ac4d238c77f973cfd71a428d49fc116fe4cce75a9c3e3925f34417fe2d86307320fceb83d4fc70acc22818bc8e42aaaf2493c0000ee6be8fd07f62cd72ed925f1b78b1225c8df0e9f117257e527134bb707ef01fbb38e0f3cad7d51f0f7e077c37f866df69f0e6961efc939bdba3e7dc8073c2bb0f9060e3081723ae4f35e9e1b21c4d47ef2e55e7fe479989cff000d4d7baf99f97f99f1afc33fd9dfc75e3dbd8b54f1ec53787740037f96d84bdb8e785119e625eb9671bba00a73b87e83f863c2fa0f83745b7f0f786acd2c6c2d41091ae4f2792cccc4b3313c9662493d4d6fd15f5d97e554b0ebddd5f73e4730cd2ae21fbda2ec1451457a479a145145001451450014514500145145007fffd6fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28022782091b7491ab91c64804d3d11235091a8451d001814ea2928abdc7cced60a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00ffd7fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd0fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd1fddca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd9, 'Guriqbal', 'guriqbal.singh11@yahoo.in', '123', 9780831702, 'House No. 2241, Sector-19-C', 'Chandigarh', '30.726355,76.7893523');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allorders`
--
ALTER TABLE `allorders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `beautyandhygiene`
--
ALTER TABLE `beautyandhygiene`
  ADD PRIMARY KEY (`ProductName`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryName`);

--
-- Indexes for table `clothing`
--
ALTER TABLE `clothing`
  ADD PRIMARY KEY (`Types`);

--
-- Indexes for table `electronics`
--
ALTER TABLE `electronics`
  ADD PRIMARY KEY (`Types`);

--
-- Indexes for table `gadgets`
--
ALTER TABLE `gadgets`
  ADD PRIMARY KEY (`Types`);

--
-- Indexes for table `groceries`
--
ALTER TABLE `groceries`
  ADD PRIMARY KEY (`Types`);

--
-- Indexes for table `guriqbal.singh11@yahoo.in`
--
ALTER TABLE `guriqbal.singh11@yahoo.in`
  ADD PRIMARY KEY (`CartItem`);

--
-- Indexes for table `guriqbal.singh11@yahoo.inorders`
--
ALTER TABLE `guriqbal.singh11@yahoo.inorders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `homeanddecors`
--
ALTER TABLE `homeanddecors`
  ADD PRIMARY KEY (`Types`);

--
-- Indexes for table `laptops`
--
ALTER TABLE `laptops`
  ADD PRIMARY KEY (`ProductName`);

--
-- Indexes for table `shopinfo`
--
ALTER TABLE `shopinfo`
  ADD PRIMARY KEY (`ShopName`);

--
-- Indexes for table `smartphones`
--
ALTER TABLE `smartphones`
  ADD PRIMARY KEY (`ProductName`);

--
-- Indexes for table `smarttv`
--
ALTER TABLE `smarttv`
  ADD PRIMARY KEY (`ProductName`);

--
-- Indexes for table `smartwatches`
--
ALTER TABLE `smartwatches`
  ADD PRIMARY KEY (`ProductName`);

--
-- Indexes for table `spiritual`
--
ALTER TABLE `spiritual`
  ADD PRIMARY KEY (`ProductName`);

--
-- Indexes for table `tabledecor`
--
ALTER TABLE `tabledecor`
  ADD PRIMARY KEY (`ProductName`);

--
-- Indexes for table `topwear`
--
ALTER TABLE `topwear`
  ADD PRIMARY KEY (`ProductName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
