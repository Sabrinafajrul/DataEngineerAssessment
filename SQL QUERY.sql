-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2025 at 04:28 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techtest tandigital`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch_details`
--

CREATE TABLE `branch_details` (
  `branch_code` varchar(10) NOT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `operation_start_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `max_capacity` int(11) DEFAULT NULL,
  `last_renovation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch_details`
--

INSERT INTO `branch_details` (`branch_code`, `branch_name`, `region_id`, `operation_start_date`, `is_active`, `max_capacity`, `last_renovation_date`) VALUES
('B001', 'Jakarta Pusat', 1, '2015-01-01', 1, 5000, '2022-01-15'),
('B002', 'Jakarta Selatan', 1, '2016-03-12', 1, 4500, '2021-12-20'),
('B003', 'Bandung Utara', 2, '2017-06-05', 1, 4000, '2020-09-10'),
('B004', 'Surabaya Barat', 3, '2018-04-22', 1, 4200, '2021-11-11'),
('B005', 'Medan Kota', 4, '2019-07-15', 1, 3800, '2022-05-20'),
('B006', 'Makassar Timur', 5, '2020-02-10', 1, 3600, '2022-03-18'),
('B007', 'Yogyakarta', 6, '2021-01-05', 1, 3500, '2023-02-01'),
('B008', 'Semarang', 6, '2019-10-17', 1, 3700, '2022-08-19'),
('B009', 'Denpasar', 7, '2020-11-11', 1, 3400, '2023-01-12'),
('B010', 'Palembang', 8, '2018-08-08', 1, 3900, '2022-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_movements`
--

CREATE TABLE `inventory_movements` (
  `movement_id` bigint(20) NOT NULL,
  `product_code` varchar(20) DEFAULT NULL,
  `branch_code` varchar(10) DEFAULT NULL,
  `transaction_type` char(3) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `batch_number` varchar(20) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `unit_cost_at_time` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_movements`
--

INSERT INTO `inventory_movements` (`movement_id`, `product_code`, `branch_code`, `transaction_type`, `quantity`, `transaction_date`, `batch_number`, `expiry_date`, `unit_cost_at_time`) VALUES
(1, 'P001', 'B001', 'IN', 500, '2025-04-22', 'B001-001', '2025-11-01', 1000.00),
(2, 'P001', 'B001', 'OUT', 200, '2023-11-15', 'B001-001', '2025-11-01', 1000.00),
(3, 'P002', 'B001', 'EXP', 50, '2023-06-13', 'B001-002', '2023-12-01', 2500.00),
(4, 'P003', 'B002', 'IN', 400, '2025-07-14', 'B002-001', '2025-11-10', 1500.00),
(5, 'P003', 'B002', 'OUT', 150, '2025-06-16', 'B002-001', '2025-11-10', 1500.00),
(6, 'P004', 'B002', 'IN', 200, '2023-12-15', 'B002-002', '2024-12-15', 5000.00),
(7, 'P005', 'B003', 'IN', 300, '2023-11-20', 'B003-001', '2026-11-20', 3000.00),
(8, 'P005', 'B003', 'OUT', 100, '2025-05-19', 'B003-001', '2026-11-20', 3000.00),
(9, 'P006', 'B004', 'IN', 250, '2023-11-22', 'B004-001', '2028-11-22', 20000.00),
(10, 'P006', 'B004', 'EXP', 30, '2026-08-11', 'B004-001', '2023-12-01', 20000.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_hierarchy`
--

CREATE TABLE `product_hierarchy` (
  `product_code` varchar(20) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `category_l1` varchar(50) DEFAULT NULL,
  `category_l2` varchar(50) DEFAULT NULL,
  `category_l3` varchar(50) DEFAULT NULL,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `unit_price` decimal(12,2) DEFAULT NULL,
  `supplier_id` varchar(10) DEFAULT NULL,
  `minimum_stock` int(11) DEFAULT NULL,
  `is_perishable` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_hierarchy`
--

INSERT INTO `product_hierarchy` (`product_code`, `product_name`, `category_l1`, `category_l2`, `category_l3`, `unit_cost`, `unit_price`, `supplier_id`, `minimum_stock`, `is_perishable`) VALUES
('P001', 'Paracetamol 500mg', 'Medicine', 'Tablet', 'OTC', 1000.00, 2000.00, 'SUP01', 50, 1),
('P002', 'Amoxicillin 500mg', 'Medicine', 'Capsule', 'Prescription', 2500.00, 5000.00, 'SUP02', 30, 1),
('P003', 'Vitamin C 1000mg', 'Supplement', 'Tablet', 'Health', 1500.00, 3000.00, 'SUP03', 40, 0),
('P004', 'Cough Syrup 60ml', 'Medicine', 'Liquid', 'OTC', 5000.00, 8000.00, 'SUP04', 25, 1),
('P005', 'Hand Sanitizer 100ml', 'Hygiene', 'Liquid', 'Personal Care', 3000.00, 6000.00, 'SUP05', 20, 0),
('P006', 'Face Mask Pack 50pcs', 'Hygiene', 'Disposable', 'Personal Care', 20000.00, 35000.00, 'SUP06', 15, 0),
('P007', 'Ibuprofen 400mg', 'Medicine', 'Tablet', 'OTC', 1800.00, 3600.00, 'SUP01', 35, 1),
('P008', 'Calcium + Vitamin D', 'Supplement', 'Tablet', 'Health', 2200.00, 4400.00, 'SUP03', 40, 0),
('P009', 'Thermometer Digital', 'Equipment', 'Device', 'Health Tools', 25000.00, 45000.00, 'SUP07', 10, 0),
('P010', 'Alcohol Swab 100pcs', 'Hygiene', 'Disposable', 'Medical Supply', 12000.00, 20000.00, 'SUP05', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_line_items`
--

CREATE TABLE `sales_line_items` (
  `transaction_id` varchar(30) NOT NULL,
  `line_number` int(11) NOT NULL,
  `product_code` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price_at_time` decimal(12,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `total_line_amount` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_line_items`
--

INSERT INTO `sales_line_items` (`transaction_id`, `line_number`, `product_code`, `quantity`, `unit_price_at_time`, `discount_percentage`, `total_line_amount`) VALUES
('T001', 1, 'P001', 5, 2000.00, 0.00, 10000.00),
('T001', 2, 'P003', 3, 3000.00, 0.00, 9000.00),
('T002', 1, 'P002', 4, 5000.00, 10.00, 18000.00),
('T002', 2, 'P005', 2, 6000.00, 0.00, 12000.00),
('T003', 1, 'P004', 2, 8000.00, 0.00, 16000.00),
('T003', 2, 'P007', 2, 3600.00, 0.00, 7200.00),
('T004', 1, 'P006', 1, 35000.00, 5.00, 33250.00),
('T004', 2, 'P003', 2, 3000.00, 0.00, 6000.00),
('T005', 1, 'P008', 3, 4400.00, 0.00, 13200.00),
('T005', 2, 'P001', 2, 2000.00, 0.00, 4000.00),
('T006', 1, 'P001', 4, 2000.00, 0.00, 8000.00),
('T006', 2, 'P002', 1, 5000.00, 0.00, 5000.00),
('T007', 1, 'P010', 2, 20000.00, 0.00, 40000.00),
('T008', 1, 'P005', 2, 6000.00, 0.00, 12000.00),
('T008', 2, 'P001', 1, 2000.00, 0.00, 2000.00),
('T009', 1, 'P003', 2, 3000.00, 0.00, 6000.00),
('T009', 2, 'P004', 1, 8000.00, 0.00, 8000.00),
('T010', 1, 'P002', 3, 5000.00, 0.00, 15000.00),
('T010', 2, 'P005', 1, 6000.00, 0.00, 6000.00);

-- --------------------------------------------------------

--
-- Table structure for table `sales_transactions`
--

CREATE TABLE `sales_transactions` (
  `transaction_id` varchar(30) NOT NULL,
  `branch_code` varchar(10) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `staff_id` varchar(15) DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `discount_amount` decimal(12,2) DEFAULT NULL,
  `loyalty_points_earned` int(11) DEFAULT NULL,
  `loyalty_points_redeemed` int(11) DEFAULT NULL,
  `customer_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_transactions`
--

INSERT INTO `sales_transactions` (`transaction_id`, `branch_code`, `transaction_date`, `staff_id`, `payment_method`, `total_amount`, `discount_amount`, `loyalty_points_earned`, `loyalty_points_redeemed`, `customer_id`) VALUES
('T001', 'B001', '2025-05-19 03:15:00', 'S002', 'Cash', 40000.00, 2000.00, 20, 0, 'CUST01'),
('T002', 'B001', '2023-11-06 04:30:00', 'S002', 'Card', 30000.00, 1500.00, 15, 5, 'CUST02'),
('T003', 'B002', '2025-04-29 02:45:00', 'S003', 'Cash', 25000.00, 1000.00, 10, 0, 'CUST03'),
('T004', 'B002', '2023-11-08 07:20:00', 'S004', 'E-Wallet', 45000.00, 3000.00, 25, 0, 'CUST04'),
('T005', 'B003', '2023-11-09 09:00:00', 'S005', 'Cash', 32000.00, 2000.00, 18, 2, 'CUST05'),
('T006', 'B003', '2024-11-14 06:50:00', 'S005', 'Card', 28000.00, 1500.00, 14, 0, 'CUST06'),
('T007', 'B004', '2023-11-11 05:10:00', 'S008', 'Cash', 36000.00, 2500.00, 20, 0, 'CUST07'),
('T008', 'B004', '2025-06-25 08:25:00', 'S008', 'E-Wallet', 40000.00, 2000.00, 22, 1, 'CUST08'),
('T009', 'B005', '2023-11-13 03:40:00', 'S010', 'Cash', 27000.00, 1000.00, 12, 0, 'CUST09'),
('T010', 'B005', '2025-07-14 04:55:00', 'S010', 'Card', 31000.00, 1200.00, 15, 3, 'CUST10');

-- --------------------------------------------------------

--
-- Table structure for table `staff_records`
--

CREATE TABLE `staff_records` (
  `staff_id` varchar(15) NOT NULL,
  `branch_code` varchar(10) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `role_code` varchar(5) DEFAULT NULL,
  `base_salary` decimal(12,2) DEFAULT NULL,
  `supervisor_id` varchar(15) DEFAULT NULL,
  `resignation_date` date DEFAULT NULL,
  `performance_score` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_records`
--

INSERT INTO `staff_records` (`staff_id`, `branch_code`, `join_date`, `role_code`, `base_salary`, `supervisor_id`, `resignation_date`, `performance_score`) VALUES
('S001', 'B001', '2018-01-10', 'MGR', 8000000.00, NULL, NULL, 4.50),
('S002', 'B001', '2019-03-14', 'CSH', 4500000.00, 'S001', NULL, 4.20),
('S003', 'B002', '2020-07-18', 'CSH', 4200000.00, 'S006', NULL, 4.00),
('S004', 'B002', '2017-12-01', 'SUP', 6000000.00, 'S001', NULL, 4.30),
('S005', 'B003', '2019-06-22', 'CSH', 4300000.00, 'S007', NULL, 4.10),
('S006', 'B002', '2016-08-30', 'MGR', 8200000.00, NULL, NULL, 4.60),
('S007', 'B003', '2018-09-15', 'MGR', 8100000.00, NULL, NULL, 4.70),
('S008', 'B004', '2021-04-11', 'CSH', 4100000.00, 'S009', NULL, 3.90),
('S009', 'B004', '2018-11-20', 'MGR', 8300000.00, NULL, NULL, 4.40),
('S010', 'B005', '2019-02-27', 'SUP', 5900000.00, 'S011', NULL, 4.20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch_details`
--
ALTER TABLE `branch_details`
  ADD PRIMARY KEY (`branch_code`);

--
-- Indexes for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD PRIMARY KEY (`movement_id`),
  ADD KEY `product_code` (`product_code`),
  ADD KEY `branch_code` (`branch_code`);

--
-- Indexes for table `product_hierarchy`
--
ALTER TABLE `product_hierarchy`
  ADD PRIMARY KEY (`product_code`);

--
-- Indexes for table `sales_line_items`
--
ALTER TABLE `sales_line_items`
  ADD PRIMARY KEY (`transaction_id`,`line_number`),
  ADD KEY `product_code` (`product_code`);

--
-- Indexes for table `sales_transactions`
--
ALTER TABLE `sales_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `branch_code` (`branch_code`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staff_records`
--
ALTER TABLE `staff_records`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `branch_code` (`branch_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD CONSTRAINT `inventory_movements_ibfk_1` FOREIGN KEY (`product_code`) REFERENCES `product_hierarchy` (`product_code`),
  ADD CONSTRAINT `inventory_movements_ibfk_2` FOREIGN KEY (`branch_code`) REFERENCES `branch_details` (`branch_code`);

--
-- Constraints for table `sales_line_items`
--
ALTER TABLE `sales_line_items`
  ADD CONSTRAINT `sales_line_items_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `sales_transactions` (`transaction_id`),
  ADD CONSTRAINT `sales_line_items_ibfk_2` FOREIGN KEY (`product_code`) REFERENCES `product_hierarchy` (`product_code`);

--
-- Constraints for table `sales_transactions`
--
ALTER TABLE `sales_transactions`
  ADD CONSTRAINT `sales_transactions_ibfk_1` FOREIGN KEY (`branch_code`) REFERENCES `branch_details` (`branch_code`),
  ADD CONSTRAINT `sales_transactions_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff_records` (`staff_id`);

--
-- Constraints for table `staff_records`
--
ALTER TABLE `staff_records`
  ADD CONSTRAINT `staff_records_ibfk_1` FOREIGN KEY (`branch_code`) REFERENCES `branch_details` (`branch_code`);
COMMIT;

--
-- 1. Calculate inventory turnover metrics per branch:
--
SELECT 
    b.branch_name AS `Branch Name`,

    SUM(CASE WHEN t.transaction_type = 'IN' THEN t.quantity ELSE 0 END) AS `Total IN`,
    SUM(CASE WHEN t.transaction_type = 'OUT' THEN t.quantity ELSE 0 END) AS `Total OUT`,
    SUM(CASE 
            WHEN t.transaction_type = 'IN'  THEN t.quantity 
            WHEN t.transaction_type = 'OUT' THEN -t.quantity 
            ELSE 0 
        END) AS `Current Stock`,
    SUM(CASE WHEN t.transaction_type = 'EXP' THEN t.quantity ELSE 0 END) AS `Expired Items`,
    CASE 
        WHEN SUM(CASE WHEN t.transaction_type = 'IN' THEN t.quantity ELSE 0 END) = 0 
        THEN 0
        ELSE SUM(CASE WHEN t.transaction_type = 'OUT' THEN t.quantity ELSE 0 END) * 1.0 /
             NULLIF(SUM(CASE WHEN t.transaction_type = 'IN' THEN t.quantity ELSE 0 END),0)
    END AS `Stock Turnover Rate`

FROM branch_details b
JOIN inventory_movements t 
    ON b.branch_code = t.branch_code
WHERE t.transaction_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY b.branch_name
ORDER BY `Stock Turnover Rate` DESC;

--
-- 2. Analyze staff performance and sales:
--
SELECT 
    s.staff_id AS Staff_ID,
    b.branch_name AS Branch_Name,
    COUNT(st.transaction_id) AS Transactions_Handled,
    SUM(st.total_amount) AS Total_Sales_Amount,
    AVG(st.total_amount) AS Avg_Transaction_Value,
    (COUNT(st.transaction_id) * AVG(st.total_amount)) AS Performance_Score
FROM staff_records s
JOIN branch_details b 
    ON s.branch_code = b.branch_code
JOIN sales_transactions st 
    ON s.staff_id = st.staff_id
WHERE s.resignation_date IS NULL
  AND YEAR(st.transaction_date) = 2023
GROUP BY s.staff_id, b.branch_name
ORDER BY Performance_Score DESC;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
