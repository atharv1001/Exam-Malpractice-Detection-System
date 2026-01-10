-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2026 at 07:17 PM
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
-- Database: `exammalpracticedetection`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `log_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `ip_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`log_id`, `student_id`, `event_type`, `timestamp`, `ip_address`) VALUES
(1, 101, 'login', '2026-01-10 23:42:35', '192.168.0.2'),
(2, 101, 'tab_switch', '2026-01-10 23:42:35', '192.168.0.2'),
(3, 101, 'tab_switch', '2026-01-10 23:42:35', '192.168.0.2'),
(4, 102, 'login', '2026-01-10 23:42:35', '192.168.0.3'),
(5, 102, 'minimize', '2026-01-10 23:42:35', '192.168.0.3'),
(6, 103, 'login', '2026-01-10 23:42:35', '192.168.0.4'),
(7, 103, 'tab_switch', '2026-01-10 23:42:35', '192.168.0.4');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_id`, `subject`, `duration`) VALUES
(1, 'Computer Science', '60'),
(2, 'Mathematics', '45');

-- --------------------------------------------------------

--
-- Table structure for table `malpractice_report`
--

CREATE TABLE `malpractice_report` (
  `report_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `count` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `malpractice_report`
--

INSERT INTO `malpractice_report` (`report_id`, `student_id`, `reason`, `count`) VALUES
(1, 101, 'Tab switch > 5', 6),
(2, 102, 'Multiple login from same IP', 2),
(3, 103, 'Time exceeded', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `correct_answer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `exam_id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_answer`) VALUES
(6, 1, 'What is the capital of India?', 'New Delhi', 'Mumbai', 'Kolkata', 'Chennai', 'A'),
(7, 1, 'Which language is used for web development?', 'Python', 'Java', 'HTML', 'C++', 'C'),
(8, 1, 'Who developed Java?', 'Dennis Ritchie', 'James Gosling', 'Bjarne Stroustrup', 'Guido van Rossum', 'B'),
(9, 1, 'What does SQL stand for?', 'Structured Query Language', 'Simple Query Language', 'Sequential Query Language', 'Standard Query Language', 'A'),
(10, 1, 'Which of the following is a database?', 'MySQL', 'HTML', 'CSS', 'JavaScript', 'A'),
(11, 2, 'Solve: 2 + 2 * 2', '6', '8', '4', '2', 'A'),
(12, 2, 'Derivative of x^2?', 'x', '2x', 'x^2', '2', 'B'),
(13, 2, 'Integral of 1/x?', 'ln x', 'x', '1/x', 'e^x', 'A'),
(14, 2, 'Value of pi (approx)?', '3.14', '2.71', '1.41', '3.41', 'A'),
(15, 2, 'Square root of 49?', '6', '7', '8', '9', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `email`, `password`) VALUES
(101, 'Alice', 'alice@example.c', 'alice123'),
(102, 'Bob', 'bob@example.com', 'bob123'),
(103, 'Charlie', 'charlie@example', 'charlie123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `malpractice_report`
--
ALTER TABLE `malpractice_report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `malpractice_report`
--
ALTER TABLE `malpractice_report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `malpractice_report`
--
ALTER TABLE `malpractice_report`
  ADD CONSTRAINT `malpractice_report_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
