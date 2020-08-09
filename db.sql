-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2020 at 12:47 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbrlogical`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `mobile` int(11) NOT NULL,
  `create_dated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_dated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `name`, `email`, `password`, `address`, `phone`, `mobile`, `create_dated`, `update_dated`) VALUES
(2, 'ravi', 'ravi@gmail.com', '$2b$10$E5.Wm1e1j2WBUM4Tu4svVeS43YlgRlaujveSGidZGlc6M0aO2G00y', 'Ahmedabad', 1234567899, 1234567899, '2020-08-09 08:08:48', '0000-00-00 00:00:00'),
(3, 'surendra', 'surendra@gmail.com', '$2b$10$S2Jr11LNDgliYLV.T0hbq.tNd8zxvxUVHxqQXkcKV5WyngqJEl5KW', 'Ahmedabad', 1234567899, 1234567899, '2020-08-09 09:11:29', '0000-00-00 00:00:00'),
(4, 'ritu', 'ritu@gmail.com', '$2b$10$GXrXdiqrOW9LyY4bGoeUv.p69xjJGIyISvTOXNpXtbhlEafGJgfOm', 'Ahmedabad', 1234567899, 1234567899, '2020-08-09 09:14:38', '0000-00-00 00:00:00'),
(5, 'sonal', 'sonal@gmail.com', '$2b$10$rRpdevycq.eTk0U9bfDaBOF2VODDnByqCUM0GTCAPMTAtLTlo.P2y', 'Ahmedabad', 1234567899, 1234567899, '2020-08-09 09:53:17', '0000-00-00 00:00:00'),
(7, 'Arpit', 'Arpit@gmail.com', '$2b$10$G30uIQtXJP5NN5wyU2Q2f./twNGrzeitRhO2rOBY0/Vejp2B4c8r2', 'Ahmedabad', 1234567899, 1234567899, '2020-08-09 10:27:22', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
