use Udemy;
SET DATEFORMAT dmy; 
--------------------------------------------TABLES--------------------------------------------

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



--------------------------------------------DATABASES--------------------------------------------

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
('DK02', '20/11/2023', 'K1101', 'DP'),
('DK03', '15/12/2022', 'K1102', 'DP'),
('DK04', '10/10/2022', 'K1102', 'Figma'),
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
('DG001', 4.5, 'Khóa học bổ ích', '12/12/2022', 'K1101', 'AI'),
('DG002', 5.0, 'Rất hữu ích', '15/12/2022', 'K1102', 'DP'),
('DG003', 1.5, 'Quá tệ', '10/10/2022', 'K1103', 'Figma'),
('DG004', 2.5, 'Tạm được', '11/12/2022', 'K1304', 'Lightroom'),
('DG005', 3.5, 'Khá ổn', '12/11/2022', 'K1201', 'PTS'),
('DG006', 1.0, 'Thất vọng cực kỳ', '13/10/2022', 'K1106', 'AE'),
('DG007', 2.0, 'Tệ', '15/10/2022', 'K1310', 'AE'),
('DG008', 3.0, 'Khá bổ ích', '15/11/2020', 'K1311', 'AI'),
('DG009', 3.0, 'Ổn', '15/12/2022', 'K1211', 'AI'),
('DG010', 4.0, 'Hữu ích', '15/12/2022', 'K1204', 'DP'),
('DG011', 4.5, 'Khóa học bổ ích', '15/12/2022', 'K1209', 'NA'),
('DG012', 4.2, 'Hữu ích', '15/12/2022', 'K1203', 'NA'),
('DG013', 3.8, 'Khá hữu ích', '15/12/2022', 'K1302', 'PTS'),
('DG014', 2.3, 'Tạm', '15/12/2022', 'K1301', 'Lightroom'),
('DG015', 4.0, 'Hữu ích', '15/12/2022', 'K1306', 'PTS'),
('DG016', 5.0, 'Rất hữu ích', '15/12/2022', 'K1301', 'Lightroom'),
('DG017', 5.0, 'Tuyệt vời', '15/12/2022', 'K1203', 'DP');

--THANH TOÁN
INSERT INTO THANHTOAN (MATT, SOTIENTT, NGAYTT, TRANGTHAI, MAHV, MAKH)
VALUES 
('TT001', 1200000, '24/9/2023', 'PAID', 'K1101', 'AI'),
('TT002', 1200000, '20/11/2023', 'NOT PAID', 'K1101', 'DP'),
('TT003', 1000000, '15/12/2022', 'NOT PAID', 'K1102', 'DP'),
('TT004', 1000000, '10/10/2022', 'PAID', 'K1102', 'Figma'),
('TT005', 1000000, '5/12/2021', 'PAID', 'K1103', 'Figma'),
('TT006', 1000000, '2/11/2023', 'PAID', 'K1303', 'Figma'),
('TT007', 600000, '12/11/2022', 'NOT PAID', 'K1304', 'Lightroom'),
('TT008', 2000000, '24/04/2023', 'PAID', 'K1201', 'PTS'),
('TT009', 1500000, '15/07/2022', 'PAID', 'K1106', 'AE'),
('TT010', 1500000, '18/12/2022', 'PAID', 'K1310', 'AE'),
('TT011', 1200000, '20/9/2023', 'PAID', 'K1311', 'AI'),
('TT012', 1200000, '11/11/2023', 'NOT PAID', 'K1211', 'AI'),
('TT013', 1000000, '8/12/2022', 'PAID', 'K1204', 'DP'),
('TT014', 1600000, '3/07/2022', 'PAID', 'K1209', 'NA'),
('TT015', 1600000, '5/1/2021', 'NOT PAID', 'K1203', 'NA'),
('TT016', 2000000, '2/1/2023', 'PAID', 'K1203', 'PTS'),
('TT017', 600000, '2/11/2022', 'NOT PAID', 'K1302', 'Lightroom'),
('TT018', 2000000, '4/08/2023', 'PAID', 'K1301', 'PTS'),
('TT019', 600000, '11/08/2022', 'PAID', 'K1306', 'Lightroom'),
('TT020', 1000000, '17/07/2022', 'PAID', 'K1301', 'DP');

