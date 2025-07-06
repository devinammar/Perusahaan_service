-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2025 at 04:25 PM
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
-- Database: `perusahaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `no` int(10) NOT NULL,
  `nama_karyawan` varchar(255) NOT NULL,
  `gaji` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`no`, `nama_karyawan`, `gaji`) VALUES
(1, 'ronaldo', 4500000),
(2, 'messi', 5000000),
(3, 'neymar', 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `pendapatan_2023`
--

CREATE TABLE `pendapatan_2023` (
  `bulan` varchar(255) NOT NULL,
  `total_pendapatan` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pendapatan_2023`
--

INSERT INTO `pendapatan_2023` (`bulan`, `total_pendapatan`) VALUES
('januari', 40000000),
('februari', 51000000),
('maret', 47000000),
('april', 56000000),
('mei', 70000000),
('juni', 62000000),
('juli', 57000000),
('agustus', 77000000),
('september', 80000000),
('oktober', 68000000),
('november', 64000000),
('desember', 59000000);

-- --------------------------------------------------------

--
-- Table structure for table `pendapatan_2024`
--

CREATE TABLE `pendapatan_2024` (
  `bulan` varchar(255) NOT NULL,
  `total_pendapatan` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pendapatan_2024`
--

INSERT INTO `pendapatan_2024` (`bulan`, `total_pendapatan`) VALUES
('januari', 120000000),
('februari', 100000000),
('maret', 120000000),
('april', 89000000),
('mei', 95000000),
('juni', 130000000),
('juli', 90000000),
('agustus', 115000000),
('september', 132000000),
('oktober', 79000000),
('november', 122000000),
('desember', 140000000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(10) DEFAULT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `total_penjualan` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `nama_produk`, `total_penjualan`) VALUES
(1, 'buku', 350),
(2, 'baju', 210),
(3, 'celana', 77);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(10) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `stok` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `harga`, `stok`) VALUES
(1, 'buku', 15000, 50),
(2, 'baju', 120000, 120),
(3, 'celana', 100000, 568);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD KEY `id` (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `produk` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
