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
	TRANGTHAI VARCHAR(20) NOT NULL,
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
INSERT INTO KHOAHOC(MAKH, TENKH, MOTAKH, GIA_GOC, GIA_KM, NGAYTAO, MACD, MATL, MAGV)
VALUES
('AI', 'Học Adobe Illustrator từ cơ bản đến nâng cao', 'Illustrator là phần mềm thiết kế đồ họa chuyên vẽ. Sử dụng các thuật toán, các đối tượng hình học, text kết hợp. Việc kết hợp giữa các hình dạng cơ bản đó với nhau để tạo thành một đối tượng vector'
, 700000, 1200000,'26/04/2022', 'CD03', 'MATL07','GV03'),
('DP', 'Khóa học Digital Paiting cơ bản cho người mới bắt đầu', 'Digital Painting hay còn được gọi là vẽ kỹ thuật số. Đây là một kĩ thuật vẽ mà trong đó hoạ sĩ sẽ sử dụng công nghệ '
, 500000, 1000000, '26/04/2022', 'CD01', 'MATL05','GV02'),
('Figma', 'Nhập môn thiết kế UX/UI, UX-UI Design', 'UX/UI Designer là người đảm nhận vai trò thiết kế trải nghiệm người dùng (User Experience Design) và thiết kế giao diện người dùng (User Interface Design)'
, 600000, 1000000, '26/04/2022', 'CD01', 'MATL07','GV01'),
('Lightroom', 'Khóa học Lightroom - Blend màu và Retouch - Histogram là gì?', 'Lightroom là phần mềm xử lý ảnh cực kỳ mạnh mẽ và là người anh em với phần mềm Adobe Photoshop'
, 300000, 600000, '26/04/2022', 'CD01', 'MATL08','GV05'),
('NA', 'Nhiếp ảnh cơ bản cho người mới bắt đầu', 'Nhiếp ảnh là quá trình tạo ra hình ảnh bằng tác động của ánh sáng với phim hoặc thiết bị nhạy sáng'
, 800000, 1600000, '26/04/2022', 'CD02', 'MATL08','GV04'),
('PTS', 'Khóa học giúp bạn làm chủ Photoshop từ A - Z', 'Adobe Photoshop có thể được xem là phần mềm xử lý ảnh nổi tiếng nhất trên thị trường'
, 1200000, 2000000, '26/04/2022', 'CD03', 'MATL07','GV06'),
('AE', 'Học kỹ xảo trong sản xuất video bằng Adobe After Effects', 'Adobe After Effects là phần mềm đồ họa chuyển động số và đồ họa tổng hợp, được phát triển bởi hãng Adobe Systems.'
, 1000000, 1500000, '26/04/2022', 'CD03', 'MATL05','GV07');

-- CẤP ĐỘ
INSERT INTO CAPDO(MACD, TENCD)
VALUES
('CD01', 'Co ban'),
('CD02', 'Trung binh'),
('CD03', 'Nang cao'),
('CD04', 'Chuyen sau'),
('CD05', 'Co ban dac biet'),
('CD06', 'Nang cao dac biet'),
('CD07', 'Mo rong'),
('CD08', 'Trinh do cao');

-- THỂ LOẠI
INSERT INTO THELOAI(MATL, TENTL)
VALUES
('MATL01','Kĩ năng ngoại ngữ'),
('MATL02','Phát triển cá nhân'),
('MATL03','Sales, bán hàng'),
('MATL04','Phong cách sống'),
('MATL05','Thiết kế đồ họa'),
('MATL06','Tin học văn phòng'),
('MATL07','Công nghệ thông tin'),
('MATL08','Nhiếp ảnh, quay phim'),
('MATL09','Marketing'),
('MATL10','Kinh doanh khởi nghiệp'),
('MATL11','Sức khỏe - Giới tính'),
('MATL12','Gia đình');

-- GIÁO VIÊN
INSERT INTO GIAOVIEN(MAGV,TENGV,MOTAGV,DTGV) 
VALUES
('GV01','Huỳnh Ngọc Thanh','Chuyên viên digital marketing','09241378928'),
('GV02','Nguyễn Mai Phương','Chuyên viên thiết kế','09012675341'),
('GV03','Nguyễn Quang Duy','Chuyên viên thiết kế','09723982386'),
('GV04','Tô Phương Linh','Chuyên viên dựng phim','07925436712'),
('GV05','Nguyên Bính','Chuyên viên lập trình','09092534678'),
('GV06','Trần Thắng Lợi','Chuyên viên lập trình','09252534678'),
('GV07','Nguyễn Việt Toàn','Chuyên viên lập trình','09785534678'),
('GV08','Nguyễn Tấn Khoa','life skills','07342378928'),
('GV09','Nguyễn Phương Nhã','life skills','09563278928'),
('GV10','Phạm Lê Đạt','Chuyên viên kinh tế','09689278989');

