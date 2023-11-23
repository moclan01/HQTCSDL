--table

create table HOCVIEN(
MAHV varchar(20) not null primary key,
HO varchar(200) not null,
TEN varchar(200) not null,
NGSINH date not null,
GIOITINH varchar(10) not null,
NOISINH varchar(100) not null,
MALOP varchar(20) not null
);

drop table HOCVIEN;

create table KHOA(
MAKHOA varchar(20) not null primary key,
TENKHOA varchar(200) not null,
NGTLAP date not null,
TRGKHOA varchar(20),
);

drop table KHOA;

create table GIAOVIEN(
MAGV varchar(20) not null primary key,
HOTEN varchar(200) not null,
HOCVI varchar(20),
HOCHAM varchar(20),
GIOITINH varchar(10) not null,
NGSINH date not null,
NGVL date not null,
HESO numeric not null,
MUCLUONG numeric not null,
MAKHOA varchar(20) references KHOA(MAKHOA),
);

drop table GIAOVIEN;

create table LOP(
MALOP varchar(20) not null primary key,
TENLOP varchar(200) not null,
TRGLOP varchar(20) not null references HOCVIEN(MAHV),
SISO int not null,
MAGVCN varchar(20) not null references GIAOVIEN(MAGV)
);

drop table LOP;

create table MONHOC(
MAMH varchar(20) not null primary key,
TENMH varchar(200) not null,
TCLT int,
TCTH int,
MAKHOA varchar(20) references KHOA(MAKHOA)
);

drop table MONHOC;

create table DIEUKIEN(
MAMH varchar(20) not null references MONHOC(MAMH),
MAMH_TRUOC varchar(20) not null references MONHOC(MAMH),
primary key (MAMH, MAMH_TRUOC)
);

drop table DIEUKIEN;

create table GIANGDAY(
MALOP varchar(20) not null references LOP(MALOP),
MAMH varchar(20) not null references MONHOC(MAMH),
MAGV varchar(20) not null references GIAOVIEN(MAGV),
HOCKY int not null,
NAM int not null,
TUNGAY date,
DENNGAY date,
primary key (MALOP, MAMH)
);

drop table GIANGDAY;

create table KETQUATHI(
MAHV varchar(20) not null references HOCVIEN(MAHV),
MAMH varchar(20) not null references MONHOC(MAMH),
LANTHI int not null,
NGTHI date not null,
DIEM numeric,
KQUA varchar(255)
);

drop table KETQUATHI;

--database
SET DATEFORMAT dmy; 

--HOC VIEN
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP)
values
('K1101', 'Nguyen Van', 'A', '27/1/1986', 'nam', 'TpHCM', 'K11'),
('K1102', 'Tran Ngoc', 'Han', '14/3/1986', 'nu', 'Kien Giang', 'K11'),
('K1103', 'Ha Duy', 'Lap', '18/4/1986', 'nam', 'Nghe An', 'K11'),
('K1104', 'Tran Ngoc', 'Linh', '30/3/1986', 'nu', 'Tay Ninh', 'K11'),
('K1105', 'Tran Minh', 'Long', '27/2/1986', 'nam', 'TpHCM', 'K11'),
('K1106', 'Le Nhat', 'Minh', '24/1/1986', 'nam', 'TpHCM', 'K11'),
('K1107', 'Nguyen Nhu', 'Nhut', '27/1/1986', 'nam', 'Ha Noi', 'K11'),
('K1108', 'Nguyen Manh', 'Tam', '27/2/1986', 'nam', 'Kien Giang', 'K11'),
('K1109', 'Phan Thi Thanh', 'Tam', '27/1/1986', 'nu', 'Vinh Long', 'K11'),
('K1110', 'Le Hoai', 'Thuong', '5/2/1986', 'nu', 'Can Tho', 'K11'),
('K1111', 'Le Ha', 'Vinh', '25/12/1986', 'nam', 'Vinh Long', 'K11');

insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP)
values
('K1201', 'Nguyen Van', 'B', '11/2/1986','nam','TpHCM','K12'),
('K1202', 'Nguyen Thi Kim', 'Duyen', '18/1/1986','nu','TpHCM','K12'),
('K1203', 'Tran Thi Kim', 'Duyen', '17/9/1986','nu','TpHCM','K12'),
('K1204', 'Truong Thi', 'Hanh', '19/5/1986','nu','Dong Nai','K12'),
('K1205', 'Nguyen Thanh', 'Nam', '17/4/1986','nam','TpHCM','K12'),
('K1206', 'Nguyen Thi Truc', 'Thanh', '4/3/1986','nu','Kien Giang','K12'),
('K1207', 'Tran Thi Bich', 'Thuy', '8/2/1986','nu','Nghe An','K12'),
('K1208', 'Huynh Thi Kim', 'Trieu', '8/4/1986','nu','Tay Ninh','K12'),
('K1209', 'Pham Thanh', 'Trieu', '23/2/1986','nam','TpHCM','K12'),
('K1210', 'Ngo Thanh', 'Tuan', '14/2/1986','nam','TpHCM','K12'),
('K1211', 'Do Thi', 'Xuan', '9/3/1986','nu','Ha Noi','K12'),
('K1212', 'Le Thi Phi', 'Yen', '12/3/1986','nu','TpHCM','K12');

insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP)
values
('K1301', 'Nguyen Thi Kim', 'Cuc', '09/06/1986', 'Nu', 'Kien Giang', 'K13'),
('K1302', 'Truong Thi My', 'Hien', '18/03/1986', 'Nu', 'Nghe An', 'K13'),
('K1303', 'Le Duc', 'Hien', '21/03/1986', 'Nam', 'Tay Ninh', 'K13'),
('K1304', 'Le Quang', 'Hien ', '18/04/1986', 'Nam ', 'TP.HCM ', 'K13'),
('K1305', 'Le Thi', 'Huong', '27/03/1986 ', 'Nu', 'TP.HCM', 'K13'),
('K1306', 'Nguyen Thai', 'Huu ', '30/03/1986', 'Nam', 'Ha Noi', 'K13'),
('K1307', 'Tran Minh', 'Man ', '28/05/1986 ', 'Nam', 'TP.HCM ', 'K13'),
('K1308', 'Nguyen Hieu', 'Nghia', '08/04/1986', 'Nam', 'Kien Giang', 'K13'),
('K1309', 'Nguyen Trung', 'Nghia', '18/01/1987', 'Nam', 'Nghe An', 'K13'),
('K1310', 'Tran Thi Hong','Tham', '22/04/1986','Nu','Tay Ninh', 'K13'),
('K1311', 'Tran Minh', 'Thuc', ' 04/04/1986', 'Nam', 'TP.HCM', 'K13'),
('K1312', 'Nguyen Thi Kim', 'Yen', '07/09/1986', 'Nu', 'TP.HCM', 'K13');

--KHOA
insert into KHOA(MAKHOA, TENKHOA, NGTLAP, TRGKHOA)
values
('KHMT', 'Khoa học máy tính', '7/6/2005', 'GV01'),
('HTTT', 'Hệ thống thông tin', '7/6/2005', 'GV02'),
('CNPM', 'Công nghệ phần mềm', '7/6/2005', 'GV04'),
('MMT', 'Mạng và truyền thông', '20/10/2005', 'GV03'),
('KTMT', 'Kỹ thuật máy tính', '20/12/2005', null);

