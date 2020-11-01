create table Vung(
	MaVung int primary key,
	TenVung nvarchar(100),
)
go
create table DiaDanh(
	MaDiaDanh int primary key,
	TenDiaDanh nvarchar(100),
	Img varchar(100),
	MoTa varchar(1000),
	MaVung int references Vung(Mavung)
)
go
create table ChiTietTour(
	MaChiTietTour int primary key,
	MoTaTour nvarchar(1000),
	PlaceVisit nvarchar(500),
)
create table Link(
	LinkCode varchar(10) primary key,
	LinkImg varchar(100),
	MaChiTietTour int references ChiTietTour(MaChiTietTour)
)
go
create table PhanHoi(
	MaPhanHoi int primary key,
	NoiDung nvarchar(1000),
)
go
create table ThanhVien(
	MaThanhVien int primary key,
	username varchar(10),
	pass varchar(20),
	email varchar(100)
)
go
create table KhachHang(
	MaKH int primary key,
	TenKH nvarchar(50),
	DiaChi nvarchar(50),
	Email varchar(30),
	SoDienThoai varchar(12) ,
	MaPhanHoi int references PhanHoi(MaPhanHoi),
	MaThanhVien int references ThanhVien(MaThanhVien),
)
go
create table Tour(
	MaTour int primary key,
	TenTour nvarchar(100),
	Mota nvarchar(100),
	Gia decimal(18, 0),
	MaDiaDanh int references DiaDanh(MaDiaDanh),
	MaChiTietTour int references ChiTietTour(MaChiTietTour),
	NumView int,
	LinkImage varchar(100),
	DiaDiem nvarchar(100),
	NumDay int,
)
go
create table PhieuDatTour(
	MaPhieuDat int primary key,
	MaKH int references KhachHang(MaKH),
	MaTour int references Tour(MaTour)
)
go
create table DanhGia(
	MaKH int references KhachHang(MaKH),
	MaTour int references Tour(MaTour),
	NumStar int,
	primary key (MaKH, MaTour)
)
go
create table Ngay(
	MaNgay int primary key,
	TenNgay nvarchar(10),
	TieuDe nvarchar(100),
	MaChiTietTour int references ChiTietTour(MaChiTietTour)
)
go
create table ChiTietNgay(
	MaChiTietNgay int primary key,
	NoiDung nvarchar(1000),
	GioHoatDong nvarchar(100),
	MaNgay int references Ngay(MaNgay)
)
go
create table DichVuTour(
	MaDichVuTour int primary key,
	TenDichVu nvarchar(100),
	MaChiTietTour int references ChiTietTour(MaChiTietTour)
)
go
create table DanhMucTour(
	MaDanhMucGoiTour int primary key,
	TenDanhMucGoiTour nvarchar(100),
	Mota nvarchar(2000),
	MaDiaDanh int references DiaDanh(MaDiaDanh)
)
go
--View
create view Vung_Diadanh as
select dd.MaDiaDanh, dd.TenDiaDanh, dd.Img, dd.MoTa,v.Mavung, v.TenVung  from Vung v join DiaDanh dd
on dd.Mavung=v.Mavung
create view ChiTietTour_ChiTietNgay_Ngay as
select n_ctn.MaChiTietTour,n_ctn.MaChiTietNgay,n_ctn.TieuDe,n_ctn.TenNgay,n_ctn.MaNgay,n_ctn.NoiDung,n_ctn.GioHoatDong,ctt.MoTaTour from (select n.MaNgay,n.TenNgay,n.TieuDe,n.MaChiTietTour,ctn.MaChiTietNgay,ctn.GioHoatDong,ctn.NoiDung from Ngay n join ChiTietNgay ctn on n.MaNgay=ctn.MaNgay) as n_ctn join ChiTietTour ctt on ctt.MaChiTietTour=n_ctn.MaChiTietTour
--Vung
insert Vung(MaVung,TenVung) values(1,'Northwest') --Tây Bắc Bộ
insert Vung(MaVung,TenVung) values(2,'Northeast') -- Đông Bắc Bộ
insert Vung(MaVung,TenVung) values(3,'Red River Delta') -- Đồng Bằng Sông Hồng
insert Vung(MaVung,TenVung) values(4,'North Central') -- Bắc Trung Bộ
insert Vung(MaVung,TenVung) values(5,'South Central Coast') -- Nam Trung Bộ
insert Vung(MaVung,TenVung) values(6,'Central Highlands') -- Tây Nguyên
insert Vung(MaVung,TenVung) values(7,'Southeast') -- Đông Nam Bộ
insert Vung(MaVung,TenVung) values(8,'Southwest') -- Tây Nam Bộ
--DiaDanh
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1000,'Phu Quoc','Des_Phuquoc.jpg','Phu Quoc is the largest island in Vietnam. Phu Quoc and nearby islands, along with the distant Tho Chu Islands, are part of Kien Giang Province as Phu Quoc District, the island has a total area of 574 square kilometres and a permanent population of approximately 103,000.Located in the Gulf of Thailand, the district of Phu Quoc includes the island proper and 21 smaller islets. Duong Dong town is located on the west coast, and is also the administrative and largest town on the island.',8)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1001,'Sa Pa','Des_Sapa.jpg','Sapa is a district-level town of Lao Cai Province in the Northwest region of Vietnam. As of 2018, the town had a population of 61,498.The town covers an area of 677 km². The town capital lies at Sa Pa.It is one of the main market towns in the area, where several ethnic minority groups such as Hmong, Dao (Yao), Xa Pho, and Tay live.',1)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1002,'Moc Chau','Des_Mocchau.jpg','Moc Chau is a rural district of Sơn La Province in the Northwest region of Vietnam.The district capital lies at Moc Chau.Moc Chau is popular with Vietnamese and international tourists for its hill tribes such as White & Black Thai People and Muong People, the green tea hills, Moc Chau milk, the natural landscape of Dai Yem waterfalls, Hill Pine and Orchid Garden flowers. It takes five hours driving, with a distance of 200 kilometres from Hanoi to Moc Chau.',1)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1003,'Ha Giang','Des_Hagiang.jpg','Ha Giang is a province in the Northeast region of Vietnam.It is located in the far north of the country, and contains Vietnam northernmost point. It shares a 270 km long border with Yunnan province of southern China, and thus is known as Vietnam final frontier. The province covers an area of 7,945.8 square kilometres and as of 2008 it had a population of 705,100 people.',1)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1004,'Ha Long','Des_Halong.jpg','Ha Long is the capital city and 1st-class provincial city of Quang Ninh Province, Vietnam. The name Ha Long means "descending dragon". The city was created in 1993, when the old capital, Hon Gai, was merged with Bai Chay – the main tourist area. The city mainly lies on Ha Long Bay. It is located at about 178 km (111 mi) east of Hanoi. The population in 2013 was 227,000',2)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1005,'Cat Ba','Des_Catba.jpg','Cat Ba Island is the largest of the 367 islands spanning 260 km2 (100 sq mi) that comprise the Cat Ba Archipelago, which makes up the southeastern edge of Lan Ha Bay in Northern Vietnam. Cat Ba island has a surface area of 285 km2 (110 sq mi) and maintains the dramatic and rugged features of Ha Long Bay.',2)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1006,'Phong Nha Ke Bang','Des_PNKB.jpg','Phong Nha-Ke Bang is a national park and UNESCO World Heritage Site in the Bố Trạch and Minh Hóa districts of central Quang Binh Province in the North Central Coast region of Vietnam, about 500 km south of Hanoi. The park borders the Hin Namno Nature Reserve in Khammouane Province, Laos to the west and 42 km east of the South China Sea from its borderline point. Phong Nha–Ke Bang National Park is situated in a limestone zone of 2,000 km2 in Vietnamese territory and borders another limestone zone of 2,000 km2 of Hin Namno in Laotian territory. The core zone of this national park covers 857.54 km2 and a buffer zone of 1,954 km',4)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1007,'Thua Thien Hue','Des_Hue.jpg','Thua Thien Hue is a province in the North Central Coast region of Vietnam, approximately in the centre of the country. It borders Quang Tri Province to the north and Da Nang to the south, Laos to the west and the East Sea to the east. The province has 128 km of coastline, 22,000 ha of lagoons and over 200,000 ha of forest. There is an extensive complex of imperial tombs and temples in Hue.',4)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1008,'Da Nang','Des_Danang.jpg','Da Nang is the commercial and educational centre of Central Vietnam and is the largest city in the region. It has a well-sheltered, easily accessible port, and its location on National Route 1A and the North–South Railway makes it a transport hub. It is within 100 km (62 mi) of several UNESCO World Heritage Sites, including the Imperial City of Hue, the Old Town of Hoi An, and the My Son ruins. The city was known as Cua Han during early Dai Viet settlement, and as Tourane (or Turon) during French colonial rule.',5)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1009,'Khanh Hoa','Des_KhanhHoa.jpg','Khanh Hoa is a province of Vietnam located in the South Central Coast. It has a population of 1,147,000 and spans an area of 5,197 km². Its capital is Nha Trang. Khanh Hoa is the site of Bao Dai summer home, the Pasteur Institute of Nha Trang, the Institute of Oceanography, the Institute of Vaccines and Biological Substances, and was headquarters of the US Army Special Forces ("the Green Berets") during the Vietnam War in the late 1950s and 1960s. Cam Ranh Bay port is on land closest to a deep sea drop in Vietnam - the best site for submarine bases in Vietnam. An ancient temple of Champa is on the north side of Nha Trang.',5)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1010,'Da Lat','Des_Dalat.jpg','Da Lat is the capital of Lam Dong Province and the largest city of Central Highlands region. The city is located 1,500m  above sea level on the Langbian Plateau. Da Lat is one of the most popular tourist destinations in Vietnam.Da Lat specific sights are pine woods and twisting roads full of marigold and mimosa blossom in the winter. The city temperate weather stands in contrast to Vietnam otherwise tropical climate that no other city in the country has. Mist covering the valleys almost year-round leads to its name "City of Eternal Spring".',6)
INSERT INTO DiaDanh(MaDiaDanh,TenDiaDanh,Img,MoTa,Mavung) VALUES(1011,'Ba Ria Vung Tau','Des_Vungtau.jpg','Ba Ria Vung Tau is a province of Vietnam. It is located on the coast of the country Southeast region. It also includes the Con Dao islands, located some distance off Vietnam southeastern coast. From 1954 to 1975, this province belonged to South Vietnam with the name Phuoc Tuy.',7)
--ChiTietTour
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2000,'Some Place','Ha Giang is a large area, you need to spend a few days here to get the best out of it. If you are in for an adventure, we recommend a private motorbike tour or rent a motorbike with a driver. For those travellers who prefer more comfort but don’t want to miss the spectacular views, we arrange tours by private car and driver. We can also arrange treks for you if you decide to travel Ha Giang on your own. Of course, your private guide will accompany you along the way!')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2001,'Some Place','Book your personalized tour with us and get to know the beautiful scenery and culture of the Ha Giang Province. On this 2 day tour you will visit various small towns, along a breathtaking route through Ha Giang.You have the option to sleep in a homestay or in a hotel. We provide friendly English speaking guides, who will tell you more about the area along the way. There will be plenty of stops to take beautiful photos. It is possible to do the tour by motorbike or car, whichever you prefer.')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2002,'Some Place','The remote areas of Ha Giang offer travelling experiences like no other, the cultural diversity and uniquely beautiful landscapes remain pure and unspoilt by modern day trappings. This tour gives you the chance to take in the highlights of this remarkable region, making the most of your time by staying with local families to maximise your cultural discovery')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2003,'Some Place','If you are looking to visit the northeastern region of Vietnam, then consider a trip to Ha Giang, where the stunning terraced rice fields, the majestic mountains, and the local bustling fairs are plenty. You will be in awe of how breathtaking nature can be at Quan Ba Twin Mountain and Dong Van Karst Plateau Geopark.The adventure then will take you next to Ma Pi Leng Pass, one of the four greatest passes in northern Vietnam. Conquering this pass is a one-of-a-kind experience that you will not forget! If you wonder why Ha Giang is a must-visit in Vietnam, then join this tour and find out yourself!')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2004,'Some Place','The Ma Pi Leng Pass is Vietnam’s final frontier and is dubbed the Great Wall of Viet Nam, situated between Dong Van and Meo Vac. An area of outstanding nature beauty and geological significant. the 20km long wingding road of happiness has many sharp turn 2000m high mountain and incredible view. Standing on Ma Pi Leng’s top point and outstretch your arms, you will seem like you are flying into the skies. Indeed, the harmonious beauty of ground, sky, and mountainous scenes may steal the heart of any tourists')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2005,'Some Place','Unique 3 days 2 nights tours to Ha Long Bay with First travel is the best choice for you. Our classic itinerary with a perfect combination suite for all of traveler we will not only bring you the most top attraction in Bai Tu Long such as: Cap la. Tra San, Cong Dam, Thien Canh Son cave and Vung Vieng floating village but also take you deep into natural wonderful with various amazing activities. Let’s come to First Travel to make your trip more experience ')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2006,'Some Place','Halong Bay, the magnificent World Heritage listed destination, with its thousand islands rising from the emerald waters of the Gulf of Tonkin. Ha Long Bay is an excellent example of a Karst landscape created by a complex chain reaction over millions of years of geological movement. Let us take you back in time on a fascinating relaxing journey through the Red River Delta to the World Heritage Site of Halong Bay')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2007,'Some Place','Ha Long Bay 1 Day trip is best idea for your, if you have don’t’ much time to travel. This full day trip is a perfect way to spending as much time  to enjoy  this wondrous beauty. The First travel  will bring to you the best time and sure that this is one unforgettable day')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2008,'Some Place','3 days 2 nights Oasis Classic Cruise and Ninh Binh is the best idea for your traveling in Vietnam. The First travel but only give you have a chance to discover wonderful landscape Ha Long Bay – one of the Word Heritage and Ninh Binh – the old capital, but also know more about of cultural and history of Vietnam. Let’s coming with us to make your trip more best experience')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2009,'Some Place','On this trip you will trek through Muong Hoa valley surrounded by huge rice terraces. You will have chance to know about how the local grow and harvest rice in this kind of topographic. Moreover, Bac Ha fair still retains its pristine character and cultural identity of the Northwest highlanders as an interesting experience for visitors.')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2010,'Some Place','Fansipan is the highest mountain in Vietnam, also the highest among the three Indochina countries, so it was dubbed the " Roof of Indochina " in the Hoang Lien Son mountain range, about 9 km southwest of Sapa town. On this trip you will conquer this mount with the heigh of 3147m to experience the “above the cloud” feeling.')
insert into ChiTietTour(MaChiTietTour,PlaceVisit,MoTaTour) values(2011,'Some Place','Rushed of time but desired for a unique feeling of the peaceful rumors of Mai Chau and Moc Chau Land but that could be packed in 03 Day Valley Retreat.')
--Link
insert into Link(LinkCode,LinkImg,MaChiTietTour) values(1,'DesHCM.jpg',2000)
insert into Link(LinkCode,LinkImg,MaChiTietTour) values(2,'DesNinhBinh.jpg',2000)
insert into Link(LinkCode,LinkImg,MaChiTietTour) values(3,'DesPhuQuoc.jpg',2000)
insert into Link(LinkCode,LinkImg,MaChiTietTour) values(4,'DesDaNang.jpg',2000)
insert into Link(LinkCode,LinkImg,MaChiTietTour) values(5,'DesVungTau.jpg',2000)
insert into Link(LinkCode,LinkImg,MaChiTietTour) values(6,'DesHue.jpg',2000)
--PhanHoi
insert into PhanHoi(MaPhanHoi,NoiDung) values(3001,'This tour is so wonderfull')
--ThanhVien
insert into ThanhVien(MaThanhVien,username,pass,email) values(1,'Dinh Dai','matkhau1','nguyendinhdai@gmail.com')
insert into ThanhVien(MaThanhVien,username,pass,email) values(2,'Ba Tuyen','matkhau1','thaibatuyen@gmail.com')
insert into ThanhVien(MaThanhVien,username,pass,email) values(3,'Trong Linh','matkhau1','phamtronglinh@gmail.com')
insert into ThanhVien(MaThanhVien,username,pass,email) values(4,'Duc Anh','matkhau1','duongducanh@gmail.com')
insert into ThanhVien(MaThanhVien,username,pass,email) values(0,'admin','admin','admin@gmail.com')
--KhachHang
insert into KhachHang(MaKH,TenKH) values(1,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(2,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(3,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(4,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(5,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(6,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(7,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(8,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(9,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(10,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(11,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(12,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(13,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(14,N'Phạm Trọng Linh')
insert into KhachHang(MaKH,TenKH) values(15,N'Phạm Trọng Linh')

--Tour
insert into Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumView,DiaDiem,LinkImage,NumDay) values(3000,'Three Days In Phu Quoc','Some text to describe this tour',1500,1000,2006,1200,'Kien Giang, Viet Nam','images/tour/tour-3.jpg',3)
insert into Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumView,DiaDiem,LinkImage,NumDay) values(3001,'A Peaceful Beach - Vung Tau','Some text to describe this tour',2000,1011,2005,1400,'Vung Tau, Viet Nam','images/tour/tour-4.jpg',4)
insert into Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumView,DiaDiem,LinkImage,NumDay) values(3002,'BaNa - way to heaven','Some text to describe this tour',3000,1008,2004,600,'Da Nang, Viet Nam','images/tour/tour-5.jpg',5)
insert into Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumView,DiaDiem,LinkImage,NumDay) values(3003,'Explore Cave in Phong Nha','Some text to describe this tour',1700,1006,2003,300,'Quang Binh, Viet Nam','images/tour/tour-6.jpg',2)
insert into Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumView,DiaDiem,LinkImage,NumDay) values(3004,'Tour for group in Sapa','Some text to describe this tour',2100,1001,2002,200,'Lao Cai, Viet Nam','images/tour/tour-7.jpg',3)
insert into Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumView,DiaDiem,LinkImage,NumDay) values(3005,'Autumn In Ha Noi ','Some text to describe this tour',2900,1002,2001,3000,'Ha Noi, Viet Nam','images/tour/tour-8.jpg',1)
insert into Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumView,DiaDiem,LinkImage,NumDay) values(3006,'Be Love With Nha Trang','Some text to describe this tour',1500,1009,2000,545,'Quang Ninh, Viet Nam','images/tour/tour-2.jpg',6)
insert into Tour(MaTour,TenTour,Mota,Gia,MaDiaDanh,MaChiTietTour,NumView,DiaDiem,LinkImage,NumDay) values(3007,'Family Tour In Ha Long Bay','Some text to describe this tour',1500,1004,2006,1000,'Quang Ninh, Viet Nam','images/tour/tour-1.jpg',3)
--PhieuDatTour
--DanhGia

insert into DanhGia(MaKH,MaTour,NumStar) values(1,3000,3)
insert into DanhGia(MaKH,MaTour,NumStar) values(2,3000,3)
insert into DanhGia(MaKH,MaTour,NumStar) values(3,3000,3)
insert into DanhGia(MaKH,MaTour,NumStar) values(4,3000,3)
insert into DanhGia(MaKH,MaTour,NumStar) values(1,3001,4)
insert into DanhGia(MaKH,MaTour,NumStar) values(2,3001,4)
insert into DanhGia(MaKH,MaTour,NumStar) values(3,3001,4)
insert into DanhGia(MaKH,MaTour,NumStar) values(4,3001,4)
insert into DanhGia(MaKH,MaTour,NumStar) values(1,3002,5)
insert into DanhGia(MaKH,MaTour,NumStar) values(2,3002,5)
insert into DanhGia(MaKH,MaTour,NumStar) values(3,3002,5)
insert into DanhGia(MaKH,MaTour,NumStar) values(4,3002,5)
insert into DanhGia(MaKH,MaTour,NumStar) values(1,3003,3)
insert into DanhGia(MaKH,MaTour,NumStar) values(2,3003,3)
insert into DanhGia(MaKH,MaTour,NumStar) values(3,3003,3)
insert into DanhGia(MaKH,MaTour,NumStar) values(4,3003,3)
insert into DanhGia(MaKH,MaTour,NumStar) values(1,3004,4)
insert into DanhGia(MaKH,MaTour,NumStar) values(2,3004,4)
insert into DanhGia(MaKH,MaTour,NumStar) values(3,3004,4)
insert into DanhGia(MaKH,MaTour,NumStar) values(4,3004,4)
insert into DanhGia(MaKH,MaTour,NumStar) values(1,3005,2)
insert into DanhGia(MaKH,MaTour,NumStar) values(2,3005,2)
insert into DanhGia(MaKH,MaTour,NumStar) values(3,3005,2)
insert into DanhGia(MaKH,MaTour,NumStar) values(4,3005,2)
insert into DanhGia(MaKH,MaTour,NumStar) values(1,3006,5)
insert into DanhGia(MaKH,MaTour,NumStar) values(2,3006,5)
insert into DanhGia(MaKH,MaTour,NumStar) values(3,3006,5)
insert into DanhGia(MaKH,MaTour,NumStar) values(4,3006,5)
insert into DanhGia(MaKH,MaTour,NumStar) values(1,3007,2)
insert into DanhGia(MaKH,MaTour,NumStar) values(2,3007,2)
insert into DanhGia(MaKH,MaTour,NumStar) values(3,3007,2)
insert into DanhGia(MaKH,MaTour,NumStar) values(4,3007,2)
--Ngay
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4001,'Ngày 1',N'HÀ NỘI –TUẦN CHÂU – BƠI TẠI KHU AO ẾCH ( Ăn trưa, tối )',2000)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4002,'Ngày 2',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2000)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4003,'Ngày 1',N'HÀ NỘI –TUẦN CHÂU – BƠI TẠI KHU AO ẾCH ( Ăn trưa, tối )',2001)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4004,'Ngày 2',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2001)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4005,'Ngày 1',N'HÀ NỘI –TUẦN CHÂU – BƠI TẠI KHU AO ẾCH ( Ăn trưa, tối )',2002)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4007,'Ngày 2',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2002)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4008,'Ngày 1',N'HÀ NỘI –TUẦN CHÂU – BƠI TẠI KHU AO ẾCH ( Ăn trưa, tối )',2003)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4009,'Ngày 2',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2003)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4010,'Ngày 1',N'HÀ NỘI –TUẦN CHÂU – BƠI TẠI KHU AO ẾCH ( Ăn trưa, tối )',2004)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4011,'Ngày 2',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2004)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4012,'Ngày 1',N'HÀ NỘI –TUẦN CHÂU – BƠI TẠI KHU AO ẾCH ( Ăn trưa, tối )',2005)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4013,'Ngày 2',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2005)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4014,'Ngày 1',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2006)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4015,'Ngày 1',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2007)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4016,'Ngày 1',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2008)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4017,'Ngày 1',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2009)
insert into Ngay(MaNgay,TenNgay,TieuDe,MaChiTietTour) values(4018,'Ngày 1',N'TAI CHI – THĂM HANG SÁNG,TỐI – HÀ NỘI (Ăn Sáng, trưa)',2010)
--ChiTetNgay
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50001,4001,'8:00',N'Xe của tàu đón khách tại Hà Nội đi đảo Tuần Châu – Hạ Long.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50002,4001,'11:00',N'Tàu cao tốc đưa Quý khách từ Tuần Châu đến khu vực bến Gia Luận. Quý khách được trải nghiệm vẻ đẹp kỳ quan thiên nhiên của Vịnh Hạ Long và Lan Hạ.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50003,4001,'11.45 – 12:00',N'Quý khách lên tàu thưởng thức đồ uống chào mời. Quản lý tàu cùng Hướng dẫn viên sẽ giới thiệu về lịch trình chi tiết cùng các hướng dẫn an toàn trên tàu. Sau đó quý khách nhận phòng, nghỉ ngơi và chuẩn bị ăn trưa')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50004,4001,'12:00 – 12:30 ',N'Quý khách ăn trưa với những món hải sản thơm ngon hấp dẫn được chế biến và trang trí đẹp mắt bởi đầu bếp tiêu chuẩn 5 sao. Quý khách vừa ăn trưa vừa thưởng ngọan phong cảnh hùng vĩ khi qua những hòn đảo lớn nhỏ như hòn con Vịt, hòn Ngón Tay,…')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50005,4001,'13:00 - 16:00',N'Quý khách nghỉ ngơi, hít thở không khí trong lành. Tàu đưa Quý khách tới khu vực Ao Ếch, Quý khách có thể lựa chọn tự do bơi lội hoặc tự mình chèo thuyền kayak để cảm nhận vẻ đẹp Vịnh Lan Hạ theo một cách rất riêng.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50006,4001,'16:15 - 18:00',N'Tàu đưa Quý khách tới điểm ngủ đêm. Trên đường, Quý khách vừa ngắm cảnh hoàng hôn trên vịnh vừa tham gia bữa tiệc rượu và hoa quả cùng giao lưu, làm quen với những người bạn mới hoặc thư giãn boong tàu')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50007,4001,'18:00 - 19:00',N'Quý khách tự do nghỉ ngơi, chơi golf hay bơi tại bể bơi bốn mùa trên tàu.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50008,4001,'19:00',N'Quý khách thưởng thức bữa tối BBQ trong khung cảnh lãng mạn xung quanh bể bơi bốn mùa.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50009,4001,'19:00 - 21:00',N'Quý khách thưởng thức bữa tối BBQ trong khung cảnh lãng mạn xung quanh bể bơi bốn mùa.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50010,4001,'21:00',N'Quý khách ngủ đêm trên tàu.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50011,4002,'06:30',N'Quý khách tham gia buổi tập thể dục dưỡng sinh (Taichi) trên sundeck, ngắm bình minh trong không khí trong lành và khung cảnh thơ mộng trên Vịnh Lan Hạ, nạp thêm năng lượng cho một ngày mới')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50012,4002,'07:00 – 08:00', N'Quý khách ăn sáng')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50013,4002,'08:00', N'Tàu tiếp tục hành trình tới Hang Sáng & Tối. Quý khách tự do nghỉ ngơi. Tới Hang Sáng & Tối, quý khách có thể lựa chọn tự mình chèo thuyền kayak hoặc ngồi trên thuyền nan do người dân địa phương chèo, thăm và khám phá vẻ đẹp hoang sơ nơi đây.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50014,4002,'09:30', N'Quý khách làm thủ tục trả phòng')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50015,4002,'10:00 ',N'Quý khách tham gia lớp học chế biến và trang trí món nem truyền thống của Việt Nam cũng như cách cắt tỉa hoa quả.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50016,4002,'10:30', N'Quý khách thưởng thức bữa trưa set menu với nhiều món mới, món đặc trưng của địa phương.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50017,4002,'11:50 – 12:00', N'Tàu cập cảng Tuần Châu kết thúc hành trình trên vịnh, xe đưa Quý khách quay trở về Hà Nội.')
insert into ChiTietNgay(MaChiTietNgay,MaNgay,GioHoatDong,NoiDung) values(50018,4002,N'Lưu ý',N'Tùy thuộc vào tình huống vận hành cụ thể, lịch trình có thể thay đổi mà không có sự báo trước. Wi-Fi có sẵn trong khu nhà hàng và quầy bar, nhưng kết nối có thể bị giới hạn do địa lý của Vịnh Hạ Long – Lan Hạ. Xin trân trọng cảm ơn và mong quý khách thông cảm.')
 --DanhMucTour
 insert into DanhMucTour(MaDanhMucGoiTour,TenDanhMucGoiTour,MaDiaDanh,Mota) values(1,'HOW TO BOOK A TOUR',1000,'There are three ways to plan and book a trip:<br>
1. Get a customized tour planned and booked by a travel professional. Travel independently on your own schedule.
<br>2. Book a group tour. Join an escorted group tour with a fixed departure date.
<br>3. Plan and book a trip yourself.
<br>The First Travel offers the best solution for a customized tour by matching you with top travel specialists who plan and book the trip for you. Our travel agency division, Marageti, specializes in helping you book an escorted group tour. There is no extra cost to you for either service.
<br>Custom Tours
<br>A customized tour is one that is planned by a travel specialist according to your specific interests, preferences, and schedule. Whether you desire a family-friendly adventure or a romantic getaway, each of the accommodations, activities, and destinations is tailored to your preferences. The knowledge and experience of your travel specialist makes a big difference. Zicasso has spent thousands of hours vetting the best travel partners. We act as a referral service, matching you with specialists that best meet your goals and priorities.
<br>Escorted Group Tours
<br>A group tour offers the advantage of convenience at a great value. The schedule is fixed, the itinerary is pre-planned, and a dedicated tour director travels with the group throughout the trip. A group tour can be 30 - 50% less expensive than an equivalent customized tour. Out of the many hundreds of group tours, how do you select the right one for you? Our travel agency division, Marageti, has sales agents who specialize in helping travelers weigh the pros and cons of each group tour. We give you personalized recommendations to find the best tour for you.
<br>Goals and Priorities
<br>What are your goals and priorities for the trip? These should drive your decision for either a customized tour or a fixed departure group tour. We are here to help you make the right decisions to make your dream trip a reality.')
 insert into DanhMucTour(MaDanhMucGoiTour,TenDanhMucGoiTour,MaDiaDanh,Mota) values(2,'MUST SEE DESTINATION',1000,'some text to describe')
 insert into DanhMucTour(MaDanhMucGoiTour,TenDanhMucGoiTour,MaDiaDanh,Mota) values(3,'SPECIAL INTERESTS AND ACTIVITIES',1000,'Ha Long Bay is one of the top destination travel in Norther Vietnam. It is recognized as a UNESCO Word Heritage Site, and more famous news in the Word said :” Ha Long Bay one of the top wonderful landscape natural in the world”<br>Cat ba island belongs to Hai Phong city about 10kms southeast of Ha Long bay, 30 km form city center of Hai Phong. Cat Ba is the largest island of Cat ba which is 367 island on the water of Lan Ha Bay. Come to Cat Ba visitors will have a chance to enjoy the wonder of nature .')
 insert into DanhMucTour(MaDanhMucGoiTour,TenDanhMucGoiTour,MaDiaDanh,Mota) values(4,'BEST TIME TO TRAVEL',1000,'some text to describe')
 insert into DanhMucTour(MaDanhMucGoiTour,TenDanhMucGoiTour,MaDiaDanh,Mota) values(5,'TRANSPORTATION',1000,'some text to describe')
 insert into DanhMucTour(MaDanhMucGoiTour,TenDanhMucGoiTour,MaDiaDanh,Mota) values(6,'TRAVEL CONSIDERATION',1000,'some text to describe')
 --DichVuTour
 insert into DichVuTour(MaDichVuTour,MaChiTietTour,TenDichVu) values(1,2000,'08 hour for cycling & kayaking')
 insert into DichVuTour(MaDichVuTour,MaChiTietTour,TenDichVu) values(2,2000,'Entrance fee')
 insert into DichVuTour(MaDichVuTour,MaChiTietTour,TenDichVu) values(3,2000,'Private boat')
 insert into DichVuTour(MaDichVuTour,MaChiTietTour,TenDichVu) values(4,2000,'Lunch on Boat')
 insert into DichVuTour(MaDichVuTour,MaChiTietTour,TenDichVu) values(5,2000,'01 bottle of mineral water')
 insert into DichVuTour(MaDichVuTour,MaChiTietTour,TenDichVu) values(6,2000,'Single or double bicycle')
 insert into DichVuTour(MaDichVuTour,MaChiTietTour,TenDichVu) values(7,2000,'Shuttle bus')
 insert into DichVuTour(MaDichVuTour,MaChiTietTour,TenDichVu) values(8,2000,'English speaking guide​')


