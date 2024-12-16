1. Cari nama belakang "Doe":
Select FullName FROM Employees e WHERE FullName LIKE '%Doe'

2. Cari JobTitle yang mengandung "Developer":
Select JobTitle FROM Employees e WHERE JobTitle  LIKE '%Developer%'

3. Cari email yang diakhiri "example.com":
Select Email FROM Employees e WHERE Email LIKE '%example.com'



4. Temukan semua produk yang memiliki kata pertama "Laptop" di ProductName.
SELECT ProductName FROM Products p WHERE ProductName LIKE 'Laptop%'

5. Cari produk dengan nama yang dimulai dengan huruf "S".
SELECT ProductName FROM Products p WHERE LEFT(ProductName,1) Like '%S%'

6. Temukan produk dengan harga di atas 1000 dan nama mengandung "Pro".
SELECT ProductName FROM Products p WHERE Price > 1000 AND ProductName LIKE '%Pro%'

7. Cari pelanggan yang nama depannya dimulai dengan huruf "A" menggunakan LEFT.
SELECT FullName FROM Customers c WHERE LEFT(FullName ,1) Like '%A%'

8. Cari pelanggan yang memiliki titik (.) dalam alamat email menggunakan CHARINDEX.
SELECT FullName FROM Customers c WHERE CHARINDEX('.',Email) > 0

9. Cari pelanggan yang nomor teleponnya berisi "1234" menggunakan PATINDEX.
SELECT FullName FROM Customers c WHERE PATINDEX('%1234%',PhoneNumber) > 0