---------------------------------------------FOREIGN KEY--------------------------------------------

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

---------------------------------------------QUERIES--------------------------------------------

-----------------------VIEWS-----------------------

-- 1. View danh sách học viên: (Linh)
CREATE VIEW V_hocvien
AS
SELECT *
FROM HOCVIEN

SELECT * FROM V_hocvien

-- 2. View chi tiết khoá học: (Linh)
CREATE VIEW V_khoahoc
AS 
SELECT KHOAHOC.TENKH, KHOAHOC.MOTAKH, KHOAHOC.GIA_GOC, KHOAHOC.GIA_KM, CAPDO.TENCD, THELOAI.TENTL, GIAOVIEN.TENGV
FROM KHOAHOC, CAPDO, THELOAI, GIAOVIEN
WHERE KHOAHOC.MACD = CAPDO.MACD and KHOAHOC.MATL = THELOAI.MATL and KHOAHOC.MAGV = GIAOVIEN.MAGV

SELECT * FROM V_khoahoc

--3.View danh sách bài học trong một khoá học: (Ngân)
--Kết hợp thông tin từ bảng BAIHOC và KHOAHOC.
CREATE VIEW v_dsbh
AS
SELECT BAIHOC.MABH, BAIHOC.TIEUDEBH, BAIHOC.NOIDUNGBH, BAIHOC.VIDEOBH, BAIHOC.THUTUBH, KHOAHOC.MAKH
FROM BAIHOC INNER JOIN KHOAHOC ON BAIHOC.MAKH = KHOAHOC.MAKH
WHERE KHOAHOC.MAKH = 'AI';

SELECT * FROM v_dsbh;

--4.View danh sách đánh giá cho một khoá học: (Ngân)
--Kết hợp thông tin từ bảng DANHGIA, HOCVIEN, và KHOAHOC.
CREATE VIEW v_dsdg
AS
SELECT DANHGIA.MADG, DANHGIA.DIEMDG, DANHGIA.BINHLUAN, DANHGIA.NGAYDG, HOCVIEN.MAHV, KHOAHOC.MAKH
FROM DANHGIA  INNER JOIN KHOAHOC ON DANHGIA.MAKH = KHOAHOC.MAKH 
			  INNER JOIN HOCVIEN ON DANHGIA.MAHV = HOCVIEN.MAHV
WHERE KHOAHOC.MAKH = 'Figma';

SELECT * FROM v_dsdg;;

--cau 5. View danh sách đăng ký học và thông tin học viên:(Tâm)
CREATE VIEW V_HOCVIEN
AS SELECT 
DANGKYHOC.MADKH, DANGKYHOC.NGAYDANGKY,DANGKYHOC.MAKH,DANGKYHOC.MAHV,
HOCVIEN.HO,HOCVIEN.TEN,HOCVIEN.NGAYSINH,HOCVIEN.GIOITINH,HOCVIEN.SDT,HOCVIEN.DCHV,
KHOAHOC.TENKH,KHOAHOC.MOTAKH,KHOAHOC.GIA_GOC,KHOAHOC.GIA_KM,KHOAHOC.NGAYTAO,KHOAHOC.MACD,KHOAHOC.MATL,KHOAHOC.MAGV
FROM (HOCVIEN INNER JOIN DANGKYHOC ON DANGKYHOC.MAHV = HOCVIEN.MAHV) INNER JOIN KHOAHOC ON DANGKYHOC.MAKH = KHOAHOC.MAKH;


SELECT * FROM V_HOCVIEN

--cau 6. View tổng thanh toán cho mỗi học viên:(Tâm)
CREATE VIEW V_TONGTHANHTOAN
AS SELECT HOCVIEN.MAHV,SUM(THANHTOAN.SOTIENTT) AS TONGTHANHTOAN
FROM HOCVIEN INNER JOIN THANHTOAN ON HOCVIEN.MAHV = THANHTOAN.MAHV
GROUP BY HOCVIEN.MAHV;

