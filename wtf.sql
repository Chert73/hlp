USE [master]
GO
/****** Object:  Database [prikol]    Script Date: 09.06.2022 21:13:56 ******/
CREATE DATABASE [prikol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prikol', FILENAME = N'D:\MSSQL14.MSSQLSERVERDOLJ\MSSQL\DATA\prikol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prikol_log', FILENAME = N'D:\MSSQL14.MSSQLSERVERDOLJ\MSSQL\DATA\prikol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [prikol] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prikol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prikol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prikol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prikol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prikol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prikol] SET ARITHABORT OFF 
GO
ALTER DATABASE [prikol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [prikol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prikol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prikol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prikol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prikol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prikol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prikol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prikol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prikol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [prikol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prikol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prikol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prikol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prikol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prikol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prikol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prikol] SET RECOVERY FULL 
GO
ALTER DATABASE [prikol] SET  MULTI_USER 
GO
ALTER DATABASE [prikol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prikol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prikol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prikol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prikol] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'prikol', N'ON'
GO
ALTER DATABASE [prikol] SET QUERY_STORE = OFF
GO
USE [prikol]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09.06.2022 21:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 09.06.2022 21:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] NOT NULL,
	[ManufacturerName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09.06.2022 21:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderUser] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderReceivingCode] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFEF1B2DBF] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 09.06.2022 21:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A2662E02666A5] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 09.06.2022 21:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[StatusID] [int] NOT NULL,
	[StatusName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 09.06.2022 21:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointID] [int] NOT NULL,
	[PostalCode] [varchar](6) NOT NULL,
	[Town] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[House] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09.06.2022 21:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductPhoto] [varchar](100) NOT NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductCurrentDiscount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [int] NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD528BB82E7] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09.06.2022 21:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Role__8AFACE3A8B03E48D] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09.06.2022 21:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[UserSurname] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[UserPatronymic] [nvarchar](100) NULL,
	[UserLogin] [nvarchar](max) NULL,
	[UserPassword] [nvarchar](max) NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCACB660D84F] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Творчество')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Рисование')
