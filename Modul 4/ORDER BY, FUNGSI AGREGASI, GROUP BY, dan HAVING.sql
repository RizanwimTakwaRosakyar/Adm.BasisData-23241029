-- NAMA : RIZANWIM TAKWA ROSAKYAR
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









