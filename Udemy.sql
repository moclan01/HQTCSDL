use Udemy;

-- Học viên: Mã học viên, tên học viên, địa chỉ học viên, sđt học viên
--table
--bính
CREATE TABLE HOCVIEN(
	MAHV VARCHAR(10) PRIMARY KEY NOT NULL,
	HO NVARCHAR(255) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	NGAYSINH DATE NOT NULL,
	GIOITINH VARCHAR(3) NOT NULL,
	SDT VARCHAR(11),
	DCHV NVARCHAR(255)
);
DROP TABLE HOCVIEN;

--toàn
-- Khoá học: Mã khoá học, tên khoá học, mô tả khoá học, giá gốc, giá khuyến mãi, ngày tạo, mã cấp độ, mã thể loại, mã giáo viên
CREATE TABLE KHOAHOC (
	MAKH VARCHAR(10) PRIMARY KEY NOT NULL,
	TENKH NVARCHAR(255) NOT NULL,
	MOTAKH TEXT NOT NULL,
	GIA_GOC FLOAT NOT NULL,
	GIA_KM FLOAT NOT NULL,
	NGAYTAO DATE NOT NULL,
	MACD VARCHAR(10) NOT NULL,
	MATL VARCHAR(10) NOT NULL,
	MAGV VARCHAR(10) NOT NULL
);
--linh
-- Cấp độ: mã cấp độ, tên cấp độ
CREATE TABLE CAPDO (
	MACD VARCHAR(10) PRIMARY KEY NOT NULL,
	TENCD NVARCHAR(255) NOT NULL
);
--tâm
-- Thể loại: Mã thể loại, tên thể loại
CREATE TABLE THELOAI (
	MATL VARCHAR(10) PRIMARY KEY NOT NULL,
	TENTL NVARCHAR(255) NOT NULL
);
--tâm
-- Giáo viên: Mã giáo viên, tên giáo viên, mô tả giáo viên, điện thoại giáo viên
CREATE TABLE GIAOVIEN (
	MAGV VARCHAR(10) PRIMARY KEY NOT NULL,
	TENGV NVARCHAR(255) NOT NULL,
	MOTAGV TEXT,
	DTGV VARCHAR(11)
);
--bính
-- Bài học: Mã bài học, tiêu đề bài học, nội dung bài học, video bài học, thứ tự bài học, mã khoá học
CREATE TABLE BAIHOC (
	MABH VARCHAR(10) PRIMARY KEY NOT NULL,
	TIEUDEBH NVARCHAR(255) NOT NULL,
	NOIDUNGBH TEXT NOT NULL,
	VIDEOBH VARCHAR(255),
	THUTUBH INT NOT NULL,
	MAKH VARCHAR(10) NOT NULL
);
--linh
-- Đăng ký học: Mã đăng ký học, ngày đăng ký, mã học viên, mã khoá học
CREATE TABLE DANGKYHOC (
	MADKH VARCHAR(10) PRIMARY KEY NOT NULL,
	NGAYDANGKY DATE NOT NULL,
	MAHV VARCHAR(10) NOT NULL,
	MAKH VARCHAR(10) NOT NULL
);
--ngân
-- Đánh giá: Mã đánh giá, điểm đánh giá, bình luận, ngày đánh giá, mã học viên, mã khoá học
CREATE TABLE DANHGIA (
	MADG VARCHAR(10) PRIMARY KEY NOT NULL,
	DIEMDG FLOAT,
	BINHLUAN TEXT,
	NGAYDG DATE NOT NULL,
	MAHV VARCHAR(10) NOT NULL,
	MAKH VARCHAR(10) NOT NULL
);
--ngân
-- Thanh toán: Mã thanh toán, số tiền thanh toán, ngày thanh toán, ...
-- ... trạng thái thanh toán (đã thanh toán đủ hay chưa), Mã học viên, mã khoá học
CREATE TABLE THANHTOAN (
	MATT VARCHAR(10) PRIMARY KEY NOT NULL,
	SoTienTT FLOAT NOT NULL,
	NGAYTT DATE NOT NULL,
	TRANGTHAI TINYINT NOT NULL,
	MAHV VARCHAR(10) NOT NULL,
	MAKH VARCHAR(10) NOT NULL
);

ALTER TABLE KHOAHOC ADD FOREIGN KEY (MACD) REFERENCES CAPDO (MACD);
ALTER TABLE KHOAHOC ADD FOREIGN KEY (MATL) REFERENCES THELOAI (MATL);
ALTER TABLE KHOAHOC ADD FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MAGV);

ALTER TABLE BAIHOC ADD FOREIGN KEY (MAKH) REFERENCES KHOAHOC (MAKH);

ALTER TABLE DANGKYHOC ADD FOREIGN KEY (MAHV) REFERENCES HOCVIEN (MAHV);
ALTER TABLE DANGKYHOC ADD FOREIGN KEY (MAKH) REFERENCES KHOAHOC (MAKH);

ALTER TABLE DANHGIA ADD FOREIGN KEY (MAHV) REFERENCES HOCVIEN (MAHV);
ALTER TABLE DANHGIA ADD FOREIGN KEY (MAKH) REFERENCES KHOAHOC (MAKH);