--BÀI HỌC
--Adobe Illustrator
INSERT INTO BAIHOC(MABH, TIEUDEBH, NOIDUNGBH, VIDEOBH, THUTUBH, MAKH)
VALUES
('AI01', 'Bài 1: Làm quen với Adobe Illustrator 2020', 'Giới thiệu Adobe Illustrator 2020', 'https://youtu.be/aQMopS2idcc?si=pOAj3OObgPai347T', 1,'AI'),
('AI02', 'Bài 2: Tạo, Mở và Lưu File Trên Adobe Illustrator', 'Tạo, Mở và Lưu File trên AI','https://youtu.be/YvzRFvn76dA?si=RQ9h-fdISY_3qafw',2,'AI'),
('AI03', 'Bài 3: Cách sử dụng Artboards trong Adobe Illustrator', 'Sử dụng Artboards', 'https://youtu.be/SFh7OvTT8ZM?si=v20-uA4JIELBv4KZ',3,'AI');
--Digital Paiting
INSERT INTO BAIHOC(MABH, TIEUDEBH, NOIDUNGBH, VIDEOBH, THUTUBH, MAKH)
VALUES
('DP01', 'Bài 1: Làm quen với công cụ', 'Giới thiệu Digital Paiting', 'https://youtu.be/i-EPhpzq5zU?si=04xkB3EJenOTWtzj', 1, 'DP'),
('DP02', 'Bai 2: Cách vẽ đôi môi trong PTS', 'Vẽ đôi môi', 'https://youtu.be/sfGfKsRs-f0?si=w_LCAXu4k0DI1y6i', 2, 'DP'),
('DP03', 'Bài 03: Cách vẽ mũi nhân vật', 'Vẽ mũi', 'https://youtu.be/HAjNWQGNGcU?si=0GAvMSZKj9s2Lsnq',3,'DP');
--Figma
INSERT INTO BAIHOC(MABH, TIEUDEBH, NOIDUNGBH, VIDEOBH, THUTUBH, MAKH)
VALUES
('F01', 'Bài 1: Giới thiệu giao diện người dùng Website và Desktop Thiết Kế UX/UI App với FIGMA', 'Giới thiệu Figma', 'https://youtu.be/fAAHMwa8Q1o?si=4JgZBFBujSjTBrHX',1,'Figma'),
('F02', 'Bài 2: Làm việc với Move, Scale, Frame và Slice Tool', 'Sử dụng các công cụ', 'https://youtu.be/KtdKvSa9Uc8?si=vS1896Y7WIsFGVPo', 2,'Figma'),
('F03', 'Bài 3: Draw Vector Shapes và Pen Tool', 'Sử dụng các công cụ', 'https://youtu.be/f-hXMC13udc?si=dzCCOcgsWvhrl6DX',3,'Figma');
--Lightroom
INSERT INTO BAIHOC(MABH, TIEUDEBH, NOIDUNGBH, VIDEOBH, THUTUBH, MAKH)
VALUES
('L01', 'Bài 1: Giới thiệu Lightroom', 'Giới thiệu Lightroom', 'https://youtu.be/rQ_7QJrbC0A?si=BYLD2Cnf-y6z9giE', 1, 'Lightroom'),
('L02', 'Bài 2: Cách mở file bằng LightRoom', 'Mở file', 'https://youtu.be/b6Hj5a0wLYI?si=OxuChBCwEc9RvzJy',2,'Lightroom'),
('L03', 'Bài 3: Nguyên lý cốt lõi của LightRoom', 'Nguyên lý cốt lõi', 'https://youtu.be/Kc2ueDsZ6Js?si=OxKqroLDVpScdN9M', 3, 'Lightroom');
--Nhiếp ảnh 360
INSERT INTO BAIHOC(MABH, TIEUDEBH, NOIDUNGBH, VIDEOBH, THUTUBH, MAKH)
VALUES
('NA01', 'Bài 1: Tại sao chúng ta cần mua máy ảnh?', 'Lý do mua máy ảnh', 'https://youtu.be/z1zWvtRucn0?si=Vh92edRrCgbJp3-5', 1, 'NA'),
('NA02', 'Bài 2: Tìm hiểu về Khẩu Độ', 'Khẩu độ', 'https://youtu.be/PwrA7yFo7eQ?si=b4b0oe7TSjnJS1KV', 2, 'NA'),
('NA03', 'Bài 3: Tìm hiểu về Tốc độ chụp', 'Tốc độ chụp', 'https://youtu.be/Tdz_4PZtqkE?si=aBMbapM0VeHK9DdA', 3,'NA');
--Photoshop
INSERT INTO BAIHOC(MABH, TIEUDEBH, NOIDUNGBH, VIDEOBH, THUTUBH, MAKH)
VALUES
('PTS01', 'Bài 1: Làm quen với phần mềm Photoshop 2021', 'Giới thiệu Photoshop', 'https://youtu.be/UsAKKpEFaK4?si=RVB4PRyrRLajSzxN', 1, 'PTS'),
('PTS02', 'Bài 2: Công cụ tạo vùng chọn và bài tập ghép hình ', 'Công cụ', 'https://youtu.be/uO6XFEDgYcg?si=1zm61MlT5Em5Oxp3', 2, 'PTS'),
('PTS03', 'Bài 3: Ghép hình với PEN', 'Pen tool', 'https://youtu.be/6jyLNaCOYzI?si=z_9rTUkMHp9JuJME', 3, 'PTS');
--Adobe After Effect
INSERT INTO BAIHOC(MABH, TIEUDEBH, NOIDUNGBH, VIDEOBH, THUTUBH, MAKH)
VALUES
('AE01', 'Bài 1: Tổng quan giới thiệu After Effects', 'Giới thiệu After Effects', 'https://youtu.be/Y6LAk4vGO2E?si=oxHXCuwm7Mjk8aPX', 1, 'AE'),
('AE02', 'Bài 2: Import data vào trong After Effects', 'Import data', 'https://youtu.be/wblHOBlif6Q?si=X18fmdCX5IRd47q7', 2, 'AE'),
('AE03', 'Bài 3: Chức năng các công cụ Tools trong AE', 'Công cụ', 'https://youtu.be/362DIxXMYGU?si=whuyQmSpUqatjGwR',3,'AE');

