CREATE Database MusicologyWarehouse
GO

USE MusicologyWarehouse
GO

CREATE TABLE Branch
(
	Branch_ID int primary key,
	Branch_Name varchar(50),
	Branch_Floor_Size int,
	Branch_Phone varchar(50),
	Branch_Address varchar(50),
	Branch_Contact_Name varchar(50),
	Branch_City varchar(20)
); 

CREATE TABLE Customer
(
	Customer_Acc_No int primary key,
	Customer_Name varchar(50),
	Customer_Surname varchar(50),
	Customer_Phone varchar(50),
	Customer_Email varchar(50),
	Customer_Address varchar(50),
	Customer_City varchar(20)
); 

CREATE TABLE Invoice
(
	Invoice_Num int primary key,
	Branch_ID int references Branch(Branch_ID),
	Customer_Acc_No int references Customer(Customer_Acc_No),
	Invoice_date datetime
);

CREATE TABLE Album_Type
(
	[Type_ID] int primary key,
	Type_Desc varchar(50)
); 

CREATE TABLE Album_Price
(
	Price_ID int primary key,
	Price_Amount money,
	Price_Desc varchar(50)
);

CREATE TABLE Album_Category
(
	Category_ID int primary key,
	Category_Desc varchar(50)
);

CREATE TABLE Album
(
	Album_ISBN varchar(15) primary key,
	Album_Artist varchar(50),
	Album_Name varchar(50),
	Category_ID int references Album_Category(Category_ID),
	Album_Year int,
	Album_Run_Time datetime,
	[Type_ID] int references Album_Type([Type_ID]),
	Price_ID int references Album_Price(Price_ID)
);

CREATE TABLE Stock_Item
(
	Album_ISBN varchar(15) primary key references Album(Album_ISBN),
	Branch_ID int references Branch(Branch_ID),
	Stock_Total_Quantity int,
	Stock_Quantity_Sold int
); 

CREATE TABLE Invoice_Line
(
	Invoice_Num int references Invoice(Invoice_Num),
	Album_ISBN varchar(15)references Stock_Item(Album_ISBN),
	Purchase_Quantity int,
	Item_Unit_Price money,
	Constraint PK_Invoice_Line Primary Key (Invoice_Num, Album_ISBN)
);

INSERT into Album_Type VALUES (1, 'DVD')
INSERT into Album_Type VALUES (2, 'CD')


INSERT into Album_Price  VALUES (1, 126.0000, 'CD new release')
INSERT into Album_Price  VALUES (2, 99.0000, 'CD old')
INSERT into Album_Price  VALUES (3, 256.0000, 'DVD new release')
INSERT into Album_Price  VALUES (4, 156.0000, 'DVD old')
INSERT into Album_Price  VALUES (5, 99.0000, 'CD sale price')
INSERT into Album_Price  VALUES (6, 120.0000, 'DVD sale price')


INSERT into Album_Category  VALUES (1, 'Hip-Hop')
INSERT into Album_Category  VALUES (2, 'Opera')
INSERT into Album_Category  VALUES (3, 'Country Western')
INSERT into Album_Category  VALUES (4, 'Gospel')
INSERT into Album_Category  VALUES (5, 'Soul')
INSERT into Album_Category  VALUES (6, 'Reggae')
INSERT into Album_Category  VALUES (7, 'Blues')
INSERT into Album_Category  VALUES (8, 'Punk')
INSERT into Album_Category  VALUES (9, 'Kwaito')
INSERT into Album_Category  VALUES (10, 'Pop')


INSERT into Album VALUES ('0705617', 'Justin Timberlake', N'Justified', 10, 2006, CAST(0xFFFFFFFE000CE8B0 AS DateTime), 1, 3)
INSERT into Album VALUES ('0705631', 'Mariah Carrey', N'Butterfly', 10, 1999, CAST(0xFFFFFFFE00114DB0 AS DateTime), 2, 5)
INSERT into Album VALUES ('0705655', '2Pac', N'Me against the world', 1, 1991, CAST(0xFFFFFFFE000FA7D0 AS DateTime), 2, 2)
INSERT into Album VALUES ('0705679', 'Blink 182', N'All the small things', 8, 2000, CAST(0xFFFFFFFE00103470 AS DateTime), 2, 5)
INSERT into Album VALUES ('0705693', 'Britany Spears', N'Toxic', 10, 1999, CAST(0xFFFFFFFE0012F390 AS DateTime), 1, 3)
INSERT into Album VALUES ('0715605', 'Bob Marley', N'No woman no cry', 6, 1978, CAST(0xFFFFFFFE0011DA50 AS DateTime), 1, 6)
INSERT into Album VALUES ('0725609', 'Andrea Bocelli', N'Under the stars', 2, 2006, CAST(0xFFFFFFFE000FA7D0 AS DateTime), 1, 3)
INSERT into Album VALUES ('0745603', 'Skwatta Camp', N'Mkhukhu funkshen', 9, 2004, CAST(0xFFFFFFFE00149970 AS DateTime), 2, 1)
INSERT into Album VALUES ('0765607', 'BB King', N'Heart of the sailor', 7, 1998, CAST(0xFFFFFFFE000D2F00 AS DateTime), 2, 2)
INSERT into Album VALUES ('0785601', 'Dolly Parton', N'I don''t know', 3, 1992, CAST(0xFFFFFFFE0013C680 AS DateTime), 1, 4)