ALTER TABLE THANHTOAN ADD FOREIGN KEY (MAHV) REFERENCES HOCVIEN (MAHV);
ALTER TABLE THANHTOAN ADD FOREIGN KEY (MAKH) REFERENCES KHOAHOC (MAKH);

--database
SET DATEFORMAT dmy; 

--HỌC VIÊN
INSERT INTO HOCVIEN(MAHV, HO, TEN, NGAYSINH, GIOITINH , SDT, DCHV)
VALUES
('K1101', 'Nguyen Van', 'A', '27/1/1986', 'nam', '123456789', 'TpHCM'),
('K1102', 'Tran Ngoc', 'Han', '14/3/1986', 'nu', '123456789', 'Kien Giang'),
('K1103', 'Ha Duy', 'Lap', '18/4/1986', 'nam', '123456789', 'Nghe An'),
('K1104', 'Tran Ngoc', 'Linh', '30/3/1986', 'nu', '123456789', 'Tay Ninh'),
('K1105', 'Tran Minh', 'Long', '27/2/1986', 'nam', '123456789', 'TpHCM'),
('K1106', 'Le Nhat', 'Minh', '24/1/1986', 'nam', '123456789', 'TpHCM'),
('K1107', 'Nguyen Nhu', 'Nhut', '27/1/1986', 'nam', '123456789', 'Ha Noi'),
('K1108', 'Nguyen Manh', 'Tam', '27/2/1986', 'nam', '123456789', 'Kien Giang'),
('K1109', 'Phan Thi Thanh', 'Tam', '27/1/1986', 'nu', '123456789', 'Vinh Long'),
('K1110', 'Le Hoai', 'Thuong', '5/2/1986', 'nu', '123456789', 'Can Tho'),
('K1111', 'Le Ha', 'Vinh', '25/12/1986', 'nam', '123456789', 'Vinh Long');

INSERT INTO HOCVIEN(MAHV, HO, TEN, NGAYSINH, GIOITINH , SDT, DCHV)
VALUES
('K1201', 'Nguyen Van', 'B', '11/2/1986','nam', '123456789','TpHCM'),
('K1202', 'Nguyen Thi Kim', 'Duyen', '18/1/1986','nu', '123456789','TpHCM'),
('K1203', 'Tran Thi Kim', 'Duyen', '17/9/1986','nu', '123456789','TpHCM'),
('K1204', 'Truong Thi', 'Hanh', '19/5/1986','nu', '123456789','Dong Nai'),
('K1205', 'Nguyen Thanh', 'Nam', '17/4/1986','nam', '123456789','TpHCM'),
('K1206', 'Nguyen Thi Truc', 'Thanh', '4/3/1986','nu', '123456789','Kien Giang'),
('K1207', 'Tran Thi Bich', 'Thuy', '8/2/1986','nu', '123456789','Nghe An'),
('K1208', 'Huynh Thi Kim', 'Trieu', '8/4/1986','nu', '123456789','Tay Ninh'),
('K1209', 'Pham Thanh', 'Trieu', '23/2/1986','nam', '123456789','TpHCM'),
('K1210', 'Ngo Thanh', 'Tuan', '14/2/1986','nam', '123456789','TpHCM'),
('K1211', 'Do Thi', 'Xuan', '9/3/1986','nu', '123456789','Ha Noi'),
('K1212', 'Le Thi Phi', 'Yen', '12/3/1986','nu', '123456789','TpHCM');

INSERT INTO HOCVIEN(MAHV, HO, TEN, NGAYSINH, GIOITINH , SDT, DCHV)
VALUES
('K1301', 'Nguyen Thi Kim', 'Cuc', '09/06/1986', 'Nu', '123456789', 'Kien Giang'),
('K1302', 'Truong Thi My', 'Hien', '18/03/1986', 'Nu', '123456789', 'Nghe An'),
('K1303', 'Le Duc', 'Hien', '21/03/1986', 'Nam', '123456789', 'Tay Ninh'),
('K1304', 'Le Quang', 'Hien ', '18/04/1986', 'Nam ', '123456789', 'TP.HCM '),
('K1305', 'Le Thi', 'Huong', '27/03/1986 ', 'Nu', '123456789', 'TP.HCM'),
('K1306', 'Nguyen Thai', 'Huu ', '30/03/1986', 'Nam', '123456789', 'Ha Noi'),
('K1307', 'Tran Minh', 'Man ', '28/05/1986 ', 'Nam', '123456789', 'TP.HCM '),
('K1308', 'Nguyen Hieu', 'Nghia', '08/04/1986', 'Nam', '123456789', 'Kien Giang'),
('K1309', 'Nguyen Trung', 'Nghia', '18/01/1987', 'Nam', '123456789', 'Nghe An'),
('K1310', 'Tran Thi Hong','Tham', '22/04/1986','Nu', '123456789','Tay Ninh'),
('K1311', 'Tran Minh', 'Thuc', ' 04/04/1986', 'Nam', '123456789', 'TP.HCM'),
('K1312', 'Nguyen Thi Kim', 'Yen', '07/09/1986', 'Nu', '123456789', 'TP.HCM');

--KHÓA HỌC

--BÀI HỌC
INSERT INTO BAIHOC()