-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 10:18 AM
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
-- Database: `wtms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_submissions`
--

CREATE TABLE `tbl_submissions` (
  `id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `submission_text` text NOT NULL,
  `submitted_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_submissions`
--

INSERT INTO `tbl_submissions` (`id`, `work_id`, `worker_id`, `submission_text`, `submitted_at`) VALUES
(1, 3, 3, 'done.', '2025-05-28 13:34:26'),
(2, 3, 3, 'sd', '2025-05-28 13:35:04'),
(3, 8, 3, 'as', '2025-05-28 13:36:03'),
(4, 1, 1, 'A DONE for task 1', '2025-05-28 13:37:22'),
(5, 6, 1, '26', '2025-05-28 13:37:30'),
(6, 3, 3, 'asd', '2025-05-28 14:40:54'),
(7, 3, 3, 'asdf', '2025-05-28 14:41:10'),
(8, 3, 3, '12', '2025-05-28 16:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_works`
--

CREATE TABLE `tbl_works` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `date_assigned` date NOT NULL,
  `due_date` date NOT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_works`
--

INSERT INTO `tbl_works` (`id`, `title`, `description`, `assigned_to`, `date_assigned`, `due_date`, `status`) VALUES
(1, 'Prepare Material A', 'Prepare raw material A for assembly.', 1, '2025-05-25', '2025-05-28', 'pending'),
(2, 'Inspect Machine X', 'Conduct inspection for machine X.', 2, '2025-05-25', '2025-05-29', 'pending'),
(3, 'Clean Area B', 'Deep clean work area B before audit.', 3, '2025-05-25', '2025-05-30', 'pending'),
(4, 'Test Circuit Board', 'Perform unit test for circuit batch 4.', 4, '2025-05-25', '2025-05-28', 'pending'),
(5, 'Document Process', 'Write SOP for packaging unit.', 5, '2025-05-25', '2025-05-29', 'pending'),
(6, 'Paint Booth Check', 'Routine check on painting booth.', 1, '2025-05-25', '2025-05-30', 'pending'),
(7, 'Label Inventory', 'Label all boxes in section C.', 2, '2025-05-25', '2025-05-28', 'pending'),
(8, 'Update Database', 'Update inventory in MySQL system.', 3, '2025-05-25', '2025-05-29', 'pending'),
(9, 'Maintain Equipment', 'Oil and tune cutting machine.', 4, '2025-05-25', '2025-05-30', 'pending'),
(10, 'Prepare Report', 'Prepare monthly performance report.', 5, '2025-05-25', '2025-05-30', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`id`, `full_name`, `email`, `password`, `phone`, `address`) VALUES
(1, 'Kim Tae Hyung', 'vante@example.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '01112301230', 'No. 1 Jalan Ampang'),
(2, 'Jeon Jung Kook', 'kookie@example.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '012901901', 'No. 2 Jalan Kuching'),
(3, 'Tan Pei Yong', 'jemins2001@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '0110291688', 'No. 3 Jalan Klang'),
(4, 'Kim Seok Jin', 'jinn12@example.com', '7b52009b64fd0a2a49e6d8a939753077792b0554', '0161204120', 'No. 4 Jalan Genting'),
(5, 'Park Ji Min', 'jm.park@example.com', '7b52009b64fd0a2a49e6d8a939753077792b0554', '0181013101', 'No. 5 Jalan Imbi'),
(6, 'Kim Nam Joon', 'rm@example.com', '7b52009b64fd0a2a49e6d8a939753077792b0554', '0120912123', 'No. 6 Jalan Tun Razak'),
(7, 'Min Yoon Gi', 'agustd@example.com', '356a192b7913b04c54574d18c28d46e6395428ab', '0181230309', 'No. 7 Jalan Loke Yew'),
(8, 'Jung Ho Seok', 'jhoooope@example.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '0172220218', 'No. 8 Jalan Cheras'),
(9, 'Ivan Teh', 'ivan.teh@example.com', 'c6490f67d4f56bb4891e847583660deff479e50d', '0123456789', 'No. 9 Jalan Bangsar'),
(10, 'Jasmine Yap', 'jasmine.yap@example.com', '20eabe5d64b0e216796e834f52d61fd0b70332fc', '0123456790', 'No. 10 Jalan Damansara'),
(11, 'Lee Hee Seung', 'hs@example.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '0171005123', 'No. 10 Jalan Busan'),
(12, 'TAN PEI YONG - IT', 'jemins2002@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1234567891', 'klang, selangor'),
(14, '', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', ''),
(15, 'Daniel Wu', 'dw@example.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '01118018018', 'Hong Kong');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_submissions`
--
ALTER TABLE `tbl_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_works`
--
ALTER TABLE `tbl_works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_submissions`
--
ALTER TABLE `tbl_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_works`
--
ALTER TABLE `tbl_works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
