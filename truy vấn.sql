USE library;

--Lấy danh sách các đầu sách thuộc thể loại 'Giao Trinh CNTT' và đang còn xuất bản (Tinh_Trang = 'YES').
SELECT Ma_ISBN, Ten_Sach, Tac_Gia, Gia_Thue 
FROM Sach 
WHERE The_Loai = 'Giao Trinh CNTT' AND Tinh_Trang = 'YES';

--Xem thông tin các khoản phạt đã được thanh toán và có giá trị từ 50.000 trở lên.
SELECT Ma_PP, Ma_PT, Tien_Phat, Ly_Do 
FROM Phieu_Phat 
WHERE Thanh_Toan = 'Da Nop' AND Tien_Phat >= 50000;

--Tra cứu xem những bản sao sách nào (mã vạch, trạng thái) đang được lưu trữ tại chi nhánh Hà Nội (CN_HN).
SELECT s.Ma_ISBN, s.Ten_Sach, sc.Ma_Vach, sc.Trang_Thai 
FROM Sach s 
JOIN Sach_Copies sc ON s.Ma_ISBN = sc.Ma_ISBN 
WHERE sc.Ma_CN = 'CN_HN';

--Xem chi tiết thông tin những khách hàng đã thực hiện mượn sách trong năm 2025.
SELECT pm.Ma_PM, kh.Ma_KH, kh.Ten_KH, pm.Ma_Vach, pm.Ngay_Muon 
FROM Phieu_Muon pm
JOIN Khach_Hang kh ON pm.Ma_KH = kh.Ma_KH
WHERE YEAR(pm.Ngay_Muon) = 2025;

--Tìm hiểu chi tiết khoản phạt của khách hàng có mã 'dg003' (dựa trên phiếu trả của họ).
SELECT pt.Ma_KH, pp.Ma_PP, pp.Tien_Phat, pp.Ly_Do, pp.Thanh_Toan
FROM Phieu_Phat pp
JOIN Phieu_Tra pt ON pp.Ma_PT = pt.Ma_PT
WHERE pt.Ma_KH = 'dg003';

--Thống kê số lượng bản sao vật lý đang có sẵn trên kệ tại từng chi nhánh.
SELECT Ma_CN, COUNT(Ma_Vach) AS So_Luong_Sach_San_Co
FROM Sach_Copies
WHERE Trang_Thai IN ('San Co', 'San co')
GROUP BY Ma_CN;

--Đếm số lượng đầu sách do mỗi Nhà xuất bản (NXB) cung cấp, chỉ tính những sách có tình trạng 'YES'.
SELECT NXB, COUNT(Ma_ISBN) AS So_Luong_Dau_Sach
FROM Sach
WHERE Tinh_Trang = 'YES'
GROUP BY NXB;

--Tìm các chi nhánh đang sở hữu ít nhất 1 cuốn sách có tình trạng vật lý là 'Moi'.
SELECT Ma_CN, COUNT(Ma_Vach) AS So_Sach_Moi
FROM Sach_Copies
WHERE Tinh_Trang = 'Moi'
GROUP BY Ma_CN
HAVING COUNT(Ma_Vach) >= 1;

--Thống kê số lượng đầu sách theo từng thể loại có giá thuê lớn hơn 5.000, chỉ hiển thị những nhóm thể loại có từ 2 đầu sách trở lên.
SELECT The_Loai, COUNT(Ma_ISBN) AS So_Sach
FROM Sach
WHERE Gia_Thue > 5000
GROUP BY The_Loai
HAVING COUNT(Ma_ISBN) > 1;

--Tìm các Nhà xuất bản (NXB) cung cấp sách đang lưu hành (Tinh_Trang = 'YES') mà có mức giá thuê trung bình của các sách đó lớn hơn 5.000 VNĐ.
SELECT NXB, AVG(Gia_Thue) AS Gia_Thue_Trung_Binh
FROM Sach
WHERE Tinh_Trang = 'YES'
GROUP BY NXB
HAVING AVG(Gia_Thue) > 5000;