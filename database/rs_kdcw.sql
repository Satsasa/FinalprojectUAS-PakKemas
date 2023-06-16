-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2023 at 11:17 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

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
('2021-01-100.731', 'Parto', 56, 'fcvyhyh', 'A', '2019-01-10', '12', '33', 'edxcgtv', '2019-01-13'),
('2023-06-110.123', 'radiana', 23, 'kenjeran city', 'O', '2023-06-11', '03', '07', 'nangis dan mual', '2023-06-08'),
('2023-06-110.183', 'aisyatus zhroh', 25, 'gembong city', 'A', '2023-06-11', '02', '01', 'sulit mikir', '2023-06-11'),
('2023-06-110.454', 'dapina', 21, 'samping pegadaian', 'AB', '2023-06-11', '02', '04', 'pusing fp', '2023-06-11');

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
('02', 'BLUE', 'Kosong'),
('03', 'GREEN', 'Kosong'),
('04', 'VIOLET', 'Terisi'),
('05', 'GOLDEN', 'Kosong'),
('06', 'WHITE', 'Kosong'),
('07', 'BLACK', 'Terisi'),
('08', 'MINT', 'Kosong'),
('09', 'SAGE', 'Kosong'),
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
