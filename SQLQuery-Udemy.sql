use Udemy;
SET DATEFORMAT dmy; 

-----------------------VIEWS-----------------------

--3.View danh sách bài học trong một khoá học: (Ngân)
--Kết hợp thông tin từ bảng BAIHOC và KHOAHOC.
create view v_dsbh
as
select BAIHOC.MABH, BAIHOC.TIEUDEBH, BAIHOC.NOIDUNGBH, BAIHOC.VIDEOBH, BAIHOC.THUTUBH, KHOAHOC.MAKH
from BAIHOC inner join KHOAHOC on BAIHOC.MAKH = KHOAHOC.MAKH
where KHOAHOC.MAKH = 'AI';

select * from v_dsbh;

--4.View danh sách đánh giá cho một khoá học: (Ngân)
--Kết hợp thông tin từ bảng DANHGIA, HOCVIEN, và KHOAHOC.
create view v_dsdg
as
select DANHGIA.MADG, DANHGIA.DIEMDG, DANHGIA.BINHLUAN, DANHGIA.NGAYDG, HOCVIEN.MAHV, KHOAHOC.MAKH
from DANHGIA  inner join KHOAHOC on DANHGIA.MAKH = KHOAHOC.MAKH 
			  inner join HOCVIEN on DANHGIA.MAHV = HOCVIEN.MAHV
where KHOAHOC.MAKH = 'Figma';

select * from v_dsdg;

--cau 5. View danh sách đăng ký học và thông tin học viên:(Tâm)
create view V_hocvien
as select 
DANGKYHOC.MADKH, DANGKYHOC.NGAYDANGKY,DANGKYHOC.MAKH,DANGKYHOC.MAHV,
hocvien.ho,hocvien.ten,hocvien.ngaysinh,hocvien.gioitinh,hocvien.sdt,hocvien.dchv,
KHOAHOC.TENKH,KHOAHOC.MOTAKH,KHOAHOC.GIA_GOC,KHOAHOC.GIA_KM,KHOAHOC.NGAYTAO,KHOAHOC.MACD,KHOAHOC.MATL,KHOAHOC.MAGV
from (hocvien inner join DANGKYHOC on DANGKYHOC.MAHV = hocvien.mahv) inner join KHOAHOC on DANGKYHOC.MAKH = KHOAHOC.MAKH;

select * from V_hocvien
drop view V_hocvien

--cau 6. View tổng thanh toán cho mỗi học viên:(Tâm)
create view V_tongthanhtoan
as select hocvien.mahv,sum(THANHTOAN.SoTienTT) as TongThanhToan
from hocvien inner join THANHTOAN on hocvien.mahv = THANHTOAN.MAHV
group by hocvien.mahv;

select * from V_tongthanhtoan

--7.View tổng điểm đánh giá (thang điểm 10) và số lượng đánh giá cho mỗi khoá học: (Bính)
-- Tính tổng điểm và số lượng đánh giá từ bảng DANHGIA theo MAKH.
CREATE VIEW tongdiem_soluongDanhgia
AS
	SELECT KHOAHOC.MAKH, AVG(DANHGIA.DIEMDG) AS TONGDIEMDG , COUNT(DANHGIA.MADG) AS SLDANHGIA
	FROM DANHGIA INNER JOIN KHOAHOC ON DANHGIA.MAKH = KHOAHOC.MAKH
	GROUP BY KHOAHOC.MAKH
;

SELECT * FROM tongdiem_soluongDanhgia;

-----------------------PROCẺDURES-----------------------
--3.Xóa đánh giá: (Ngân)
--Xóa một bản ghi đánh giá từ bảng DANHGIA dựa trên MADG.
use Udemy
go

create procedure p_xdg @madg varchar(10)
as
begin
	delete from DANHGIA
	where MADG = @madg
end;

execute p_xdg 'DG001';
select * from DANHGIA;

drop procedure p_xdg;

--cau 4. Đăng ký học(Tâm)
create procedure sp_themDangKyHoc(@madkh varchar(10),@ngaydangky date,@mahv varchar(10),@makh varchar(10))
as INSERT INTO DANGKYHOC(MADKH, NGAYDANGKY, MAHV, MAKH)
	VALUES	(@madkh,@ngaydangky,@mahv,@makh)
go

exec sp_themDangKyHoc 'DK21','2/1/2003','K1301','DP';
delete dangkyhoc where madkh ='DK21';

--cau 5 Cập nhật trạng thái thanh toán:(Tâm)
create procedure sp_trangThaiThanhToan @matt varchar(10), @trangthai varchar(20)
as 
	update thanhtoan set trangthai = @trangthai where matt = @matt
go

exec sp_trangThaiThanhToan 'TT0010', 'NOT PAID';


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
 	
DROP PROC xoa_hocvien;

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
DROP PROC themBaiHocMoi;

SELECT * FROM BAIHOC WHERE MAKH='AI';

-----------------------FUNCTIONS-----------------------

