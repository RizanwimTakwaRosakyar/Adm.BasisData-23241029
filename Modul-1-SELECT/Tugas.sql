-- Membuat database baru
CREATE DATABASE IF NOT EXISTS TOKO_BANGUNAN;

USE TOKO_BANGUNAN;

-- Membuat tabel pelanggan
CREATE TABLE IF NOT EXISTS pelanggan (
    no_telpon INT PRIMARY KEY,
    alamat VARCHAR(255),
    tanggal_pembelian INT
);

-- Membuat tabel nama_pelanggan
CREATE TABLE IF NOT EXISTS nama_pelanggan (
    nama VARCHAR(255) PRIMARY KEY,
    no_telpon INT,
    FOREIGN KEY (no_telpon) REFERENCES pelanggan(no_telpon)
);

-- Membuat tabel barang
CREATE TABLE IF NOT EXISTS barang (
    nama VARCHAR(255) PRIMARY KEY,
    harga INT,
    ukuran INT,
    Tanggal_pembelian DATETIME
);

-- Membuat tabel nama_barang
CREATE TABLE IF NOT EXISTS nama_barang (
    nama VARCHAR(255) PRIMARY KEY,
    FOREIGN KEY (nama) REFERENCES barang(nama)
);

-- Membuat tabel kategori_barang
CREATE TABLE IF NOT EXISTS kategori_barang (
    kategori VARCHAR(255),
    nama_barang VARCHAR(255),
    PRIMARY KEY (kategori, nama_barang),
    FOREIGN KEY (nama_barang) REFERENCES nama_barang(nama)
);

-- Membuat tabel karyawan
CREATE TABLE IF NOT EXISTS karyawan (
    nama_karyawan VARCHAR(255) PRIMARY KEY,
    no_telpon INT UNIQUE,
    alamat VARCHAR(255)
);

-- Membuat tabel karyawann (seperti di diagram)
CREATE TABLE IF NOT EXISTS karyawann (
    nama_brgn VARCHAR(255) PRIMARY KEY,
    no_telpon_kryn INT,
    alamat VARCHAR(255)
);

-- Membuat tabel suplier
CREATE TABLE IF NOT EXISTS suplier (
    no_kontak INT PRIMARY KEY,
    alamat VARCHAR(255),
    nama VARCHAR(255),
    jenis_barang VARCHAR(255),
    kualitas VARCHAR(255),
    ketersediaan_harga INT
);

-- Membuat tabel nama_suplier
CREATE TABLE IF NOT EXISTS nama_suplier (
    nama VARCHAR(255) PRIMARY KEY,
    no_kontak INT,
    FOREIGN KEY (no_kontak) REFERENCES suplier(no_kontak)
);

-- Membuat tabel beli
CREATE TABLE IF NOT EXISTS beli (
    no_telpon INT,
    nama_barang VARCHAR(255),
    qty INT,
    total_bayar INT,
    tanggal_pembelian INT,
    PRIMARY KEY (no_telpon, nama_barang),
    FOREIGN KEY (no_telpon) REFERENCES pelanggan(no_telpon),
    FOREIGN KEY (nama_barang) REFERENCES nama_barang(nama)
);

-- Membuat tabel memiliki
CREATE TABLE IF NOT EXISTS memiliki (
    nama_barang VARCHAR(255),
    no_kontak INT,
    tanggal_pembelian INT,
    total_bayar FLOAT,
    qty INT,
    PRIMARY KEY (nama_barang, no_kontak),
    FOREIGN KEY (nama_barang) REFERENCES nama_barang(nama),
    FOREIGN KEY (no_kontak) REFERENCES suplier(no_kontak),
    FOREIGN KEY (nama_barang) REFERENCES karyawann(nama_brgn)
);

-- Memasukkan data contoh untuk toko bangunan
-- Data pelanggan
INSERT IGNORE INTO pelanggan (no_telpon, alamat, tanggal_pembelian) VALUES
(628123456789, 'Jl. Merdeka No. 12, Jakarta', 20250415),
(628234567890, 'Jl. Sudirman No. 45, Bandung', 20250416),
(628345678901, 'Jl. Veteran No. 23, Surabaya', 20250417),
(628456789012, 'Jl. Ahmad Yani No. 67, Semarang', 20250418),
(628567890123, 'Jl. Pahlawan No. 89, Yogyakarta', 20250419);

-- Data nama_pelanggan
INSERT IGNORE INTO nama_pelanggan (nama, no_telpon) VALUES
('Budi Santoso', 628123456789),
('Dewi Wulandari', 628234567890),
('Eko Prasetyo', 628345678901),
('Fitri Rahayu', 628456789012),
('Gunawan Wibowo', 628567890123);

