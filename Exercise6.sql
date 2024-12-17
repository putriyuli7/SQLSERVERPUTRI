Soal 
1.Pencarian Kamar yang Tersedia Tampilkan semua kamar yang saat ini tersedia untuk dipesan.
SELECT 
    RoomID
    ,RoomNumber
    ,RoomType 
FROM Rooms WHERE Status = 'Available'

2.Laporan Pemesanan Per Pelanggan Tampilkan laporan daftar pemesanan untuk setiap pelanggan, termasuk nama pelanggan, jenis kamar, tanggal check-in, dan tanggal check-out.
SELECT 
    c.FullName
    ,r.RoomType 
    ,b.CheckInDate 
    ,b.CheckOutDate 
FROM Bookings b 
JOIN Customers c ON b.CustomerID = c.CustomerID 
JOIN Rooms r ON b.RoomID = r.RoomID 


3.Validasi Ketersediaan Kamar Sebelum Pemesanan Tulis query untuk memeriksa apakah kamar tertentu tersedia pada rentang tanggal tertentu.

DECLARE 
    @Room_ID INT = 1,
    @Checkin_Date DATE = '2024-12-20',
    @Checkout_Date DATE = '2024-12-25',
    @Status VARCHAR(50) = 'Active'

SELECT 
CASE WHEN EXISTS 
	(
        SELECT 1 FROM Bookings b 
        WHERE b.RoomID = @Room_ID 
        AND BookingStatus = @Status
        AND 
        (
            b.CheckInDate BETWEEN @Checkin_Date AND @Checkout_Date 
            OR b.CheckOutDate BETWEEN @Checkin_Date AND @Checkout_Date 
        )
    ) 
THEN 
	'Booking' 
ELSE 
	'Available'
END
