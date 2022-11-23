﻿SELECT IIF(LUONG>=LUONGTB,'KHONG TANG LUONG','TANG LUONG')
AS THUONG,TENNV, LUONG,LUONGTB FROM 
(select TENNV,LUONG, LUONGTB FROM NHANVIEN,
(select PHG, avg(LUONG) as 'LUONGTB'FROM NHANVIEN GROUP BY PHG) AS TAMP
WHERE NHANVIEN.PHG =TAMP.PHG) AS ABCD

SELECT IIF(LUONG>=LUONGTB,'TRUONG PHONG','NHAN VIEN')
AS THUONG,TENNV, LUONG,LUONGTB FROM 
(select TENNV,LUONG, LUONGTB FROM NHANVIEN,
(select PHG, avg(LUONG) as 'LUONGTB'FROM NHANVIEN GROUP BY PHG) AS TAMP
WHERE NHANVIEN.PHG =TAMP.PHG) AS ABCD

SELECT IIF(PHAI=N'NAM','MR..','MS..')+TENNV AS TEN FROM NHANVIEN


/*0<luong<25000 thì đóng 10% tiền lương
o 25000<luong<30000 thì đóng 12% tiền lương
o 30000<luong<40000 thì đóng 15% tiền lương
o 40000<luong<50000 thì đóng 20% tiền lương
o Luong>50000 đóng 25% tiền lương */

SELECT TENNV,LUONG,THUE= CASE
WHEN LUONG BETWEEN 0 AND 25000 THEN LUONG*0.1
WHEN LUONG BETWEEN 25000 AND 30000 THEN LUONG*0.12
WHEN LUONG BETWEEN 30000 AND 40000 THEN LUONG*0.15
WHEN LUONG BETWEEN 40000 AND 50000 THEN LUONG*0.20
WHEN LUONG>=50000 THEN LUONG*0.25
ELSE 0 END
FROM NHANVIEN


/*➢ Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn.*/
SELECT *FROM NHANVIEN
DECLARE @DDD INT=2;
WHILE @DDD <(SELECT COUNT (MANV) FROM NHANVIEN)
  BEGIN
   SELECT * FROM NHANVIEN WHERE CAST(MANV AS INT)=@DDD
   SET @DDD=@DDD+2;
   END