-- Data barang bangunan
INSERT IGNORE INTO barang (nama, harga, ukuran, Tanggal_pembelian) VALUES
('Semen Tiga Roda', 60000, 50, '2025-04-10 08:00:00'),
('Bata Merah', 2500, 10, '2025-04-11 09:30:00'),
('Pasir Halus', 250000, 1000, '2025-04-12 10:15:00'),
('Cat Nippon Paint', 85000, 5, '2025-04-13 11:45:00'),
('Paku Beton', 15000, 1, '2025-04-14 13:20:00'),
('Keramik Platinum', 125000, 60, '2025-04-15 14:10:00'),
('Kayu Jati', 350000, 200, '2025-04-16 15:30:00'),
('Atap Genteng', 7500, 1, '2025-04-17 16:45:00'),
('Pipa PVC', 35000, 4, '2025-04-18 09:20:00'),
('Kabel Listrik', 450000, 100, '2025-04-19 10:40:00');

-- Data nama_barang
INSERT IGNORE INTO nama_barang (nama) VALUES
('Semen Tiga Roda'),
('Bata Merah'),
('Pasir Halus'),
('Cat Nippon Paint'),
('Paku Beton'),
('Keramik Platinum'),
('Kayu Jati'),
('Atap Genteng'),
('Pipa PVC'),
('Kabel Listrik');

-- Data kategori_barang
INSERT IGNORE INTO kategori_barang (kategori, nama_barang) VALUES
('Material Dasar', 'Semen Tiga Roda'),
('Material Dasar', 'Bata Merah'),
('Material Dasar', 'Pasir Halus'),
('Finishing', 'Cat Nippon Paint'),
('Hardware', 'Paku Beton'),
('Finishing', 'Keramik Platinum'),
('Material Dasar', 'Kayu Jati'),
('Atap', 'Atap Genteng'),
('Sanitasi', 'Pipa PVC'),
('Listrik', 'Kabel Listrik');

-- Data karyawan
INSERT IGNORE INTO karyawan (nama_karyawan, no_telpon, alamat) VALUES
('Joko Susanto', 628111222333, 'Jl. Mangga No. 5, Jakarta'),
('Ani Mulyani', 628222333444, 'Jl. Apel No. 7, Bandung'),
('Bima Arya', 628333444555, 'Jl. Jeruk No. 9, Surabaya'),
('Citra Dewi', 628444555666, 'Jl. Pisang No. 11, Semarang'),
('Dodi Pratama', 628555666777, 'Jl. Nanas No. 13, Yogyakarta');

-- Data karyawann
INSERT IGNORE INTO karyawann (nama_brgn, no_telpon_kryn, alamat) VALUES
('Semen Tiga Roda', 628111222333, 'Gudang A'),
('Bata Merah', 628222333444, 'Gudang B'),
('Pasir Halus', 628333444555, 'Gudang C'),
('Cat Nippon Paint', 628444555666, 'Gudang D'),
('Paku Beton', 628555666777, 'Gudang E');

-- Data suplier
INSERT IGNORE INTO suplier (no_kontak, alamat, nama, jenis_barang, kualitas, ketersediaan_harga) VALUES
(628111111111, 'Jl. Industri No. 101, Jakarta', 'PT Semen Sejahtera', 'Material Dasar', 'Premium', 1),
(628222222222, 'Jl. Manufaktur No. 202, Bandung', 'CV Bata Jaya', 'Material Dasar', 'Standar', 1),
(628333333333, 'Jl. Produksi No. 303, Surabaya', 'PT Cat Warna Abadi', 'Finishing', 'Premium', 1),
(628444444444, 'Jl. Distribusi No. 404, Semarang', 'CV Hardware Lengkap', 'Hardware', 'Standar', 1),
(628555555555, 'Jl. Logistik No. 505, Yogyakarta', 'PT Kayu Nusantara', 'Material Dasar', 'Premium', 1);

-- Data nama_suplier
INSERT IGNORE INTO nama_suplier (nama, no_kontak) VALUES
('PT Semen Sejahtera', 628111111111),
('CV Bata Jaya', 628222222222),
('PT Cat Warna Abadi', 628333333333),
('CV Hardware Lengkap', 628444444444),
('PT Kayu Nusantara', 628555555555);

