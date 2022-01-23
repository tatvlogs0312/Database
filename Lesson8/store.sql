-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 23, 2022 at 07:07 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` varchar(5) NOT NULL,
  `customer_id` varchar(5) NOT NULL,
  `employee_id` varchar(5) NOT NULL,
  `sale_date` date NOT NULL,
  `voucher_id` varchar(5) DEFAULT NULL,
  `payments` enum('cash','transfer') DEFAULT NULL,
  `branch_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `customer_id`, `employee_id`, `sale_date`, `voucher_id`, `payments`, `branch_id`) VALUES
('00001', '00001', '00001', '2021-12-29', NULL, 'transfer', '00001'),
('00002', '00002', '00002', '2021-12-30', '00002', 'cash', '00001'),
('00003', '00003', '00001', '2022-01-03', NULL, 'transfer', '00001'),
('00004', '00004', '00002', '2022-01-05', NULL, 'transfer', '00001'),
('00005', '00005', '00001', '2022-01-15', '00001', 'cash', '00001'),
('00006', '00006', '00002', '2022-01-21', NULL, 'cash', '00001');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_detail_id` varchar(5) NOT NULL,
  `bill_id` varchar(5) NOT NULL,
  `moto_id` varchar(5) NOT NULL,
  `amount` int NOT NULL,
  `price` bigint NOT NULL,
  `voucher_id` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`bill_detail_id`, `bill_id`, `moto_id`, `amount`, `price`, `voucher_id`) VALUES
('00001', '00001', '00002', 1, 124000000, '00003'),
('00002', '00002', '00003', 1, 50000000, NULL),
('00003', '00003', '00001', 1, 70000000, '00002'),
('00004', '00004', '00005', 1, 47790000, '00002'),
('00005', '00005', '00004', 1, 38000000, NULL),
('00006', '00006', '00006', 1, 20400000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bonus`
--

CREATE TABLE `bonus` (
  `bonus_id` varchar(5) NOT NULL,
  `reason_bonus` text NOT NULL,
  `bonus` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bonus`
--

INSERT INTO `bonus` (`bonus_id`, `reason_bonus`, `bonus`) VALUES
('00001', 'Thưởng tết âm', 1000000),
('00002', 'Thưởng tết dương', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` varchar(5) NOT NULL,
  `branch_name` text NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `address`) VALUES
('00001', 'tuấn moto chinh nhánh cầu giấy', 'Cầu Giấy, Hà Nội');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` varchar(5) NOT NULL,
  `brand` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand`) VALUES
('00001', 'Yamaha');

-- --------------------------------------------------------

--
-- Table structure for table `change_price`
--

CREATE TABLE `change_price` (
  `change_price_id` varchar(5) NOT NULL,
  `moto_id` varchar(5) NOT NULL,
  `price` bigint NOT NULL,
  `date_change` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `change_price`
--

INSERT INTO `change_price` (`change_price_id`, `moto_id`, `price`, `date_change`) VALUES
('00001', '00001', 70000000, '2021-12-15'),
('00002', '00002', 124000000, '2021-12-15'),
('00003', '00003', 50000000, '2021-12-15'),
('00004', '00004', 38000000, '2021-12-15'),
('00005', '00005', 47790000, '2021-12-15'),
('00006', '00006', 20400000, '2021-12-15');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `tax_code` text NOT NULL,
  `bank` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `account_number` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `address`, `mobile`, `tax_code`, `bank`, `account_number`) VALUES
('00001', 'Nguyễn Trung Văn', 'Cầu Giấy', '0123456789', 'N1N2-11111', 'BIDV', 0),
('00002', 'Nguyễn Thị Phương', 'Bắc Từ Liêm', '0123456788', 'N1N2-11112', NULL, NULL),
('00003', 'Trần Quang Tùng', 'Mỹ Đình', '0123456787', 'N1N2-11113', 'Viettin Bank', 1),
('00004', 'Nguyễn Thu Trang', 'Cổ Nhuế 1', '0123456786', 'N1N2-11114', 'MB Bank', 3),
('00005', 'Phan Trung Anh', 'Cầu Giấy', '0123456785', 'N1N2-11115', NULL, NULL),
('00006', 'Nguyễn Phong Dũng', 'Mỹ Đình', '0123456784', 'N1N2-11116', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `birthday` date NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `position` text NOT NULL,
  `mobile` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `birthday`, `gender`, `address`, `email`, `position`, `mobile`) VALUES