--2.Kiểm tra học viên đã tham gia một khoá học chưa: (Ngân)
create function f_kthvdk(@mahv varchar(10))
returns varchar(20)
as
begin
	if exists (select HOCVIEN.MAHV
		       from HOCVIEN inner join DANGKYHOC on HOCVIEN.MAHV = DANGKYHOC.MAHV
						    inner join KHOAHOC on DANGKYHOC.MAKH = KHOAHOC.MAKH
			   where HOCVIEN.MAHV in (select HOCVIEN.MAHV 
								      from DANGKYHOC inner join HOCVIEN on DANGKYHOC.MAHV = HOCVIEN.MAHV
								      where DANGKYHOC.MAHV = @mahv)
			  )
	begin 
		return 'Da dang ky'
	end
	return 'Chua dang ky'
end;

print(dbo.f_kthvdk('K1103'));
drop function f_kthvdk;

--3.Tính tổng số tiền thanh toán của một học viên: (Ngân)
create function f_tttthv(@mahv varchar(10))
returns float
as
begin
	return(
		select SUM(THANHTOAN.SoTienTT) as Tongtienhocvienthanhtoan
		from THANHTOAN inner join HOCVIEN on THANHTOAN.MAHV = HOCVIEN.MAHV
		where THANHTOAN.MAHV = @mahv
		group by HOCVIEN.MAHV
		)
end

print(dbo.f_tttthv('K1301'));
drop function f_tthv;

--cau 4 Lấy danh sách các khoá học mà một học viên đã đăng ký(Tâm)
create function f_listKhoaHoc (@mahv varchar(10))
returns table 
Return 
select hocvien.mahv, KHOAHOC.* from (KHOAHOC inner join DANGKYHOC on KHOAHOC.MAKH = DANGKYHOC.MAKH) inner join  hocvien on hocvien.mahv = DANGKYHOC.MAHV
where hocvien.mahv = @mahv

go

select * from f_listKhoaHoc('K1101');
--cau 5. Tính tổng số bài học trong một khoá học:(Tâm)
create function f_tongBaiHoc (@makh varchar(10))
returns numeric
as
begin
	declare @tong numeric
	select @tong = COUNT(BAIHOC.MAKH)
	from BAIHOC where BAIHOC.MAKH = @makh
	return @tong
end
go
select dbo.f_tongBaiHoc('AI');
select * from BAIHOC

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
DROP FUNCTION f_baiHocMoiNhat;

-----------------------TRIGGERS-----------------------

--2.Trigger kiểm tra số lượng bài học trước khi xóa khoá học: (Ngân)
--Trước khi xóa một khoá học khỏi bảng KHOAHOC, 
--kiểm tra xem có bài học nào liên quan không. 
--Nếu có, không cho phép xóa.
create trigger delete_kh on KHOAHOC for delete
as
begin
	declare @makh varchar(10)
	set @makh = (select MAKH from deleted)

	if exists (select * 
			   from deleted
			   where MAKH in (select MAKH from BAIHOC))
	begin
		raiserror('Khoa hoc co bai hoc lien quan, khong the xoa', 10,1);
		rollback;
	end
	else
		begin
			delete from THANHTOAN where THANHTOAN.MAKH = @makh
			delete from DANHGIA where DANHGIA.MAKH = @makh
			delete from DANGKYHOC where DANGKYHOC.MAKH = @makh
		end;
end


--4. Trigger kiểm tra trạng thái học viên trước khi xóa học viên: (Bính)
-- Trước khi xóa một học viên khỏi bảng HOCVIEN, kiểm tra xem học viên có đang tham gia khoá học nào không. 
-- Nếu có, không cho phép xóa.

CREATE TRIGGER kt_trangthai_hocvien ON HOCVIEN instead of DELETE
as
begin
	declare @mahv varchar(10);
	set @mahv = (select mahv from deleted);
	if exists (select DANGKYHOC.MAHV
				from DANGKYHOC
				where DANGKYHOC.MAHV = @mahv)
			begin
				RAISERROR('học viên đang đăng ký khóa học, không thể xóa', 16, 1);
				ROLLBACK;
			end;
end;

delete from HOCVIEN where MAHV = 'K1312';
delete from HOCVIEN where MAHV = 'K1103';

DROP TRIGGER kt_trangthai_hocvien;

--CÂU TỰ TẠO: Tạo trigger kiểm tra xem khóa học mà một học viên đó đăng ký hay chưa, 
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

DROP TRIGGER dangky_khoahoc;

INSERT INTO DANGKYHOC(MADKH, NGAYDANGKY, MAHV, MAKH)
VALUES ('DK26', '10/10/2022', 'K1308', 'Figma');

--cau 8. kiểm tra số điện thoại hợp lệ(Tâm)
CREATE or alter TRIGGER trg_checkForNumberPhone ON hocvien
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE len(sdt) <> 11  OR sdt NOT LIKE '%[^0-9]%' )
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR ('số điện thoại của học viên phải có đúng 11 ký tự và chỉ chứa các chữ số', 16, 1);
        RETURN;
    END;
END;


INSERT INTO HOCVIEN(MAHV, HO, TEN, NGAYSINH, GIOITINH , SDT, DCHV)
VALUES
('K1313', 'ABC', 'Cuc', '09/06/1986', 'Nu', '12345678911', 'Kien Giang')
select * from hocvien;
delete hocvien where mahv = 'K1313';

drop trigger trg_checkForNumberPhone;