SELECT * FROM V_TONGTHANHTOAN
--7.View tổng điểm đánh giá (thang điểm 10) và số lượng đánh giá cho mỗi khoá học: (Bính)
-- Tính tổng điểm và số lượng đánh giá từ bảng DANHGIA theo MAKH.
CREATE VIEW tongdiem_soluongDanhgia
AS
	SELECT KHOAHOC.MAKH, AVG(DANHGIA.DIEMDG) AS TONGDIEMDG , COUNT(DANHGIA.MADG) AS SLDANHGIA
	FROM DANHGIA INNER JOIN KHOAHOC ON DANHGIA.MAKH = KHOAHOC.MAKH
	GROUP BY KHOAHOC.MAKH
;

SELECT * FROM tongdiem_soluongDanhgia;
-- câu 8 view •	Hiển thị thông tin từ bảng KHOAHOC với điều kiện NGAYTAO <= ngày hiện tại.(Toàn)
CREATE VIEW THONG_TIN_KHOA_HOC AS
SELECT MAKH,TENKH,MOTAKH,GIA_GOC,GIA_KM,NGAYTAO,MACD,MATL,MAGV	
FROM
KHOAHOC
WHERE
NGAYTAO <= CURRENT_DATE + 1;

-- Câu 9 :  cung cấp danh sách các khóa học cùng với mô tả, giáo viên được chỉ định và cấp độ tương ứng.(Toàn)
CREATE VIEW COURSE_TEACHER_VIEW AS
SELECT KH.MAKH, KH.TENKH, KH.MOTAKH,
		GV.TENGV AS GIAOVIEN_TEN, CD.TENCD AS CAPDO_TEN
FROM KHOAHOC KH
JOIN GIAOVIEN GV ON KH.MAGV = GV.MAGV
JOIN CAPDO CD ON KH.MACD = CD.MACD;

--Câu 10: View tổng số học viên đăng ký cho từng khoá học: (Lợi)
CREATE VIEW TongSoHocVienDangKy AS
	SELECT KHOAHOC.MAKH, COUNT(KHOAHOC.MAKH) AS TongDangKy FROM DANGKYHOC
	INNER JOIN KHOAHOC ON DANGKYHOC.MAKH = KHOAHOC.MAKH
	GROUP BY KHOAHOC.MAKH
GO

-----------------------PROCẺDURES-----------------------

-- 1. Thêm học viên mới: (Linh)
CREATE PROCEDURE p_themhocvien
@mahv varchar(10), @ho nvarchar(255), @ten nvarchar(255), @ngaysinh date, @gioitinh varchar(3), @sdt varchar(11), @dchv nvarchar(255)
AS
BEGIN
 IF EXISTS (SELECT MAHV FROM HOCVIEN WHERE MAHV = @mahv)
	BEGIN
	RAISERROr ('Ma hoc vien da ton tai' , 16, 1)
	 END
	 ELSE
	 BEGIN
		INSERT HOCVIEN(MAHV, HO, TEN, NGAYSINH, GIOITINH , SDT, DCHV)
		VALUES (@mahv, @ho, @ten, @ngaysinh, @gioitinh, @sdt, @dchv)
	END
END

EXECUTE p_themhocvien @mahv = 'K1313', @ho = 'Tran', @ten = 'Linh', @ngaysinh = '24/04/2003', @gioitinh = 'nu', @sdt = '123456789', @dchv = 'TP.HCM'

SELECT * FROM HOCVIEN

-- 2. Cập nhật thông tin học viên: (Linh)
CREATE PROCEDURE p_capnhat_tthv
@mahv varchar(10), @ho nvarchar(255), @ten nvarchar(255), @ngaysinh date, @gioitinh varchar(3), @sdt varchar(11), @dchv nvarchar(255)
AS
BEGIN
	IF EXISTS (SELECT MAHV FROM HOCVIEN WHERE MAHV = @mahv)
	BEGIN
		UPDATE HOCVIEN
		SET HO = @ho, TEN = @ten, NGAYSINH = @ngaysinh, GIOITINH = @gioitinh, SDT = @sdt, DCHV = @dchv  
		WHERE MAHV = @mahv
	END
	ELSE 
	BEGIN 
		 RAISERROR('Khong tim thay ma hoc vien', 16, 1)
	END
