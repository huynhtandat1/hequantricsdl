--Bài 1
SELECT*FROM NHANVIEN;
DECLARE @THONGKE TABLE (PHG INT, LTB FLOAT);
INSERT INTO @THONGKE
SELECT PHG,AVG(LUONG) as LTB FROM NHANVIEN GROUP BY PHG;
SELECT TENNV, LUONG,'TINH TRANG' = IIF(LUONG>B.LTB, 'KHONG TANG LUONG', 'TANG LUONG') 
FROM NHANVIEN A INNER JOIN @THONGKE B ON A.PHG = B.PHG;

--------------------

DECLARE @THONGKE TABLE (PHG INT, LTB FLOAT);
INSERT INTO @THONGKE
SELECT PHG,AVG(LUONG) as LTB FROM NHANVIEN GROUP BY PHG;
SELECT 'CHUC VU' = IIF(LUONG>B.LTB, 'TRUONG PHONG', 'NHAN VIEN'),TENNV,LUONG
FROM NHANVIEN A INNER JOIN @THONGKE B ON A.PHG = B.PHG

--------------------

SELECT TENNV = CASE PHAI
WHEN 'NAM' THEN 'MR. '+[TENNV]
ELSE 'MRS. '+[TENNV]
END
FROM NHANVIEN

--------------------

SELECT TENNV,LUONG,
'THUE'=CASE 
WHEN LUONG BETWEEN 0 AND 25000 THEN LUONG*0.1
WHEN LUONG BETWEEN 25000 AND 30000 THEN LUONG*0.12
WHEN LUONG BETWEEN 30000 AND 40000 THEN LUONG*0.15
WHEN LUONG BETWEEN 40000 AND 50000 THEN LUONG*0.2
ELSE LUONG*0.25
END
FROM NHANVIEN

--Bài 2

DECLARE @DEM INT=2;
WHILE @DEM <(SELECT COUNT(MANV) FROM NHANVIEN)
BEGIN
SELECT*FROM NHANVIEN
WHERE CAST(MANV AS int) = @DEM
SET @DEM = @DEM +2
END

--------------------

DECLARE @DEM1 INT = 2, @I INT;
WHILE @DEM1<(SELECT COUNT(MANV) FROM NHANVIEN)
WHILE (@DEM1<@I)
BEGIN 
IF (@DEM1 = 4) 
BEGIN
SET @DEM1 = @DEM1+2 
CONTINUE;
END
SELECT*FROM NHANVIEN
WHERE CAST(MANV AS int) = @DEM1
SET @DEM1 = @DEM1+2 
END

--Bài 3
select*from PHONGBAN;
begin try 
    insert into PHONGBAN(TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	   values(N'Sản xuất', 10, '009', '2020-03-02');
	print N'Dữ liệu chèn thành công';
end try 
begin catch
  print N'Dữ liệu chèn thất bại';
end catch;

--------------------

begin try 
    declare @chia int;
	set @chia = 55/0;
end try
begin catch 
    declare @ErrorMessage nvarchar(2048), 
	        @ErrorSeverity int, 
			@ErrorState int;
	select @ErrorMessage = ERROR_MESSAGE(),
	       @ErrorSeverity = ERROR_SEVERITY(),
		   @ErrorState = ERROR_STATE();
    Raiserror(@ErrorMessage, @ErrorSeverity, @ErrorState);
end catch;
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Priv