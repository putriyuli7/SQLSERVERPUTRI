1.Buatlah sebuah CTE untuk menghitung total penjualan bulanan dari tabel Sales dan mencari bulan dengan total penjualan tertinggi. Tampilkan kolom:
Bulan
Total Penjualan Bulanan
Indikasi apakah bulan tersebut memiliki penjualan tertinggi ("Ya" atau "Tidak").

WITH Based1 as(SELECT FORMAT(Saledate, 'yyyy-MM')BULAN, SUM(Amount) total_amount  FROM Sales GROUP BY FORMAT(Saledate, 'yyyy-MM'))
,Based2 as(SELECT MAX(total_amount) maxamount FROM Based1)
Select BULAN, total_amount, CASE WHEN total_amount = maxamount THEN 'Iya' ELSE 'Tidak' END Status FROM Based1, Based2

5. CTE: Buat query untuk menghitung total stok per kategori menggunakan CTE.

WITH TableCTE AS(
SELECT 
Kategori
,sum(Stok) totalstock
FROM TRAINING.DBO.Produk GROUP BY Kategori
)
SELECT 
* 
FROM TableCTE;