-- ĐĂNG KÝ HỌC
INSERT INTO DANGKYHOC(MADKH, NGAYDANGKY, MAHV, MAKH)
VALUES
('DK01', '24/9/2023', 'K1101', 'AI'),
('DK02', '20/11/2023', 'K1101', 'AI'),
('DK03', '15/12/2022', 'K1102', 'DP'),
('DK04', '10/10/2022', 'K1103', 'Figma'),
('DK05', '5/12/2021', 'K1103', 'Figma'),
('DK06', '2/11/2023', 'K1303', 'Figma'),
('DK07', '12/11/2022', 'K1304', 'Lightroom'),
('DK08', '24/04/2023', 'K1201', 'PTS'),
('DK09', '15/07/2022', 'K1106', 'AE'),
('DK10', '18/12/2022', 'K1310', 'AE'),
('DK11', '20/9/2023', 'K1311', 'AI'),
('DK12', '11/11/2023', 'K1211', 'AI'),
('DK13', '8/12/2022', 'K1204', 'DP'),
('DK14', '3/07/2022', 'K1209', 'NA'),
('DK15', '5/1/2021', 'K1203', 'NA'),
('DK16', '2/1/2023', 'K1203', 'PTS'),
('DK17', '2/11/2022', 'K1302', 'Lightroom'),
('DK18', '4/08/2023', 'K1301', 'PTS'),
('DK19', '11/08/2022', 'K1306', 'Lightroom'),
('DK20', '17/07/2022', 'K1301', 'DP');

--ĐÁNH GIÁ
INSERT INTO DANHGIA(MADG, DIEMDG, BINHLUAN, NGAYDG, MAHV, MAKH)
VALUES
('DG001', 4.5, 'Khoa hoc bo ich', '12/12/2020', 'K1305', 'AI'),
('DG002', 5.0, 'Rat huu ich', '15/12/2020', 'K1204', 'AI'),
('DG003', 1.5, 'Qua te', '10/10/2020', 'K1303', 'DP'),
('DG004', 2.5, 'Tam duoc', '11/12/2020', 'K1105', 'NA'),
('DG005', 3.5, 'Kha on', '12/11/2020', 'K1106', 'Figma'),
('DG006', 1.0, 'That vong cuc ky', '13/10/2020', 'K1207', 'AE'),
('DG007', 2.0, 'te', '15/10/2020', 'K1208', 'PTS'),
('DG008', 3.0, 'Kha bo ich', '15/11/2020', 'K1301', 'Lightroom'),
('DG009', 4.0, 'Huu ich', '15/12/2020', 'K1109', 'NA'),
('DG0010', 5.0, 'Tuyet voi', '15/12/2020', 'K1203', 'Figma');


