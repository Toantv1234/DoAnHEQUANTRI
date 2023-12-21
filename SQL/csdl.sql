-- Tạo cơ sở dữ liệu
CREATE DATABASE QuanLyPhongKhamNhaKhoa_HQT;
GO
USE QuanLyPhongKhamNhaKhoa_HQT;
GO
-- Tạo bảng KhachHang
CREATE TABLE KhachHang (
    MaBN varchar(10) PRIMARY KEY,
    HoTen NVARCHAR(255),
    NgaySinh DATE,
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(20),
    MatKhau NVARCHAR(255),
	Ban bit
);
go
-- Tạo bảng NhaSi
create TABLE NhaSi (
    MaNhaSi varchar(10) PRIMARY KEY,
    HoTen NVARCHAR(255),
	SoDienThoai NVARCHAR(20),
    MatKhau NVARCHAR(255),
	lichlam nvarchar(MAX),
	Ban bit
);
go

-- Tạo bảng LichHen
CREATE TABLE LichHen (
    NgayGio DATETIME,
    MaBN varchar(10),
    MaNhaSi varchar(10),
	NhaSiDat bit, -- 1 :có 0: không
    FOREIGN KEY (MaBN) REFERENCES KhachHang(MaBN),
    FOREIGN KEY (MaNhaSi) REFERENCES NhaSi(MaNhaSi),
    --FOREIGN KEY (StaffID) REFERENCES NhanVien(StaffID)
);
go
-- Tạo bảng HoSoBenhNhan
CREATE TABLE HoSoBenhNhan (
	STT int ,
	DonThuoc varchar(10),
	MaBN varchar(10),
    NgayKham DATE,
    NhaSI varchar(10),
	MaNhaSi varchar(10),
	PhiKham float,
	DichVu nvarchar(MAX),
	PRIMARY KEY (STT,MaBN),
    FOREIGN KEY (MaNhaSi) REFERENCES NhaSi(MaNhaSi),
    FOREIGN KEY (MaBN) REFERENCES KhachHang(MaBN),
);
go
ALTER TABLE HoSoBenhNhan
ADD CONSTRAINT UQ_DonThuoc UNIQUE (DonThuoc);
go
-- Tạo bảng Thuoc
CREATE TABLE Thuoc (
    MaThuoc varchar(10) PRIMARY KEY,
    TenThuoc NVARCHAR(255),
    DonViTinh NVARCHAR(50),
    ChiDinh NVARCHAR(MAX),
    SoLuongTon INT,
    NgayHetHan DATE
);
go
CREATE TABLE DonThuoc(
	DonThuoc varchar(10), 
	MaThuoc varchar(10),
	PRIMARY KEY(DonThuoc, MaThuoc),
	FOREIGN KEY (DonThuoc) REFERENCES HoSoBenhNhan(DonThuoc),
	FOREIGN KEY (MaThuoc) REFERENCES Thuoc(MaThuoc)
)
go
-- (Optional) Tạo bảng LichHen_HoSoBenhNhan (Nếu mối quan hệ nhiều-nhiều)
--CREATE TABLE LichHen_HoSoBenhNhan (
--    AppointmentID INT,
--    RecordID INT,
--    PRIMARY KEY (AppointmentID, RecordID),
--    FOREIGN KEY (AppointmentID) REFERENCES LichHen(AppointmentID),
--    FOREIGN KEY (RecordID) REFERENCES HoSoBenhNhan(RecordID)
--);

-- (Optional) Tạo bảng LichHen_Thuoc (Nếu mối quan hệ nhiều-nhiều)
--CREATE TABLE LichHen_Thuoc (
--    AppointmentID INT,
--    MedicineID INT,
--    PRIMARY KEY (AppointmentID, MedicineID),
--    FOREIGN KEY (AppointmentID) REFERENCES LichHen(AppointmentID),
--    FOREIGN KEY (MedicineID) REFERENCES Thuoc(MedicineID)
--);
-- Tạo bảng QuanTriVien
CREATE TABLE NhanVien (
    MaNV char(10) PRIMARY KEY,
    HoTen NVARCHAR(255),
    MatKhau NVARCHAR(255)
);
