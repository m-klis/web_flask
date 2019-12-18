-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Agu 2019 pada 21.56
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mkafe`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detil_jual`
--

CREATE TABLE `detil_jual` (
  `id_jual` int(11) DEFAULT NULL,
  `id_menu` int(4) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` varchar(3) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `diskon` int(3) DEFAULT NULL,
  `ppn` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detil_jual`
--

INSERT INTO `detil_jual` (`id_jual`, `id_menu`, `harga`, `jumlah`, `comment`, `diskon`, `ppn`) VALUES
(2, 3, 9900, '3', '-', 0, 10),
(3, 3, 9000, '3', '-', 10, 10),
(4, 24, 16500, '1', '-', 0, 10),
(4, 3, 3000, '1', '-', 10, 10),
(4, 2, 7700, '1', '-', 0, 10),
(4, 25, 27500, '1', '-', 0, 10),
(4, 4, 5500, '1', '-', 0, 10),
(4, 1, 3300, '1', '-', 0, 10),
(5, 24, 16500, '1', 'hhhcvls', 0, 10),
(5, 3, 3000, '1', 'lkhlil', 10, 10),
(6, 4, 5500, '1', '-', 0, 10),
(6, 1, 3300, '1', 'ghkiukhu', 0, 10),
(7, 24, 16500, '1', '-', 0, 10),
(7, 3, 3300, '1', '-', 0, 10),
(7, 2, 7700, '1', '-', 0, 10),
(7, 25, 27500, '1', '-', 0, 10),
(7, 4, 5500, '1', '-', 0, 10),
(7, 1, 3300, '1', '-', 0, 10),
(8, 3, 3300, '1', 'bmh', 0, 10),
(8, 2, 7700, '1', 'hkjh', 0, 10),
(9, 24, 49500, '3', 'j;o', 0, 10),
(9, 3, 3300, '1', 'jhjk', 0, 10),
(11, 24, 16500, '1', 'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP', 0, 10),
(12, 24, 16500, '1', '0ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp', 0, 10),
(13, 24, 16500, '1', 'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO', 0, 10),
(14, 24, 16500, '1', '-', 0, 10),
(15, 24, 16500, '1', '-', 0, 10),
(16, 24, 16500, '1', '-', 0, 10),
(17, 24, 16500, '1', '-', 0, 10),
(18, 24, 16500, '1', '-', 0, 10),
(19, 24, 16500, '1', '-', 0, 10),
(20, 24, 16500, '1', '-', 0, 10),
(21, 24, 16500, '1', '-', 0, 10),
(21, 3, 3000, '1', '-', 10, 10),
(22, 24, 16500, '1', '-', 0, 10),
(22, 3, 3000, '1', '-', 10, 10),
(23, 24, 16500, '1', '-', 0, 10),
(23, 3, 3000, '1', '-', 10, 10),
(24, 24, 16500, '1', '-', 0, 10),
(24, 3, 3000, '1', '-', 10, 10),
(25, 24, 16500, '1', '-', 0, 10),
(25, 3, 3000, '1', '-', 10, 10),
(26, 24, 16500, '1', '-', 0, 10),
(26, 3, 3000, '1', '-', 10, 10),
(27, 24, 16500, '1', '-', 0, 10),
(27, 3, 3000, '1', '-', 10, 10),
(28, 24, 16500, '1', '-', 0, 10),
(28, 3, 3000, '1', '-', 10, 10),
(29, 3, 3000, '1', '-', 10, 10),
(30, 3, 3300, '1', '-', 0, 10),
(31, 3, 3300, '1', '-', 0, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jual`
--

CREATE TABLE `jual` (
  `id_jual` int(11) NOT NULL,
  `no_pesan` varchar(15) DEFAULT NULL,
  `tgl_jual` date DEFAULT NULL,
  `id_member` int(4) DEFAULT NULL,
  `id_kasir` int(4) DEFAULT NULL,
  `total_byr` int(11) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `nama_cust` varchar(50) DEFAULT NULL,
  `kontak` varchar(50) DEFAULT NULL,
  `status_byr` varchar(7) DEFAULT NULL,
  `status` varchar(7) DEFAULT NULL,
  `tgl_trx` date DEFAULT NULL,
  `no_meja` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jual`
--

INSERT INTO `jual` (`id_jual`, `no_pesan`, `tgl_jual`, `id_member`, `id_kasir`, `total_byr`, `bayar`, `kembali`, `nama_cust`, `kontak`, `status_byr`, `status`, `tgl_trx`, `no_meja`) VALUES
(2, 'TR190810021029', '2019-08-10', 0, 1, 9900, 9900, 0, 'uji1', '-', 'bayar', 'selesai', '2019-08-11', '1'),
(3, 'TR190810021105', '2019-08-10', 1, 1, 9000, 9000, 0, 'member', '089089089089', 'bayar', 'selesai', '2019-08-11', '1'),
(4, 'TR190810021143', '2019-08-10', 1, 1, 63500, 63500, 0, 'member', '089089089089', 'bayar', 'selesai', '2019-08-11', '1'),
(5, 'TR190810021159', '2019-08-10', 1, 1, 19500, 19500, 0, 'member', '089089089089', 'bayar', 'selesai', '2019-08-11', '1'),
(6, 'TR190810021217', '2019-08-10', 1, 1, 8800, 8800, 0, 'member', '089089089089', 'bayar', 'selesai', '2019-08-11', '1'),
(7, 'TR190810021255', '2019-08-10', 0, 1, 63800, 63800, 0, 'uji2', '-', 'bayar', 'selesai', '2019-08-11', '1'),
(8, 'TR190810021315', '2019-08-10', 0, 1, 11000, 11000, 0, 'uji3', '-', 'bayar', 'selesai', '2019-08-11', '1'),
(9, 'TR190810021415', '2019-08-10', 0, 1, 52800, 52800, 0, 'input kasir', '089', 'bayar', 'selesai', '2019-08-11', '1'),
(11, 'TR190811113034', '2019-08-11', 0, 1, 16500, 16500, 0, 'kasir input', '-', 'bayar', 'selesai', '2019-08-11', '10'),
(12, 'TR190811184152', '2019-08-11', 0, 1, 16500, 16500, 0, 'Ujilagi', '-', 'bayar', 'selesai', '2019-08-11', '11'),
(13, 'TR190811212705', '2019-08-11', 0, 1, 16500, 100000, 83500, 'uji gan', '-', 'bayar', 'belum', NULL, '11'),
(14, 'TR190811233128', NULL, 1, NULL, 16500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '30'),
(15, 'TR190811233604', NULL, 1, NULL, 16500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '13'),
(16, 'TR190811233851', NULL, 1, NULL, 16500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '13'),
(17, 'TR190811233919', NULL, 1, NULL, 16500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '13'),
(18, 'TR190811233956', NULL, 1, NULL, 16500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '13'),
(19, 'TR190811234000', NULL, 1, NULL, 16500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '13'),
(20, 'TR190811234006', NULL, 1, NULL, 16500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '13'),
(21, 'TR190811234316', NULL, 1, NULL, 19500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '14'),
(22, 'TR190811234918', NULL, 1, NULL, 19500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '14'),
(23, 'TR190811235108', NULL, 1, NULL, 19500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '14'),
(24, 'TR190811235240', NULL, 1, NULL, 19500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '14'),
(25, 'TR190811235455', NULL, 1, NULL, 19500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '14'),
(26, 'TR190811235529', NULL, 1, NULL, 19500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '14'),
(27, 'TR190811235632', NULL, 1, NULL, 19500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '14'),
(28, 'TR190811235707', NULL, 1, NULL, 19500, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '14'),
(29, 'TR190812001535', NULL, 1, NULL, 3000, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '15'),
(30, 'TR190812001604', NULL, 0, NULL, 3300, NULL, NULL, 'bukan member', '-', 'pesan', 'belum', NULL, '15'),
(31, 'TR190812001651', NULL, 0, NULL, 3300, NULL, NULL, 'bukan member', '-', 'pesan', 'belum', NULL, '15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int(4) NOT NULL,
  `nm_kasir` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `kota_lhr` varchar(40) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nm_kasir`, `alamat`, `tgl_lhr`, `kota_lhr`, `no_telp`, `email`, `username`, `password`) VALUES
(1, 'kasir', 'semarang gan', '1997-05-02', 'semarang', '089123456789', 'kasir@kasir', 'kasir', 'kasir'),
(2, 'kasir2', 'kasir2', '2000-11-11', 'Semarang', '089000888999', 'kasir@2', 'kasir2', 'kasir2'),
(3, 'kasir3', 'kasir3', '1992-05-05', 'Semarang', '087777888999', 'kasir@3', 'kasir3', 'kasir3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `login_as` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`, `login_as`) VALUES
('admin', '*4ACFE3202A5FF5CF467898FC58AAB1D615029441', 'admin'),
('kasir', '*6E02B27D5638DD2E97ABAA5B61A4FE6D03D8DF45', 'kasir'),
('kasir2', '*65A4FA02F4A4B15A53012F7CAF3E0CF0F566B3C8', 'kasir'),
('kasir3', '*3C885A633660AF7E1D28C949FB9FA2584F9EB2DB', 'kasir'),
('member', '*F76A0292E763BD108EA5492E25EC051F7E23E6E9', 'member'),
('member2', '*2FAF8D7F69BBF9784796EA6D378EF19AD0D73231', 'member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(4) NOT NULL,
  `nm_member` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` char(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nm_member`, `alamat`, `no_telp`, `email`, `username`, `password`) VALUES
(1, 'member', 'member', '089089089089', 'member@member', 'member', 'member'),
(2, 'member2', 'member2', '089000888999', 'member@2', 'member2', 'member2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(4) NOT NULL,
  `nm_menu` varchar(50) DEFAULT NULL,
  `kategori` varchar(25) DEFAULT NULL,
  `ft_menu` varchar(50) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `diskon` int(3) DEFAULT NULL,
  `ppn` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `nm_menu`, `kategori`, `ft_menu`, `harga`, `deskripsi`, `diskon`, `ppn`) VALUES
(1, 'Teh', 'minuman', 'esteh.jpg', 3000, 'Dapat disajikan dingin atau hangat', 0, 10),
(2, 'mie rebus', 'makanan', 'mierebus.jpg', 7000, 'Terdapat varian rasa', 0, 10),
(3, 'kopi', 'minuman', 'kopi.jpg', 3000, 'Dapat disajikan dingin atau panas', 10, 10),
(4, 'Roti Bakar', 'makanan', 'rotibakar.jpg', 5000, 'Varian rasa', 0, 10),
(24, 'Kentang Goreng', 'makanan', 'dino.png', 15000, 'Kentang Goreng', 0, 10),
(25, 'Nasi Goreng', 'makanan', 'dino_run.jpg', 25000, 'Nasi goreng', 0, 10);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detil_jual`
--
ALTER TABLE `detil_jual`
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_jual` (`id_jual`) USING BTREE;

--
-- Indeks untuk tabel `jual`
--
ALTER TABLE `jual`
  ADD PRIMARY KEY (`id_jual`),
  ADD UNIQUE KEY `no_pesan` (`no_pesan`),
  ADD KEY `id_kasir` (`id_kasir`);

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`),
  ADD KEY `username` (`username`) USING BTREE;

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`) USING BTREE;

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`),
  ADD KEY `username` (`username`) USING BTREE;

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jual`
--
ALTER TABLE `jual`
  MODIFY `id_jual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id_kasir` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detil_jual`
--
ALTER TABLE `detil_jual`
  ADD CONSTRAINT `detil_jual_ibfk_4` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detil_jual_ibfk_5` FOREIGN KEY (`id_jual`) REFERENCES `jual` (`id_jual`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jual`
--
ALTER TABLE `jual`
  ADD CONSTRAINT `jual_ibfk_3` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
