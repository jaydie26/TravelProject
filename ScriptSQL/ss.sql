
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

create table Link(
	LinkCode varchar(10) primary key,
	LinkImg varchar(100),
	MaChiTietTour int references ChiTietTour(MaChiTietTour)
)
go
alter table tour add NumStar int, NumView int, Place varchar(100)
go
alter table tour add LinkImage varchar(100)
go
alter table tour add NumDay INT
go
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
go
create view Tour_Diadanh as
select t.MaTour, t.TenTour, t.Gia, t.MaChiTietTour, t.MaDiaDanh, t.NumStar, t.NumView, t.Place, t.LinkImage, t.NumDay, dd.TenDiaDanh  from Tour t join DiaDanh dd
on t.MaDiaDanh=dd.MaDiaDanh

GO
ALTER TABLE ThanhVien ADD email VARCHAR(50)

INSERT INTO ThanhVien(MaThanhVien,username,pass,email) VALUES(1,'Dinh Dai','1','nguyendinhdai@gmail.com')
INSERT INTO ThanhVien(MaThanhVien,username,pass,email) VALUES(2,'Ba Tuyen','1','thaibatuyen@gmail.com')
INSERT INTO ThanhVien(MaThanhVien,username,pass,email) VALUES(0,'admin','admin','admin@gmail.com')


ALTER TABLE dbo.DiaDanh ADD Img VARCHAR(50)
ALTER TABLE dbo.DiaDanh ADD MoTa VARCHAR(5000)

INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2001,'Sa Pa','Des_Sapa.jpg','Sapa is a district-level town of Lao Cai Province in the Northwest region of Vietnam. As of 2018, the town had a population of 61,498.The town covers an area of 677 km². The town capital lies at Sa Pa.It is one of the main market towns in the area, where several ethnic minority groups such as Hmong, Dao (Yao), Xa Pho, and Tay live.')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2002,'Moc Chau','Des_Mocchau.jpg','Moc Chau is a rural district of Sơn La Province in the Northwest region of Vietnam.The district capital lies at Moc Chau.Moc Chau is popular with Vietnamese and international tourists for its hill tribes such as White & Black Thai People and Muong People, the green tea hills, Moc Chau milk, the natural landscape of Dai Yem waterfalls, Hill Pine and Orchid Garden flowers. It takes five hours driving, with a distance of 200 kilometres from Hanoi to Moc Chau.')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2003,'Ha Giang','Des_Hagiang.jpg','Ha Giang is a province in the Northeast region of Vietnam.It is located in the far north of the country, and contains Vietnam northernmost point. It shares a 270 km long border with Yunnan province of southern China, and thus is known as Vietnam final frontier. The province covers an area of 7,945.8 square kilometres and as of 2008 it had a population of 705,100 people.')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2004,'Ha Long','Des_Halong.jpg','Ha Long is the capital city and 1st-class provincial city of Quang Ninh Province, Vietnam. The name Ha Long means "descending dragon". The city was created in 1993, when the old capital, Hon Gai, was merged with Bai Chay – the main tourist area. The city mainly lies on Ha Long Bay. It is located at about 178 km (111 mi) east of Hanoi. The population in 2013 was 227,000')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2005,'Cat Ba','Des_Catba.jpg','Cat Ba Island is the largest of the 367 islands spanning 260 km2 (100 sq mi) that comprise the Cat Ba Archipelago, which makes up the southeastern edge of Lan Ha Bay in Northern Vietnam. Cat Ba island has a surface area of 285 km2 (110 sq mi) and maintains the dramatic and rugged features of Ha Long Bay.')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2006,'Phong Nha Ke Bang','Des_PNKB.jpg','Phong Nha-Ke Bang is a national park and UNESCO World Heritage Site in the Bố Trạch and Minh Hóa districts of central Quang Binh Province in the North Central Coast region of Vietnam, about 500 km south of Hanoi. The park borders the Hin Namno Nature Reserve in Khammouane Province, Laos to the west and 42 km east of the South China Sea from its borderline point. Phong Nha–Ke Bang National Park is situated in a limestone zone of 2,000 km2 in Vietnamese territory and borders another limestone zone of 2,000 km2 of Hin Namno in Laotian territory. The core zone of this national park covers 857.54 km2 and a buffer zone of 1,954 km')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2007,'Thua Thien Hue','Des_Hue.jpg','Thua Thien Hue is a province in the North Central Coast region of Vietnam, approximately in the centre of the country. It borders Quang Tri Province to the north and Da Nang to the south, Laos to the west and the East Sea to the east. The province has 128 km of coastline, 22,000 ha of lagoons and over 200,000 ha of forest. There is an extensive complex of imperial tombs and temples in Hue.')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2008,'Da Nang','Des_Danang.jpg','Da Nang is the commercial and educational centre of Central Vietnam and is the largest city in the region. It has a well-sheltered, easily accessible port, and its location on National Route 1A and the North–South Railway makes it a transport hub. It is within 100 km (62 mi) of several UNESCO World Heritage Sites, including the Imperial City of Hue, the Old Town of Hoi An, and the My Son ruins. The city was known as Cua Han during early Dai Viet settlement, and as Tourane (or Turon) during French colonial rule.')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES (2009,'Khanh Hoa','Des_KhanhHoa.jpg','Khanh Hoa is a province of Vietnam located in the South Central Coast. It has a population of 1,147,000 and spans an area of 5,197 km². Its capital is Nha Trang. Khanh Hoa is the site of Bao Dai summer home, the Pasteur Institute of Nha Trang, the Institute of Oceanography, the Institute of Vaccines and Biological Substances, and was headquarters of the US Army Special Forces ("the Green Berets") during the Vietnam War in the late 1950s and 1960s. Cam Ranh Bay port is on land closest to a deep sea drop in Vietnam - the best site for submarine bases in Vietnam. An ancient temple of Champa is on the north side of Nha Trang.')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES( 2010,'Da Lat','Des_Dalat.jpg','Da Lat is the capital of Lam Dong Province and the largest city of Central Highlands region. The city is located 1,500m  above sea level on the Langbian Plateau. Da Lat is one of the most popular tourist destinations in Vietnam.Da Lat specific sights are pine woods and twisting roads full of marigold and mimosa blossom in the winter. The city temperate weather stands in contrast to Vietnam otherwise tropical climate that no other city in the country has. Mist covering the valleys almost year-round leads to its name "City of Eternal Spring".')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2011,'Ba Ria Vung Tau','Des_Vungtau.jpg','Ba Ria Vung Tau is a province of Vietnam. It is located on the coast of the country Southeast region. It also includes the Con Dao islands, located some distance off Vietnam southeastern coast. From 1954 to 1975, this province belonged to South Vietnam with the name Phuoc Tuy.')
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa) VALUES(2012,'Phu Quoc','Des_Phuquoc.jpg','Phu Quoc is the largest island in Vietnam. Phu Quoc and nearby islands, along with the distant Tho Chu Islands, are part of Kien Giang Province as Phu Quoc District, the island has a total area of 574 square kilometres and a permanent population of approximately 103,000.Located in the Gulf of Thailand, the district of Phu Quoc includes the island proper and 21 smaller islets. Duong Dong town is located on the west coast, and is also the administrative and largest town on the island.')

