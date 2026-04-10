USE library;
INSERT INTO Khach_Hang (Ma_KH, Ten_KH, Dia_Chi, Ngay_Dang_Ki) VALUES
('dg001', 'Nguyen Van An', '123 Le Loi, Quan 1, TP.HCM', '2025-01-15'),
('dg002','Tran Thi Bich', '45 Cau Giay, Ha Noi', '2025-03-20'),
('dg003', 'Le Hoang Cuong', '88 Tran Phu, Thanh Hoa', '2025-06-10'),
('dg004', 'Le Duc Anh', '99 Nguyen Chi Thanh, Ha Noi', '2025-06-25'),
('dg005', 'Nguyen Tran Duy Anh', '136 Trung Liet, Ha Noi', '2025-08-02'),
('dg006', 'Hoang Quoc Khanh', '236 Le Van Sy, TP.HCM', '2025-09-23'),
('dg007', 'Nguyen Duc Duy', '45 Le Loi, Thanh Hoa', '2026-01-01');

SELECT * FROM Khach_Hang;

INSERT INTO Sach(Ma_ISBN, Ten_Sach, The_Loai, Gia_Thue, Tinh_Trang, Tac_Gia, NXB) VALUES
('001', 'Thuat toan Machine Learning', 'Giao Trinh CNTT', 10000, 'YES', 'Ethan Alpaydin', 'NXB Kim Dong'),
('002', 'Cau truc du lieu va giai thuat', 'Giao Trinh CNTT', 8000, 'YES', 'Do Xuan Loi', 'NXB Bach Khoa Ha Noi'),
('003', 'Harry Potter', 'Tieu Thuyet Ky Ao', 15000, 'YES', 'J.K.Rowling', 'NXB Tre'),
('004', 'Doraemon', 'Truyen Tranh', 2000, 'YES', 'F.Fujio', 'NXB Kim Dong'),
('005', 'Sherlock Holmes', 'Tieu Thuyet Trinh Tham', 5000,'NO', 'Arthur Conan Doyle', 'NXB Hoi Nha Van' ),
('006', 'Mat ma Da Vinci', 'Tieu Thuyet Trinh Tham', 7000, 'YES', 'Dan Brown', 'NXB Tong Hop'),
('007', 'Dac Nhan Tam', 'Ky Nang Song', 2000, 'NO', 'Dale Carnegie', 'NXB Tong Hop'),
('008', 'Giai Tich 1', 'Giao Trinh', 5000, 'YES', 'Vu Van Khuong', 'NXB GTVT');
SELECT * FROM Sach;

INSERT INTO Chi_Nhanh(Ma_CN, Ma_Quan_Ly, Dia_Chi, SDT) VALUES
('CN_HN', NULL, '20 Trang Tien, Hoan Kiem, Ha Noi', '02433334444'),
('CN_HCM', NULL, '10 Nguyen Hue, Quan 1, HCM', '02811112222'),
('CN_TH', NULL, '36 Le Loi, Thanh Hoa', '02836363636');

SELECT * FROM Chi_Nhanh;


INSERT INTO Nhan_Vien(Ma_NV, Ten_NV, Chuc_Vu, Luong, Ma_Quan_Ly) VALUES
('nv001', 'Pham Van Phu', 'Quan ly', 20000000, NULL),
('nv002', 'Pham Le Hoang', 'Quan ly', 20000000, NULL),
('nv003', 'Nguyen Thi Nhung', 'Quan ly', 20000000, NULL),
('nv004', 'Vu Thu Thu', 'Thu thu', 8000000, 'nv001'),
('nv005', 'Nguyen Nhu Quynh', 'Thu thu', 8500000, 'nv002'),
('nv006', 'Tran Van Dong', 'Thu thu', 8000000, 'nv003'),
('nv007', 'Tran Duy Manh', 'Bao ve', 5000000, 'nv001'),
('nv008', 'Le Duc Duy', 'Bao ve', 5300000, 'nv002'),
('nv009', 'Nguyen Van Hung', 'Bao ve', 5100000, 'nv003');

SELECT * FROM Nhan_Vien;

UPDATE Chi_Nhanh SET Ma_Quan_Ly = 'nv001' WHERE Ma_CN = 'CN_HN';
UPDATE Chi_Nhanh SET Ma_Quan_Ly = 'nv002' WHERE Ma_CN = 'CN_HCM';
UPDATE Chi_Nhanh SET Ma_Quan_Ly = 'nv003' WHERE Ma_CN = 'CN_TH'; 

INSERT INTO Sach_Copies(Ma_Vach, Ma_ISBN, Ma_CN, Tinh_Trang, Trang_Thai) VALUES
('1', '001', 'CN_HCM', 'Moi', 'San Co'),
('2', '001', 'CN_HCM', 'Rach Bia', 'San Co'),
('3', '001', 'CN_HN', 'Moi', 'Dang Muon'),
('4', '002', 'CN_TH', 'Moi', 'San co'),
('5', '002', 'CN_HN', 'Rach Bia', 'San Co'),
('6', '003', 'CN_HCM', 'Moi', 'Dang Muon');

SELECT * FROM Sach_Copies;

INSERT INTO Phieu_Muon(Ma_KH, Ma_Vach, Ngay_Muon) VALUES
('dg001', '3', '2025-01-17'),
('dg002', '6', '2025-03-25'),
('dg006', '5', '2025-10-30')
('dg003', '2', '2026-1-2');

SELECT * FROM Phieu_Muon;

INSERT INTO Phieu_Tra(Ma_KH, Ma_Vach, Ngay_Tra) VALUES
('dg006', '5', '2025-12-20');
SELECT * FROM Phieu_Tra;

INSERT INTO Phieu_Phat(Ma_PT, Tien_Phat, Ly_Do, Thanh_Toan) VALUES
(2, '50000', 'Lam rach bia', 'Da Nop');
SELECT * FROM Phieu_Phat;