END


EXECUTE p_capnhat_tthv @mahv = 'K1314', @ho = 'Tran', @ten = 'C', @ngaysinh = '24/04/2003', @gioitinh = 'nu', @sdt = '123456789', @dchv = 'TP.HCM'

SELECT * FROM HOCVIEN;

--3.Xóa đánh giá: (Ngân)
--Xóa một bản ghi đánh giá từ bảng DANHGIA dựa trên MADG.

CREATE PROCEDURE p_xdg @madg varchar(10)
AS
BEGIN
	DELETE FROM DANHGIA
	WHERE MADG = @madg
END;

EXECUTE p_xdg 'DG001';
SELECT * FROM DANHGIA;

--cau 4. Đăng ký học(Tâm)
CREATE PROCEDURE SP_THEMDANGKYHOC(@MADKH VARCHAR(10),@NGAYDANGKY DATE,@MAHV VARCHAR(10),@MAKH VARCHAR(10))
AS INSERT INTO DANGKYHOC(MADKH, NGAYDANGKY, MAHV, MAKH)
	VALUES	(@MADKH,@NGAYDANGKY,@MAHV,@MAKH)
GO

EXEC SP_THEMDANGKYHOC 'DK21','2/1/2003','K1301','DP';
DELETE DANGKYHOC WHERE MADKH ='DK21';

--cau 5 Cập nhật trạng thái thanh toán:(Tâm)
CREATE PROCEDURE SP_TRANGTHAITHANHTOAN @MATT VARCHAR(10), @TRANGTHAI VARCHAR(20)
AS 
	UPDATE THANHTOAN SET TRANGTHAI = @TRANGTHAI WHERE MATT = @MATT
GO

EXEC SP_TRANGTHAITHANHTOAN 'TT0010', 'NOT PAID';
EXEC SP_TRANGTHAITHANHTOAN 'TT0010', 'PAID';

--6.Xóa học viên: (Bính)
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
SELECT * FROM HOCVIEN;

-- câu 7 Stored Procedures: • Tìm kiếm và trả về danh sách học viên dựa trên các điều kiện như tên, địa chỉ, hoặc số điện thoại.(Toàn)
CREATE PROCEDURE Tim_kiem
    @searchKeyword NVARCHAR(255)
AS
BEGIN
    SELECT *
    FROM HOCVIEN
    WHERE
        HO LIKE '%' + @searchKeyword + '%'
        OR TEN LIKE '%' + @searchKeyword + '%'
        OR DCHV LIKE '%' + @searchKeyword + '%'
        OR SDT LIKE '%' + @searchKeyword + '%';
END
GO

--8.Thêm bài học mới: (Bính) 
--	Thêm một bài học mới vào bảng BAIHOC của một khoá học cụ thể.
CREATE PROC themBaiHocMoi @mabh varchar(10), @tieude nvarchar(255), 
							@noidung text, @video nvarchar(255),
							@thutu int, @makh varchar(10)
AS
	SET @makh = (SELECT MAKH	
					FROM BAIHOC
					WHERE EXISTS(SELECT MAKH
								FROM BAIHOC)
					)
	IF NOT EXISTS (SELECT MABH,THUTUBH 
					FROM BAIHOC 
					WHERE MABH = @mabh AND @thutu IN (SELECT THUTUBH 
														FROM BAIHOC 
														WHERE MAKH = @makh) 
											) 
		BEGIN
		INSERT INTO BAIHOC(MABH, TIEUDEBH, NOIDUNGBH, VIDEOBH, THUTUBH, MAKH)
		VALUES (@mabh, @tieude, @noidung, @video, @thutu, @makh);
		END
GO;

