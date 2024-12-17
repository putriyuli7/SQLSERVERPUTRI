1.Dirty Read Buat transaksi yang menunjukkan data dibaca sebelum di-commit oleh transaksi lain.

BEGIN TRANSACTION
/*UPDATE TANPA COMMIT*/
UPDATE Orders   
SET Status = 'Processing'
WHERE OrderID = 9;

/*MEMBACA DATA TANPA COMMIT*/
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 
SELECT Status 
FROM Orders o 
WHERE OrderID = 9;

/*ROLLBACK PERUBAHAN*/
IF @@ERROR <> 0
ROLLBACK

2. Non-repeatable Read Tunjukkan perbedaan hasil baca karena transaksi lain melakukan perubahan. (Data tersebut akan berubah jika sudah dicommit)

/*MEMBACA DATA PERTAMA KALI*/
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
BEGIN TRANSACTION
SELECT Status 
FROM Orders o 
WHERE OrderID = 3;

/*MELAKUKAN PERUBAHAN*/
BEGIN TRANSACTION
UPDATE Orders   
SET Status = 'Shipped'
WHERE OrderID = 3;

COMMIT;

/*MEMBACA DATA KEDUA KALI , MENGEMBALIKAN DATA SESUAI DATA YANG DISELECT PERTAMA KALI, ROLLBACK HANYA BISA DILAKUKAN OLEH SUPERADMIN*/
SELECT Status 
FROM Orders o 
WHERE OrderID = 3
ROLLBACK;

3. Phantom Read Demonstrasikan transaksi yang membaca hasil berbeda karena ada penyisipan data oleh transaksi lain.

4. Serializable Tunjukkan isolasi penuh sehingga transaksi lain tidak dapat menyisipkan data pada rentang yang sedang diakses.

/*MEMBACA DATA DENGAN SERIAlizable*/

/*MENYISIPKAN DATA*/

5. Snapshot Tunjukkan bagaimana snapshot isolation memberikan konsistensi tanpa mengunci data.
/*Aktifkan snapshoot isolation*/
/*MEMBACA DATA*/
/*UPDATE DATA*/
/*MEMBACA DATA ULANG*/
