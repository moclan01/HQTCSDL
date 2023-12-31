﻿use Udemy;
SET DATEFORMAT dmy; 

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