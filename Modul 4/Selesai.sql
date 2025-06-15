-- NAMA : Rizanwim Takwa Rosakyar
-- NIM : 23241029
-- Kelas : A
-- Modul : modul 4 : ORDER BY, FUNGSI AGREGASI, GROUP BY, dan HAVING

-- Menggunakan database
USE PTI_mart;

-- ORDER BY
-- Ambil koloom nama produk dan qty dari tabel penjualan urutkan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan_dqlab; -- tanpa order by
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty; -- dengan order by

-- ORDER BY 2 kolom 
-- AMbil kolom nama_produk dan qty dari penjualan urutkan qty, nama_produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty, nama_produk;

-- latihan mandiri
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- ORDER BY ASC dan DESC
-- kolom nama produk dan qty dari tabel penjualan urutkan qty terbesar
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC;

-- ambil kolom nama produk dan qty dari penjualan urutkan qty dan nama produk A-Z
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC, nama_produk DESC;

-- Tugas Mandiri
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty ASC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;

-- ORDER BY dari hasil pengolahan filed (kolom)
-- Ambil nama produk, qty, harga, total (qty*harga) dari penjualan urutkan berdasarkan total
SELECT nama_produk, qty, harga, qty*harga AS total FROM tr_penjualan_dqlab ORDER BY qty*harga DESC;

-- Latihan Mandiri
SELECT nama_produk, qty, harga, diskon_persen, (qty*harga) - (qty * harga * ( diskon_persen / 100 )) AS total_harga_setelah_diskon
FROM tr_penjualan_dqlab ORDER BY total_harga_setelah_diskon DESC;

-- ORDER BY dengan WHERE 
-- ambil nama produk, qty, dari penjualan filter berdasarkan nama produk berawalan F, urutkan qty desc
SELECT nama_produk, qty FROM tr_penjualan_dqlab WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- Latihan Mandiri
SELECT * FROM tr_penjualan_dqlab WHERE diskon_persen > 0 ORDER BY harga DESC;
SELECT nama_produk, qty AS Kuantitas_pembelian, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 ORDER BY harga DESC; 
SELECT nama_produk, qty AS kuantitas_pembelian, harga, diskon_persen 
FROM tr_penjualan_dqlab WHERE harga>= 100000 OR nama_produk LIKE 'T%' ORDER BY diskon_persen DESC;

-- Fungsi Agregasi
-- Hituung penjualan nilai qty dari seluruh baris (row) pada tb penjualan
SELECT sum(qty) FROM tr_penjualan_dqlab;
SELECT qty FROM tr_penjualan_dqlab;

-- Hitung jumlah seluruh transaksi yang telah terjadi pada tb penjualan
SELECT COUNT(*) FROM tr_penjualan_dqlab;
SELECT * FROM tr_penjualan_dqlab;

-- Hitung jumlah nilai qty dan jumlah transaksi pada tb penjualan
SELECT SUM(qty), COUNT(*) FROM tr_penjualan_dqlab;

-- Hitung jumlah nilai rata-rata dari qty dan nilai
SELECT AVG(qty), MIN(qty), MAX(qty)
FROM tr_penjualan_dqlab;

-- COUNT(DISTINCT)
-- Tanpa count (distinct)
SELECT  COUNT(nama_produk) FROM tr_penjualan_dqlab;
-- Pakai count(distinct) hanya nilai yang unik saja
SELECT COUNT (district nama_produk) FROM tr_penjualan_dqlab;
-- Hitung seluruh baris nama produk dan baris unik dari nama produk
SELECT COUNT (nama_produk),count(distinct nama_produk) FROM tr_penjualan_dqlab;
-- Menggambungkan kolom lain dengan fungsi agregasi
-- Tampilkan nama produk yang paling banyak dibeli dalam 1 kali transaksi
SELECT nama_produk,MAX(qty) FROM tr_penjualan_dqlab;
 
-- GROUP BY 
-- Pengelompokan isi data dari satu kolom atau lebih  dan biasanya digabung dengan fungsi agregasi
-- Ambil nilai dari pengelompokan nama produk pada tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab GROUP BY nama_produk;
 
-- Ambil nilai dari pengelompokan nama produk dan qty pada tabel penjualan
SELECT nama_produk,qty FROM tr_penjualan_dqlab GROUP BY nama_produk, qty;
 
-- Ambil nilai dari jumlah qty dari pengelompokan nama produk pada tabel penjualan urut berdasarkan qty besar kecil
SELECT nama_produk, SUM(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk ORDER BY SUM(qty)DESC;

-- HAVING
-- kata kunci untuk filtering pada hasil fungsi agregasi dengan GROUP BY 
-- Ambil nama produk yang hasil penjualan qty > 2
SELECT nama_produk, SUM(qty) AS produkTerjual
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty) > 2;

-- Latihan Mandiri
-- latihan 1
SELECT nama_produk, SUM(qty) AS produkTerjual
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty) >4;

-- latihan 2
SELECT nama_produk, SUM(qty) AS produkTerjual
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty) =9;

-- latihan 3
SELECT nama_produk, qty, harga, diskon_persen, (qty*harga) AS total_harga, SUM(qty*harga) - (qty * harga * ( diskon_persen / 100 )) AS Total_setelah_Diskon
FROM tr_penjualan_dqlab
GROUP BY nama_produk, qty
HAVING diskon_persen >0
ORDER BY SUM(qty)DESC;