-- update 26/10----
Create table Vung
(
	Mavung int primary key not null,
	TenVung nvarchar(100)
)
ALTER TABLE Diadanh drop column Mavung
ALTER TABLE Diadanh ADD Mavung int
Insert into Vung(Mavung,TenVung) values(1,'Northwest')
Insert into Vung(Mavung,TenVung) values(2,'Northeast')
Insert into Vung(Mavung,TenVung) values(3,'North Centra')
Insert into Vung(Mavung,TenVung) values(4,'South Central Coast')
Insert into Vung(Mavung,TenVung) values(5,'Central Highlands')
Insert into Vung(Mavung,TenVung) values(6,'Southeast')
Insert into Vung(Mavung,TenVung) values(7,'Mekong River Delta')

INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2001,'Sa Pa','Des_Sapa.jpg','Sapa is a district-level town of Lao Cai Province in the Northwest region of Vietnam. As of 2018, the town had a population of 61,498.The town covers an area of 677 km². The town capital lies at Sa Pa.It is one of the main market towns in the area, where several ethnic minority groups such as Hmong, Dao (Yao), Xa Pho, and Tay live.',1)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2002,'Moc Chau','Des_Mocchau.jpg','Moc Chau is a rural district of Sơn La Province in the Northwest region of Vietnam.The district capital lies at Moc Chau.Moc Chau is popular with Vietnamese and international tourists for its hill tribes such as White & Black Thai People and Muong People, the green tea hills, Moc Chau milk, the natural landscape of Dai Yem waterfalls, Hill Pine and Orchid Garden flowers. It takes five hours driving, with a distance of 200 kilometres from Hanoi to Moc Chau.',2)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2003,'Ha Giang','Des_Hagiang.jpg','Ha Giang is a province in the Northeast region of Vietnam.It is located in the far north of the country, and contains Vietnam northernmost point. It shares a 270 km long border with Yunnan province of southern China, and thus is known as Vietnam final frontier. The province covers an area of 7,945.8 square kilometres and as of 2008 it had a population of 705,100 people.',4)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2004,'Ha Long','Des_Halong.jpg','Ha Long is the capital city and 1st-class provincial city of Quang Ninh Province, Vietnam. The name Ha Long means "descending dragon". The city was created in 1993, when the old capital, Hon Gai, was merged with Bai Chay – the main tourist area. The city mainly lies on Ha Long Bay. It is located at about 178 km (111 mi) east of Hanoi. The population in 2013 was 227,000',4)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2005,'Cat Ba','Des_Catba.jpg','Cat Ba Island is the largest of the 367 islands spanning 260 km2 (100 sq mi) that comprise the Cat Ba Archipelago, which makes up the southeastern edge of Lan Ha Bay in Northern Vietnam. Cat Ba island has a surface area of 285 km2 (110 sq mi) and maintains the dramatic and rugged features of Ha Long Bay.',2)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2006,'Phong Nha Ke Bang','Des_PNKB.jpg','Phong Nha-Ke Bang is a national park and UNESCO World Heritage Site in the Bố Trạch and Minh Hóa districts of central Quang Binh Province in the North Central Coast region of Vietnam, about 500 km south of Hanoi. The park borders the Hin Namno Nature Reserve in Khammouane Province, Laos to the west and 42 km east of the South China Sea from its borderline point. Phong Nha–Ke Bang National Park is situated in a limestone zone of 2,000 km2 in Vietnamese territory and borders another limestone zone of 2,000 km2 of Hin Namno in Laotian territory. The core zone of this national park covers 857.54 km2 and a buffer zone of 1,954 km',6)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2007,'Thua Thien Hue','Des_Hue.jpg','Thua Thien Hue is a province in the North Central Coast region of Vietnam, approximately in the centre of the country. It borders Quang Tri Province to the north and Da Nang to the south, Laos to the west and the East Sea to the east. The province has 128 km of coastline, 22,000 ha of lagoons and over 200,000 ha of forest. There is an extensive complex of imperial tombs and temples in Hue.',4)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2008,'Da Nang','Des_Danang.jpg','Da Nang is the commercial and educational centre of Central Vietnam and is the largest city in the region. It has a well-sheltered, easily accessible port, and its location on National Route 1A and the North–South Railway makes it a transport hub. It is within 100 km (62 mi) of several UNESCO World Heritage Sites, including the Imperial City of Hue, the Old Town of Hoi An, and the My Son ruins. The city was known as Cua Han during early Dai Viet settlement, and as Tourane (or Turon) during French colonial rule.',6)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES (2009,'Khanh Hoa','Des_KhanhHoa.jpg','Khanh Hoa is a province of Vietnam located in the South Central Coast. It has a population of 1,147,000 and spans an area of 5,197 km². Its capital is Nha Trang. Khanh Hoa is the site of Bao Dai summer home, the Pasteur Institute of Nha Trang, the Institute of Oceanography, the Institute of Vaccines and Biological Substances, and was headquarters of the US Army Special Forces ("the Green Berets") during the Vietnam War in the late 1950s and 1960s. Cam Ranh Bay port is on land closest to a deep sea drop in Vietnam - the best site for submarine bases in Vietnam. An ancient temple of Champa is on the north side of Nha Trang.',5)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES( 2010,'Da Lat','Des_Dalat.jpg','Da Lat is the capital of Lam Dong Province and the largest city of Central Highlands region. The city is located 1,500m  above sea level on the Langbian Plateau. Da Lat is one of the most popular tourist destinations in Vietnam.Da Lat specific sights are pine woods and twisting roads full of marigold and mimosa blossom in the winter. The city temperate weather stands in contrast to Vietnam otherwise tropical climate that no other city in the country has. Mist covering the valleys almost year-round leads to its name "City of Eternal Spring".',2)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2011,'Ba Ria Vung Tau','Des_Vungtau.jpg','Ba Ria Vung Tau is a province of Vietnam. It is located on the coast of the country Southeast region. It also includes the Con Dao islands, located some distance off Vietnam southeastern coast. From 1954 to 1975, this province belonged to South Vietnam with the name Phuoc Tuy.',1)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(2000,'Phu Quoc','Des_Phuquoc.jpg','Phu Quoc is the largest island in Vietnam. Phu Quoc and nearby islands, along with the distant Tho Chu Islands, are part of Kien Giang Province as Phu Quoc District, the island has a total area of 574 square kilometres and a permanent population of approximately 103,000.Located in the Gulf of Thailand, the district of Phu Quoc includes the island proper and 21 smaller islets. Duong Dong town is located on the west coast, and is also the administrative and largest town on the island.',7)

create view Vung_Diadanh as
select dd.MaDiaDanh, dd.TenDiaDanh, dd.Img, dd.MoTa,v.Mavung, v.TenVung  from Vung v join DiaDanh dd
on dd.Mavung=v.Mavung