('00001', 'Trần Văn Linh', '1998-10-23', 'male', 'Cầu Giấy', 'tvlinh@gmail.com', 'Nhân viên bán hàng', '0987654321'),
('00002', 'Nguyễn Trung Quang', '1990-07-21', 'male', 'Cầu Giấy', 'ntquang@gmail.com', 'Nhân viên bán hàng', '0987654322'),
('00003', 'Trần Phương Anh', '1998-03-15', 'female', 'Cầu Giấy', 'tpanh@gmail.com', 'Nhân viên thu ngân', '0987654323'),
('00004', 'Trần Anh Tuấn', '2000-12-03', 'male', 'Cầu Giấy', 'tanhtuan093@gmail.com', 'Quản lý', '0384551953');

-- --------------------------------------------------------

--
-- Table structure for table `import`
--

CREATE TABLE `import` (
  `import_id` varchar(5) NOT NULL,
  `supplier_id` varchar(5) NOT NULL,
  `employee_id` varchar(5) NOT NULL,
  `date_enter` date NOT NULL,
  `branch_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `import`
--

INSERT INTO `import` (`import_id`, `supplier_id`, `employee_id`, `date_enter`, `branch_id`) VALUES
('00001', '00001', '00004', '2021-11-15', '00001'),
('00002', '00001', '00004', '2021-11-16', '00001');

-- --------------------------------------------------------

--
-- Table structure for table `import_detail`
--

CREATE TABLE `import_detail` (
  `import_detail_id` varchar(5) NOT NULL,
  `import_id` varchar(5) NOT NULL,
  `moto_id` varchar(5) NOT NULL,
  `amount` int NOT NULL,
  `price` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `import_detail`
--

INSERT INTO `import_detail` (`import_detail_id`, `import_id`, `moto_id`, `amount`, `price`) VALUES
('00001', '00001', '00001', 6, 65000000),
('00002', '00001', '00002', 11, 115000000),
('00003', '00001', '00003', 6, 45000000),
('00004', '00002', '00004', 6, 30000000),
('00005', '00002', '00005', 11, 42000000),
('00006', '00002', '00006', 11, 15000000);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `moto_id` varchar(5) NOT NULL,
  `branch_id` varchar(5) NOT NULL,
  `amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`moto_id`, `branch_id`, `amount`) VALUES
('00001', '00001', 5),
('00002', '00001', 10),
('00003', '00001', 5),
('00004', '00001', 5),
('00005', '00001', 10),
('00006', '00001', 10);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` varchar(5) NOT NULL,
  `moto_id` varchar(5) NOT NULL,
  `price` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `moto_id`, `price`) VALUES
('00001', '00001', 70000000),
('00002', '00002', 124000000),
('00003', '00003', 50000000),
('00004', '00004', 38000000),
('00005', '00005', 47790000),
('00006', '00006', 20400000);

-- --------------------------------------------------------

--
-- Table structure for table `moto`
--

CREATE TABLE `moto` (
  `moto_id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `color` text NOT NULL,
  `cylinder_capacity` int NOT NULL,
  `weight` int NOT NULL,
  `brand_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `moto`
--

INSERT INTO `moto` (`moto_id`, `name`, `color`, `cylinder_capacity`, `weight`, `brand_id`) VALUES
('00001', 'YZF-R15', 'BLACK', 155, 100, '00001'),
('00002', 'MT-03', 'BLACK', 155, 100, '00001'),
('00003', 'GRANDE', 'WHITE', 125, 100, '00001'),
('00004', 'LATTE', 'RED', 125, 100, '00001'),
('00005', 'EXCITER', 'BLUE', 150, 85, '00001'),
('00006', 'SIRIUS', 'BLACK', 150, 85, '00001');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `payroll_id` varchar(5) NOT NULL,
  `employee_id` varchar(5) NOT NULL,
  `shift_id` varchar(5) NOT NULL,
  `month` enum('1','2','3','4','5','6','7','8','9','10','11','12') DEFAULT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`payroll_id`, `employee_id`, `shift_id`, `month`, `year`) VALUES
('00001', '00001', '00003', '1', 2022),
('00002', '00002', '00003', '1', 2022),
('00003', '00003', '00003', '1', 2022),
('00004', '00004', '00003', '1', 2022);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_bonus`
--