EXEC themBaiHocMoi 'AI04', 'Bài 4: Hiệu Chỉnh Vùng Nhìn, Chế Độ Hiển Thị', 'Hiệu Chỉnh','https://youtu.be/tVlZz61zS9s?si=A6bHQEG2b9XGmYpE',4,'AI';
EXEC themBaiHocMoi 'AI05', 'Bài 4: Hiệu Chỉnh Vùng Nhìn, Chế Độ Hiển Thị', 'Hiệu Chỉnh','https://youtu.be/tVlZz61zS9s?si=A6bHQEG2b9XGmYpE',5,'AI';
EXEC themBaiHocMoi 'AI05', 'Bài 4: Hiệu Chỉnh Vùng Nhìn, Chế Độ Hiển Thị', 'Hiệu Chỉnh','https://youtu.be/tVlZz61zS9s?si=A6bHQEG2b9XGmYpE',5,'AI';

SELECT * FROM BAIHOC WHERE MAKH='AI';

-- câu 9 Stored Procedures:• Cập nhật thông tin giáo viên trong bảng GIAOVIEN dựa trên MAGV.(Toàn)
CREATE PROCEDURE UpdateTeacherInfo
    @teacherId VARCHAR(10),
    @newTeacherName NVARCHAR(255),
    @newTeacherDescription TEXT,
    @newTeacherPhone VARCHAR(11)
AS
BEGIN
    UPDATE GIAOVIEN
    SET 
        TENGV = @newTeacherName,
        MOTAGV = @newTeacherDescription,
        DTGV = @newTeacherPhone
    WHERE 
        MAGV = @teacherId;
END
GO

--câu 10: PROC Tìm kiếm và trả về danh sách học viên dựa trên các điều kiện như tên, địa chỉ, hoặc số điện thoại.(Lợi)
CREATE PROC TimKiemHocVien 
	@Ten NVARCHAR(255), 
	@DCHV NVARCHAR(255),
	@SDT VARCHAR(11)
AS
BEGIN
	SELECT * FROM HOCVIEN
    WHERE
        (@Ten IS NULL OR TEN LIKE '%' + @Ten + '%') AND
        (@DCHV IS NULL OR DCHV LIKE '%' + @DCHV + '%') AND
        (@SDT IS NULL OR SDT = @SDT)
END
GO


-----------------------FUNCTIONS-----------------------

--1. Tính tổng số đánh giá cho một khoá học: (Linh)
CREATE FUNCTION f_tongso()
RETURNS TABLE
RETURN 
SELECT DANHGIA.MAKH, COUNT(DANHGIA.MADG) AS 'Tổng số đánh giá'
FROM DANHGIA
GROUP BY DANHGIA.MAKH

SELECT * FROM f_tongso();

--2.Kiểm tra học viên đã tham gia một khoá học chưa: (Ngân)
CREATE FUNCTION f_kthvdk(@mahv varchar(10))
RETURNS varchar(20)
AS
BEGIN
	IF EXISTS (SELECT HOCVIEN.MAHV
		       FROM HOCVIEN INNER JOIN DANGKYHOC ON HOCVIEN.MAHV = DANGKYHOC.MAHV
						    INNER JOIN KHOAHOC ON DANGKYHOC.MAKH = KHOAHOC.MAKH
			   WHERE HOCVIEN.MAHV IN (SELECT HOCVIEN.MAHV 
								      FROM DANGKYHOC INNER JOIN HOCVIEN ON DANGKYHOC.MAHV = HOCVIEN.MAHV
								      WHERE DANGKYHOC.MAHV = @mahv)
			  )
	BEGIN 
		RETURN 'Da dang ky'
	END
	RETURN 'Chua dang ky'
END;

PRINT(dbo.f_kthvdk('K1103'));
DROP FUNCTION f_kthvdk;

--3.Tính tổng số tiền thanh toán của một học viên: (Ngân)
CREATE FUNCTION f_tttthv(@mahv varchar(10))
RETURNS FLOAT
AS
BEGIN
	RETURN(
		SELECT SUM(THANHTOAN.SoTienTT) AS Tongtienhocvienthanhtoan
		FROM THANHTOAN INNER JOIN HOCVIEN ON THANHTOAN.MAHV = HOCVIEN.MAHV
		WHERE THANHTOAN.MAHV = @mahv
		GROUP BY HOCVIEN.MAHV
		)
END

PRINT(dbo.f_tttthv('K1301'));

