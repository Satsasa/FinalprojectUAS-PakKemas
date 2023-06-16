-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2023 at 04:56 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rs_kdcw`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `no_tlp` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama`, `username`, `password`, `no_tlp`) VALUES
(1, 'Abdul Rohim', 'rohim', '5918', '082252009575'),
(2, 'admin', 'admin', 'admin', '085156049602');

-- --------------------------------------------------------

--
-- Table structure for table `data_dokter`
--

CREATE TABLE `data_dokter` (
  `kode_dokter` varchar(4) NOT NULL,
  `nama_dokter` varchar(50) NOT NULL,
  `spesialis` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `umur` int(2) NOT NULL,
  `alumni` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `data_dokter`
--

INSERT INTO `data_dokter` (`kode_dokter`, `nama_dokter`, `spesialis`, `alamat`, `no_hp`, `umur`, `alumni`) VALUES
('12', 'Ridwan', 'Mata', 'Jl. Tanpa Nama Tondo', '082252009575', 25, 'Universitas Tadulako');

-- --------------------------------------------------------

--
-- Table structure for table `data_pasien`
--

CREATE TABLE `data_pasien` (
  `No_RM` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `umur` int(2) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `gol_darah` varchar(2) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `kode_dokter` varchar(4) NOT NULL,
  `kode_ruangan` varchar(4) NOT NULL,
  `penyakit` varchar(50) NOT NULL,
  `tgl_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `data_pasien`
--

INSERT INTO `data_pasien` (`No_RM`, `nama`, `umur`, `alamat`, `gol_darah`, `tgl_daftar`, `kode_dokter`, `kode_ruangan`, `penyakit`, `tgl_keluar`) VALUES
('2023-06-100.015', 'Miptah ', 21, 'Jl.London Ulsan Gg XIIB No. 8 ', 'O', '2023-06-10', '12', '33', 'Final Project ', '2023-06-10'),
('2023-06-100.047', 'Abrilla', 22, 'Kendalsari', 'A', '2023-06-10', '12', '329', 'Final Project ', '2023-06-11'),
('2023-06-100.491', 's', 21, 'london', 'A', '2023-06-10', '12', '99', 'Final Project ', '2023-06-09'),
('2023-06-100.862', 'Andara', 21, 'Jl. Langgeng Raya Kurnia No. 90', 'A', '2023-06-10', '12', '19', 'Final Project ', '2023-06-10');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kode_ruangan` varchar(4) NOT NULL,
  `nama_ruangan` varchar(50) NOT NULL,
  `status` enum('Terisi','Kosong') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kode_ruangan`, `nama_ruangan`, `status`) VALUES
('19', 'Langgeng', 'Terisi'),
('329', 'Mawar', 'Terisi'),
('33', 'qwertyu', 'Terisi'),
('99', 'Rusa', 'Terisi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_antrian`
--

CREATE TABLE `tbl_antrian` (
  `id` bigint(20) NOT NULL,
  `tanggal` date NOT NULL,
  `no_antrian` smallint(6) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_antrian`
--

INSERT INTO `tbl_antrian` (`id`, `tanggal`, `no_antrian`, `status`, `updated_date`) VALUES
(1, '2023-06-10', 1, '1', '2023-06-10 16:26:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_dokter`
--
ALTER TABLE `data_dokter`
  ADD PRIMARY KEY (`kode_dokter`);

--
-- Indexes for table `data_pasien`
--
ALTER TABLE `data_pasien`
  ADD PRIMARY KEY (`No_RM`),
  ADD KEY `kode_dokter` (`kode_dokter`),
  ADD KEY `kode_ruangan` (`kode_ruangan`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kode_ruangan`);

--
-- Indexes for table `tbl_antrian`
--
ALTER TABLE `tbl_antrian`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_antrian`
--
ALTER TABLE `tbl_antrian`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_pasien`
--
ALTER TABLE `data_pasien`
  ADD CONSTRAINT `data_pasien_ibfk_1` FOREIGN KEY (`kode_dokter`) REFERENCES `data_dokter` (`kode_dokter`),
  ADD CONSTRAINT `data_pasien_ibfk_2` FOREIGN KEY (`kode_ruangan`) REFERENCES `ruangan` (`kode_ruangan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