CREATE TABLE `payroll_bonus` (
  `payroll_bonus_id` varchar(5) NOT NULL,
  `payroll_id` varchar(5) NOT NULL,
  `bonus_id` varchar(5) NOT NULL,
  `bonus_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll_bonus`
--

INSERT INTO `payroll_bonus` (`payroll_bonus_id`, `payroll_id`, `bonus_id`, `bonus_date`) VALUES
('00001', '00001', '00001', '2022-01-23'),
('00002', '00002', '00001', '2022-01-23'),
('00003', '00003', '00001', '2022-01-23'),
('00004', '00004', '00001', '2022-01-23');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_punish`
--

CREATE TABLE `payroll_punish` (
  `payroll_punish_id` varchar(5) NOT NULL,
  `payroll_id` varchar(5) NOT NULL,
  `punish_id` varchar(5) NOT NULL,
  `punish_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll_punish`
--

INSERT INTO `payroll_punish` (`payroll_punish_id`, `payroll_id`, `punish_id`, `punish_date`) VALUES
('00001', '00001', '00001', '2022-01-05'),
('00002', '00003', '00001', '2022-01-07'),
('00003', '00002', '00001', '2022-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `punish`
--

CREATE TABLE `punish` (
  `punish_id` varchar(5) NOT NULL,
  `reason_punish` text NOT NULL,
  `punish` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `punish`
--

INSERT INTO `punish` (`punish_id`, `reason_punish`, `punish`) VALUES
('00001', 'đi muộn', 50000),
('00002', 'nghỉ không phép', 100000),
('00003', 'không mặc đồng phục', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shift_id` varchar(5) NOT NULL,
  `shift_name` text NOT NULL,
  `start` time DEFAULT NULL,
  `working_time` int NOT NULL,
  `salary` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shift_id`, `shift_name`, `start`, `working_time`, `salary`) VALUES
('00001', 'ca sáng', '07:00:00', 5, 5000000),
('00002', 'ca chiều', '14:00:00', 5, 5000000),
('00003', 'full time', '07:00:00', 10, 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `address`, `mobile`, `email`) VALUES
('00001', 'Yamaha Việt Nam', 'Hà Nội', '0999988888', 'yamaha@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` varchar(5) NOT NULL,
  `voucher_content` text NOT NULL,
  `discount` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`voucher_id`, `voucher_content`, `discount`) VALUES