--cau 4 Lấy danh sách các khoá học mà một học viên đã đăng ký(Tâm)
REATE FUNCTION F_LISTKHOAHOC (@MAHV VARCHAR(10))
RETURNS TABLE 
RETURN 
SELECT HOCVIEN.MAHV, KHOAHOC.* FROM (KHOAHOC INNER JOIN DANGKYHOC ON KHOAHOC.MAKH = DANGKYHOC.MAKH) INNER JOIN  HOCVIEN ON HOCVIEN.MAHV = DANGKYHOC.MAHV
WHERE HOCVIEN.MAHV = @MAHV

GO

SELECT * FROM F_LISTKHOAHOC('K1101');

--cau 5. Tính tổng số bài học trong một khoá học:(Tâm)
CREATE FUNCTION F_TONGBAIHOC (@MAKH VARCHAR(10))
RETURNS NUMERIC
AS
BEGIN
	DECLARE @TONG NUMERIC
	SELECT @TONG = COUNT(BAIHOC.MAKH)
	FROM BAIHOC WHERE BAIHOC.MAKH = @MAKH
	RETURN @TONG
END
GO
SELECT DBO.F_TONGBAIHOC('AI');
SELECT * FROM BAIHOC

--6.Lấy danh sách các học viên đã đánh giá một khoá học: (Bính)
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

--câu 7: Function tính tổng tiền thanh toán đối với khoá học tương ứng (Lợi)
CREATE FUNCTION TongTienThanhToan (@MAKH VARCHAR(10))
RETURNS INT AS
BEGIN
	DECLARE @tong INT
	SELECT @tong = SUM(THANHTOAN.SoTienTT) FROM THANHTOAN
	INNER JOIN KHOAHOC ON THANHTOAN.MAKH = KHOAHOC.MAKH
	WHERE KHOAHOC.MAKH = @MAKH
	GROUP BY THANHTOAN.MAKH
	RETURN @tong
END
GO

--8.	Lấy thông tin bài học mới nhất trong một khoá học: (Bính)
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

-- câu 9: FUNC Lấy danh sách học viên đã đăng ký và thanh toán cho một khoá học (Lợi)
CREATE FUNCTION DangKyVaThanhToan()
RETURNS TABLE AS
RETURN (
		SELECT HOCVIEN.* FROM THANHTOAN
		INNER JOIN DANGKYHOC ON THANHTOAN.MAHV = DANGKYHOC.MAHV AND THANHTOAN.MAKH = DANGKYHOC.MAKH
		INNER JOIN HOCVIEN ON HOCVIEN.MAHV = THANHTOAN.MAHV AND HOCVIEN.MAHV = DANGKYHOC.MAHV
		WHERE THANHTOAN.TRANGTHAI = 'PAID'
	);
GO

