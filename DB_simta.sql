-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2022 at 02:37 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simta`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bimbingan`
--

CREATE TABLE `tbl_bimbingan` (
  `idBimb` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `idProp` int(11) NOT NULL,
  `isValid` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_catatan`
--

CREATE TABLE `tbl_catatan` (
  `idCatatan` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `idProp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_catatan`
--

INSERT INTO `tbl_catatan` (`idCatatan`, `keterangan`, `idProp`) VALUES
(1, NULL, 1),
(2, 'tes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dosen`
--

CREATE TABLE `tbl_dosen` (
  `idDosen` int(11) NOT NULL,
  `nmDosen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dosen`
--

INSERT INTO `tbl_dosen` (`idDosen`, `nmDosen`) VALUES
(1, 'Faizal Johan Atletiko, S.Kom, M.T'),
(2, 'Nur Aini Rakhmawati, S.Kom, M.Sc.Eng, Ph.D'),
(3, 'Radityo Prasetianto.W, S.Kom, M.Kom');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `idMhs` int(11) NOT NULL,
  `nmMhs` varchar(50) NOT NULL,
  `nrpMhs` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`idMhs`, `nmMhs`, `nrpMhs`) VALUES
(1, 'Ahmad Choirun Najib', '5214100057'),
(2, 'Ahmad Arif Samudro', '5214100118'),
(3, 'Ahsanul Khuluq Saifullah', '5214100106'),
(4, 'Alden Delfian Wattimena', '5214100707'),
(5, 'ADITYA SEPTA SETYA BUDI', '5214100126');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_propta`
--

CREATE TABLE `tbl_propta` (
  `idProp` int(11) NOT NULL,
  `jdlTA` text NOT NULL,
  `idMhs` int(11) NOT NULL,
  `status` varchar(15) DEFAULT 'Diajukan',
  `isProp` tinyint(1) DEFAULT 1,
  `pembSatu` varchar(75) NOT NULL,
  `pembDua` varchar(75) DEFAULT NULL,
  `nrp` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_propta`
--

INSERT INTO `tbl_propta` (`idProp`, `jdlTA`, `idMhs`, `status`, `isProp`, `pembSatu`, `pembDua`, `nrp`, `nama`) VALUES
(1, 'Integrasi Data Bantuan Pemerintah Kota Terhadap Penduduk Surabaya Menggunakan Identity Correlation Approach', 1, 'Disetujui', 1, 'Nur Aini Rakhmawati, S.Kom, M.Sc.Eng, Ph.D', 'Faizal Johan Atletiko, S.Kom, M.T', '5214100057', 'Ahmad Choirun Najib'),
(2, 'Analisis Sentimen Teks Berbahasa Indonesia Pada Media Sosial Dengan Algoritma Convolutional Neural Network ( Studi Kasus : Operator Telekomunikasi )', 2, 'Disetujui', 1, 'Radityo Prasetianto.W, S.Kom, M.Kom', 'Nur Aini Rakhmawati, S.Kom, M.Sc.Eng, Ph.D', '5214100118', 'Ahmad Arif Samudro'),
(3, 'Normalisasi Teks Bahasa Indonesia pada Media Sosial Berdasarkan FastText Embedding', 3, 'Diajukan', 1, 'Nur Aini Rakhmawati, S.Kom, M.Sc.Eng, Ph.D', NULL, '5214100106', 'Ahsanul Khuluq Saifullah'),
(4, 'Rancang Bangun Aplikasi Android Halal Nutrition Food Menggunakan Kombinasi Query-Independent dan Query-Dependent Ranking', 4, 'Diajukan', 1, 'Radityo Prasetianto.W, S.Kom, M.Kom', 'Faizal Johan Atletiko, S.Kom, M.T', '5214100707', 'Alden Delfian Wattimena');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vcatatanajuan`
-- (See below for the actual view)
--
CREATE TABLE `vcatatanajuan` (
`idProp` int(11)
,`jdlTA` text
,`idMhs` int(11)
,`pembSatu` varchar(75)
,`pembDua` varchar(75)
,`status` varchar(15)
,`isProp` tinyint(1)
,`idCatatan` int(11)
,`keterangan` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vdaftarta`
-- (See below for the actual view)
--
CREATE TABLE `vdaftarta` (
`idProp` int(11)
,`idMhs` int(11)
,`nrpMhs` varchar(20)
,`nmMhs` varchar(50)
,`jdlTA` text
,`pembSatu` varchar(75)
,`pembDua` varchar(75)
,`status` varchar(15)
,`isProp` tinyint(1)
);

-- --------------------------------------------------------

--
-- Structure for view `vcatatanajuan`
--
DROP TABLE IF EXISTS `vcatatanajuan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcatatanajuan`  AS SELECT `p`.`idProp` AS `idProp`, `p`.`jdlTA` AS `jdlTA`, `p`.`idMhs` AS `idMhs`, `p`.`pembSatu` AS `pembSatu`, `p`.`pembDua` AS `pembDua`, `p`.`status` AS `status`, `p`.`isProp` AS `isProp`, `c`.`idCatatan` AS `idCatatan`, `c`.`keterangan` AS `keterangan` FROM (`tbl_catatan` `c` join `tbl_propta` `p` on(`c`.`idProp` = `p`.`idProp`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vdaftarta`
--
DROP TABLE IF EXISTS `vdaftarta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vdaftarta`  AS SELECT `p`.`idProp` AS `idProp`, `p`.`idMhs` AS `idMhs`, `m`.`nrpMhs` AS `nrpMhs`, `m`.`nmMhs` AS `nmMhs`, `p`.`jdlTA` AS `jdlTA`, `p`.`pembSatu` AS `pembSatu`, `p`.`pembDua` AS `pembDua`, `p`.`status` AS `status`, `p`.`isProp` AS `isProp` FROM (`tbl_propta` `p` join `tbl_mahasiswa` `m` on(`m`.`idMhs` = `p`.`idMhs`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bimbingan`
--
ALTER TABLE `tbl_bimbingan`
  ADD PRIMARY KEY (`idBimb`),
  ADD KEY `idProp` (`idProp`);

--
-- Indexes for table `tbl_catatan`
--
ALTER TABLE `tbl_catatan`
  ADD PRIMARY KEY (`idCatatan`),
  ADD KEY `idProp` (`idProp`);

--
-- Indexes for table `tbl_dosen`
--
ALTER TABLE `tbl_dosen`
  ADD PRIMARY KEY (`idDosen`);

--
-- Indexes for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`idMhs`);

--
-- Indexes for table `tbl_propta`
--
ALTER TABLE `tbl_propta`
  ADD PRIMARY KEY (`idProp`),
  ADD KEY `idMhs` (`idMhs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bimbingan`
--
ALTER TABLE `tbl_bimbingan`
  MODIFY `idBimb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_catatan`
--
ALTER TABLE `tbl_catatan`
  MODIFY `idCatatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_dosen`
--
ALTER TABLE `tbl_dosen`
  MODIFY `idDosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  MODIFY `idMhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_propta`
--
ALTER TABLE `tbl_propta`
  MODIFY `idProp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bimbingan`
--
ALTER TABLE `tbl_bimbingan`
  ADD CONSTRAINT `tbl_bimbingan_ibfk_1` FOREIGN KEY (`idProp`) REFERENCES `tbl_propta` (`idProp`);

--
-- Constraints for table `tbl_catatan`
--
ALTER TABLE `tbl_catatan`
  ADD CONSTRAINT `tbl_catatan_ibfk_1` FOREIGN KEY (`idProp`) REFERENCES `tbl_propta` (`idProp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