INSERT into Branch VALUES (1, 'Brooklyn', 250, '012-4603151', '79 Fesen Str', 'Jonathan', 'Johannesburg')
INSERT into Branch VALUES (2, 'Menlyn', 250, '012-3465678', '100 Lois Ave', 'Sam', 'Pretoria')
INSERT into Branch VALUES (3, 'Lynnwood', 75, '012-3616589', '2 Kings Highway', 'Phil Van DeVenter', 'Pretoria')
INSERT into Branch VALUES (11, 'Northridge', 125, '011-2547896', '58 Hans Strijdom drive', 'Kirstin Krauss', 'Polokwane')


INSERT into Stock_Item  VALUES ('0705617', 1, 300, 282)
--INSERT into Stock_Item  VALUES ('0705618', 2, 800, 782)
INSERT into Stock_Item  VALUES ('0705631', 1, 350, 340)
--INSERT into Stock_Item  VALUES ('0705632', 2, 400, 385)
INSERT into Stock_Item  VALUES ('0705655', 2, 600, 578)
INSERT into Stock_Item  VALUES ('0705679', 3, 550, 438)
INSERT into Stock_Item  VALUES ('0705693', 3, 200, 181)
INSERT into Stock_Item  VALUES ('0715605', 2, 150, 146)
--INSERT into Stock_Item  VALUES ('0715607', 3, 150, 141)
INSERT into Stock_Item  VALUES ('0725609', 1, 120, 116)
INSERT into Stock_Item  VALUES ('0745603', 1, 150, 132)
INSERT into Stock_Item  VALUES ('0765607', 2, 150, 147)
INSERT into Stock_Item  VALUES ('0785601', 2, 60, 57)
--INSERT into Stock_Item  VALUES ('0785602', 3, 50, 43)

INSERT into Customer VALUES (563001, 'Lazo', 'Karas', '012-4678765', 'Amanda@yahoo.com', '1 Lois Ave', 'Pretoria')
INSERT into Customer VALUES (563002, 'Mike', 'Theodorou', '012-6788765', 'Dean@yahoo.com', '67 Zena Str', 'Pretoria')
INSERT into Customer VALUES (563003, 'Stella', 'Van Rensburg', '011-9980123', 'Denise@yahoo.com', '14 Loop Str', 'Johannesburg')
INSERT into Customer VALUES (563004, 'Thembi', 'Madishe', '011-3465111', 'ben@tuks.com', '67 Marlboro Drive', 'Johannesburg')
INSERT into Customer VALUES (563005, 'Dario', 'Macagnano', '016-3222777', ' Dario@tuks.com', '113 Garob Ave', 'Polokwane')
INSERT into Customer VALUES (563006, 'Suzaan', 'Coetzee', '012-9981490', 'Suzaan@yahoo.com', '79 Hill Str', 'Pretoria')
INSERT into Customer VALUES (563007, 'Vincenzo', 'Bellomo', '011-8987655', 'Vincenzo@tuks.com', '1 Star Str', 'Johannesburg')
INSERT into Customer VALUES (563008, 'Liza', 'Kriek', '016-7897689', 'sam@yahoo.com', '56 Buite Str', 'Polokwane')
INSERT into Customer VALUES (563009, 'Nsoozi', 'Matongo', '012-6786123', 'jonathan@yahoo.com', '98 Brooklyn Weg', 'Pretoria')
INSERT into Customer VALUES (563010, 'Andrew', 'Suddards', '012-5675673', 'Andrew@tuks.com', '129 Bucks Drive', 'Pretoria')
INSERT into Customer VALUES (563011, 'Wilmar', 'Van Heerden', '011-3465671', 'Wilmar@tuks.com', '34 Sahara Ave', 'Johannesburg')