-- câu 10 FUNCTION : Lấy tổng số tiền thanh toán cho một khoá học:(Toàn)
CREATE FUNCTION dbo.total_Thanh_Toan
(
    @courseId VARCHAR(10)
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @totalPayment FLOAT;

    SELECT @totalPayment = ISNULL(SUM(SoTienTT), 0)
    FROM THANHTOAN
    WHERE MAKH = @courseId;

    RETURN @totalPayment;
END
GO

-----------------------TRIGGERS-----------------------
-- 1. Trigger tự động xóa các đánh giá khi khoá học bị xóa: (linh)
CREATE TRIGGER t_tudongxoa ON KHOAHOC AFTER DELETE
AS 
BEGIN 
	DELETE FROM DANHGIA
	WHERE MAKH IN (SELECT MAKH FROM DELETED)
END;

--2.Trigger kiểm tra số lượng bài học trước khi xóa khoá học: (Ngân)
--Trước khi xóa một khoá học khỏi bảng KHOAHOC, 
--kiểm tra xem có bài học nào liên quan không. 
--Nếu có, không cho phép xóa.
CREATE TRIGGER delete_kh ON KHOAHOC FOR DELETE
AS
BEGIN
	DECLARE @makh varchar(10)
	SET @makh = (SELECT MAKH FROM deleted)
	IF EXISTS (SELECT * 
			   FROM deleted
			   WHERE MAKH IN (SELECT MAKH FROM BAIHOC))
	BEGIN
		RAISERROR('Khoa hoc co bai hoc lien quan, khong the xoa', 10,1);
		ROLLBACK;
	END
	ELSE
		BEGIN
			DELETE FROM THANHTOAN WHERE THANHTOAN.MAKH = @makh
			DELETE FROM DANHGIA WHERE DANHGIA.MAKH = @makh
			DELETE FROM DANGKYHOC WHERE DANGKYHOC.MAKH = @makh
		END;
END;

--CÂU 3: Tạo trigger kiểm tra xem khóa học mà một học viên đó đăng ký hay chưa, 
--nếu đã đăng ký rồi thì không cho đăng ký (Bính)
CREATE TRIGGER dangky_khoahoc ON DANGKYHOC AFTER INSERT,UPDATE
AS
	BEGIN
		DECLARE @makh varchar(10), @mahv varchar(10);
		SET @makh = (SELECT MAKH FROM inserted);
		SET @mahv = (SELECT MAHV FROM inserted);
		IF((select count(madkh) from dangkyhoc where mahv = @mahv and MAKH = @makh) > 1)
		BEGIN
			RAISERROR('học viên này đã đăng ký khóa học này', 16,1);
			ROLLBACK;
		END
END;

INSERT INTO DANGKYHOC(MADKH, NGAYDANGKY, MAHV, MAKH)
VALUES ('DK26', '10/10/2022', 'K1308', 'Figma');

--4. Trigger kiểm tra trạng thái học viên trước khi xóa học viên: (Bính)
-- Trước khi xóa một học viên khỏi bảng HOCVIEN, kiểm tra xem học viên có đang tham gia khoá học nào không. 
-- Nếu có, không cho phép xóa.

CREATE TRIGGER kt_trangthai_hocvien ON HOCVIEN instead of DELETE
AS
BEGIN
	DECLARE @mahv varchar(10);
	SET @mahv = (SELECT mahv FROM deleted);
	IF EXISTS (SELECT DANGKYHOC.MAHV
				FROM DANGKYHOC
				WHERE DANGKYHOC.MAHV = @mahv)
			BEGIN
				RAISERROR('học viên đang đăng ký khóa học, không thể xóa', 16, 1);
				ROLLBACK;
			END;
END;

DELETE FROM HOCVIEN WHERE MAHV = 'K1312';
DELETE FROM HOCVIEN WHERE MAHV = 'K1103';

--câu 5: Trigger tên giáo viên không chứa ký tự đặc biệt(Lợi)
CREATE TRIGGER Trg_KiemTraTenGiaoVien
ON GIAOVIEN
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE PATINDEX('%[^a-zA-Z0-9 ]%', TENGV) > 0
    )
    BEGIN
        RAISERROR (N'Tên giáo viên khôn chứa ký tự đặc biệt', 16, 1);
        ROLLBACK;
    END
END
GO

--Câu 6: Trigger kiểm tra trạng thái của học viên trước khi đánh giá (Lợi)
CREATE TRIGGER Trg_TrangThaiTruocKhiDanhGia
ON DANHGIA
AFTER INSERT
AS
BEGIN
	DECLARE @MAHV VARCHAR(10);
	DECLARE @MAKH VARCHAR(10);

	SELECT @MAHV = MAHV, @MAKH = MAKH FROM inserted

	IF NOT EXISTS (
		SELECT 1 FROM DANGKYHOC WHERE MAHV = @MAHV AND MAKH = @MAKH
	)
	BEGIN
		RAISERROR (N'Học viên chưa đăng ký học chưa được phép đánh giá', 12, 1);
		ROLLBACK;
	END;
END
GO

-- câu 7 trigger: •Trước khi thêm giáo viên mới, trigger này đảm bảo rằng tên giáo viên không chứa bất kỳ ký tự đặc biệt nào.(Toàn)
CREATE TRIGGER TruocThemGV
ON GIAOVIEN
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @containsSpecialChar BIT;

    SELECT @containsSpecialChar = CASE WHEN PATINDEX('%[^a-zA-Z0-9 ]%', i.TENGV) > 0 THEN 1 ELSE 0 END
    FROM INSERTED i;

    IF @containsSpecialChar = 1
    BEGIN
        RAISERROR ('Tên giáo viên không được chứa ký tự đặc biệt', 16, 1);
        RETURN;
    END;
    
    INSERT INTO GIAOVIEN (MAGV, TENGV, MOTAGV, DTGV)
    SELECT MAGV, TENGV, MOTAGV, DTGV
    FROM INSERTED;
