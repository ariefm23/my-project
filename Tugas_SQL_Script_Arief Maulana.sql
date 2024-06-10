-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 10, 2024 at 06:48 PM
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
-- Database: `bank_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabang_bank`
--

CREATE TABLE `cabang_bank` (
  `kode_cabang` varchar(10) NOT NULL,
  `nama_cabang` varchar(50) NOT NULL,
  `alamat_cabang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cabang_bank`
--

INSERT INTO `cabang_bank` (`kode_cabang`, `nama_cabang`, `alamat_cabang`) VALUES
('BRUB', 'Bank Rut Unit Boyolali', 'Jl.Slamet Riyadi 18'),
('BRUK', 'Bank Rut Unit Klaten', 'Jl.Slamet Riyadi 18'),
('BRUM', 'Bank Rut Unit Magelang', 'Jl.Slamet Riyadi 18'),
('BRUS', 'BANK Rut Unit Surakarta', 'Jl.Slamet Riyadi 18'),
('BRUW', 'Bank Rut Unit Wonogiri', 'Jl. A. Yani No.23.');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id_nasabah` int(11) NOT NULL,
  `nama_nasabah` varchar(30) NOT NULL,
  `alamat_nasabah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id_nasabah`, `nama_nasabah`, `alamat_nasabah`) VALUES
(1, 'Sutopo', 'JI. Jendral Sudirman 12'),
(2, 'Maryati', 'JI. MT. Haryono 31'),
(3, 'Suparman', 'JI. Hasanudin 81'),
(4, 'Kartika Padmasari', 'Jl. Manggis 15'),
(5, 'Budi Eko Prayogo', 'JI. Kantil 30'),
(6, 'Satria Eka Jaya', 'JI. Slamet Riyadi 45'),
(7, 'Indri Hapsari', 'Jl. Slamet Riyadi No.34.'),
(9, 'Canka Lokananta', 'Jl. Tidar 86'),
(10, 'Budi Murtono', 'JI. Merak 22');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah_has_rekening`
--

CREATE TABLE `nasabah_has_rekening` (
  `id_nasabah` int(11) NOT NULL,
  `no_rekening` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nasabah_has_rekening`
--

INSERT INTO `nasabah_has_rekening` (`id_nasabah`, `no_rekening`) VALUES
(1, '104'),
(2, '103'),
(3, '105'),
(4, '106'),
(5, '101'),
(6, '102');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `no_rekening` varchar(3) NOT NULL,
  `kode_cabang` varchar(10) NOT NULL,
  `pin` char(4) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`no_rekening`, `kode_cabang`, `pin`, `saldo`) VALUES
('101', 'BRUS', '1111', 500000),
('102', 'BRUS', '2222', 350000),
('103', 'BRUS', '3333', 750000),
('104', 'BRUM', '4444', 900000),
('105', 'BRUM', '5555', 2000000),
('106', 'BRUS', '6666', 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` int(11) NOT NULL,
  `no_rekening` varchar(3) NOT NULL,
  `id_nasabah` int(11) NOT NULL,
  `jenis_transaksi` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `no_rekening`, `id_nasabah`, `jenis_transaksi`, `tanggal`, `jumlah`) VALUES
(1, '105', 3, 'debit', '2009-11-10', 50000),
(2, '103', 2, 'debit', '2009-11-10', 40000),
(3, '101', 5, 'kredit', '2009-11-12', 20000),
(4, '106', 4, 'debit', '2009-11-13', 50000),
(5, '101', 5, 'kredit', '2009-11-13', 30000),
(6, '104', 1, 'kredit', '2009-11-15', 200000),
(7, '102', 6, 'kredit', '2009-11-15', 150000),
(8, '102', 6, 'debit', '2009-11-16', 20000),
(9, '105', 3, 'kredit', '2009-11-18', 50000),
(10, '106', 4, 'debit', '2009-11-19', 100000),
(11, '103', 2, 'debit', '2009-11-19', 100000),
(12, '104', 1, 'debit', '2009-11-19', 50000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabang_bank`
--
ALTER TABLE `cabang_bank`
  ADD PRIMARY KEY (`kode_cabang`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id_nasabah`);

--
-- Indexes for table `nasabah_has_rekening`
--
ALTER TABLE `nasabah_has_rekening`
  ADD KEY `id_nasabah` (`id_nasabah`),
  ADD KEY `no_rekening` (`no_rekening`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`no_rekening`),
  ADD KEY `rekening_ibfk_1` (`kode_cabang`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_nasabah` (`id_nasabah`),
  ADD KEY `no_rekening` (`no_rekening`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `id_nasabah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `no_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nasabah_has_rekening`
--
ALTER TABLE `nasabah_has_rekening`
  ADD CONSTRAINT `nasabah_has_rekening_ibfk_1` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id_nasabah`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nasabah_has_rekening_ibfk_2` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rekening`
--
ALTER TABLE `rekening`
  ADD CONSTRAINT `rekening_ibfk_1` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang_bank` (`kode_cabang`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id_nasabah`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
