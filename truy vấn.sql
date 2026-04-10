USE library ;
 
SELECT * FROM Sach
WHERE Gia_Thue > 5000;
-- tìm sách có giá thuê dưới 5000

SELECT kh.Ten_KH , pm.Ngay_Muon
FROM Khach_Hang kh
INNER JOIN Phieu_Muon pm ON kh.Ma_KH = pm.Ma_KH
WHERE pm.Ngay_muon >="2025-01-01" AND pm.Ngay_Muon <"2026-01-01";
-- tìm những khách hàng mượn sách trong năm 2025

SELECT pt.Ngay_Tra,pp.Tien_Phat,pp.Ly_Do
FROM Phieu_tra pt
INNER JOIN Phieu_Phat pp ON pp.Ma_PT = pt.Ma_PT
WHERE pp.Thanh_Toan = 'đã nộp';
-- lấy thông tin ngày trả và số tiền phạt của những phiếu đã nộp 

SELECT Chuc_vu,count(Ma_NV) AS So_Luong_Nhan_Vien
FROM Khach_Hang kh
WHERE Luong > 5000000
GROUP BY Chuc_vu;
-- đếm số lượng nhân viên theo từng chức vụ ,chỉ xét những người có mức lương trên 5 triệu 

SELECT Ma_CN, count(Ma_Vach) AS So_Luong 
FROM Sach_Copies
WHERE Trang_Thai = 'YES'
GROUP BY Ma_CN
HAVING Ma_Vach >1;
-- chỉ ra các chi nhánh có nhiều hơn 1 bản sao có sẵn

SELECT The_loai, count(Ma_IBSN) AS So_Luong
FROM Sach
WHERE Gia_Thue > 2000
GROUP BY The_Loai
HAVING count(Ma_IBSN) >= 2
ORDER BY So_Luong DESC;
-- thống kê số lượng sách có giá bán trên 2000,chỉ lấy nhóm >=2,số lượng giảm dần

SELECT Ma_KH,count(Ma_Vach) AS So_Luong_Sach	
FROM Phieu_Muon
WHERE Ma_KH IN(SELECT Ma_KH FROM Khach_Hang WHERE Dia_Chi LIKE '%Thanh Hoa%')
GROUP BY Ma_KH
HAVING count(Ma_Vach) >= 1; 
-- đếm số khách đã mượn tại thanh hoá

INSERT INTO Gia_Sach_Cao(Ma_IBSN,Ten_Sach,The_Loai,Gia_Thue)
SELECT Ma_IBSN,Ten_Sach,The_Loai,Gia_Thue
FROM Sach
WHERE Gia_thue > 10000;
-- chèn những quyển sách có giá trị trên 10000 vào phần những quyển sách có gía trị cao

UPDATE Nhan_Vien
SET Luong =Luong * 1.8
WHERE Chuc_vu ='Bao ve';
-- tăng lương cho nhân viên có chức vụ là bảo vệ

DELETE FROM Sach 
WHERE Tinh_Trang = 'NO';
-- xoá những sách không còn được thuê





 