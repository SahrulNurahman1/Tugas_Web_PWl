-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jul 2025 pada 08.16
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dvd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_dvd`
--

CREATE TABLE `kategori_dvd` (
  `id_kategori` int(50) UNSIGNED NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_dvd`
--

INSERT INTO `kategori_dvd` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Drama'),
(2, 'Petualangan'),
(3, 'Aksi'),
(4, 'Horor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewaan`
--

CREATE TABLE `penyewaan` (
  `id` int(50) NOT NULL,
  `nama_penyewa` varchar(100) NOT NULL,
  `judul_dvd` varchar(100) NOT NULL,
  `tanggal_sewa` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `harga_sewa` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penyewaan`
--

INSERT INTO `penyewaan` (`id`, `nama_penyewa`, `judul_dvd`, `tanggal_sewa`, `tanggal_kembali`, `harga_sewa`) VALUES
(1, 'Nida', 'avatar', '2025-06-30', '2025-07-29', 110000),
(4, 'sahrul', 'Jurassic Park Series', '2025-07-16', '2025-06-28', 35000),
(6, 'molly', 'Call Me by Your Name', '2025-07-08', '2025-07-17', 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_dvd`
--

CREATE TABLE `produk_dvd` (
  `id` int(50) NOT NULL,
  `judul_dvd` varchar(100) NOT NULL COMMENT 'none_9',
  `genre` varchar(50) NOT NULL COMMENT 'none_9',
  `tahun` int(50) NOT NULL COMMENT 'none_9',
  `id_kategori` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk_dvd`
--

INSERT INTO `produk_dvd` (`id`, `judul_dvd`, `genre`, `tahun`, `id_kategori`) VALUES
(1, 'Call Me by Your Name', 'Drama', 2017, NULL),
(2, 'The Pursuit of Happyness', 'Drama', 2006, NULL),
(3, 'Avatar', 'Petualangan', 2009, NULL),
(4, 'Jurassic Park Series', 'Petualangan', 2015, NULL),
(5, 'Mission: Impossible – Fallout', 'Aksi', 2018, NULL),
(6, 'The Dark Knight ', 'Aksi', 2008, NULL),
(7, 'The Conjuring', 'Horor', 2013, NULL),
(8, 'Pengabdi Setan', 'Horor', 2017, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori_dvd`
--
ALTER TABLE `kategori_dvd`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk_dvd`
--
ALTER TABLE `produk_dvd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produk_kategori` (`id_kategori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori_dvd`
--
ALTER TABLE `kategori_dvd`
  MODIFY `id_kategori` int(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `penyewaan`
--
ALTER TABLE `penyewaan`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `produk_dvd`
--
ALTER TABLE `produk_dvd`
  ADD CONSTRAINT `fk_produk_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_dvd` (`id_kategori`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
