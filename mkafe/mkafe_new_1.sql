-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Agu 2019 pada 10.12
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
(44, 52, 11000, '1', '-', 0, 10),
(44, 53, 13200, '1', '-', 0, 10),
(44, 54, 19800, '1', '-', 0, 10),
(44, 55, 17600, '1', '-', 0, 10),
(44, 56, 17600, '1', '-', 0, 10),
(44, 57, 17600, '1', '-', 0, 10),
(44, 58, 23100, '1', '-', 0, 10),
(45, 52, 11000, '1', '-', 0, 10),
(46, 52, 11000, '1', '-', 0, 10),
(46, 43, 25300, '1', '-', 0, 10),
(47, 52, 132000, '12', 'Ghhhhhhhhhhhhhbbbb', 0, 10),
(47, 53, 118800, '9', 'Bhhhhhhhh', 0, 10);

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
(44, 'TR190819055755', '2019-08-19', 0, 1, 119900, 119900, 0, 'uji', '-', 'bayar', 'simpan', NULL, '23'),
(45, 'TR190819080002', '2019-08-19', 0, 1, 11000, 11000, 0, 'pelanggan', '-', 'bayar', 'simpan', NULL, '12'),
(46, 'TR190819113434', NULL, 1, NULL, 36300, NULL, NULL, 'member', '089089089089', 'pesan', 'belum', NULL, '10'),
(47, 'TR190821105652', NULL, 0, NULL, 250800, NULL, NULL, 'ali', '-', 'pesan', 'belum', NULL, '12');

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
(1, 'kasir', 'semarang', '1997-05-02', 'semarang', '089123456789', 'kasir@kasir', 'kasir', 'kasir'),
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
('member2', '*2FAF8D7F69BBF9784796EA6D378EF19AD0D73231', 'member'),
('ujigan', '*0EDAB2BA7B160FA564CD6249D2493A4CCDB916D7', 'member'),
('ujiuji', '*AAE8A25238764E6196F61BFC566ED5C6A0EC4913', 'member');

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
(2, 'member2', 'member2', '089000888999', 'member@2', 'member2', 'member2'),
(7, 'ujigan', 'ujigan', '089089089000', 'uji@gan', 'ujigan', 'ujigan'),
(8, 'uji', 'uji', '089', 'uji@uji', 'ujiuji', 'ujiuji');

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
(30, 'Gyu Don', 'Rice is Lyfe', 'Gyu_Don.jpg', 35000, 'Gyu Don', 0, 10),
(31, 'Darkside Burger', 'No Rice No Cry', 'Darkside_Burger.png', 32000, 'Cheese/Salted Egg/Blackpepper', 0, 10),
(34, 'Banana Fritter', 'Diet What Diet ?', 'Banana_Fritter.jpg', 19000, 'Chocolate/Peanut/Cheese', 0, 10),
(35, 'Crispy Chicken Skin', 'Diet What Diet ?', 'Crispy_Chicken_Skin.jpg', 18000, 'Crispy Chicken Skin', 0, 10),
(36, 'Potato Ball', 'Diet What Diet ?', 'Potato_Ball.jpg', 19000, 'Potato Ball', 0, 10),
(37, 'French Fries', 'Diet What Diet ?', 'French_Fries.jpg', 19000, 'French Fries', 0, 10),
(38, 'Mayo Cassava', 'Diet What Diet ?', 'mayo_casava.jpg', 19000, 'Mayo Cassava', 0, 10),
(39, 'French Egg Toast', 'Diet What Diet ?', 'French_Egg_Toast.jpg', 21000, 'French Egg Toast', 0, 10),
(40, 'Naugat Bread', 'Diet What Diet ?', 'nugget_bread.jpg', 22000, 'Naugat Bread', 0, 10),
(41, 'Banana Hotdog', 'Diet What Diet ?', 'banana_hotdog.jpg', 21000, 'Banana Hotdog', 0, 10),
(42, 'Bratwurst Hotdog', 'Diet What Diet ?', 'Bratwurst_Hotdog.jpg', 24000, 'Bratwurst Hotdog', 0, 10),
(43, 'Chicken Bites', 'Diet What Diet ?', 'Chicken_Bites.jpg', 23000, 'Salt Pepper / BBQ', 0, 10),
(44, 'Chocolate', 'Non Caffeine and else', 'Chocolate.jpg', 28000, 'Chocolate', 0, 10),
(45, 'Matcha', 'Non Caffeine and else', 'Matcha.jpg', 28000, 'Matcha', 0, 10),
(46, 'Matcha Chocolate', 'Non Caffeine and else', 'Matcha_Chocolate.jpg', 28000, 'Matcha Chocolate', 0, 10),
(47, 'Salted Caramel', 'Non Caffeine and else', 'Salted_Caramel.jpg', 26000, 'Salted Caramel', 0, 10),
(48, 'Purplish Latte', 'Non Caffeine and else', 'Purplish_Latte.jpg', 26000, 'Purplish Latte', 0, 10),
(49, 'Black Latte', 'Non Caffeine and else', 'Black_Latte.jpg', 28000, 'Black Latte', 0, 10),
(50, 'Black Forest', 'Non Caffeine and else', 'Black_Forest.jpg', 28000, 'Black Forest', 0, 10),
(51, 'Blood Velvet', 'Non Caffeine and else', 'Blood_Velvet.jpg', 26000, 'Blood Velvet', 0, 10),
(52, 'Mineral Water', 'Any \"tea\" ng', 'Mineral_Water.jpg', 10000, 'Mineral Water', 0, 10),
(53, 'Tea', 'Any \"tea\" ng', 'tea.jpg', 12000, 'Tea', 0, 10),
(54, 'Lychee Tea', 'Any \"tea\" ng', 'Lychee_Tea.jpg', 18000, 'Lychee Tea', 0, 10),
(55, 'Peach Tea', 'Any \"tea\" ng', 'Peach_Tea.jpg', 16000, 'Peach Tea', 0, 10),
(56, 'Mango Tea', 'Any \"tea\" ng', 'mango_tea.jpg', 16000, 'Mango Tea', 0, 10),
(57, 'Peppermint Tea', 'Any \"tea\" ng', 'Peppermint_Tea.jpg', 16000, 'Peppermint Tea', 0, 10),
(58, 'Thai Tea', 'Any \"tea\" ng', 'Thai_Tea.jpg', 21000, 'Thai Tea', 0, 10),
(59, 'Green Tea Jasmine Tea', 'Any \"tea\" ng', 'jasmine_tea.jpg', 18000, 'Green Tea Jasmine Tea', 0, 10),
(60, 'Blacktea Decaf', 'Any \"tea\" ng', 'Blacktea_Decaf.jpg', 18000, 'Blacktea Decaf', 0, 10),
(61, 'Chamomile Tea', 'Any \"tea\" ng', 'Chamomile_Tea.jpg', 18000, 'Chamomile Tea', 0, 10),
(62, 'Espresso', 'Sleep is for The Weak', 'Espresso.jpg', 17000, 'Espresso', 0, 10),
(63, 'Kopi Susu Anugerah', 'Sleep is for The Weak', 'Kopi_Susu_Anugerah.jpg', 20000, 'Kopi Susu Anugerah', 0, 10),
(64, 'Kopi Susu Marie', 'Sleep is for The Weak', 'Kopi_Susu_Marie.jpg', 24000, 'Kopi Susu Marie', 0, 10),
(65, 'Kopi Susu Rum', 'Sleep is for The Weak', 'Kopi_Susu_Rum.jpg', 24000, 'Kopi Susu Rum', 0, 10),
(66, 'Latte', 'Sleep is for The Weak', 'Latte.jpg', 27000, 'Original/Hazelnut/Kalua/Caramel/Greyscale', 0, 10),
(67, 'Cappucinno', 'Sleep is for The Weak', 'Capucinno.jpg', 27000, 'Cappucinno', 0, 10),
(68, 'Picollo', 'Sleep is for The Weak', 'Picollo.png', 24000, 'Picollo', 0, 10),
(69, 'Afogatto', 'Sleep is for The Weak', 'Afogatto.jpg', 24000, 'Afogatto', 0, 10),
(70, 'Kalua Java Chip', 'Non Caffeine and else', 'Kalua_Java_Chip.jpg', 29000, 'Kalua Java Chip', 0, 10),
(71, 'Caramel Sweet Cookies', 'Non Caffeine and else', 'Caramel_Sweet_Cookies.jpg', 29000, 'Caramel Sweet Cookies', 0, 10),
(72, 'Mango Slush', 'Non Caffeine and else', 'Mango_Slush.jpg', 27000, 'Mango Slush', 0, 10),
(73, 'Banana Monkey', 'Non Caffeine and else', 'Banana_Monkey.jpg', 27000, 'Banana Monkey', 0, 10),
(74, 'Banana Coffee (Surprise !!)', 'Non Caffeine and else', 'Banana_Coffee_Surprise_.jpg', 30000, 'Banana Coffee (Surprise !!)', 0, 10),
(75, 'Lavender Bliss', 'Non Caffeine and else', 'Lavender_Bliss.jpg', 27000, 'Lavender Bliss', 0, 10),
(76, 'Green Pappermint', 'Non Caffeine and else', 'Green_Pappermint.jpg', 27000, 'Green Pappermint', 0, 10),
(77, 'Blue Agave', 'Non Caffeine and else', 'Blue_Agave.jpg', 27000, 'Blue Agave', 0, 10),
(78, 'Melonized', 'Non Caffeine and else', 'Melonized.jpg', 27000, 'Melonized', 0, 10),
(79, 'Fruitini', 'Non Caffeine and else', 'Fruitini.jpg', 26000, 'Fruitini', 0, 10),
(80, 'Beer Coffe Ori', 'Non Caffeine and else', 'Beer_Coffe_Ori.jpg', 26000, 'Beer Coffe Ori', 0, 10),
(81, 'Beer Coffee Signature', 'Non Caffeine and else', 'Beer_Coffee_Signature.jpg', 25000, 'Beer Coffee Signature', 0, 10),
(82, 'Signature Chicken', 'Non Caffeine and else', 'Signature_Chicken.jpg', 30000, 'Signature Chicken', 0, 10),
(83, 'Thai Basil Chicken Rice', 'Rice is Lyfe', 'Thai_Basil_Chicken_Rice.jpg', 30000, 'Thai Basil Chicken Rice', 0, 10),
(84, 'Patty Hamburg Mushroom Butter Rice', 'Rice is Lyfe', 'Patty_Hamburg_Mushroom_Butter_Rice.png', 30000, 'Patty Hamburg Mushroom Butter Rice', 0, 10),
(85, 'Chicken Bowl', 'Rice is Lyfe', 'Chicken_Bowl.jpg', 28000, 'Salted Egg/Cheese/Black Pepper', 0, 10),
(86, 'Crazy Rice', 'Rice is Lyfe', 'Crazy_Rice.jpg', 25000, 'Crazy Rice', 0, 10),
(87, 'Chicken Prek', 'Rice is Lyfe', 'Chiken_Prek.jpg', 25000, 'Chicken Prek', 0, 10),
(88, 'Athaya Fried Chicken', 'Rice is Lyfe', 'Athaya_Fried_Chicken.jpg', 25000, 'Athaya Fried Chicken', 0, 10),
(89, 'Spicy Crispy Chicken Noodle', 'No Rice No Cry', 'Spicy_Crispy_Chicken_Noodle.jpg', 28000, 'Spicy Crispy Chicken Noodle', 0, 10),
(90, 'Penne Aglio Olio', 'No Rice No Cry', 'Penne_Aglio_Olio.jpg', 28000, 'Penne Aglio Olio', 0, 10),
(91, 'Malaya Fried Noodle', 'No Rice No Cry', 'Malaya_Fried_Noodle.jpg', 25000, 'Malaya Fried Noodle', 0, 10);

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
  MODIFY `id_jual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id_kasir` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

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
