USE [master]
GO
/****** Object:  Database [TravelVietNam]    Script Date: 10/11/2020 10:43:23 PM ******/
CREATE DATABASE [TravelVietNam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelVietNam', FILENAME = N'D:\Ki1_nam4\Web\TravelVietNam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TravelVietNam_log', FILENAME = N'D:\Ki1_nam4\Web\TravelVietNam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TravelVietNam] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelVietNam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelVietNam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelVietNam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelVietNam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelVietNam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelVietNam] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelVietNam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TravelVietNam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelVietNam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelVietNam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelVietNam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelVietNam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelVietNam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelVietNam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelVietNam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelVietNam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TravelVietNam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelVietNam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelVietNam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelVietNam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelVietNam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelVietNam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravelVietNam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelVietNam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TravelVietNam] SET  MULTI_USER 
GO
ALTER DATABASE [TravelVietNam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelVietNam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelVietNam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelVietNam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TravelVietNam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TravelVietNam] SET QUERY_STORE = OFF
GO
USE [TravelVietNam]
GO
/****** Object:  Table [dbo].[ChiTietTour]    Script Date: 10/11/2020 10:43:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietTour](
	[MaChiTietTour] [int] NOT NULL,
	[MoTaTour] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaDanh]    Script Date: 10/11/2020 10:43:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaDanh](
	[MaDiaDanh] [int] NOT NULL,
	[TenDiaDanh] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDiaDanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/11/2020 10:43:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [varchar](30) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[MaPhanHoi] [int] NULL,
	[MaThanhVien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 10/11/2020 10:43:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaPhanHoi] [int] NOT NULL,
	[NoiDung] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatTour]    Script Date: 10/11/2020 10:43:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatTour](
	[MaPhieuDat] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[MaKH] [int] NULL,
	[MaTour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 10/11/2020 10:43:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaThanhVien] [int] NOT NULL,
	[username] [varchar](10) NULL,
	[pass] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 10/11/2020 10:43:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[MaTour] [int] NOT NULL,
	[TenTour] [nvarchar](100) NULL,
	[Mota] [nvarchar](100) NULL,
	[Gia] [decimal](18, 0) NULL,
	[MaDiaDanh] [int] NULL,
	[MaChiTietTour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ThanhVien] ([MaThanhVien], [username], [pass]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[ThanhVien] ([MaThanhVien], [username], [pass]) VALUES (2, N'dai', N'dai')
INSERT [dbo].[ThanhVien] ([MaThanhVien], [username], [pass]) VALUES (3, N'tuyen', N'tuyen')
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD FOREIGN KEY([MaPhanHoi])
REFERENCES [dbo].[PhanHoi] ([MaPhanHoi])
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
GO
ALTER TABLE [dbo].[PhieuDatTour]  WITH CHECK ADD FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[PhieuDatTour]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([MaChiTietTour])
REFERENCES [dbo].[ChiTietTour] ([MaChiTietTour])
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([MaDiaDanh])
REFERENCES [dbo].[DiaDanh] ([MaDiaDanh])
GO
USE [master]
GO
ALTER DATABASE [TravelVietNam] SET  READ_WRITE 
GO
create table Link(
	LinkCode varchar(10) primary key,
	LinkImg varchar(100),
	MaChiTietTour int references ChiTietTour(MaChiTietTour)
)
alter table tour add NumStar int, NumView int, Place varchar(100)
alter table tour add LinkImage varchar(100)
alter table tour add NumDay int
insert ChiTietTour(MaChiTietTour, MoTaTour) values(1000,'Some Text to describe this tour')
insert ChiTietTour(MaChiTietTour, MoTaTour) values(1001,'Some Text to describe this tour')
insert ChiTietTour(MaChiTietTour, MoTaTour) values(1002,'Some Text to describe this tour')
insert ChiTietTour(MaChiTietTour, MoTaTour) values(1003,'Some Text to describe this tour')
insert ChiTietTour(MaChiTietTour, MoTaTour) values(1004,'Some Text to describe this tour')
insert ChiTietTour(MaChiTietTour, MoTaTour) values(1005,'Some Text to describe this tour')
insert ChiTietTour(MaChiTietTour, MoTaTour) values(1006,'Some Text to describe this tour')
insert ChiTietTour(MaChiTietTour, MoTaTour) values(1007,'Some Text to describe this tour')
insert DiaDanh(MaDiaDanh,TenDiaDanh) values(2000,'Vinh Ha Long')
insert DiaDanh(MaDiaDanh,TenDiaDanh) values(2001,'Nha Trang Beach')
insert DiaDanh(MaDiaDanh,TenDiaDanh) values(2002,'Phu Quoc Island')
insert DiaDanh(MaDiaDanh,TenDiaDanh) values(2003,'Vung Tau Beach')
insert DiaDanh(MaDiaDanh,TenDiaDanh) values(2004,'Ba Na Hill')
insert DiaDanh(MaDiaDanh,TenDiaDanh) values(2005,'Phong Nha Cave')
insert DiaDanh(MaDiaDanh,TenDiaDanh) values(2006,'Sapa Town')
insert DiaDanh(MaDiaDanh,TenDiaDanh) values(2007,'Ha Noi city')
insert Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumStar,NumView,Place,LinkImage,NumDay) values(3002,'Three Days In Phu Quoc','Some text to describe this tour',1500,2002,1002,2,1200,'Kien Giang, Viet Nam','images/tour/tour-3.jpg',3)
insert Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumStar,NumView,Place,LinkImage,NumDay) values(3003,'A Peaceful Beach - Vung Tau','Some text to describe this tour',2000,2003,1003,3,1400,'Vung Tau, Viet Nam','images/tour/tour-4.jpg',4)
insert Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumStar,NumView,Place,LinkImage,NumDay) values(3004,'BaNa - way to heaven','Some text to describe this tour',3000,2004,1004,4,600,'Da Nang, Viet Nam','images/tour/tour-5.jpg',5)
insert Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumStar,NumView,Place,LinkImage,NumDay) values(3005,'Explore Cave in Phong Nha','Some text to describe this tour',1700,2005,1005,5,300,'Quang Binh, Viet Nam','images/tour/tour-6.jpg',2)
insert Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumStar,NumView,Place,LinkImage,NumDay) values(3006,'Tour for group in Sapa','Some text to describe this tour',2100,2006,1006,5,200,'Lao Cai, Viet Nam','images/tour/tour-7.jpg',3)
insert Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumStar,NumView,Place,LinkImage,NumDay) values(3007,'Autumn In Ha Noi ','Some text to describe this tour',2900,2007,1007,4,3000,'Ha Noi, Viet Nam','images/tour/tour-8.jpg',1)
insert Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumStar,NumView,Place,LinkImage,NumDay) values(3001,'Be Love With Nha Trang','Some text to describe this tour',1500,2001,1001,4,545,'Quang Ninh, Viet Nam','images/tour/tour-2.jpg',6)
insert Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumStar,NumView,Place,LinkImage,NumDay) values(3000,'Family Tour In Ha Long Bay','Some text to describe this tour',1500,2000,1000,5,1000,'Quang Ninh, Viet Nam','images/tour/tour-1.jpg',3)

create view Tour_Diadanh as
select t.MaTour, t.TenTour, t.Gia, t.MaChiTietTour, t.MaDiaDanh, t.NumStar, t.NumView, t.Place, t.LinkImage, t.NumDay, dd.TenDiaDanh  from Tour t join DiaDanh dd
on t.MaDiaDanh=dd.MaDiaDanh
