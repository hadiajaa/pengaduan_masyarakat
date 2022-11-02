-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2022 at 02:28 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_masyarakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `id_masyarakat` int(5) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `telp` varchar(12) NOT NULL,
  `kecamatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `masyarakat`
--

INSERT INTO `masyarakat` (`id_masyarakat`, `nik`, `nama`, `username`, `password`, `telp`, `kecamatan`) VALUES
(1, '1234', 'AMMAR', 'lufi', '123', '0878544357', 'Kec.Cilodong'),
(6, '456789', 'SINTA', 'sinta', '4567', '0878544357', 'Kec.Cilodong'),
(7, '99999', 'ECA', 'eca', '123', '0878544357', 'Kec.Cilodong'),
(8, '3030303030', 'ROZA', 'roza', '12345', '0878544357', 'Kec.Cilodong'),
(9, '90909090', 'ANISA', 'anisa', '123', '0878544357', 'Kec.Cilodong');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(5) NOT NULL,
  `tgl_pengaduan` varchar(20) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(5, '2022-09-28', '1234', 'KEBAKARAN', 'noImage.png', 'proses'),
(7, '2022-09-28', '1234', 'KEBAKARAN JAKARTA UTARA', '280920222529kebakaran.jpeg', 'proses'),
(8, '2022-09-28', '1234', 'KEBAKARAN DI JAKARTA SELATAN', '280920222622kebakaran.jpeg', 'proses'),
(9, '2022-09-28', '1234', 'BADAI', '280920223203kebakaran.jpeg', 'selesai'),
(10, '2022-09-28', '456789', 'LONGSOR', 'noImage.png', 'selesai'),
(12, '2022-09-29', '1234', 'LONGSOR', '2909202225232018_02_06-11_43_20_5dc25f0adba4644d8b269d5242a28e0e_400x267_thumb.jpg', 'proses'),
(13, '2022-09-29', '456789', 'hujan', '290920220544kebakaran.jpeg', 'proses'),
(14, '2022-10-03', '1234', 'HARI INI BANJIR', '031020225340kebakaran.jpeg', 'selesai'),
(15, '2022-10-03', '456789', 'MOTOR', '031020225943kebakaran.jpeg', 'proses'),
(16, '2022-10-04', '99999', 'kebakaran di jakarta', '041020220021kebakaran.jpeg', 'selesai'),
(17, '2022-09-28', '555555', 'aaaaaaaaaaaa', '', 'selesai'),
(18, '2022-10-16', '90909090', 'BANJIR DI JALAN RAYA', '161020222354banjir-rendam-rawajati-5_169.jpeg', 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(5) NOT NULL,
  `nama_petugas` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp_petugas` varchar(13) NOT NULL,
  `level` enum('owner','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp_petugas`, `level`) VALUES
(1, 'Aqil Rahman', 'admin', '21232f297a57a5a743894a0e4a801fc3', '081215951492', 'owner'),
(2, 'M Riski', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', '081215951492', 'petugas'),
(3, 'lufi', 'petugas_lufi', 'petugas', '321', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(5) NOT NULL,
  `id_pengaduan` int(5) NOT NULL,
  `tgl_tanggapan` varchar(20) NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(5, 10, '2022-09-28', 'SIAP', 3),
(6, 9, '2022-09-28', 'TERIMAKASIH LAPORANNYA', 3),
(7, 14, '2022-10-03', 'OKE PEMADAM KESANA', 3),
(8, 16, '2022-10-04', 'IYA ECA PETUGAS OTW', 3),
(10, 18, '2022-10-16', 'OTW', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`id_masyarakat`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `masyarakat`
--
ALTER TABLE `masyarakat`
  MODIFY `id_masyarakat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