-- Data beli
INSERT IGNORE INTO beli (no_telpon, nama_barang, qty, total_bayar, tanggal_pembelian) VALUES
(628123456789, 'Semen Tiga Roda', 10, 600000, 20250415),
(628234567890, 'Bata Merah', 500, 1250000, 20250416),
(628345678901, 'Pasir Halus', 3, 750000, 20250417),
(628456789012, 'Cat Nippon Paint', 5, 425000, 20250418),
(628567890123, 'Paku Beton', 20, 300000, 20250419);

-- Data memiliki
INSERT IGNORE INTO memiliki (nama_barang, no_kontak, tanggal_pembelian, total_bayar, qty) VALUES
('Semen Tiga Roda', 628111111111, 20250410, 5500000.00, 100),
('Bata Merah', 628222222222, 20250411, 1100000.00, 500),
('Cat Nippon Paint', 628333333333, 20250413, 4000000.00, 50),
('Paku Beton', 628444444444, 20250414, 700000.00, 50),
('Kayu Jati', 628555555555, 20250416, 3000000.00, 10);

-- Menampilkan semua data
SELECT * FROM pelanggan;
SELECT * FROM nama_pelanggan;
SELECT * FROM barang;
SELECT * FROM nama_barang;
SELECT * FROM kategori_barang;
SELECT * FROM karyawan;
SELECT * FROM karyawann;
SELECT * FROM suplier;
SELECT * FROM nama_suplier;
SELECT * FROM beli;
SELECT * FROM memiliki;

-- Contoh query untuk laporan
-- 1. Menampilkan total penjualan per kategori
SELECT kb.kategori, SUM(b.total_bayar) as total_penjualan
FROM beli b
JOIN nama_barang nb ON b.nama_barang = nb.nama
JOIN kategori_barang kb ON nb.nama = kb.nama_barang
GROUP BY kb.kategori;

-- 2. Menampilkan barang paling laris
SELECT nb.nama, SUM(b.qty) as total_terjual
FROM beli b
JOIN nama_barang nb ON b.nama_barang = nb.nama
GROUP BY nb.nama
ORDER BY total_terjual DESC
LIMIT 5;

-- 3. Menampilkan suplier dengan total pasokan terbanyak
SELECT ns.nama as nama_suplier, SUM(m.qty) as total_pasokan
FROM memiliki m
JOIN nama_suplier ns ON m.no_kontak = ns.no_kontak
GROUP BY ns.nama
ORDER BY total_pasokan DESC;

-- 4. Menampilkan transaksi pelanggan dengan detail
SELECT np.nama as nama_pelanggan, b.nama_barang, b.qty, b.total_bayar, b.tanggal_pembelian
FROM beli b
JOIN nama_pelanggan np ON b.no_telpon = np.no_telpon
ORDER BY b.tanggal_pembelian DESC;

-- SELECT Statement untuk mengambil 1 kolom menggunakan alias dan prefix
SELECT p.no_telpon as nomor_kontak FROM pelanggan as p;
SELECT np.nama as nama_customer FROM nama_pelanggan as np;
SELECT b.nama as nama_produk FROM barang as b;
SELECT nb.nama as jenis_barang FROM nama_barang as nb;
SELECT kb.kategori as jenis_kategori FROM kategori_barang as kb;
SELECT k.nama_karyawan as nama_pegawai FROM karyawan as k;
SELECT kn.nama_brgn as produk_tanggungjawab FROM karyawann as kn;
SELECT s.nama as nama_vendor FROM suplier as s;
SELECT ns.nama as pemasok_barang FROM nama_suplier as ns;
SELECT bl.qty as jumlah_pembelian FROM beli as bl;
SELECT m.total_bayar as nilai_transaksi FROM memiliki as m;

-- SELECT Statement untuk mengambil 1 kolom menggunakan alias dan prefix
SELECT p.no_telpon as nomor_kontak FROM pelanggan as p;
SELECT np.nama as nama_customer FROM nama_pelanggan as np;
SELECT b.nama as nama_produk FROM barang as b;
SELECT nb.nama as jenis_barang FROM nama_barang as nb;
SELECT kb.kategori as jenis_kategori FROM kategori_barang as kb;
SELECT k.nama_karyawan as nama_pegawai FROM karyawan as k;
SELECT kn.nama_brgn as produk_tanggungjawab FROM karyawann as kn;
SELECT s.nama as nama_vendor FROM suplier as s;
SELECT ns.nama as pemasok_barang FROM nama_suplier as ns;
SELECT bl.qty as jumlah_pembelian FROM beli as bl;
SELECT m.total_bayar as nilai_transaksi FROM memiliki as m;