('00001', 'Giảm 1 triệu', 1000000),
('00002', 'Giảm 500 nghìn', 500000),
('00003', 'Giảm 2 triệu', 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `warranty`
--

CREATE TABLE `warranty` (
  `warranty_id` varchar(5) NOT NULL,
  `warranty_date` date NOT NULL,
  `warranty_content` text NOT NULL,
  `employee_id` varchar(5) NOT NULL,
  `bill_id` varchar(5) NOT NULL,
  `distance_traveled` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `warranty`
--

INSERT INTO `warranty` (`warranty_id`, `warranty_date`, `warranty_content`, `employee_id`, `bill_id`, `distance_traveled`) VALUES
('00001', '2022-01-04', 'Bảo hành', '00001', '00001', 47),
('00002', '2022-01-05', 'Bảo hành', '00002', '00003', 32);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `fk_bill_customer` (`customer_id`),
  ADD KEY `fk_bill_employee` (`employee_id`),
  ADD KEY `fk_bill_voucher` (`voucher_id`),
  ADD KEY `fk_bill_branch` (`branch_id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_detail_id`),
  ADD KEY `fk_bill_detail_bill` (`bill_id`),
  ADD KEY `fk_bill_detail_moto` (`moto_id`),
  ADD KEY `fk_bill_detail_voucher` (`voucher_id`);

--
-- Indexes for table `bonus`
--
ALTER TABLE `bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `change_price`
--
ALTER TABLE `change_price`
  ADD PRIMARY KEY (`change_price_id`),
  ADD KEY `fk_doigia_moto` (`moto_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `import`
--
ALTER TABLE `import`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `fk_import_supplier` (`supplier_id`),
  ADD KEY `fk_import_employee` (`employee_id`),
  ADD KEY `fk_import_branch` (`branch_id`);

--
-- Indexes for table `import_detail`
--
ALTER TABLE `import_detail`
  ADD PRIMARY KEY (`import_detail_id`),
  ADD KEY `fk_import_detail_phieunhap` (`import_id`),
  ADD KEY `fk_import_detail_moto` (`moto_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD KEY `fk_inventory_moto` (`moto_id`),
  ADD KEY `fk_inventory_branch` (`branch_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `fk_menu_moto` (`moto_id`);

--
-- Indexes for table `moto`
--
ALTER TABLE `moto`
  ADD PRIMARY KEY (`moto_id`),
  ADD KEY `fk_moto_brand` (`brand_id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`payroll_id`),
  ADD KEY `fk_payroll_employee` (`employee_id`),
  ADD KEY `fk_payroll_shift` (`shift_id`);

--
-- Indexes for table `payroll_bonus`
--
ALTER TABLE `payroll_bonus`
  ADD PRIMARY KEY (`payroll_bonus_id`),
  ADD KEY `fk_payroll_bonus_payroll` (`payroll_id`),
  ADD KEY `fk_payroll_bonus_bonus` (`bonus_id`);

--
-- Indexes for table `payroll_punish`
--
ALTER TABLE `payroll_punish`
  ADD PRIMARY KEY (`payroll_punish_id`),
  ADD KEY `fk_payroll_punish_payroll` (`payroll_id`),
  ADD KEY `fk_payroll_punish_bonus` (`punish_id`);

--
-- Indexes for table `punish`
--
ALTER TABLE `punish`
  ADD PRIMARY KEY (`punish_id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `warranty`
--
ALTER TABLE `warranty`
  ADD PRIMARY KEY (`warranty_id`),
  ADD KEY `fk_warranty_employee` (`employee_id`),
  ADD KEY `fk_warranty_bill` (`bill_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_bill_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `fk_bill_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `fk_bill_staff` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `fk_bill_voucher` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`voucher_id`);

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `fk_bill_detail_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  ADD CONSTRAINT `fk_bill_detail_moto` FOREIGN KEY (`moto_id`) REFERENCES `moto` (`moto_id`),
  ADD CONSTRAINT `fk_bill_detail_voucher` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`voucher_id`);

--
-- Constraints for table `change_price`
--
ALTER TABLE `change_price`
  ADD CONSTRAINT `fk_change_price_moto` FOREIGN KEY (`moto_id`) REFERENCES `moto` (`moto_id`);

--
-- Constraints for table `import`
--
ALTER TABLE `import`
  ADD CONSTRAINT `fk_import_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `fk_import_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `fk_import_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `import_detail`
--
ALTER TABLE `import_detail`
  ADD CONSTRAINT `fk_import_detail_import` FOREIGN KEY (`import_id`) REFERENCES `import` (`import_id`),
  ADD CONSTRAINT `fk_import_detail_moto` FOREIGN KEY (`moto_id`) REFERENCES `moto` (`moto_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inventory_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `fk_inventory_moto` FOREIGN KEY (`moto_id`) REFERENCES `moto` (`moto_id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_moto` FOREIGN KEY (`moto_id`) REFERENCES `moto` (`moto_id`);

--
-- Constraints for table `moto`
--
ALTER TABLE `moto`
  ADD CONSTRAINT `fk_moto_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`);

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `fk_payroll_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `fk_payroll_shift` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`);

--
-- Constraints for table `payroll_bonus`
--
ALTER TABLE `payroll_bonus`
  ADD CONSTRAINT `fk_payroll_bonus_bonus` FOREIGN KEY (`bonus_id`) REFERENCES `bonus` (`bonus_id`),
  ADD CONSTRAINT `fk_payroll_bonus_payroll` FOREIGN KEY (`payroll_id`) REFERENCES `payroll` (`payroll_id`);

--
-- Constraints for table `payroll_punish`
--
ALTER TABLE `payroll_punish`
  ADD CONSTRAINT `fk_payroll_punish_bonus` FOREIGN KEY (`punish_id`) REFERENCES `punish` (`punish_id`),
  ADD CONSTRAINT `fk_payroll_punish_payroll` FOREIGN KEY (`payroll_id`) REFERENCES `payroll` (`payroll_id`);

--
-- Constraints for table `warranty`
--
ALTER TABLE `warranty`
  ADD CONSTRAINT `fk_warranty_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  ADD CONSTRAINT `fk_warranty_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