INSERT into Invoice VALUES (5, 1, 563002, CAST(0x0000986C00000000 AS DateTime))
INSERT into Invoice VALUES (6, 1, 563002, CAST(0x0000988300000000 AS DateTime))
INSERT into Invoice VALUES (7, 3, 563009, CAST(0x0000988E00000000 AS DateTime))
INSERT into Invoice VALUES (8, 2, 563005, CAST(0x0000989100000000 AS DateTime))
INSERT into Invoice VALUES (9, 1, 563003, CAST(0x0000989500000000 AS DateTime))
INSERT into Invoice VALUES (10, 2, 563002, CAST(0x0000989D00000000 AS DateTime))
INSERT into Invoice VALUES (11, 1, 563006, CAST(0x000098AD00000000 AS DateTime))
INSERT into Invoice VALUES (12, 3, 563010, CAST(0x000098B700000000 AS DateTime))
INSERT into Invoice VALUES (13, 3, 563011, CAST(0x000098BC00000000 AS DateTime))
INSERT into Invoice VALUES (14, 1, 563001, CAST(0x000098BE00000000 AS DateTime))
INSERT into Invoice VALUES (15, 2, 563008, CAST(0x000098C600000000 AS DateTime))
INSERT into Invoice VALUES (16, 2, 563005, CAST(0x000098C800000000 AS DateTime))
INSERT into Invoice VALUES (17, 2, 563002, CAST(0x000098C900000000 AS DateTime))
INSERT into Invoice VALUES (18, 3, 563007, CAST(0x000098D100000000 AS DateTime))
INSERT into Invoice VALUES (19, 1, 563011, CAST(0x000098D300000000 AS DateTime))
INSERT into Invoice VALUES (20, 2, 563001, CAST(0x000098D400000000 AS DateTime))


INSERT into Invoice_Line  VALUES (5, '0705631', 3, 99.0000)
INSERT into Invoice_Line  VALUES (5, '0705679', 1, 99.0000)
INSERT into Invoice_Line  VALUES (6, '0715605', 1, 120.0000)
INSERT into Invoice_Line  VALUES (6, '0745603', 1, 126.0000)
INSERT into Invoice_Line  VALUES (6, '0765607', 1, 99.0000)
INSERT into Invoice_Line  VALUES (7, '0705617', 1, 256.0000)
INSERT into Invoice_Line  VALUES (7, '0705631', 1, 99.0000)
INSERT into Invoice_Line  VALUES (8, '0705655', 1, 99.0000)
INSERT into Invoice_Line  VALUES (7, '0705655', 1, 0.0000)
INSERT into Invoice_Line  VALUES (9, '0705693', 1, 256.0000)
INSERT into Invoice_Line  VALUES (10,'0785601', 2, 156.0000)
INSERT into Invoice_Line  VALUES (11, '0765607', 1, 99.0000)
INSERT into Invoice_Line  VALUES (11, '0715605', 2, 120.0000)
INSERT into Invoice_Line  VALUES (11, '0725609', 1, 256.0000)
INSERT into Invoice_Line  VALUES (12, '0705679', 1, 99.0000)
INSERT into Invoice_Line  VALUES (12, '0725609', 1, 256.0000)
INSERT into Invoice_Line  VALUES (13, '0765607', 1, 99.0000)
INSERT into Invoice_Line  VALUES (14, '0705655', 1, 99.0000)
INSERT into Invoice_Line  VALUES (15, '0705693', 1, 250.0000)
INSERT into Invoice_Line  VALUES (16, '0705631', 1, 99.0000)
INSERT into Invoice_Line  VALUES (17, '0705617', 1, 256.0000)
INSERT into Invoice_Line  VALUES (18, '0725609', 1, 256.0000)
INSERT into Invoice_Line  VALUES (18, '0705693', 1, 256.0000)
INSERT into Invoice_Line  VALUES (19, '0705617', 1, 256.0000)
INSERT into Invoice_Line  VALUES (20, '0785601', 2, 156.0000)
INSERT into Invoice_Line  VALUES (19, '0785601', 1, 156.0000)
INSERT into Invoice_Line  VALUES (19, '0765607', 1, 99.0000)
INSERT into Invoice_Line  VALUES (19, '0745603', 1, 126.0000)
INSERT into Invoice_Line  VALUES (19, '0725609', 1, 256.0000)
INSERT into Invoice_Line  VALUES (19, '0715605', 1, 120.0000)
INSERT into Invoice_Line  VALUES (19, '0705693', 1, 256.0000)	
