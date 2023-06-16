-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2023 at 08:51 PM
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
(2, 'Abrila Fatzali', 'abrila', 'qwarty1324', '085708318770'),
(3, 'Miftah Rahmaddani', 'miftah', '1234', '081357422560');

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
('01', 'Abrila Fatzali', 'Bedah', 'Kendal Sari', '085708318770', 27, 'Universitas Indonesia'),
('02', 'Miftah Rahmaddani', 'Keseleo', 'Ngagel Dadi Rengganis', '085739483909', 30, 'UNTAG INDAH'),
('03', 'Nizar Maulana', 'Patah Hati', 'Medokan City', '085739849389', 27, 'UPN Veteran Jawa Timur'),
('04', 'Sabra Udin', 'Patah Tulang', 'kuburan kendal', '083178779877', 26, 'Universitas Indonesia'),
('05', 'Kariimal Haikal', 'Kecetit', 'Penjaringan Hongerloop', '083177879822', 35, 'UNAIR'),
('06', 'Tegar Adi', 'Psikolog', 'Gunung Anyar', '085738479987', 29, 'UNAIR'),
('07', 'Ariful Musyafa', 'Anak', 'Arabian', '085729382736', 34, 'Universitas Indonesia'),
('08', 'Agung Prasetyo', 'Rekam Medis', 'Pandugo Selatan', '085739483746', 37, 'UNAIR'),
('09', 'Audi Moka', 'Kepala Pusing', 'Sidoarjo', '085738293884', 44, 'UB'),
('10', 'Meika Sovanita', 'Galau', 'Semarang', '085739482019', 29, 'UB'),
('11', 'Chandrawati Dasuba', 'Keuangan', 'Benowo', '083174837798', 31, 'ITS'),
('12', 'Ridwan', 'Mata', 'Jl. Tanpa Nama Tondo', '082252009575', 25, 'Universitas Tadulako'),
('13', 'Dokter Tirta ', 'Kecetit ', 'Jakarta ', '08123456789', 33, 'UNAIR');

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
('2023-06-110.123', 'radiana', 23, 'kenjeran city', 'O', '2023-06-11', '03', '07', 'nangis dan mual', '2023-06-08'),
('2023-06-110.183', 'aisyatus zhroh', 25, 'gembong city', 'A', '2023-06-11', '02', '01', 'sulit mikir', '2023-06-11'),
('2023-06-110.454', 'dapina', 21, 'samping pegadaian', 'AB', '2023-06-11', '02', '04', 'pusing fp', '2023-06-11'),
('2023-06-150.006', 'Revo ', 29, 'London', 'A', '2023-06-15', '04', '02', 'Final Project ', '2023-06-15'),
('2023-06-150.022', 'Yudha ', 32, 'Wonokromo', 'A', '2023-06-15', '01', '05', 'Lambung', '2023-06-14'),
('2023-06-150.317', 'Berliana ', 19, 'Puskesmas', 'A', '2023-06-15', '13', '12', 'Kecetit', '2023-06-20'),
('2023-06-150.344', 'Bela ', 19, 'Kodam', 'AB', '2023-06-15', '09', '09', 'Patah Tulang', '2023-06-19'),
('2023-06-150.448', 'Dwynna', 19, 'Bekasi ', 'AB', '2023-06-15', '01', '08', 'Kecetit', '2023-06-16'),
('2023-06-150.494', 'Giras', 68, 'Purimas', 'AB', '2023-06-15', '03', '11', 'Lambung', '2023-06-15'),
('2023-06-150.661', 'Nail', 57, 'Wonorejo', 'O', '2023-06-15', '03', '06', 'Patah Tulang', '2023-06-16'),
('2023-06-150.685', 'Irene', 22, 'Wadung Asri ', 'A', '2023-06-15', '09', '10', 'Asam Urat', '2023-06-16');

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
('01', 'RED', 'Terisi'),
('02', 'BLUE', 'Terisi'),
('03', 'GREEN', 'Terisi'),
('04', 'VIOLET', 'Terisi'),
('05', 'GOLDEN', 'Terisi'),
('06', 'WHITE', 'Terisi'),
('07', 'BLACK', 'Terisi'),
('08', 'MINT', 'Terisi'),
('09', 'SAGE', 'Terisi'),
('10', 'BROWN', 'Terisi'),
('11', 'PINKWHITE', 'Terisi'),
('12', 'PinkRose', 'Terisi'),
('33', 'Kunci', 'Terisi');

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
(1, '2023-06-15', 1, '1', '2023-06-15 00:51:54'),
(2, '2023-06-15', 2, '0', NULL),
(3, '2023-06-16', 1, '0', NULL);

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
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_antrian`
--
ALTER TABLE `tbl_antrian`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