GO
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (1, N'АртМир')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (2, N'Волшебная мастерская')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (3, N'ОригамиПлюс')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (4, N'ФлюидАрт')
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (1, 1, CAST(N'2022-05-16' AS Date), 15, 11, CAST(N'2022-05-10' AS Date), 931)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (2, 1, CAST(N'2022-05-17' AS Date), 36, 7, CAST(N'2022-05-11' AS Date), 932)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (3, 1, CAST(N'2022-05-19' AS Date), 18, 9, CAST(N'2022-05-13' AS Date), 933)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (4, 1, CAST(N'2022-05-19' AS Date), 11, 11, CAST(N'2022-05-13' AS Date), 934)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (5, 1, CAST(N'2022-05-20' AS Date), 10, 11, CAST(N'2022-05-14' AS Date), 935)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (6, 1, CAST(N'2022-05-22' AS Date), 34, 11, CAST(N'2022-05-16' AS Date), 936)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (7, 1, CAST(N'2022-05-22' AS Date), 3, 11, CAST(N'2022-05-16' AS Date), 937)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (8, 1, CAST(N'2022-05-23' AS Date), 20, 11, CAST(N'2022-05-17' AS Date), 938)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (9, 1, CAST(N'2022-05-23' AS Date), 20, 8, CAST(N'2022-05-17' AS Date), 939)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (10, 1, CAST(N'2022-05-23' AS Date), 25, 10, CAST(N'2022-05-17' AS Date), 940)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'H648T5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'А112Т4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'G753H6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'N745G4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'N745G4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'Y354G6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'C745H6', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'K674F4', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'H745G5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'O735F5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'S538H6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'S735G5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'A385H6', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'S739H7', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'P946G6', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'S384G5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'F935G5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'V734G5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'A745B6', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'A972G5', 10)
GO
INSERT [dbo].[OrderStatus] ([StatusID], [StatusName]) VALUES (1, N'Новый')
INSERT [dbo].[OrderStatus] ([StatusID], [StatusName]) VALUES (2, N'Завершённый')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (1, N'344288', N' г. Чапаевск', N'ул. Чехова', N' 1')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (2, N'614164', N' г.Чапаевск', N' ул. Степная', N' 30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (3, N'394242', N' г. Чапаевск', N'ул. Коммунистическая', N' 43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (4, N'660540', N' г. Чапаевск', N'ул. Солнечная', N' 25')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (5, N'125837', N' г. Чапаевск', N'ул. Шоссейная', N' 40')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (6, N'125703', N' г. Чапаевск', N'ул. Партизанская', N' 49')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (7, N'625283', N' г. Чапаевск', N'ул. Победы', N' 46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (8, N'614611', N' г. Чапаевск', N'ул. Молодежная', N' 50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (9, N'454311', N' г.Чапаевск', N'ул. Новая', N' 19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (10, N'660007', N' г.Чапаевск', N'ул. Октябрьская', N' 19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (11, N'603036', N' г. Чапаевск', N'ул. Садовая', N' 4')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (12, N'450983', N' г.Чапаевск', N'ул. Комсомольская', N' 26')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (13, N'394782', N' г. Чапаевск', N'ул. Чехова', N' 3')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (14, N'603002', N' г. Чапаевск', N'ул. Дзержинского', N' 28')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (15, N'450558', N' г. Чапаевск', N'ул. Набережная', N' 30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (16, N'394060', N' г.Чапаевск', N'ул. Фрунзе', N' 43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (17, N'410661', N' г. Чапаевск', N'ул. Школьная', N' 50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (18, N'625590', N' г. Чапаевск', N'ул. Коммунистическая', N' 20')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (19, N'625683', N' г. Чапаевск', N'ул. Марта', N' 8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (20, N'400562', N' г. Чапаевск', N'ул. Зеленая', N' 32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (21, N'614510', N' г. Чапаевск', N'ул. Маяковского', N' 47')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (22, N'410542', N' г. Чапаевск', N'ул. Светлая', N' 46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (23, N'620839', N' г. Чапаевск', N'ул. Цветочная', N' 8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (24, N'443890', N' г. Чапаевск', N'ул. Коммунистическая', N' 1')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (25, N'603379', N' г. Чапаевск', N'ул. Спортивная', N' 46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (26, N'603721', N' г. Чапаевск', N'ул. Гоголя', N' 41')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (27, N'410172', N' г. Чапаевск', N'ул. Северная', N' 13')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (28, N'420151', N' г. Чапаевск', N'ул. Вишневая', N' 32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (29, N'125061', N' г. Чапаевск', N'ул. Подгорная', N' 8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (30, N'630370', N' г. Чапаевск', N'ул. Шоссейная', N' 24')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (31, N'614753', N' г. Чапаевск', N'ул. Полевая', N' 35')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (32, N'426030', N' г. Чапаевск', N'ул. Маяковского', N' 44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (33, N'450375', N' г. Чапаевск', N'ул. Клубная', N' 44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (34, N'625560', N' г. Чапаевск', N'ул. Некрасова', N' 12')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (35, N'630201', N' г. Чапаевск', N'ул. Комсомольская', N' 17')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (36, N'190949', N' г. Чапаевск', N'ул. Мичурина', N' 26')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A385H6', N'набор для рисования', N'Набор для рисования и творчества детский игровой', 2, N'picture.png', 1, CAST(176.0000 AS Decimal(19, 4)), 15, 2, 15, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A745B6', N'Творческий набор', N'Волшебная Мастерская Мозаика из пайеток на холсте Бабочка', 1, N'picture.png', 4, CAST(129.0000 AS Decimal(19, 4)), 5, 2, 7, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A972G5', N'Набор для рисования', N'BONDIBON Набор для творчества Аквамозаика 3D Медведь', 1, N'picture.png', 2, CAST(1567.0000 AS Decimal(19, 4)), 5, 3, 3, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C745H6', N'Набор для рисования', N'Набор для рисования и творчества', 2, N'C745H6.png', 3, CAST(999.0000 AS Decimal(19, 4)), 15, 3, 4, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D845G5', N'Набор для рисования', N'Буква- ленд / Набор для творчества / Развивающий набор', 2, N'picture.png', 3, CAST(311.0000 AS Decimal(19, 4)), 5, 3, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F935G5', N'Творческий набор', N'Origami Набор для детского творчества Оригами Братья наши меньшие', 1, N'picture.png', 1, CAST(2467.0000 AS Decimal(19, 4)), 15, 3, 24, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G735G6', N'Набор для рисования', N'Набор для рисования и творчества, 176 предметов, с мольбертом, розовый', 2, N'G735G6.png', 2, CAST(1400.0000 AS Decimal(19, 4)), 30, 4, 8, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G753H6', N'Набор для рисования', N'Набор для рисования и творчества, 145 предметов, розовый', 2, N'G753H6.png', 3, CAST(1999.0000 AS Decimal(19, 4)), 10, 5, 4, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H648T5', N'Набор для рисования', N'Набор для рисования и творчества в чемоданчике с мольбертом', 2, N'H648T5.jpg', 2, CAST(849.0000 AS Decimal(19, 4)), 15, 4, 12, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H745G5', N'Творческий набор', N'Набор для детского творчества "Умный песок" Кексики', 1, N'H745G5.jpg', 4, CAST(645.0000 AS Decimal(19, 4)), 15, 5, 15, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K674F4', N'Творческий набор', N'Aquabeads Аквамозаика Студия новичка с формой-перевертышем', 1, N'K674F4.jpg', 1, CAST(1170.0000 AS Decimal(19, 4)), 30, 4, 2, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K946G6', N'Набор для рисования', N'Волшебная Мастерская Набор для творчества Незабудка', 2, N'picture.png', 2, CAST(784.0000 AS Decimal(19, 4)), 15, 4, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'L845G5', N'Творческий набор', N'GHK Набор для творчества "Гравюра 20 x 25.5 см №10 "Пушистый котенок"', 1, N'picture.png', 1, CAST(1456.0000 AS Decimal(19, 4)), 15, 2, 4, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'L946G6', N'Набор для рисования', N'Набор для раскрашивания панно многослойное CRAFT MASTER', 2, N'picture.png', 2, CAST(1827.0000 AS Decimal(19, 4)), 5, 3, 9, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N446G5', N'набор для рисования', N'GHK Набор для творчества "Гравюра 20 x 25.5 см №16 "Москва" ', 2, N'picture.png', 1, CAST(643.0000 AS Decimal(19, 4)), 10, 4, 26, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N745G4', N'Творческий набор', N'Molly набор для творчества Флюид Арт Планета Земля', 1, N'N745G4.jpg', 2, CAST(1000.0000 AS Decimal(19, 4)), 20, 2, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'O735F5', N'набор для рисования', N'Я-Художник! / Набор для рисования из 10 предметов', 2, N'O735F5.jpg', 1, CAST(1300.0000 AS Decimal(19, 4)), 25, 3, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'P946G6', N'Набор для рисования', N'Набор для творчества Луч Витраж светящийся', 2, N'picture.png', 3, CAST(2300.0000 AS Decimal(19, 4)), 30, 4, 3, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S384G5', N'Творческий набор', N'Набор для творчества Canal Toys ART LAB для создания картин', 1, N'picture.png', 2, CAST(543.0000 AS Decimal(19, 4)), 5, 5, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S538H6', N'Творческий набор', N'Набор для творчества "Магический песок - создай гребешок" 8 цветов', 1, N'picture.png', 2, CAST(543.0000 AS Decimal(19, 4)), 10, 3, 4, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S735G5', N'Набор для рисования', N'Набор для творчества Фонарик Новогодняя ночь', 2, N'picture.png', 3, CAST(233.0000 AS Decimal(19, 4)), 30, 4, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S739H7', N'Творческий набор', N'BONDIBON Набор для творчества Копилка-подарок Миша', 1, N'picture.png', 4, CAST(268.0000 AS Decimal(19, 4)), 15, 4, 12, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V734G5', N'Набор для рисования', N'BONDIBON Набор для творчества Шьем для любимой куклы ', 2, N'picture.png', 3, CAST(754.0000 AS Decimal(19, 4)), 10, 5, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V745G5', N'Творческий набор', N'BONDIBON Набор для творчества Аквамозаика 3D Слон', 1, N'picture.png', 1, CAST(1678.0000 AS Decimal(19, 4)), 10, 5, 8, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V834G6', N'Набор для рисования', N'ГАММА Набор юного художника Классический в подарочной коробке', 2, N'picture.png', 2, CAST(1267.0000 AS Decimal(19, 4)), 5, 3, 9, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V946G5', N'Творческий набор', N'Набор для творчества Рыжий кот Холст с красками по номерам', 1, N'picture.png', 1, CAST(245.0000 AS Decimal(19, 4)), 10, 3, 7, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'X485G6', N'Творческий набор', N'GHK Набор для творчества "Гравюра 20 x 25.5 см №15 "Игривый котенок" (золото)', 1, N'picture.png', 1, CAST(241.0000 AS Decimal(19, 4)), 15, 5, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'X745H6', N'Творческий набор', N'Волшебная Мастерская Мозаика из пайеток 3D "Слон" 3D-06', 1, N'picture.png', 1, CAST(1500.0000 AS Decimal(19, 4)), 10, 2, 23, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'Y354G6', N'Творческий набор', N'Origami Набор для творчества оригами На земле, на воде, на воздухе', 1, N'Y354G6.jpg', 1, CAST(200.0000 AS Decimal(19, 4)), 5, 3, 8, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'А112Т4', N'Творческий набор', N'Творческий набор юного художника для рисования', 1, N'А112Т4.jpg', 1, CAST(889.0000 AS Decimal(19, 4)), 30, 2, 6, 1)
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Соловьев', N'Тимофей', N'Маркович', N'jsdrg8x0zqp5@outlook.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Савельева ', N'Майя', N'Михайловна', N's8w0btpz94o7@gmail.com', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Назаров ', N'Андрей', N'Никитич', N'lq6tsbvy5gue@yahoo.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Кулешов', N'Леонид', N'Андреевич', N'hzks9681fmgc@outlook.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Попов ', N'Игорь', N'Александрович', N'khg8y7dsqim2@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Петров ', N'Тимур', N'Сергеевич', N'0wxz32c9hgsb@tutanota.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Севастьянова', N'София', N'Савельевна', N'340quyv18aoi@yahoo.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Рыбакова', N'Ярослава', N'Глебовна', N'7jwstxrhqd85@outlook.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Петрова', N'Лейла', N'Артёмовна', N'0tsyif3h85ca@yahoo.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Щербаков', N'Александр', N'Александрович', N'gs3wm0d9lcx1@outlook.com', N'JlFRCZ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, NULL, NULL, NULL, NULL, NULL, 3)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[OrderStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([PickupPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([OrderUser])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2D27B809] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2D27B809]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__267ABA7A] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__267ABA7A]
GO
USE [master]
GO
ALTER DATABASE [prikol] SET  READ_WRITE 
GO