END
GO

--cau 8. kiểm tra số điện thoại hợp lệ(Tâm)
--CAU 8. KIỂM TRA SỐ ĐIỆN THOẠI HỢP LỆ
CREATE OR ALTER TRIGGER TRG_CHECKFORNUMBERPHONE ON HOCVIEN
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @SDT_HV VARCHAR(11);
	SET @SDT_HV = (SELECT SDT FROM INSERTED);
    IF  LEN(@SDT_HV) = 11  AND @SDT_HV NOT LIKE '%[^0-9]%'  
    BEGIN
    PRINT 'Số điện thoại hợp lệ.';
END
ELSE
BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR ('SỐ ĐIỆN THOẠI CỦA HỌC VIÊN PHẢI CÓ ĐÚNG 11 KÝ TỰ VÀ CHỈ CHỨA CÁC CHỮ SỐ', 16, 1);
        RETURN;
    END;
END;

INSERT INTO HOCVIEN(MAHV, HO, TEN, NGAYSINH, GIOITINH , SDT, DCHV)
VALUES
('K1313', 'ABC', 'CUC', '09/06/1986', 'NU', '12345678119', 'KIEN GIANG')
SELECT * FROM HOCVIEN;
DELETE HOCVIEN WHERE MAHV = 'K1313'

--Câu 9: Trigger tự động cập nhật số lượng bài học khi có bài học mới -> Trigger không cho phép insert khoá học có giá KM > giá gốc (Lợi)
CREATE TRIGGER Trg_GiaGocGiaKM
ON KHOAHOC
AFTER INSERT
AS
BEGIN
	DECLARE @GiaGoc FLOAT;
	DECLARE @GiaKhuyenMai FLOAT;

	SELECT @GiaGoc = GIA_GOC, @GiaKhuyenMai = GIA_KM FROM inserted

	IF @GiaGoc <= @GiaKhuyenMai
	BEGIN
		RAISERROR (N'Giá khuyến mãi không hợp lệ', 16, 1);
		ROLLBACK;
	END;
END
GO


-- câu 10 trigger • Trước khi thêm đăng ký học mới, trigger này đảm bảo rằng ngày đăng ký không được lớn hơn ngày hiện tại.(Toàn)
CREATE TRIGGER TruocDangKyHoc
ON DANGKYHOC
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @currentDate DATE;
    SET @currentDate = GETDATE();

    IF EXISTS (SELECT 1 FROM inserted WHERE NGAYDANGKY > @currentDate)
    BEGIN
        RAISERROR ('Ngày đăng ký không được lớn hơn ngày hiện tại', 16, 1);
        RETURN;
    END;

    INSERT INTO DANGKYHOC (MADKH, NGAYDANGKY, MAHV, MAKH)
    SELECT MADKH, NGAYDANGKY, MAHV, MAKH
    FROM inserted;
END
GO

---------------------------------------------USERS--------------------------------------------
-- Tạo User
CREATE LOGIN Masato WITH PASSWORD = 'Mật_Khẩu';
CREATE USER Masato FOR LOGIN Masato;

-- Xoá User
DROP USER Masato;

-- Thay đổi user
ALTER LOGIN [Tên_User] WITH PASSWORD = 'Mật_Khẩu_Mới';

--Tạo/Xóa/Thay đổi Role:
CREATE ROLE Admin;
DROP ROLE [Tên_Role];

-- Gán/Thu Hồi Quyền/Role trên User/Role: 
EXEC sp_addrolemember 'Admin', 'Masato'; -- Gán role trên user
EXEC sp_droprolemember 'Tên_Role', 'Tên_User'; -- Thu hồi quyền role trên user
EXEC sp_addrolemember 'moderator', 'Admin'; -- Gán role trên role
EXEC sp_droprolemember 'moderator', 'Admin'; -- Thu hồi role trên role