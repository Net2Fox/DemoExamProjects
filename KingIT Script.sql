USE [master]
GO
/****** Object:  Database [619_Gorlanov_KingIT]    Script Date: 17.01.2023 20:37:12 ******/
CREATE DATABASE [619_Gorlanov_KingIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'619_Gorlanov_KingIT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\619_Gorlanov_KingIT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'619_Gorlanov_KingIT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\619_Gorlanov_KingIT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [619_Gorlanov_KingIT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET ARITHABORT OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET  MULTI_USER 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [619_Gorlanov_KingIT]
GO
/****** Object:  Table [dbo].[City]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[GenderID] [int] NOT NULL,
	[Photo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pavilion]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pavilion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCenterID] [int] NOT NULL,
	[PavilionNumber] [nvarchar](50) NOT NULL,
	[Floor] [int] NOT NULL,
	[StatusPavilionID] [int] NOT NULL,
	[Square] [float] NOT NULL,
	[PricePerSquare] [float] NOT NULL,
	[ValueAddedRatio] [float] NOT NULL,
 CONSTRAINT [PK_Pavilion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDRenter] [int] NOT NULL,
	[ShoppingCenterID] [int] NOT NULL,
	[IDEmployee] [int] NOT NULL,
	[PavilionNumber] [nvarchar](50) NOT NULL,
	[StatusRentID] [int] NOT NULL,
	[BeginRent] [datetime] NOT NULL,
	[EndRent] [datetime] NOT NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renter]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDRent] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Renter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCenter]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCenter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StatusSCID] [int] NOT NULL,
	[PavilionsCount] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[ValueAddedRatio] [float] NOT NULL,
	[Floors] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShoppingCenter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusPavilion]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusPavilion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusPavilion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusRent]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusRent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusSC]    Script Date: 17.01.2023 20:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusSC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusRent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([ID], [Name]) VALUES (1, N'Москва')
INSERT [dbo].[City] ([ID], [Name]) VALUES (2, N'Санкт-Петербург')
INSERT [dbo].[City] ([ID], [Name]) VALUES (3, N'Новосибирск')
INSERT [dbo].[City] ([ID], [Name]) VALUES (4, N'Екатеринбург')
INSERT [dbo].[City] ([ID], [Name]) VALUES (5, N'Нижний Новгород')
INSERT [dbo].[City] ([ID], [Name]) VALUES (6, N'Казань')
INSERT [dbo].[City] ([ID], [Name]) VALUES (7, N'Челябинск')
INSERT [dbo].[City] ([ID], [Name]) VALUES (8, N'Самара')
INSERT [dbo].[City] ([ID], [Name]) VALUES (9, N'Ростов-на-Дону ')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (1, N'Чашин', N'Елизар', N'Михеевич', N'Elizor@gmai.com', N'yntiRS', 1, N'+7(1070)6282916', 1, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (2, N'Филенкова', N'Владлена', N'Олеговна', N'Vladlena@gmai.com', N'07i7Lb', 2, N'+7(334)1460151', 2, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (3, N'Ломовцев', N'Адам', N'Владимирович', N'Adam@gmai.com', N'7SP9CV', 3, N'+7(8560)5193299', 1, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (4, N'Тепляков', N'Кир', N'Федосиевич', N'Kar@gmai.com', N'6QF1WB', 4, N'+7(824)8932403', 1, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (5, N'Рюриков', N'Юлий', N'Глебович', N'Yli@gmai.com', N'GwffgE', 1, N'+7(6402)7013109', 1, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (6, N'Беломестина', N'Василиса', N'Тимофеевна', N'Vasilisa@gmai.com', N'd7iKKV', 1, N'+7(92)9207447', 2, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (7, N'Панькива', N'Галина', N'Якововна', N'Galina@gmai.com', N'8KC7wJ', 2, N'+7(405)0887389', 2, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (8, N'Зарубин', N'Мирон', N'Мечиславович', N'Miron@@gmai.com', N'x58OAN', 1, N'+7(6010)1950209', 1, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (9, N'Веточкина', N'Всеслава', N'Андрияновна', N'Vseslava@gmai.com', N'fhDSBf', 3, N'+7(078)4295786', 2, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (10, N'Рябова', N'Виктория', N'Елизаровна', N'Victoria@gmai.com', N'9mlPQJ', 4, N'+7(6394)9040161', 2, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (11, N'Федотов', N'Леон', N'Фёдорович', N'Anisa@gmai.com', N'Wh4OYm', 2, N'+7(22)3264959', 1, NULL)
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [RoleID], [PhoneNumber], [GenderID], [Photo]) VALUES (12, N'Шарапов', N'Феофан', N'Кириллович', N'Feafan@@gmai.com', N'Kc1PeS', 3, N'+7(789)7623028', 1, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([ID], [Name]) VALUES (1, N'Мужской')
INSERT [dbo].[Gender] ([ID], [Name]) VALUES (2, N'Женский')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Pavilion] ON 

INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (1, 3, N'88А', 1, 1, 75, 3307.7, 0.1)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (2, 2, N'40А', 3, 2, 96, 690, 1.1)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (3, 3, N'76Б', 2, 3, 199, 4938, 0.9)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (4, 4, N'61А', 1, 4, 186, 2115, 0.9)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (5, 10, N'58В', 4, 4, 98, 1306, 1.9)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (6, 6, N'7А', 2, 2, 187, 2046, 1)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (7, 7, N'13Б', 1, 2, 141, 1131, 0.1)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (8, 8, N'60В', 2, 2, 94, 361, 0.3)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (9, 10, N'56А', 1, 4, 148, 1163, 0.6)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (10, 10, N'63Г', 2, 2, 153, 3486, 0.7)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (11, 11, N'8Г', 1, 4, 122, 2451, 1.5)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (12, 10, N'94В', 3, 1, 132, 4825, 2)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (13, 13, N'87Г', 1, 2, 174, 793, 1.5)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (14, 14, N'93В', 1, 4, 165, 4937, 0.8)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (15, 15, N'10А', 3, 2, 168, 1353, 1.7)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (16, 23, N'53Г', 1, 4, 99, 3924, 1)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (17, 23, N'73В', 2, 1, 116, 3418, 0)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (18, 18, N'89Б', 1, 1, 92, 562, 0.4)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (19, 19, N'44Г', 2, 2, 66.6, 870.3, 1)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (20, 20, N'65А', 2, 2, 95, 1381, 1.7)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (21, 21, N'16Г', 2, 3, 150, 747, 0.8)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (22, 22, N'61Б', 1, 1, 58, 1032, 1.7)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (23, 23, N'34Б', 4, 2, 102, 4715, 0.3)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (24, 23, N'91Г', 3, 4, 171, 1021, 1.2)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (25, 25, N'70Г', 1, 2, 83, 2246, 1.4)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (26, 26, N'10А', 1, 2, 187, 2067, 0)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (27, 27, N'80Г', 1, 2, 117, 1049, 1.3)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (28, 28, N'2Б', 1, 3, 176, 1673, 1.7)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (29, 29, N'41А', 1, 1, 108, 344, 0)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (30, 30, N'16Г', 2, 4, 125, 1037, 1.3)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (31, 22, N'13Б', 2, 1, 161.5, 2775.7, 0.4)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (32, 32, N'83Г', 2, 4, 85.5, 4584, 0.3)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (33, 33, N'9Г', 1, 2, 131, 2477, 1.5)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (34, 34, N'49Г', 1, 4, 164, 2728, 0.9)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (35, 35, N'1Г', 1, 3, 157, 1963, 1.6)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (36, 22, N'37А', 3, 4, 187, 3173, 0.3)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (37, 22, N'38Г', 4, 4, 97, 1364, 0.5)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (38, 38, N'27В', 1, 2, 96, 3134, 0.1)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (39, 39, N'67Б', 1, 3, 55, 4442, 0.8)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (40, 40, N'86Г', 1, 1, 58, 3707, 0.5)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (41, 41, N'98А', 3, 2, 172.5, 4951, 1.1)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (42, 42, N'11Г', 2, 4, 194, 827, 0.6)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (43, 48, N'42В', 1, 1, 166, 4216, 0.7)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (44, 44, N'55А', 2, 2, 127, 703.1, 1)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (45, 48, N'6Б', 2, 1, 119, 3262, 1.9)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (46, 46, N'15А', 1, 2, 90, 1569, 1.3)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (47, 48, N'27Б', 3, 4, 132, 627, 0.4)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (48, 48, N'65Б', 4, 3, 60, 3052, 0.6)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (49, 49, N'26А', 1, 1, 95, 670, 1.7)
INSERT [dbo].[Pavilion] ([ID], [ShoppingCenterID], [PavilionNumber], [Floor], [StatusPavilionID], [Square], [PricePerSquare], [ValueAddedRatio]) VALUES (50, 49, N'53В', 3, 4, 132, 510, 1.2)
SET IDENTITY_INSERT [dbo].[Pavilion] OFF
GO
SET IDENTITY_INSERT [dbo].[Rent] ON 

INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (1, 2, 3, 2, N'88А', 1, CAST(N'2019-01-24T00:00:00.000' AS DateTime), CAST(N'2020-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (2, 2, 2, 7, N'40А', 2, CAST(N'2019-11-21T00:00:00.000' AS DateTime), CAST(N'2020-04-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (3, 5, 4, 11, N'61А', 3, CAST(N'2018-11-12T00:00:00.000' AS DateTime), CAST(N'2019-06-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (4, 1, 10, 2, N'58В', 3, CAST(N'2018-10-18T00:00:00.000' AS DateTime), CAST(N'2019-09-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (5, 5, 6, 7, N'7А', 2, CAST(N'2019-12-19T00:00:00.000' AS DateTime), CAST(N'2020-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (6, 2, 7, 11, N'13Б', 2, CAST(N'2019-12-16T00:00:00.000' AS DateTime), CAST(N'2020-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (7, 4, 8, 2, N'60В', 2, CAST(N'2019-12-06T00:00:00.000' AS DateTime), CAST(N'2020-10-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (8, 2, 10, 11, N'56А', 3, CAST(N'2018-09-03T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (9, 2, 10, 2, N'63Г', 2, CAST(N'2019-11-04T00:00:00.000' AS DateTime), CAST(N'2020-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (10, 4, 11, 7, N'8Г', 3, CAST(N'2018-11-08T00:00:00.000' AS DateTime), CAST(N'2019-01-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (11, 1, 10, 2, N'94В', 1, CAST(N'2019-06-07T00:00:00.000' AS DateTime), CAST(N'2020-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (12, 1, 13, 2, N'87Г', 2, CAST(N'2019-11-15T00:00:00.000' AS DateTime), CAST(N'2020-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (13, 5, 14, 11, N'93В', 3, CAST(N'2018-10-09T00:00:00.000' AS DateTime), CAST(N'2019-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (14, 5, 15, 7, N'10А', 2, CAST(N'2019-11-24T00:00:00.000' AS DateTime), CAST(N'2020-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (15, 1, 23, 7, N'53Г', 3, CAST(N'2018-07-20T00:00:00.000' AS DateTime), CAST(N'2019-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (16, 3, 23, 11, N'73В', 1, CAST(N'2019-02-04T00:00:00.000' AS DateTime), CAST(N'2020-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (17, 2, 18, 2, N'89Б', 1, CAST(N'2019-08-06T00:00:00.000' AS DateTime), CAST(N'2020-08-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (18, 1, 22, 7, N'61Б', 1, CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2020-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (19, 3, 23, 2, N'34Б', 2, CAST(N'2019-12-16T00:00:00.000' AS DateTime), CAST(N'2020-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (20, 3, 23, 11, N'91Г', 3, CAST(N'2018-08-24T00:00:00.000' AS DateTime), CAST(N'2019-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (21, 5, 25, 2, N'70Г', 2, CAST(N'2019-11-09T00:00:00.000' AS DateTime), CAST(N'2020-08-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (22, 4, 15, 7, N'10А', 2, CAST(N'2019-12-02T00:00:00.000' AS DateTime), CAST(N'2020-07-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (23, 2, 27, 11, N'80Г', 2, CAST(N'2019-11-23T00:00:00.000' AS DateTime), CAST(N'2020-08-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (24, 4, 29, 7, N'41А', 1, CAST(N'2019-05-02T00:00:00.000' AS DateTime), CAST(N'2020-06-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (25, 3, 7, 2, N'13Б', 2, CAST(N'2019-12-08T00:00:00.000' AS DateTime), CAST(N'2020-08-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (26, 3, 32, 7, N'83Г', 3, CAST(N'2018-11-14T00:00:00.000' AS DateTime), CAST(N'2019-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (27, 4, 33, 11, N'9Г', 2, CAST(N'2019-12-26T00:00:00.000' AS DateTime), CAST(N'2020-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (28, 1, 34, 2, N'49Г', 3, CAST(N'2018-09-16T00:00:00.000' AS DateTime), CAST(N'2019-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (29, 3, 22, 2, N'37А', 3, CAST(N'2018-10-18T00:00:00.000' AS DateTime), CAST(N'2019-06-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (30, 4, 22, 2, N'38Г', 3, CAST(N'2018-06-23T00:00:00.000' AS DateTime), CAST(N'2019-08-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (31, 3, 38, 11, N'27В', 2, CAST(N'2019-12-18T00:00:00.000' AS DateTime), CAST(N'2020-05-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (32, 5, 40, 7, N'86Г', 1, CAST(N'2019-04-01T00:00:00.000' AS DateTime), CAST(N'2020-12-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (33, 4, 41, 11, N'98А', 2, CAST(N'2019-11-22T00:00:00.000' AS DateTime), CAST(N'2020-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (34, 3, 42, 11, N'11Г', 3, CAST(N'2018-10-08T00:00:00.000' AS DateTime), CAST(N'2019-07-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (35, 2, 48, 2, N'42В', 1, CAST(N'2019-04-07T00:00:00.000' AS DateTime), CAST(N'2020-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (36, 1, 44, 7, N'55А', 2, CAST(N'2019-11-07T00:00:00.000' AS DateTime), CAST(N'2020-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (37, 3, 48, 2, N'6Б', 1, CAST(N'2019-07-15T00:00:00.000' AS DateTime), CAST(N'2020-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (38, 1, 46, 2, N'15А', 2, CAST(N'2019-12-09T00:00:00.000' AS DateTime), CAST(N'2020-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (39, 4, 48, 11, N'27Б', 3, CAST(N'2018-08-05T00:00:00.000' AS DateTime), CAST(N'2019-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (40, 2, 49, 11, N'26А', 1, CAST(N'2019-08-19T00:00:00.000' AS DateTime), CAST(N'2020-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rent] ([ID], [IDRenter], [ShoppingCenterID], [IDEmployee], [PavilionNumber], [StatusRentID], [BeginRent], [EndRent]) VALUES (41, 4, 49, 7, N'53В', 3, CAST(N'2018-09-20T00:00:00.000' AS DateTime), CAST(N'2019-02-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rent] OFF
GO
SET IDENTITY_INSERT [dbo].[Renter] ON 

INSERT [dbo].[Renter] ([ID], [IDRent], [Name], [PhoneNumber], [Address]) VALUES (1, 1, N'AG Marine', N'+7(495)5261453', N'Москва, Бабаевская улица д.16')
INSERT [dbo].[Renter] ([ID], [IDRent], [Name], [PhoneNumber], [Address]) VALUES (2, 2, N'Artelle', N'+7(495)2505894', N'СанктПетербург, Амбарная улица д.25 корп.1')
INSERT [dbo].[Renter] ([ID], [IDRent], [Name], [PhoneNumber], [Address]) VALUES (3, 3, N'Atlantis', N'+7(495)4241165', N'Новосибирск, Улица Каменская д.16')
INSERT [dbo].[Renter] ([ID], [IDRent], [Name], [PhoneNumber], [Address]) VALUES (4, 4, N'Corporate Travel', N'+7(495)2453905', N'Екатеринбург, Улица Антона Валека д.56')
INSERT [dbo].[Renter] ([ID], [IDRent], [Name], [PhoneNumber], [Address]) VALUES (5, 5, N'GallaDance', N'+7(495)3167794', N'Нижний Новгород, Улица Ларина д. 34')
SET IDENTITY_INSERT [dbo].[Renter] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Менеджер А')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'Менеджер С')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (4, N'Удален')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCenter] ON 

INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (1, N'Ривьера', 1, 0, 1, 8260042, 0.5, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (2, N'Авиапарк', 2, 9, 2, 3297976, 0.1, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (3, N'Мега Белая Дача', 3, 16, 3, 9006645, 1.7, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (4, N'Рио2', 1, 52, 3, 18886532, 0.52, 12, N'')
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (5, N'Рио5', 3, 55, 1, 18886535, 0.55, 15, N'')
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (6, N'Лужайка', 2, 10, 6, 4603336, 0.8, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (7, N'Кунцево Плаза', 2, 8, 7, 6797653, 1.1, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (8, N'Мозаика', 2, 20, 8, 1429419, 0, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (9, N'Океания', 1, 0, 8, 5192089, 1.8, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (10, N'Гранд', 2, 20, 9, 2573981, 0.1, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (11, N'Бутово Молл', 1, 0, 1, 5327641, 1.7, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (12, N'Рига Молл', 1, 0, 9, 9788316, 0.7, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (13, N'Шоколад', 2, 12, 7, 2217279, 1.1, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (14, N'АфиМолл Сити', 1, 9, 2, 8729160, 0.9, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (15, N'Европейский', 2, 9, 1, 5690500, 0.7, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (16, N'Гагаринский', 1, 0, 4, 1508807, 1.6, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (17, N'Метрополис', 1, 0, 2, 8117913, 0, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (18, N'Мега Химки', 1, 3, 5, 3373234, 0.4, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (19, N'Москва', 1, 12, 1, 4226505, 0.3, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (20, N'Вегас Кунцево', 1, 12, 1, 3878254, 0.2, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (21, N'Город Лефортово', 3, 12, 3, 1966214, 1.7, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (22, N'Золотой Вавилон Ростокино', 1, 16, 4, 1632702, 1.8, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (23, N'Шереметьевский', 2, 16, 3, 2941379, 1, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (24, N'Ханой-Москва', 1, 0, 8, 9580221, 0.3, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (25, N'Ашан Сити Капитолий', 2, 4, 4, 5309117, 1.9, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (26, N'Черемушки', 1, 15, 3, 7344604, 1, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (27, N'Филион', 2, 8, 1, 5343904, 0.3, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (28, N'Весна', 3, 3, 5, 4687701, 0.8, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (29, N'Гудзон', 1, 3, 4, 7414460, 0, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (30, N'Калейдоскоп', 1, 10, 3, 7847659, 0.7, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (31, N'Новомосковский', 1, 0, 6, 7161963, 0.4, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (32, N'Хорошо', 1, 20, 9, 8306576, 1.9, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (33, N'Щука', 2, 5, 5, 5428485, 0.4, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (34, N'Атриум', 1, 4, 6, 5059779, 0.2, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (35, N'Принц Плаза', 1, 8, 8, 1786688, 1.5, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (36, N'Облака', 1, 0, 2, 1688905, 0.6, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (37, N'Три Кита', 1, 0, 6, 3089700, 1.7, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (38, N'Реутов Парк', 2, 4, 9, 1995904, 1.5, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (39, N'ЕвроПарк', 3, 20, 3, 9391338, 0.7, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (40, N'ГУМ', 1, 5, 2, 6731491, 1.9, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (41, N'Райкин Плаза', 2, 12, 2, 8498470, 1.8, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (42, N'Новинский пассаж', 1, 8, 4, 3158957, 1.7, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (43, N'Наш Гипермаркет', 1, 0, 9, 1088735, 1.2, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (44, N'Красный Кит', 2, 9, 6, 1912149, 1.1, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (45, N'Мегаполис', 1, 0, 7, 2175218, 0.5, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (46, N'Отрада', 2, 4, 2, 6760316, 0.9, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (47, N'Твой дом', 1, 0, 7, 6810865, 1.7, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (48, N'Фестиваль', 3, 16, 3, 1828013, 0.2, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (49, N'Времена Года', 1, 15, 4, 2650484, 1.7, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (50, N' Армада', 1, 0, 9, 9172489, 0.9, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (54, N'123', 1, 123, 1, 123, 123, 123, N'123')
INSERT [dbo].[ShoppingCenter] ([ID], [Name], [StatusSCID], [PavilionsCount], [CityID], [Price], [ValueAddedRatio], [Floors], [Image]) VALUES (55, N'333', 1, 333, 1, 333, 333, 333, N'333')
SET IDENTITY_INSERT [dbo].[ShoppingCenter] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusPavilion] ON 

INSERT [dbo].[StatusPavilion] ([ID], [Name]) VALUES (1, N'Свободен')
INSERT [dbo].[StatusPavilion] ([ID], [Name]) VALUES (2, N'Забронировано')
INSERT [dbo].[StatusPavilion] ([ID], [Name]) VALUES (3, N'Удален')
INSERT [dbo].[StatusPavilion] ([ID], [Name]) VALUES (4, N'Арендован')
SET IDENTITY_INSERT [dbo].[StatusPavilion] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusRent] ON 

INSERT [dbo].[StatusRent] ([ID], [Name]) VALUES (1, N'Открыт')
INSERT [dbo].[StatusRent] ([ID], [Name]) VALUES (2, N'Ожидание')
INSERT [dbo].[StatusRent] ([ID], [Name]) VALUES (3, N'Закрыт')
SET IDENTITY_INSERT [dbo].[StatusRent] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusSC] ON 

INSERT [dbo].[StatusSC] ([ID], [Name]) VALUES (1, N'План')
INSERT [dbo].[StatusSC] ([ID], [Name]) VALUES (2, N'Строительсто')
INSERT [dbo].[StatusSC] ([ID], [Name]) VALUES (3, N'Удален')
INSERT [dbo].[StatusSC] ([ID], [Name]) VALUES (4, N'Реализация')
SET IDENTITY_INSERT [dbo].[StatusSC] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Pavilion]  WITH CHECK ADD  CONSTRAINT [FK_Pavilion_ShoppingCenter] FOREIGN KEY([ShoppingCenterID])
REFERENCES [dbo].[ShoppingCenter] ([ID])
GO
ALTER TABLE [dbo].[Pavilion] CHECK CONSTRAINT [FK_Pavilion_ShoppingCenter]
GO
ALTER TABLE [dbo].[Pavilion]  WITH CHECK ADD  CONSTRAINT [FK_Pavilion_StatusPavilion] FOREIGN KEY([StatusPavilionID])
REFERENCES [dbo].[StatusPavilion] ([ID])
GO
ALTER TABLE [dbo].[Pavilion] CHECK CONSTRAINT [FK_Pavilion_StatusPavilion]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Employee] FOREIGN KEY([IDEmployee])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Employee]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Renter] FOREIGN KEY([IDRenter])
REFERENCES [dbo].[Renter] ([ID])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Renter]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_ShoppingCenter] FOREIGN KEY([ShoppingCenterID])
REFERENCES [dbo].[ShoppingCenter] ([ID])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_ShoppingCenter]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_StatusRent] FOREIGN KEY([StatusRentID])
REFERENCES [dbo].[StatusRent] ([ID])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_StatusRent]
GO
ALTER TABLE [dbo].[Renter]  WITH CHECK ADD  CONSTRAINT [FK_Renter_Rent] FOREIGN KEY([IDRent])
REFERENCES [dbo].[Rent] ([ID])
GO
ALTER TABLE [dbo].[Renter] CHECK CONSTRAINT [FK_Renter_Rent]
GO
ALTER TABLE [dbo].[ShoppingCenter]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCenter_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCenter] CHECK CONSTRAINT [FK_ShoppingCenter_City]
GO
ALTER TABLE [dbo].[ShoppingCenter]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCenter_StatusSC] FOREIGN KEY([StatusSCID])
REFERENCES [dbo].[StatusSC] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCenter] CHECK CONSTRAINT [FK_ShoppingCenter_StatusSC]
GO
USE [master]
GO
ALTER DATABASE [619_Gorlanov_KingIT] SET  READ_WRITE 
GO