--GIAOVIEN
insert into GIAOVIEN(MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA)
values
('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '2/5/1950', '11/1/2004', 5.00, 2250000, 'KHMT'),
('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '17/12/1965', '20/4/2004', 4.50, 2025000, 'HTTT'),
('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1/8/1950', '23/9/2004', 4.00, 1800000, 'CNPM'),
('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '22/2/1961', '12/1/2005', 4.50, 2025000, 'KTMT'),
('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '12/3/1958', '12/1/2005', 3.00, 1350000, 'HTTT'),
('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '11/3/1953', '12/1/2005', 4.50, 2050000, 'KTMT'),
('GV07', 'Nguyen Minh Tien', 'GV', 'GS', 'Nam', '23/11/1971', '1/3/2005', 4.00, 1800000, 'KTMT'),
('GV08', 'Le Thi Tran', 'KS', null, 'Nu', '26/3/1974', '1/3/2005', 1.69, 760500, 'KTMT'),
('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '31/12/1966', '1/3/2005', 4.00, 1800000, 'HTTT'),
('GV10', 'Le Tran Anh Loan', 'KS', null, 'Nu', '17/7/1972', '1/3/2005', 1.86, 837000, 'CNPM'),
('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '12/1/1980', '15/5/2005', 2.67, 1201500, 'MMT'),
('GV12', 'Tran Van Anh', 'CN', null, 'Nu', '29/3/1981', '15/5/2005', 1.69, 760500, 'CNPM'),
('GV13', 'Nguyen Linh Dan', 'CN', null, 'Nu', '23/5/1980', '15/5/2005', 1.69, 760500, 'KTMT'),
('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '30/11/1976', '15/5/2005', 3.00, 1350000, 'MMT'),
('GV15', 'Le Ha Thanh', 'PTS', 'GV', 'Nam', '4/5/1978', '15/5/2005', 3.00, 1350000, 'KHMT');

--LOP
insert into LOP(MALOP, TENLOP, TRGLOP, SISO, MAGVCN)
values
('K11', 'Lớp 1 khoá 1', 'K1108', 11, 'GV07'),
('K12', 'Lớp 2 khoá 1', 'K1205', 12, 'GV09'),
('K13', 'Lớp 3 khoá 1', 'K1305', 12, 'GV14');

--MONHOC
insert into MONHOC(MAMH, TENMH, TCLT, TCTH, MAKHOA)
values
('THDC', 'Tin học đại cương', 4, 1, 'KHMT'),
('CTRR', 'Cấu trúc rời rạc', 5, 0, 'KHMT'),
('CSDL', 'Cơ sở dữ liệu', 3, 1, 'HTTT'),
('CTDLGT', 'Cấu trúc dữ liệu và giải thuật', 3, 1, 'KHMT'),
('PTTKTT', 'Phân tích thiết kế thuật toán', 3, 0, 'KHMT'),
('DHMT', 'Đồ hoạ máy tính', 3, 1, 'KHMT'),
('KTMT', 'Kiến trúc máy tính', 3, 0, 'KTMT'),
('TKCSDL', 'Thiết kế cơ sở dữ liệu', 3, 1, 'HTTT'),
('PTTKHTTT', 'Phân tích thiết kế hệ thống thông tin', 4, 1, 'HTTT'),
('HDH', 'Hệ điều hành', 4, 0, 'KTMT'),
('NMCNPM', 'Nhập môn công nghệ phần mềm', 3, 0, 'CNPM'),
('LRCFW', 'Lập trình C for Win', 3, 1, 'CNPM'),
('LTHDT', 'Lập trình hướng đối tượng', 3, 1, 'CNPM');

--GIANGDAY
insert into GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
values
('K11', 'THDC', 'GV07', 1, 2006, '2/1/2006', '12/5/2006'),
('K12', 'THDC', 'GV06', 1, 2006, '2/1/2006', '12/5/2006'),
('K13', 'THDC', 'GV15', 1, 2006, '2/1/2006', '12/5/2006'),
('K11', 'CTRR', 'GV02', 1, 2006, '9/1/2006', '17/5/2006'),
('K12', 'CTRR', 'GV02', 1, 2006, '9/1/2006', '17/5/2006'),
('K13', 'CTRR', 'GV08', 1, 2006, '9/1/2006', '17/5/2006'),
('K11', 'CSDL', 'GV05', 2, 2006, '1/6/2006', '15/7/2006'),
('K12', 'CSDL', 'GV09', 2, 2006, '1/6/2006', '15/7/2006'),
('K13', 'CTDLGT', 'GV15', 2, 2006, '1/6/2006', '15/7/2006'),
('K13', 'CSDL', 'GV05', 3, 2006, '1/8/2006', '15/12/2006'),
('K13', 'DHMT', 'GV07', 3, 2006, '1/8/2006', '15/12/2006'),
('K11', 'CTDLGT', 'GV15', 3, 2006, '1/8/2006', '15/12/2006'),
('K12', 'CTDLGT', 'GV15', 3, 2006, '1/8/2006', '15/12/2006'),
('K11', 'HDH', 'GV04', 1, 2007, '2/1/2007', '18/2/2007'),
('K12', 'HDH', 'GV04', 1, 2007, '2/1/2007', '20/3/2007'),
('K11', 'DHMT', 'GV07', 1, 2007, '18/2/2007', '20/3/2007');


--DIEUKIEN
insert into DIEUKIEN(MAMH, MAMH_TRUOC)
values
('CSDL', 'CTRR'),
('CSDL', 'CTDLGT'),
('CTDLGT', 'THDC'),
('PTTKTT', 'THDC'),
('PTTKTT', 'CTDLGT'),
('DHMT', 'THDC'),
('LTHDT', 'THDC'),
('PTTKHTTT', 'CSDL');

--KETQUATHI
insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) 
values
('K1101', 'CSDL', 1, '20/7/2006', 10.00, 'Dat'),
('K1101', 'CTDLGT', 1, '28/12/2006', 9.00, 'Dat'),
('K1101', 'THDC', 1, '20/5/2006', 9.00, 'Dat'),
('K1101', 'CTRR', 1, '13/5/2006', 9.50, 'Dat'),
('K1102', 'CSDL', 1, '20/7/2006', 4.00, 'Khong Dat'),
('K1102', 'CSDL', 2, '27/7/2006', 4.25, 'Khong Dat'),
('K1102', 'CSDL', 3, '10/8/2006', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 1, '28/12/2006', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 2, '5/1/2007', 4.00, 'Khong Dat'),
('K1102', 'CTDLGT', 3, '15/1/2007', 6.00, 'Dat'),
('K1102', 'THDC', 1, '20/5/2006', 5.00, 'Dat'),
('K1102', 'CTRR', 1, '13/5/2006', 7.00, 'Dat'),
('K1103', 'CSDL', 1, '20/7/2006', 3.50, 'Khong Dat'),
('K1103', 'CSDL', 2, '27/7/2006', 8.25, 'Dat'),
('K1103', 'CTDLGT', 1, '28/12/2006', 7.00, 'Dat'),
('K1103', 'THDC', 1, '20/5/2006', 8.00, 'Dat'),
('K1103', 'CTRR', 1, '13/5/2006', 6.50, 'Dat'),
('K1104', 'CSDL', 1, '20/7/2006', 3.75, 'Khong Dat'),
('K1104', 'CTDLGT', 1, '28/12/2006', 4.00, 'Khong Dat'),
('K1104', 'THDC', 1, '20/5/2006', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 1, '13/5/2006', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 2, '20/5/2006', 3.50, 'Khong Dat'),
('K1104', 'CTRR', 3, '30/6/2006', 4.00, 'Khong Dat'),
('K1201', 'CTDLGT', 1, '28/12/2006', 5.00, 'Dat'),
('K1201', 'THDC', 1, '20/5/2006', 8.50, 'Dat'),
('K1201', 'CTRR', 1, '13/5/2006', 9.00, 'Dat'),
('K1202', 'CSDL', 1, '20/7/2006', 8.00, 'Dat'),
('K1202', 'CTDLGT', 1, '28/12/2006', 4.00, 'Khong Dat'),
('K1202', 'CTDLGT', 2, '5/1/2007', 5.00, 'Dat'),
('K1202', 'THDC', 1, '20/5/2006', 4.00, 'Khong Dat'),
('K1202', 'THDC', 2, '27/5/2006', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 1, '13/5/2006', 3.00, 'Khong Dat'),
('K1202', 'CTRR', 2, '20/05/2006', 4.00, 'Khong Dat'),
('K1202', 'CSDL', 3, '30/06/2006', 6.25, 'Dat'),
('K1203', 'CTDLGT', 1, '20/07/2006', 9.25, 'Dat'),
('K1203', 'THDC', 1, '28/12/2006', 9.50, 'Dat'),
('K1203', 'CTRR', 1, '20/05/2006', 10.00, 'Dat'),
('K1203', 'CSDL', 1, '13/05/2006', 10.00, 'Dat'),
('K1204', 'CTDLGT', 1, '20/07/2006', 8.50, 'Dat'),
('K1204', 'THDC', 1, '28/12/2006', 6.75, 'Dat'),
('K1204', 'CTRR', 1, '20/05/2006', 4.00, 'Khong Dat'),
('K1204', 'CSDL', 1, '13/05/2006', 6.00, 'Dat'),
('K1301', 'CTDLGT', 1, '20/12/2006', 4.25, 'Khong Dat'),
('K1301', 'THDC', 1, '25/07/2006', 8.00, 'Dat'),
('K1301', 'CTRR', 1, '20/05/2006', 7.75, 'Dat'),
('K1301', 'CSDL', 1, '13/05/2006', 8.00, 'Dat'),
('K1302', 'CTDLGT', 1, '20/12/2006', 6.75, 'Dat'),
('K1302', 'THDC', 1, '25/07/2006', 5.00, 'Dat'),
('K1302', 'CTRR', 1, '13/05/2006', 8.50, 'Dat'),
('K1303', 'CSDL', 1, '20/12/2006', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 1, '25/07/2006', 4.50, 'Khong Dat'),
('K1303', 'CTDLGT', 2, '07/08/2006', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 3, '15/08/2006', 4.25, 'Khong Dat'),
('K1303', 'THDC', 1, '20/05/2006', 4.50, 'Khong Dat'),
('K1303', 'CTRR', 1, '13/05/2006', 3.25, 'Khong Dat'),
('K1303', 'CTRR', 2, '20/05/2006', 5.00, 'Dat'),
('K1304', 'CSDL', 1, '20/12/2006', 7.75, 'Dat'),
('K1304', 'CTDLGT', 1, '25/07/2006', 9.75, 'Dat'),
('K1304', 'THDC', 1, '20/05/2006', 5.50, 'Dat'),
('K1304', 'CTRR', 1, '13/05/2006', 5.00, 'Dat'),
('K1305', 'CSDL', 1, '20/12/2006', 9.25, 'Dat'),
('K1305', 'CTDLGT', 1, '25/07/2006', 10.00, 'Dat'),
('K1305', 'THDC', 1, '20/05/2006', 8.00, 'Dat'),
('K1305', 'CTRR', 1, '13/05/2006', 10.00, 'Dat');

--contraints
alter table HOCVIEN add constraint MALOP foreign key (MALOP) references LOP(MALOP);

--Batchs
--1. Sử dụng kiểu dữ liệu cursor, viết đoạn chương trình in danh sách giáo viên của từng khoa như sau:
----------- DANH SACH GIAO VIEN KHOA: <TENKHOA> 
--<STT> <HOTEN> <HOCVI> <HOCHAM>

declare @maKhoa varchar(20), @tenKhoa varchar(20), @stt int,@hoten varchar(20), @hocvi varchar(20), @hocham varchar(20)

declare cursor_khoa cursor for 
select KHOA.MAKHOA, KHOA.TENKHOA from dbo.KHOA
open cursor_khoa
fetch next from cursor_khoa into @maKhoa, @tenKhoa
while @@FETCH_STATUS = 0
begin
	print '----------- DANH SACH GIAO VIEN KHOA ' + @tenKhoa
	declare cursor_gv cursor for
	select GIAOVIEN.HOTEN, GIAOVIEN.HOCVI, GIAOVIEN.HOCHAM from dbo.GIAOVIEN where GIAOVIEN.MAKHOA = @maKhoa 
	open cursor_gv
	fetch next from cursor_gv into @hoten, @hocvi, @hocham
	while @@FETCH_STATUS = 0
	begin
		print(@hoten + ' ' + @hocvi + ' ' +@hocham)
		fetch next from cursor_gv into @hoten, @hocvi, @hocham
	end
	deallocate cursor_gv
	fetch next from cursor_khoa into @maKhoa, @tenKhoa 
end
deallocate cursor_khoa;

--2. Sử dụng cấu trúc vòng lập While, sử dụng sequence để tạo MAMH, TENMH, nhập 10 mẫu tin vào bảng 
--MONHOC với nội dung:
--◦ MALOP có giá trị là ‘M1’,M2,….,’M10’
--◦ TENMH có giá trị là ‘Mon 1’, Mon 2’,……, ‘Mon 10’
--◦ Các thuộc tính còn lại có giá trị null

declare @index int,@mamh varchar(20), @tenmh varchar(20)
set @index = 1

while @index <= 10
begin
set @mamh = 'M' +  cast(@index as varchar(2))
set @tenmh = 'Mon' + cast(@index as varchar(2))
insert into MONHOC(MAMH, TENMH, TCLT, TCTH, MAKHOA)
values(@mamh,@tenmh,null,null,null)

set @index = @index + 1
end

select * from MONHOC;

--Function
--1. Tạo hàm F_DTB cho biết điểm trung bình các môn thi của học viên. Mỗi môn thi, chỉ lấy điểm của lần thi 
--sau cùng (mã học viên là tham số của hàm).
create function f_dtb(@mahv varchar(20))
returns float
as
begin
	return(
		select avg(DIEM)
		from ketquathi inner join hocvien on ketquathi.mahv = hocvien.mahv
		where hocvien.mahv = @mahv	and ketquathi.lanthi in (select max(ketquathi.lanthi)
																from ketquathi
																where mahv = @mahv
																group by mahv)

		group by hocvien.mahv
	)
end

print(dbo.f_dtb('k1102'));
drop function f_dtb;

--2. Tạo hàm F_XL có mã học viên là tham số, cho biết kết quả xếp loại của học viên như sau: 
-- Nếu DIEMTB ≥ 9 thì XEPLOAI =”XS” 
-- Nếu 8 ≤ DIEMTB < 9 thì XEPLOAI = “G” 
-- Nếu 6.5 ≤ DIEMTB < 8 thì XEPLOAI = “K” 
-- Nếu 5 ≤ DIEMTB < 6.5 thì XEPLOAI = “TB” 
-- Nếu DIEMTB < 5 thì XEPLOAI = ”Y” .

create function f_xl(@mahv varchar(20))
returns varchar(2)
as
begin
	declare @dtb float = dbo.f_dtb(@mahv)
	if (@dtb >= 9)
	begin 
		return 'XS';
	end
	if (8 <= @dtb and @dtb < 9)
	begin 
		return 'G';
	end
	if (6.5 <= @dtb and @dtb < 8)
	begin 
	return 'K';
	end
	if (5 <= @dtb and @dtb < 6.5)
	begin 
		return 'TB';
	end
	return 'Y';
end

print(dbo.f_xl('K1101'));
drop function f_xl;

--3. Tạo hàm F_DSMON cho biết danh sách điểm các môn học mà học viên có kết quả ‘đạt’.
-- Danh sách gồm: MAMH, TENMH, ĐIỂM
-- Mã học viên là tham số của hàm
create function f_dsmon(@mahv varchar(20))
returns table
as
	return( 
		select monhoc.mamh, monhoc.tenmh, ketquathi.diem
		from monhoc inner join ketquathi on monhoc.mamh = ketquathi.mamh
				inner join hocvien on hocvien.mahv = ketquathi.mahv
		where hocvien.mahv = @mahv and ketquathi.kqua = 'Dat' 
	);

select * from dbo.f_dsmon('K1101');
drop function f_dsmon;

--4. Tạo hàm F_DSGV cho biết danh sách giáo viên đã dạy hết các môn mà khoa phụ trách. Hàm có tham 
--số là mã khoa
create function f_dsgv(@makhoa varchar(20))
returns table
as
	return(
		select giaovien.magv, giaovien.hoten, monhoc.tenmh, khoa.makhoa  
		from giaovien inner join khoa on giaovien.makhoa = khoa.makhoa
			inner join giangday on giaovien.magv = giangday.magv
				inner join monhoc on monhoc.mamh = giangday.mamh
		where giangday.mamh in (select mamh from monhoc where makhoa = @makhoa)
	);

select * from dbo.f_dsgv('HTTT');
drop function f_dsgv;

--5. Tạo hàm trả về danh sách học viên và kết quả xếp loại từng học viên của lớp.
-- Thông tin gồm: MAHV, Họ & tên HV, Điểm trung bình, xếp loại.
-- Mã lớp là tham số của hàm

create function f_dshv(@malop varchar(20))
returns table
as
	return(
		select hocvien.mahv, dbo.f_dtb(hocvien.mahv) as dtb, dbo.f_xl(hocvien.mahv) as xeploai
		from hocvien
		where hocvien.malop = @malop
	);

select * from dbo.f_dshv('K12');
drop function f_dshv;

--Procedures

--1. Tạo thủ tục P_KQMH, cho biết bảng điểm của học viên (p_mahv). 
-- Thông tin gồm: Mã học viên, tên học viên, mã môn học, tên môn học, điểm (chỉ lấy điểm của lần 
--thi cuối cùng), kết quả
-- Thủ tục nhận tham số đầu vào là mã học viên (p_mahv)
use TH03
go

create procedure p_kqmh @p_mahv varchar(20)
as
	select hocvien.mahv, hocvien.ho, hocvien.ten, ketquathi.mamh, monhoc.tenmh, ketquathi.diem, ketquathi.kqua
	from hocvien inner join ketquathi on hocvien.mahv = ketquathi.mahv
			inner join monhoc on ketquathi.mamh = monhoc.mamh
	where hocvien.mahv = @p_mahv and ketquathi.lanthi in (select max(lanthi)
															from ketquathi
															where ketquathi.mahv = @p_mahv
															group by mamh)
go;

create proc p_kqmh @p_mahv varchar(10)
as 
select HOCVIEN.MAHV,HOCVIEN.HO, HOCVIEN.TEN, MONHOC.MAMH, MONHOC.TENMH, KETQUATHI.DIEM
from HOCVIEN inner join KETQUATHI on HOCVIEN.MAHV = KETQUATHI.MAHV
inner join MONHOC on MONHOC.MAMH = KETQUATHI.MAMH
where HOCVIEN.MAHV = @p_mahv and KETQUATHI.LANTHI in (select MAX(LANTHI)
							from KETQUATHI 
							where KETQUATHI.MAHV = @p_mahv
							group by MAMH)
go;
exec p_kqmh 'K1102'; 
drop proc p_kqmh;

--2. Tạo thủ tục P_GVMH, cho biết danh sách sinh viên học môn (p_mamh) do giáo viên (p_mgv) phụ trách 
--trong học kỳ (p_hocky), năm học (p_nam).
--Thông tin gồm: Mã GV, mã môn học, mahv, ho&ten hoc vien 
--Thủ tục nhận các tham số đầu vào là mã môn học (p_mamh), mã giáo viên (p_mgv), học kỳ
--(p_hocky), năm học (p_nam).

use TH03
go

create proc p_gvmh @p_mamh varchar(20), @p_magv varchar(20), @p_hocky int, @p_nam int
as
	select giaovien.magv, giangday.mamh, hocvien.mahv, hocvien.ho, hocvien.ten
	from hocvien inner join lop on hocvien.malop = lop.malop 
			inner join giangday on lop.malop = giangday.malop
			inner join giaovien on giaovien.magv = giangday.magv
	where giangday.mamh = @p_mamh and giaovien.magv = @p_magv and giangday.hocky = @p_hocky and giangday.nam = @p_nam
go;

exec p_gvmh 'CTDLGT', 'GV15', 2, 2006;
drop proc p_gvmh;

--3. Tạo thủ tục P_LOP cho biết danh sách học viên của lớp (p_malop).
-- Thông tin gồm: mã lớp, mgvcn, tên gv chủ nhiệm, tên trưởng lớp, mahv, ho&ten học viên.
-- Thủ tục nhận 1 tham số đầu vào là mã lớp (p_malop)
create proc p_lop @p_malop varchar(20)
as
	declare @ten_truonglop varchar(200)
	select @ten_truonglop = hocvien.ten
	from hocvien inner join lop on hocvien.mahv = lop.trglop
	where lop.malop = @p_malop;

	select lop.malop, lop.magvcn, giaovien.hoten as gvcn, @ten_truonglop as tentruonglop, hocvien.mahv, hocvien.ho, hocvien.ten
	from hocvien inner join lop on hocvien.malop = lop.malop
		inner join giaovien on lop.magvcn = giaovien.magv
	where lop.malop = @p_malop
go;

exec p_lop 'K11';
drop proc p_lop;

--4. Tạo thủ tục P_TOPN liệt kê danh sách n môn học có số lượng học đăng ký học nhiều nhất.
--Thông tin gồm: Mã môn học, tên môn học, số lượng học viên
--Thủ tục nhận 1 tham số đầu vào là n.
create proc p_topn @n int
as
select top(@n) monhoc.mamh, monhoc.tenmh, count(hocvien.mahv) as sldk
from monhoc inner join giangday on monhoc.mamh = giangday.mamh
		inner join lop on giangday.malop = lop.malop
		inner join hocvien on lop.malop = hocvien.malop
group by monhoc.mamh, monhoc.tenmh
order by count(hocvien.mahv) desc
go;

exec p_topn 5;

--5. Tạo thủ tục P_TK, thống kê số lượng học viên của từng môn học mà giáo viên (p_magv) đã phụ trách 
--giảng dạy. 
-- Thông tin gồm: MAGV, tên gv, mamh, tenmh, số lượng học viên
-- Thủ tục nhận 1 tham số đầu vào là mã giáo viên (p_magv).
create proc p_tk @p_magv varchar(20)
as
select giaovien.magv, giaovien.hoten, monhoc.mamh, monhoc.tenmh, count(hocvien.mahv) as slhv
from hocvien inner join lop on hocvien.malop = lop.malop
	inner join giangday on giangday.malop = lop.malop
	inner join monhoc on monhoc.mamh = giangday.mamh
	inner join giaovien on giaovien.magv = giangday.magv
where giaovien.magv = @p_magv
group by giaovien.magv, giaovien.hoten, monhoc.mamh, monhoc.tenmh
go;
exec p_tk 'GV15';
drop proc p_tk;

--Trigger
--1.Học viên thi một môn tối đa 3 lần.
create trigger ketquathi_insert_update on ketquathi after insert,update,delete
as
begin
	declare @mahv varchar(20), @mamh varchar(20), @solanthi int
	select @mahv = inserted.mahv, @mamh=inserted.mamh from inserted 
	set @solanthi = (select max(lanthi) from ketquathi 
						where mahv = @mahv and mamh = @mamh)
	if(@solanthi > 3)
		begin
			raiserror('Mot hoc vien khong duoc thi mot mon qua 3 lan', 16,1);
			rollback;
		end			
end

drop trigger ketquathi_insert_update;

insert into KETQUATHI
values
('K1104', 'CTRR', 4, '30/6/2006', 5.00, 'Dat');

-- 2. Học kỳ chỉ có giá trị từ 1 đến 3.
create trigger giangday_insert_update on giangday after insert,update,delete
as 
begin
	declare @hocky int
	set @hocky = (select hocky from inserted)
	if(@hocky < 1 or @hocky >3)
		begin
		raiserror('hoc ky chi co gia tri tu 1 -3', 16,1);
		rollback;
		end
end;

drop trigger giangday_insert_update;

insert into GIANGDAY
values
('K13', 'LRCFW', 'GV07', 4, 2008, '2/1/2006', '12/5/2006');

--3. Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”.
 create trigger hocvigiaovien_insert_update on giaovien after insert, update,delete
 as
 begin
	declare @hocvi varchar(20)
	set @hocvi = (select hocvi from inserted)
	if(@hocvi not in ('CN', 'KS', 'Ths', 'TS', 'PTS'))
	begin
		raiserror('hoc vi giao vien khong hop le',16,1);
		rollback;
	end
 end;

 drop trigger hocvigiaovien_insert_update;
 --4. Học viên ít nhất là 18 tuổi.
 create trigger tuoihocvien on  hocvien after insert, update, delete
 as
 begin
	declare @tuoi int
	set @tuoi = (select DATEPART(year,GETDATE() - DATEPART(year,ngsinh)
					from inserted
				)
	if(@tuoi < 18)
		begin
		raiserror('hoc vien chua du tuoi',16,1);
		rollback;
		end
 end;

 --5. Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc 
--(DENNGAY).
create trigger thoigiangiangday on giangday after insert, update, delete
as
begin
	declare @tungay date
	declare @denngay date
	set @tungay = (select tungay from inserted)
    set @denngay = (select denngay from inserted)

--	select @tungay = TUNGAY, @denngay = DENNGAY from inserted;
	if(@tungay > @denngay)
		begin
		raiserror('ngay bat dau phai nho hon ngay ket thuc', 16,1);
		rollback;
		end
end;

drop trigger thoigiangiangday;

--6. Giáo viên khi vào làm ít nhất là 22 tuổi.
create trigger tuoigiavien on giaovien after insert,update,delete
as
begin
	declare @tuoi int
	set @tuoi = (select DATEPART(year,GETDATE()) - DATEPART(year,ngsinh)
					from inserted);

	if(@tuoi < 22)
		begin
		raiserror('giao vien chua du tuoi', 16,1);
		rollback;
		end
end;

drop trigger tuoigiaovien;

--7. Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch 
--nhau không quá 3
create trigger monhoc_tinchi on monhoc after insert,update,delete
as
begin
	declare @tc_lt int, @tc_th int;

	select @tc_lt = TCLT, @tc_th = TCTH from inserted;

	if (abs(@tc_lt - @tc_th) > 3)
	begin 
		raiserror('Cac mon hoc co TCLT va TCTH khong lech nhau qua 3TC', 16, 1);
		rollback;
	end
end;

--8. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn
create trigger mon_hocky_lop on giangday after insert,update,delete
as
begin
	declare @countmon int, @hocky int
	set @hocky = (select hocky
					from inserted
					)

	set @countmon = (select count(mamh)
						from giangday
						where hocky = @hocky
						group by malop)
	 if(@countmon > 3)
		begin
			raiserror ('Moi mot lop chi duoc hoc toi da 3 mon trong hoc ky',16,1);
			rollback;
		end
end;

drop trigger mon_hocky_lop;

insert into GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
values
('K11', 'NMCNPM', 'GV07', 1, 2006, '2/1/2006', '12/5/2006');

--9. Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
create trigger sisolop on lop after insert, update, delete
as
begin
	declare @count_hocvien int
	set @count_hocvien = ( select count(mahv)
							from hocvien inner join inserted on hocvien.malop = inserted.malop
							group by hocvien.malop
						)
	if(@count_hocvien <> (select siso from inserted))
		begin
		raiserror('Si so phai bang so luong hoc vien cua lop do', 16, 1);
		rollback	
		end
end;

--10. Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong 
--cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ
--(“A”,”B”) và (“B”,”A”).
create trigger dieukien_monhoc on dieukien after update,insert,delete
as
begin
	declare @mamh varchar(20), @mamh_truoc varchar(20)
	set @mamh = (select mamh from inserted)
	set @mamh_truoc = (select mamh_truoc from inserted)

	if(@mamh = @mamh_truoc)
		begin
			raiserror('Ma mon hoc va ma mon hoc truoc khong duoc giong nhau', 16, 1);
			rollback;
		end
	if exists (select * from dieukien where mamh = @mamh and mamh_truoc = @mamh_truoc)
		begin
			raiserror('Ma mon hoc va ma mon hoc truoc khong duoc phu thuoc nhau', 16, 1);
		rollback;
		end
end;

--11. Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
create trigger giaovien_luong_insert_update on GIAOVIEN after insert, update
as
begin
	declare @hocvi nvarchar(3000), @hocham nvarchar(3000), @muc_luong int, @mucluong_ud_ins int;

	select @hocvi = HOCVI, @hocham = HOCHAM, @mucluong_ud_ins = MUCLUONG from inserted;

	set @muc_luong = (select top(1) MUCLUONG from GIAOVIEN where HOCVI = @hocvi and HOCHAM = @hocham);

	if (@muc_luong <> @mucluong_ud_ins)
	begin 
		raiserror('Muc luong cua giao vien chua hop ly', 16, 1);
		rollback;
	end
end;

insert into GIAOVIEN(MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA)
values
('GV16', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '2/5/1950', '11/1/2004', 5.00, 2260000, 'KHMT');

delete from GIAOVIEN where MAGV = 'GV16';

--12. Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
create trigger ketqua_thilai on KETQUATHI after insert
as
begin
	declare @mahv varchar(10), @mamh varchar(10), @solanthi int, @diem float;

	select @mahv = MAHV, @mamh = MAMH from inserted;

	set @solanthi = (select LANTHI - 1 from inserted);

	set @diem = (select KETQUATHI.DIEM from KETQUATHI
	where KETQUATHI.MAMH = @mamh and KETQUATHI.MAHV = @mahv and KETQUATHI.LANTHI = @solanthi);

	if (@diem >= 5)
	begin 
		raiserror('Thong tin thi lai khong hop le', 16, 1);
		rollback;
	end
end;

drop trigger ketqua_thilai;

insert into KETQUATHI
values
('K1305', 'CTRR', 2, '13/05/2006', 10.00, 'Dat');

delete from KETQUATHI where  MAHV = 'K1305' and MAMH = 'CTRR' and LANTHI = 2;

select * from KETQUATHI;

--13. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, 
--cùng môn học).
create trigger ngaythi_lansau on ketquathi after insert, update,delete
as
begin
	declare  @mahv varchar(10), @mamh varchar(10), @ngaythitruoc date, @ngaythihientai date, @solanthitruoc int;
	select @mahv = mahv, @mamh = mamh , @solanthitruoc = lanthi - 1, @ngaythihientai = ngthi from inserted;
	select @ngaythitruoc = ngthi from ketquathi where mahv=@mahv and mamh = @mamh and lanthi = @solanthitruoc
	if(@ngaythihientai <= @ngaythitruoc)
		begin
			raiserror('Ngay thi hien tai phai lon hon  ngay thi truoc', 16, 1);
			rollback;
		end
end;

insert into KETQUATHI
values
('K1303', 'THDC', 2, '20/05/2005', 4.50, 'Khong Dat');

--14. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.
create trigger giangday_khoaphutrach on giangday after insert,update
as
begin
	declare @mamh varchar(20), @magv varchar(20), @makhoa varchar(20)

	select @magv = magv, @mamh = mamh from inserted
	set @makhoa = (select makhoa from giaovien where magv = @magv)

	if exists (select mamh = @mamh from monhoc where makhoa = @makhoa)
		begin
			raiserror('Mon hoc khong thuoc khoa cua GV phu trach', 16, 1);
			rollback;
		end
end;

-- NMCNPM thuoc KHOA CNPM, GV06 thuoc KHOA CTMT
insert into GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
values
('K12', 'NMCNPM', 'GV06', 2, 2006, '2/1/2006', '12/5/2006');