1. 02 Câu lệnh SELECT có WHERE, GROUP BY, HAVING và ORDER BY
Câu 1: Thống kê các chi nhánh có hơn 1 cuốn sách đang 'Sẵn Có', sắp xếp giảm dần theo số lượng.

SQL
SELECT Ma_CN, COUNT(Ma_Vach) AS So_Luong_Sach
FROM Sach_Copies
WHERE Trang_Thai = N'Sẵn Có'
GROUP BY Ma_CN
HAVING COUNT(Ma_Vach) > 1
ORDER BY So_Luong_Sach DESC;
Câu 2: Liệt kê các chức vụ nhân viên có tổng lương trên 15 triệu (chỉ tính những người lương > 5tr), sắp xếp theo lương tăng dần.

SQL
SELECT Chuc_Vu, SUM(Luong) AS Tong_Luong_Chuc_Vu
FROM Nhan_Vien
WHERE Luong > 5000000
GROUP BY Chuc_Vu
HAVING SUM(Luong) > 15000000
ORDER BY Tong_Luong_Chuc_Vu ASC;
2. 02 Câu lệnh SELECT có WHERE, GROUP BY, HAVING và TRUY VẤN CON (Subquery)
Câu 3: Tìm các thể loại sách có số lượng bản sao nhiều hơn số lượng bản sao trung bình của tất cả các đầu sách.

SQL
SELECT S.The_Loai, COUNT(SC.Ma_Vach) AS So_Bản_Sao
FROM Sach S JOIN Sach_Copies SC ON S.Ma_ISBN = SC.Ma_ISBN
GROUP BY S.The_Loai
HAVING COUNT(SC.Ma_Vach) > (SELECT COUNT(Ma_Vach)/COUNT(DISTINCT Ma_ISBN) FROM Sach_Copies);
Câu 4: Liệt kê các khách hàng đã mượn sách nhiều hơn 1 lần và địa chỉ không nằm trong danh sách địa chỉ của nhân viên.

SQL
SELECT Ma_KH, COUNT(Ma_PM) AS So_Lan_Muon
FROM Phieu_Muon
WHERE Ma_KH NOT IN (SELECT DISTINCT Dia_Chi FROM Nhan_Vien)
GROUP BY Ma_KH
HAVING COUNT(Ma_PM) >= 1;
3. 02 Câu lệnh INSERT có điều kiện

Câu 5: Thêm một khách hàng mới nếu mã khách hàng 'dg008' chưa tồn tại trong hệ thống.

SQL
INSERT INTO Khach_Hang (Ma_KH, Ten_KH, Dia_Chi, Ngay_Dang_Ki)
SELECT 'dg008', N'Lê Văn Tám', N'Hải Phòng', GETDATE()
WHERE NOT EXISTS (SELECT 1 FROM Khach_Hang WHERE Ma_KH = 'dg008');
Câu 6: Thêm một đầu sách mới nếu mã ISBN '009' chưa có trong danh mục sách.

SQL
INSERT INTO Sach (Ma_ISBN, Ten_Sach, The_Loai, Gia_Thue, Tinh_Trang)
SELECT '009', N'Lập trình Java', N'Giáo Trình', 12000, 'YES'
WHERE NOT EXISTS (SELECT 1 FROM Sach WHERE Ma_ISBN = '009');
4. 02 Câu lệnh UPDATE có điều kiện
Câu 7: Tăng lương thêm 10% cho tất cả nhân viên thuộc chi nhánh 'CN_HN' và có chức vụ là 'Thủ thư'.

SQL
UPDATE Nhan_Vien
SET Luong = Luong * 1.1
WHERE Chuc_Vu = N'Thủ thư' AND Ma_CN = 'CN_HN';
Câu 8: Cập nhật trạng thái 'Bảo Trì' cho những bản sao sách có tình trạng là 'Rách Bìa'.

SQL
UPDATE Sach_Copies
SET Trang_Thai = N'Bảo Trì'
WHERE Tinh_Trang = N'Rách Bìa';
5. 02 Câu lệnh DELETE có điều kiện

Câu 9: Xóa các phiếu phạt đã được 'Đã Nộp' và có số tiền phạt nhỏ hơn 10,000.

SQL
DELETE FROM Phieu_Phat
WHERE Thanh_Toan = N'Đã Nộp' AND Tien_Phat < 10000;
Câu 10: Xóa thông tin những khách hàng chưa từng thực hiện một giao dịch mượn sách nào (Dùng truy vấn con).

SQL
DELETE FROM Khach_Hang
WHERE Ma_KH NOT IN (SELECT DISTINCT Ma_KH FROM Phieu_Muon);