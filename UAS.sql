-- Nama			: Rizanwim Takwa Rosakyar
-- NIM 			: 23241029
-- Kelas		: A
-- Mata Kuliah  : Administrasi Basis Data

-- Soal
/*Munculkan kode pelanggan, nama produk, kuantitnya, harga dan total harga dari semua produk yang pernah ditransaksaikan namun, outputnya 
yang di minta adalah adalah total harga minimal 200.000 dan di urutkan berdasarkan total harganya*/

SELECT 
    nama_produk,
    qty AS kuantitas,
    harga,
    (qty * harga) AS total_harga
FROM 
    tr_penjualan_dqlab
WHERE 
    (qty * harga) >= 200000
ORDER BY 
    total_harga ASC;


-- soal 2
/*Tampilkan nama pelnggan dan nilai transaksinya dengan nilai transaksi terbanyak*/
SELECT 
    p.nama_pelanggan,
    SUM(t.qty * t.harga) AS total_transaksi
FROM 
    tr_penjualan t
JOIN 
    ms_pelanggan p ON t.kode_pelanggan = p.kode_pelanggan
GROUP BY 
    p.nama_pelanggan
ORDER BY 
    total_transaksi DESC


-- Soal 3
/*Tampilkan nama produk,kategori, dan harga semua produk yang tidak pernah terjual*/

SELECT nama_produk,kategori,harga FROM ms_produk 
LEFT JOIN tr_penjualan t ON nama_produk = nama_produk
WHERE nama_produk IS NULL;