--THANH TOÁN
INSERT INTO THANHTOAN (MATT, SOTIENTT, NGAYTT, TRANGTHAI, MAHV, MAKH)
VALUES 
('TT001', 700000, '4/11/2020', 'PAID', 'K1306', 'AE'),
('TT002', 300000, '4/11/2020', 'NOT PAID', 'K1206', 'DP'),
('TT003', 500000, '5/11/2020', 'NOT PAID', 'K1208', 'PTS'),
('TT004', 1000000, '3/11/2020', 'PAID', 'K1305', 'AI'),
('TT005', 700000, '2/11/2020', 'PAID', 'K1204', 'AI'),
('TT006', 500000, '5/11/2020', 'PAID', 'K1105', 'NA'),
('TT007', 900000, '4/11/2020', 'NOT PAID', 'K1301', 'Lightroom'),
('TT008', 700000, '3/11/2020', 'PAID', 'K1203', 'Figma'),
('TT009', 500000, '2/11/2020', 'PAID', 'K1106', 'Figma'),
('TT0010', 300000, '4/11/2020', 'NOT PAID', 'K1109', 'NA');

--VIEWS
--7.View tổng điểm đánh giá (thang điểm 10) và số lượng đánh giá cho mỗi khoá học: (bính)
-- Tính tổng điểm và số lượng đánh giá từ bảng DANHGIA theo MAKH.
CREATE VIEW tongdiem_soluongDanhgia
AS
	SELECT KHOAHOC.MAKH, AVG(DANHGIA.DIEMDG) AS TONGDIEMDG , COUNT(DANHGIA.MADG) AS SLDANHGIA
	FROM DANHGIA INNER JOIN KHOAHOC ON DANHGIA.MAKH = KHOAHOC.MAKH
	GROUP BY KHOAHOC.MAKH
;

SELECT * FROM tongdiem_soluongDanhgia;

--PROCẺDURES
--6.Xóa học viên: (bính)
 --Xóa một học viên khỏi bảng HOCVIEN và tất cả các thông tin liên quan, 
 --chẳng hạn như đăng ký học, thanh toán, và đánh giá.
CREATE PROC xoa_hocvien @mahv varchar(10)
AS
	DELETE FROM HOCVIEN WHERE HOCVIEN.MAHV = @mahv;
	DELETE FROM DANGKYHOC WHERE DANGKYHOC.MAHV = @mahv;
	DELETE FROM THANHTOAN WHERE THANHTOAN.MAHV = @mahv;
	DELETE FROM DANHGIA WHERE DANHGIA.MAHV = @mahv;
GO;

EXEC xoa_hocvien 'k1101';
 	
DROP PROC xoa_hocvien;

--8.Thêm bài học mới: (bính) 
--	Thêm một bài học mới vào bảng BAIHOC của một khoá học cụ thể.
CREATE PROC themBaiHocMoi @mabh varchar(10), @makh varchar(10)
AS

GO;

EXEC themBaiHocMoi;

--FUNCTIONS
--6.Lấy danh sách các học viên đã đánh giá một khoá học: (bính)
CREATE FUNCTION dshv_danhgiakh(@makh varchar(10))
RETURNS TABLE
AS
	RETURN(
		SELECT KHOAHOC.MAKH, HOCVIEN.* 
		FROM HOCVIEN INNER JOIN DANGKYHOC ON HOCVIEN.MAHV = DANGKYHOC.MAHV
			INNER JOIN KHOAHOC ON DANGKYHOC.MAKH = KHOAHOC.MAKH
		WHERE KHOAHOC.MAKH = @makh
	)
;

SELECT * FROM dbo.dshv_danhgiakh('AI');

--8.	Lấy thông tin bài học mới nhất trong một khoá học: (bính)
CREATE FUNCTION f_baiHocMoiNhat(@makh varchar(10))
RETURNS TABLE
AS
	RETURN(
		SELECT *
		FROM BAIHOC
		WHERE BAIHOC.THUTUBH = (SELECT MAX(THUTUBH)
									FROM BAIHOC
									WHERE BAIHOC.MAKH = @makh
									GROUP BY MAKH
								)
			AND BAIHOC.MAKH = @makh
	)

SELECT * FROM dbo.f_baiHocMoiNhat('AI');
DROP FUNCTION f_baiHocMoiNhat;
