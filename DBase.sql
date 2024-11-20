CREATE DATABASE FINAL
GO

USE FINAL
USE [master]
GO

DROP DATABASE PlanShopDB

/****** Object:  Database [FINAL]    Script Date: 3/22/2022 4:33:09 PM ******/
CREATE DATABASE [FINAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlantShopDB', FILENAME = N'D:\PlantShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PlantShopDB_log', FILENAME = N'D:\PlantShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FINAL] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FINAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FINAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FINAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FINAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FINAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FINAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [FINAL] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FINAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FINAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FINAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FINAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FINAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FINAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FINAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FINAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FINAL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FINAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FINAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FINAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FINAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FINAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FINAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FINAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FINAL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FINAL] SET  MULTI_USER 
GO
ALTER DATABASE [FINAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FINAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FINAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FINAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FINAL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FINAL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FINAL] SET QUERY_STORE = OFF
GO
USE [FINAL]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](255) NULL,
	[fullName] [varchar](100) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
	[token] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[accId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[content] [text] NULL,
	[coverImgPath] [nvarchar](255) NULL,
	[mainImgPath] [nvarchar](255) NULL,
	[createdDate] [date] NULL,
	[cateId] [int] NULL,
	[accId] [int] NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogTags]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogTags](
	[blogId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[blogId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cateId] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blogId] [int] NULL,
	[accId] [int] NULL,
	[content] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[province] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[ward] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[detailId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[pId] [int] NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[ordDate] [date] NULL,
	[shipDate] [date] NULL,
	[note] [varchar](255) NULL,
	[status] [int] NULL,
	[accId] [int] NULL,
	[shippingId] [int] NULL,
	[totalPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pName] [varchar](50) NULL,
	[price] [int] NULL,
	[imgPath] [varchar](255) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[cateId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pId] [int] NULL,
	[rating] [int] NULL,
	[comment] [text] NULL,
	[accId] [int] NULL,
	[createdDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[phone] [varchar](12) NULL,
	[address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 3/22/2022 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ordDate]  DEFAULT (getdate()) FOR [ordDate]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([accId])
REFERENCES [dbo].[Accounts] ([accId])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([cateId])
REFERENCES [dbo].[BlogCategory] ([id])
GO
ALTER TABLE [dbo].[BlogTags]  WITH CHECK ADD FOREIGN KEY([blogId])
REFERENCES [dbo].[Blog] ([id])
GO
ALTER TABLE [dbo].[BlogTags]  WITH CHECK ADD FOREIGN KEY([tagId])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([accId])
REFERENCES [dbo].[Accounts] ([accId])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([blogId])
REFERENCES [dbo].[Blog] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([orderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Item] ([pid])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([accId])
REFERENCES [dbo].[Accounts] ([accId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([shippingId])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[OrderStatus] ([id])
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([cateId])
REFERENCES [dbo].[Categories] ([cateId])
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD FOREIGN KEY([accId])
REFERENCES [dbo].[Accounts] ([accId])
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Item] ([pid])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([price]>=(0.0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [FINAL] SET  READ_WRITE 
GO

USE PlantShopDB
Go

INSERT INTO Categories VALUES ('Orchid');
INSERT INTO Categories VALUES ('Roses');
INSERT INTO Categories VALUES ('Others');

INSERT INTO OrderStatus VALUES ('Processing');
INSERT INTO OrderStatus VALUES ('Completed');
INSERT INTO OrderStatus VALUES ('Canceled');

insert into Item (pName, price, imgPath, description, status, cateId) values ('Northern California Walnut', 95, 'http://dummyimage.com/175x.png/dddddd/000000', 'Revision of Drain Dev in R Sacroiliac Jt, Perc Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Florida Hartwrightia', 67, 'http://dummyimage.com/153x.png/dddddd/000000', 'Drainage of Other Fetal Fluid from POC, Open Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Canyon Clarkia', 86, 'http://dummyimage.com/180x.png/5fa2dd/ffffff', 'Extirpation of Matter from Azygos Vein, Open Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Brazilian Peppertree', 64, 'http://dummyimage.com/154x.png/cc0000/ffffff', 'Supplement Left Palatine Bone with Synth Sub, Perc Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Sloane''s Tribisee', 15, 'http://dummyimage.com/193x.png/dddddd/000000', 'Resection of Nasopharynx, Via Natural or Artificial Opening', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Shortstalk False Bindweed', 86, 'http://dummyimage.com/233x.png/dddddd/000000', 'Introduce of Intracirc Anesth into Periph Art, Perc Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Severinia', 72, 'http://dummyimage.com/184x.png/ff4444/ffffff', 'Excision of Gallbladder, Open Approach, Diagnostic', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Finger Speedwell', 92, 'http://dummyimage.com/186x.png/ff4444/ffffff', 'Insertion of Other Device into L Shoulder, Open Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Snowy Thistle', 5, 'http://dummyimage.com/103x.png/cc0000/ffffff', 'Reposition Left Finger Phalanx, Percutaneous Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Tropical Seapurslane', 75, 'http://dummyimage.com/110x.png/5fa2dd/ffffff', 'Transfer Right Upper Arm Muscle with Subcu, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('American Sycamore', 42, 'http://dummyimage.com/188x.png/cc0000/ffffff', 'Division of R Elbow Bursa/Lig, Perc Endo Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Myrsine-leaved Willow', 73, 'http://dummyimage.com/127x.png/dddddd/000000', 'Resection of Cecum, Percutaneous Endoscopic Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Dot Lichen', 5, 'http://dummyimage.com/148x.png/ff4444/ffffff', 'Revision of Drain Dev in Cereb Vent, Perc Endo Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Sollya', 66, 'http://dummyimage.com/236x.png/dddddd/000000', 'Restriction of Right Vertebral Artery, Percutaneous Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Neon Dot Lichen', 35, 'http://dummyimage.com/205x.png/dddddd/000000', 'Excision of Right Colic Artery, Open Approach, Diagnostic', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Amygdalaria Lichen', 79, 'http://dummyimage.com/157x.png/5fa2dd/ffffff', 'Occlusion of Rectum, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('White Bladderpod', 67, 'http://dummyimage.com/170x.png/cc0000/ffffff', 'Bypass Right Femoral Artery to L Femor A, Perc Endo Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Huntsville Vasevine', 45, 'http://dummyimage.com/121x.png/5fa2dd/ffffff', 'Peripheral Nervous System, Excision', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Fern-leaf Acacia', 7, 'http://dummyimage.com/167x.png/5fa2dd/ffffff', 'Drainage of L Ext Iliac Vein with Drain Dev, Perc Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Olokele Canyon Nehe', 4, 'http://dummyimage.com/171x.png/cc0000/ffffff', 'Supplement Mid Esophag with Synth Sub, Perc Endo Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Sheldon''s Sedge', 25, 'http://dummyimage.com/213x.png/cc0000/ffffff', 'Destruction of Int Mamm, L Lymph, Perc Endo Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Richardson''s Phlox', 41, 'http://dummyimage.com/156x.png/dddddd/000000', 'Bypass R Subclav Art to Bi Low Arm Art w Synth Sub, Open', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Cusick''s Beardtongue', 98, 'http://dummyimage.com/130x.png/cc0000/ffffff', 'Supplement Right 5th Toe with Nonaut Sub, Perc Endo Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Crimson Clover', 80, 'http://dummyimage.com/136x.png/cc0000/ffffff', 'Release Right Atrium, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Pore Lichen', 66, 'http://dummyimage.com/195x.png/5fa2dd/ffffff', 'Dilate L Ant Tib Art, Bifurc, w 2 Intralum Dev, Perc Endo', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Slenderleaf Bundleflower', 56, 'http://dummyimage.com/141x.png/dddddd/000000', 'Repair Right Frontal Bone, Percutaneous Endoscopic Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Notchleaf Clover', 73, 'http://dummyimage.com/130x.png/ff4444/ffffff', 'Resection of Thoracolumbar Vertebral Disc, Open Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Trapeliopsis Lichen', 8, 'http://dummyimage.com/141x.png/5fa2dd/ffffff', 'Drainage of Lingula Bronchus, Percutaneous Approach, Diagn', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Tussock Cottongrass', 47, 'http://dummyimage.com/162x.png/cc0000/ffffff', 'Excision of Left Thumb Phalanx, Open Approach, Diagnostic', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Cold-desert Phlox', 81, 'http://dummyimage.com/110x.png/cc0000/ffffff', 'Reposition Left Kidney Pelvis, Perc Endo Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Sainfoin', 79, 'http://dummyimage.com/200x.png/dddddd/000000', 'Supplement Left Ureter with Autol Sub, Perc Endo Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Hollyhock', 11, 'http://dummyimage.com/155x.png/5fa2dd/ffffff', 'Destruction of Left Foot Muscle, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Stemmy Four-nerve Daisy', 69, 'http://dummyimage.com/219x.png/dddddd/000000', 'Removal of Neuro Lead from Spinal Cord, Extern Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Tuber Anemone', 56, 'http://dummyimage.com/175x.png/dddddd/000000', 'Introduce of Intracirc Anesth into Periph Art, Perc Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Broadscale Sedge', 72, 'http://dummyimage.com/191x.png/dddddd/000000', 'Drainage of Left Eustachian Tube, Via Opening, Diagn', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Doublehorn Calicoflower', 7, 'http://dummyimage.com/237x.png/5fa2dd/ffffff', 'Insert Monopln Ext Fix in L Humeral Head, Perc Endo', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Oahu Pilo Kea', 1, 'http://dummyimage.com/103x.png/cc0000/ffffff', 'Beam Radiation of Spleen using Electrons', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Hairy Brome', 6, 'http://dummyimage.com/212x.png/dddddd/000000', 'Excision of Lumbar Vertebral Disc, Perc Endo Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Spanish Needles', 19, 'http://dummyimage.com/219x.png/cc0000/ffffff', 'Remove Drain Dev from R Tympanic Membrane, Extern', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Drooping Bulrush', 44, 'http://dummyimage.com/134x.png/cc0000/ffffff', 'Reposition Thoracic Aorta, Ascending/Arch, Open Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Arctoparmelia Lichen', 62, 'http://dummyimage.com/198x.png/5fa2dd/ffffff', 'Removal of Infusion Device from Spinal Cord, Perc Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Fourwing Saltbush', 49, 'http://dummyimage.com/217x.png/5fa2dd/ffffff', 'Drainage of Lower Tooth, Open Approach, Multiple', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Sweet Signalgrass', 78, 'http://dummyimage.com/155x.png/5fa2dd/ffffff', 'Reposition Left Brachial Vein, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Mahoe', 21, 'http://dummyimage.com/189x.png/ff4444/ffffff', 'Drainage of L Pelvic Bone with Drain Dev, Perc Endo Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Mexican Skullcap', 97, 'http://dummyimage.com/173x.png/5fa2dd/ffffff', 'Excision of Left Pleura, Percutaneous Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Drooping Tonguefern', 54, 'http://dummyimage.com/220x.png/ff4444/ffffff', 'Revision of Intraluminal Device in Esophagus, Via Opening', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Osmund Fissidens Moss', 35, 'http://dummyimage.com/156x.png/dddddd/000000', 'Transfer Back Subcu/Fascia w Skin, Subcu, Fascia, Open', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Cloudswept Colicwood', 96, 'http://dummyimage.com/153x.png/ff4444/ffffff', 'Drainage of Male Perineum with Drain Dev, Open Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Spider Biscuitroot', 97, 'http://dummyimage.com/135x.png/ff4444/ffffff', 'Bypass Asc Colon to Desc Colon with Synth Sub, Open Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('New England Dewberry', 53, 'http://dummyimage.com/183x.png/ff4444/ffffff', 'Removal of Intermittent Pressure Device on L Up Extrem', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Torrey''s Surfgrass', 65, 'http://dummyimage.com/249x.png/ff4444/ffffff', 'Insert of Intralum Dev into R Int Iliac Art, Open Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Pinpoint Clover', 33, 'http://dummyimage.com/122x.png/dddddd/000000', 'Dilate Thor Aorta Desc w Drug-elut Intra, Open', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Diels'' Cotoneaster', 11, 'http://dummyimage.com/180x.png/ff4444/ffffff', 'Extirpate matter from L Up Extrem Bursa/Lig, Perc', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Granite Mousetail', 42, 'http://dummyimage.com/182x.png/dddddd/000000', 'Replacement of L Kidney Pelvis with Nonaut Sub, Via Opening', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Mountain Marlberry', 3, 'http://dummyimage.com/192x.png/dddddd/000000', 'Supplement Chest Subcu/Fascia w Nonaut Sub, Perc', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Porter''s Licorice-root', 47, 'http://dummyimage.com/100x.png/cc0000/ffffff', 'Bypass Duodenum to Jejunum with Nonaut Sub, Endo', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Stonecrop', 39, 'http://dummyimage.com/113x.png/5fa2dd/ffffff', 'Insertion of Int Fix into R Radius, Perc Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Littleleaf Leadtree', 62, 'http://dummyimage.com/243x.png/ff4444/ffffff', 'Bypass Hepatic Vein to Low Vein w Synth Sub, Open', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Philibert''s Thuidium Moss', 49, 'http://dummyimage.com/174x.png/ff4444/ffffff', 'Bypass R Fem Art to Low Ex Vein w Autol Vn, Perc Endo', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Silver Cinquefoil', 50, 'http://dummyimage.com/141x.png/dddddd/000000', 'Bypass L Pulm Art from Innom Art w Synth Sub, Open', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Whorled Marshpennywort', 18, 'http://dummyimage.com/199x.png/5fa2dd/ffffff', 'Supplement C-thor Jt with Autol Sub, Perc Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Guama Venezolano', 16, 'http://dummyimage.com/141x.png/ff4444/ffffff', 'Transfer L Low Arm Subcu/Fascia, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Disc Lichen', 3, 'http://dummyimage.com/171x.png/dddddd/000000', 'Dilation of Hymen with Intraluminal Device, Via Opening', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Wart Lichen', 96, 'http://dummyimage.com/175x.png/dddddd/000000', 'Insertion of Infusion Device into GI Tract, Perc Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('California Horkelia', 96, 'http://dummyimage.com/228x.png/dddddd/000000', 'Transplantation of Ear, Nose & Sinus into POC, Perc Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Small Fryxellwort', 76, 'http://dummyimage.com/133x.png/ff4444/ffffff', 'Restriction of Left Femoral Vein, Percutaneous Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Siberian-tea', 99, 'http://dummyimage.com/126x.png/ff4444/ffffff', 'Removal of Monitoring Device from Trachea, Perc Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Low Prairie Clover', 82, 'http://dummyimage.com/242x.png/5fa2dd/ffffff', 'Repair Right Buttock, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Velvetleaf Soldierbush', 65, 'http://dummyimage.com/110x.png/5fa2dd/ffffff', 'Excision of Right Vertebral Artery, Perc Endo Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Clustered Pellitory', 1, 'http://dummyimage.com/185x.png/cc0000/ffffff', 'Release Penis, Percutaneous Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Esmeralda Buckwheat', 89, 'http://dummyimage.com/250x.png/ff4444/ffffff', 'Replacement of R Basilic Vein with Autol Sub, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Klamath Plum', 28, 'http://dummyimage.com/127x.png/ff4444/ffffff', 'Bypass Right Ureter to Colon with Synth Sub, Open Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Andreaea Moss', 63, 'http://dummyimage.com/161x.png/ff4444/ffffff', 'Insertion of Infusion Device into Face, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Small Wirelettuce', 24, 'http://dummyimage.com/172x.png/ff4444/ffffff', 'Dilate 3 Cor Art, Bifurc, w 2 Intralum Dev, Perc', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Subalpine Fir', 99, 'http://dummyimage.com/102x.png/cc0000/ffffff', 'Division of Right Orbit, Open Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('American Buckwheat Vine', 1, 'http://dummyimage.com/135x.png/dddddd/000000', 'Replacement of R Humeral Head with Nonaut Sub, Open Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Toothleaf Goldeneye', 82, 'http://dummyimage.com/183x.png/5fa2dd/ffffff', 'Division of R Up Arm Subcu/Fascia, Perc Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('The Cedars Manzanita', 49, 'http://dummyimage.com/250x.png/dddddd/000000', 'Occlusion L Ext Jugular Vein w Extralum Dev, Open', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Savannah Iris', 47, 'http://dummyimage.com/244x.png/cc0000/ffffff', 'Dilation of R Hand Art with 2 Intralum Dev, Open Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Wintergreen Barberry', 9, 'http://dummyimage.com/244x.png/5fa2dd/ffffff', 'Inspection of Thoracolumbar Vertebral Disc, Perc Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Bayhops', 49, 'http://dummyimage.com/123x.png/ff4444/ffffff', 'Removal of Drain Dev from Mesentery, Perc Endo Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Holmgren''s Lupine', 86, 'http://dummyimage.com/213x.png/cc0000/ffffff', 'Replace Intracran Vein w Nonaut Sub, Perc Endo', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Aleutian Brome', 60, 'http://dummyimage.com/239x.png/dddddd/000000', 'Dilate R Int Mamm Art, Bifurc, w 4+ Intralum Dev, Perc', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Lakeshore Nutrush', 22, 'http://dummyimage.com/202x.png/ff4444/ffffff', 'Drainage of Left Humeral Head with Drain Dev, Perc Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Ongokea', 18, 'http://dummyimage.com/169x.png/dddddd/000000', 'Extirpation of Matter from R Maxillary Sinus, Open Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Paulownia', 13, 'http://dummyimage.com/232x.png/dddddd/000000', 'Dilate L Com Iliac Art w Drug-elut Intra, Perc', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Vervain', 78, 'http://dummyimage.com/205x.png/cc0000/ffffff', 'Manual Therapy Techniques Treatment of Neuro Body', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Fireweed', 34, 'http://dummyimage.com/124x.png/dddddd/000000', 'Drainage of Mult Parathyroid, Open Approach, Diagn', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Chapman''s Blazing Star', 11, 'http://dummyimage.com/136x.png/5fa2dd/ffffff', 'Dilate of Low Art, Bifurc, with Intralum Dev, Open Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Silveus'' Lovegrass', 36, 'http://dummyimage.com/107x.png/ff4444/ffffff', 'Revision of Nonaut Sub in Uterus & Cervix, Perc Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Roman Wormwood', 65, 'http://dummyimage.com/190x.png/5fa2dd/ffffff', 'MRI of Whole Fetus using Oth Contrast, Unenh, Enhance', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Wright''s Prairie Clover', 14, 'http://dummyimage.com/123x.png/ff4444/ffffff', 'Restriction of Ileocecal Valve, Endo', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Pinnate False Threadleaf', 34, 'http://dummyimage.com/137x.png/cc0000/ffffff', 'Supplement Back Subcu/Fascia w Nonaut Sub, Open', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Staggerweed', 37, 'http://dummyimage.com/214x.png/5fa2dd/ffffff', 'Division of Left Thorax Bursa and Ligament, Open Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Polyscias', 61, 'http://dummyimage.com/229x.png/5fa2dd/ffffff', 'Fusion >7 T Jt w Autol Sub, Post Appr P Col, Perc', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Common Knotweed', 60, 'http://dummyimage.com/155x.png/ff4444/ffffff', 'Replacement of Right Nipple with Autol Sub, Open Approach', 1, 1);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Redosier Dogwood', 68, 'http://dummyimage.com/151x.png/cc0000/ffffff', 'Repair Hard Palate, External Approach', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Triangle Cactus', 78, 'http://dummyimage.com/127x.png/dddddd/000000', 'Dilation of Right Internal Jugular Vein, Open Approach', 1, 3);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Bashful Four O''clock', 19, 'http://dummyimage.com/142x.png/cc0000/ffffff', 'Extirpate matter from L Metacarpocarp Jt, Perc Endo', 1, 2);
insert into Item (pName, price, imgPath, description, status, cateId) values ('Parry''s Clover', 30, 'http://dummyimage.com/110x.png/dddddd/000000', 'Release Right Internal Mammary Artery, Open Approach', 1, 2);

UPDATE Item SET imgPath = 'https://dummyimage.com/150x190/cccccc/ff0000.jpg';
USE PlantShopDB
SELECT * FROM dbo.Plants
