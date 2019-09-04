-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: fdb13.awardspace.net
-- Generation Time: Sep 04, 2019 at 03:40 PM
-- Server version: 5.7.20-log
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2525207_dbwizku`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_user`
--

CREATE TABLE `api_user` (
  `id_apiUser` int(8) UNSIGNED NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_user`
--

INSERT INTO `api_user` (`id_apiUser`, `username`, `password`) VALUES
(1, 'test', 'md5(test)');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `phone`, `email`, `address`, `city`, `state`) VALUES
(2, 'Sam', 'Smith', '333-333-3333', 'ssmith@yahoo.com', '33 Birch Rd', 'Miami', 'FL'),
(3, 'Brad', 'Traversy', '333-333-3333', 'brad@test.com', '333 South st', 'Portland', 'ME');

-- --------------------------------------------------------

--
-- Table structure for table `deal`
--

CREATE TABLE `deal` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deal`
--

INSERT INTO `deal` (`id`, `product_id`, `start_date`, `end_date`, `discount`) VALUES
(1, 1, '2017-11-01', '2017-11-11', 30),
(2, 2, '2017-11-02', '2017-11-13', 10),
(3, 3, '2017-11-03', '2017-11-14', 45),
(4, 4, '2017-11-08', '2017-11-15', 50),
(5, 5, '2017-11-18', '2017-11-27', 35),
(6, 8, '2017-11-09', '2017-11-30', 35),
(7, 11, '2017-11-10', '2017-11-22', 15),
(8, 13, '2017-11-11', '2017-11-30', 90),
(9, 10, '2017-11-12', '2017-11-30', 37),
(10, 6, '2017-11-13', '2017-11-20', 45);

-- --------------------------------------------------------

--
-- Table structure for table `mcm_budget`
--

CREATE TABLE `mcm_budget` (
  `date_budget` date NOT NULL,
  `amount` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `sharedData` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mcm_budget`
--

INSERT INTO `mcm_budget` (`date_budget`, `amount`, `username`, `sharedData`) VALUES
('2017-12-01', 'a23', '23', '2323'),
('2017-12-18', '500000', 'yo', 'F8Y8G0'),
('2017-12-19', '5000000', 'yo', 'F8Y8G0'),
('2018-02-07', '560000', 'yo', 'F8Y8G0'),
('2018-10-24', '222', 'yo', 'F8Y8G0');

-- --------------------------------------------------------

--
-- Table structure for table `mcm_expense`
--

CREATE TABLE `mcm_expense` (
  `id_expense` int(8) NOT NULL,
  `expense_name` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `amount` bigint(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `store_name` varchar(200) NOT NULL,
  `store_id` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mcm_expense`
--

INSERT INTO `mcm_expense` (`id_expense`, `expense_name`, `date`, `time`, `amount`, `username`, `store_name`, `store_id`) VALUES
(1, 'beli baso', '2017-10-10', '10:09:21', 10000, 'yo', '', 0),
(2, 'test', '0000-00-00', '11:00:37', 252525, 'yo', '', 0),
(3, 'test2', '2017-10-10', '11:01:14', 252525, 'yo', '', 0),
(4, 'hshs', '2017-12-02', '11:31:36', 6465, 'yo', '', 0),
(5, 'uuu', '2017-12-09', '10:31:28', 223, 'yo', '', 0),
(6, 'ffg', '2017-12-07', '10:31:58', 85, 'yo', '', 0),
(7, 'uu', '2017-12-10', '10:34:41', 332, 'yo', '', 0),
(8, 'vdhd', '2017-12-06', '03:17:05', 9565, 'yo', '', 0),
(9, 'juu user lain', '2017-12-06', '03:22:45', 33, 'op', '', 0),
(10, 'ter', '2018-10-24', '14:17:08', 5000, 'yo', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mcm_user`
--

CREATE TABLE `mcm_user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `shareData` varchar(50) NOT NULL,
  `masterType` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mcm_user`
--

INSERT INTO `mcm_user` (`id`, `username`, `email`, `password`, `shareData`, `masterType`) VALUES
(27, 'kk', 'kk@kk.com', 'dc468c70fb574ebd07287b38d0d0676d', '', 0),
(26, 'adimas', 'defcon211@gmail.com', 'c8837b23ff8aaa8a2dde915473ce0991', 'Q2B9T4', 1),
(25, 'aak', 'aak', '0618e57c909670e9b0b48abe1702dc48', 'F8Y8G0', 0),
(24, 'hh', 'hh', '5e36941b3d856737e81516acd45edc50', 'F0X2P8', 1),
(23, 'p', 'p', '83878c91171338902e0fe0fb97a8c47a', 'F8Y8G0', 0),
(22, 'yo', 'yo', '6d0007e52f7afb7d5a0650b0ffb8a4d1', 'F8Y8G0', 0),
(21, 'op', 'op', '11d8c28a64490a987612f2332502467f', 'F8Y8G0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `store_id`, `name`, `price`, `description`, `photo`) VALUES
(1, 1, 'Meja Belajar', 2000000, 'Meja Belajar Anak dan Orang Tua', 'http://www.hargaspringbed.com/klasifikasi%20gambar/meja%20belajar%20dan%20meja%20komputer/2016/mbs-315.jpg'),
(2, 1, 'Lemari Pakaian', 3000000, 'jbajhsbvhvbajkhvbajhvbfjavbjavbjhvbahjvbaj', 'http://www.teakpalace.com/wp-content/uploads/2011/11/Padi-Lemari-Pakaian-Ukir-Jati-4-Pintu.jpg'),
(3, 1, 'Baju Kemeja', 250000, 'Baju Kemeja casual dan resmi', 'http://plazakain.com/images/Article/News-201603/10009/Cara-Merawat-Baju-Kemeja-Flanel-small.jpg'),
(4, 1, 'Celana Jeans', 300000, 'hjabvjhabvahjbvahbvk', 'https://www.topkeren.com/wp-content/uploads/2015/08/Celana-Jeans-Pria-Levis-Standar-Panjang-Model-Terbaru-Murah.jpg'),
(5, 1, 'Kaos Jersey Bola', 450000, 'jbvafhvbvbfvba', 'https://jualjerseykeren.files.wordpress.com/2017/02/jersey-persiba-balikpapn-buat-jersey-bola.jpg?w=620'),
(6, 1, 'Seragam Sekolah', 50000, 'hjsavbjahvbajhbj', 'http://1.bp.blogspot.com/-NCECNoGvpz4/Un9x08I5r4I/AAAAAAAAARY/0fqB0tsf8_4/s1600/seragam+sekolah.jpg'),
(7, 3, 'Komputer', 5000000, 'jhdbfvjhvbjh', 'http://komputerlamongan.com/wp-content/uploads/2014/11/Komputer-Lengkap.jpg'),
(8, 3, 'Hardisk', 500000, 'jbvsjhvbsjhvbjsh', 'http://www.perangkatkeras.net/wp-content/uploads/2015/08/bad-sector-hardisk.jpg'),
(9, 3, 'cpu', 3500000, 'hsvfbkhvbvfbkebk', 'https://rukminim1.flixcart.com/image/704/704/cpu/3/c/r/zebronics-cpu-intel-core-i3-4th-gen-4gb-1tb-original-imaegzbmvppg6h9s.jpeg?q=70'),
(10, 3, 'roll kabel', 200000, 'jhdbahkvbskhvbk', 'https://ecs7.tokopedia.net/img/product-1/2015/3/23/298420/298420_9489a0a2-d137-11e4-9a4b-184f87772fba.jpg'),
(11, 3, 'Tv Led', 5500000, 'jhsvsjvsjvsjskfbvksvbks', 'http://www.finesttechnology.com/wp-content/uploads/2015/07/LED-TV.jpg'),
(12, 3, 'Headset', 550000, 'shvbksvbwkvbks', 'https://images-na.ssl-images-amazon.com/images/I/61s9D4c-UGL._SY355_.jpg'),
(13, 2, 'Buku Agama', 250000, 'ksvbksvbskjvbk', 'http://garisbuku.com/wp-content/uploads/2013/09/bukuagama-870x400.jpg'),
(14, 2, 'Buku Pemrogaraman', 400000, 'kadbvskvbskb', 'https://galihpratama.net/wp-content/uploads/2016/05/Modul-Android-Studio-1.png'),
(15, 2, 'Buku Bahasa Indonesia', 150000, 'skjvbskvbshvbskh', 'http://assets.annibuku.com/tn/20121705100053.jpg'),
(16, 2, 'Buku Matematika', 175000, 'ggjvhgcjvjvj', 'https://4.bp.blogspot.com/-ZYFymVy1YOA/V4cZ5PK4dLI/AAAAAAAAHZg/3-fF7CUjbsMiqMe0Fj3jp13u_1vxDO_TgCLcB/s1600/kumpulan-buku-matematika.jpg'),
(17, 2, 'Buku Bisnis', 345000, 'hbskvjfbskjvbfkj', 'https://store.yukbisnis.com/photo/paket-yuk-bisnis-l1.jpg'),
(18, 2, 'Buku Olahraga', 175000, 'hksvfbksvbfskj', 'http://3.bp.blogspot.com/-8aUdOLnayuI/UYYeo8irNUI/AAAAAAAAApY/pqtFni3t4Vc/s1600/Buku+Pendidikan+Jasmani,+Olahraga,+dan+Kesehatan+Kelas+XI+SMA,+MA+dan+SMK+BSE.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `photo` text NOT NULL,
  `telp` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `open_hour` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `name`, `lat`, `lng`, `photo`, `telp`, `description`, `open_hour`, `address`, `created_at`) VALUES
(1, 'Pondok indah', -6.2677552, 106.7857386, 'https://www.klikhotel.com/klik/database/informasiSekitarLokasi/1573-469.jpg', '0856322', 'toko pondok indah', '', 'jalan jakarta', '0000-00-00'),
(2, 'Nolita comfort food', -6.270482, 106.7856812, 'https://4.bp.blogspot.com/-x6_fJpRKnbM/Vw_gy5cR5cI/AAAAAAAAUDE/VdgwDmJLyecm2PyUmScZcugWZ7YT4WJDwCLcB/s1600/IMG_6609.JPG', '021646473', 'Cafe shop', '', 'Jalan pondok indah', '0000-00-00'),
(3, 'Suzanna Baby shop', -6.2856849, 106.7821335, 'http://zonamama.com/wp-content/uploads/2015/12/Suzanna-Baby-Shop-Surabaya.jpg', '08535263', 'toko baby shop', '', 'jalan jakarta', '0000-00-00'),
(4, 'Bogor Rain cake', -6.5942878, 106.8187593, 'http://cdn2.tstatic.net/bogor/foto/bank/images/bogor-raincake_20170422_160536.jpg', '0217565563', 'Rain cake', '', 'Jalan Padjadjaran No.31, Babakan, Bogor Tengah, ', '0000-00-00'),
(5, 'Pia Apple Pie', -6.5920497, 106.8043833, 'https://pbs.twimg.com/profile_images/478014069190819840/vCHBpk7N.jpeg', '024358856', 'Toko Kue', '', 'Jalan bogor', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `email`, `password`) VALUES
(6, 'jerry@c.com', '123'),
(7, 't@t.com', 'ttt'),
(8, 'apermadi', '1'),
(9, 'aa', 'aa'),
(15, 'kk', 'kk'),
(16, 'll', 'll');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_user`
--
ALTER TABLE `api_user`
  ADD PRIMARY KEY (`id_apiUser`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `mcm_budget`
--
ALTER TABLE `mcm_budget`
  ADD PRIMARY KEY (`date_budget`,`username`,`sharedData`);

--
-- Indexes for table `mcm_expense`
--
ALTER TABLE `mcm_expense`
  ADD PRIMARY KEY (`id_expense`);

--
-- Indexes for table `mcm_user`
--
ALTER TABLE `mcm_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_user`
--
ALTER TABLE `api_user`
  MODIFY `id_apiUser` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `deal`
--
ALTER TABLE `deal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mcm_expense`
--
ALTER TABLE `mcm_expense`
  MODIFY `id_expense` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mcm_user`
--
ALTER TABLE `mcm_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
