USE [master]
GO
/****** Object:  Database [GIBDD_Gorlanov_619]    Script Date: 09.02.2023 10:57:52 ******/
CREATE DATABASE [GIBDD_Gorlanov_619]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GIBDD_Gorlanov_619', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GIBDD_Gorlanov_619.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GIBDD_Gorlanov_619_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GIBDD_Gorlanov_619_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GIBDD_Gorlanov_619].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET ARITHABORT OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET  MULTI_USER 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [GIBDD_Gorlanov_619]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VIN] [nvarchar](50) NOT NULL,
	[ManufacturerID] [int] NOT NULL,
	[CarModelID] [int] NOT NULL,
	[Year] [date] NOT NULL,
	[Weight] [int] NOT NULL,
	[Color] [int] NOT NULL,
	[EngineType] [int] NOT NULL,
	[TypeOfDriveID] [int] NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarModel]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CarModel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[PassportSerial] [nvarchar](50) NOT NULL,
	[PassportNumber] [nvarchar](50) NOT NULL,
	[Postcode] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NOT NULL,
	[AddressLife] [nvarchar](250) NULL,
	[CompanyID] [int] NULL,
	[JobID] [int] NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverCar]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverCar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DriverID] [int] NOT NULL,
	[CarID] [int] NOT NULL,
 CONSTRAINT [PK_DriverCar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverLicense]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverLicense](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DriverID] [int] NOT NULL,
	[LicenseID] [int] NOT NULL,
 CONSTRAINT [PK_DriverLicense] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inspector]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspector](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](4) NULL,
 CONSTRAINT [PK_Inspector] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobName]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobName](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_JobName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[License]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[License](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LicenseDate] [date] NOT NULL,
	[ExpireDate] [date] NOT NULL,
	[LicenceSeries] [nvarchar](50) NOT NULL,
	[LicenceNumber] [nvarchar](50) NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_License] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseCategory]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LicenseID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_LicenseCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManufacturerCarModel]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManufacturerCarModel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CarModelID] [int] NOT NULL,
	[ManufacturerID] [int] NOT NULL,
 CONSTRAINT [PK_ManufacturerCarModels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfDrive]    Script Date: 09.02.2023 10:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfDrive](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeOfDrive] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (1, N'WBAKG7C54DJ746310', 1, 1, CAST(N'1905-07-01' AS Date), 1794, 116, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (2, N'JN1CV6APXCM884333', 1, 1, CAST(N'1905-07-10' AS Date), 1523, 118, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (3, N'2C4RDGCG2FR292116', 1, 2, CAST(N'1905-06-16' AS Date), 1750, 120, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (4, N'2HNYD2H46CH088623', 1, 1, CAST(N'1905-06-13' AS Date), 1799, 127, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (5, N'KNAFU5A29D5373281', 1, 3, CAST(N'1905-07-08' AS Date), 1791, 128, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (6, N'1FTMF1E84AK129978', 1, 4, CAST(N'1905-06-28' AS Date), 1637, 129, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (7, N'WBAKE5C5XCJ498380', 1, 5, CAST(N'1905-07-08' AS Date), 1483, 133, 1, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (8, N'JTHFF2C27F2931205', 1, 5, CAST(N'1905-06-30' AS Date), 1574, 145, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (9, N'WBABW33455P972485', 1, 5, CAST(N'1905-06-18' AS Date), 1753, 170, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (10, N'5FNRL5H2XCB183642', 1, 5, CAST(N'1905-07-01' AS Date), 1409, 180, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (11, N'JTEBU4BF9DK234908', 1, 5, CAST(N'1905-07-10' AS Date), 1729, 201, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (12, N'1G6DM577280903075', 1, 6, CAST(N'1905-07-02' AS Date), 1711, 202, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (13, N'1GYFC43539R480716', 1, 5, CAST(N'1905-06-23' AS Date), 1748, 203, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (14, N'1N6AA0CJ3FN926889', 1, 6, CAST(N'1905-06-17' AS Date), 1761, 204, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (15, N'2T1BURHE6EC080516', 1, 7, CAST(N'1905-07-01' AS Date), 1574, 210, 3, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (16, N'WBA3T7C57FP608583', 1, 8, CAST(N'1905-06-24' AS Date), 1495, 215, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (17, N'5FNYF3H48FB049614', 1, 9, CAST(N'1905-06-26' AS Date), 1569, 217, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (18, N'WVWGD7AJ7EW053317', 1, 10, CAST(N'1905-06-30' AS Date), 1705, 223, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (19, N'JM1NC2LF0E0131767', 1, 10, CAST(N'1905-06-20' AS Date), 1585, 228, 3, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (20, N'1FTSW2A50AE633032', 1, 10, CAST(N'1905-06-15' AS Date), 1493, 233, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (21, N'2C3CCAKT5CH834724', 1, 10, CAST(N'1905-07-11' AS Date), 1633, 235, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (22, N'1FMJU1F5XAE067185', 1, 11, CAST(N'1905-06-26' AS Date), 1557, 236, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (23, N'5TFBY5F18AX095253', 2, 12, CAST(N'1905-06-16' AS Date), 1539, 245, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (24, N'WAUVC68E55A439175', 2, 13, CAST(N'1905-06-27' AS Date), 1471, 276, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (25, N'3D73M4CL0AG485600', 2, 14, CAST(N'1905-07-05' AS Date), 1500, 277, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (26, N'3D73M3CL4BG992821', 2, 15, CAST(N'1905-06-20' AS Date), 1750, 280, 1, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (27, N'2HNYD18214H913977', 2, 16, CAST(N'1905-06-14' AS Date), 1586, 286, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (28, N'1G6DJ5E34C0750992', 2, 17, CAST(N'1905-06-27' AS Date), 1455, 295, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (29, N'3VW217AU7FM147306', 2, 17, CAST(N'1905-06-26' AS Date), 1795, 311, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (30, N'1FMJU1J56AE113733', 2, 17, CAST(N'1905-06-19' AS Date), 1445, 340, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (31, N'JN1CV6AP0CM243398', 2, 18, CAST(N'1905-06-21' AS Date), 1433, 345, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (32, N'1FTWW3B5XAE601405', 2, 19, CAST(N'1905-06-22' AS Date), 1459, 370, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (33, N'WBASN2C55AC523024', 2, 19, CAST(N'1905-06-22' AS Date), 1504, 371, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (34, N'NM0KS9BNXBT830533', 2, 19, CAST(N'1905-06-13' AS Date), 1401, 373, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (35, N'1C4RJEAG6FC571030', 2, 19, CAST(N'1905-07-07' AS Date), 1677, 377, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (36, N'WBS3R9C51FF196091', 2, 20, CAST(N'1905-06-23' AS Date), 1596, 383, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (37, N'1G4HD57238U904159', 2, 21, CAST(N'1905-06-15' AS Date), 1583, 385, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (38, N'1HGCP2E46AA778977', 2, 21, CAST(N'1905-07-11' AS Date), 1417, 387, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (39, N'WAUBGAFB1AN276966', 2, 21, CAST(N'1905-06-14' AS Date), 1423, 399, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (40, N'WAUDF48H97A496239', 2, 21, CAST(N'1905-06-24' AS Date), 1652, 403, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (41, N'5UXFG83558L839159', 2, 21, CAST(N'1905-07-08' AS Date), 1777, 406, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (42, N'1FMJK1J51AE558998', 2, 22, CAST(N'1905-06-22' AS Date), 1426, 408, 3, 3)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (43, N'SCFBF03B27G582917', 2, 22, CAST(N'1905-07-04' AS Date), 1629, 415, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (44, N'WAUCFAFH0AN942677', 2, 23, CAST(N'1905-06-24' AS Date), 1438, 416, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (45, N'JN8CS1MU3EM315101', 2, 23, CAST(N'1905-06-21' AS Date), 1724, 417, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (46, N'1D7RE3BK7AS869215', 2, 24, CAST(N'1905-06-14' AS Date), 1434, 425, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (47, N'5N1AA0NC5EN749211', 2, 25, CAST(N'1905-06-17' AS Date), 1459, 427, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (48, N'3D7TT2CT1BG470774', 2, 26, CAST(N'1905-07-07' AS Date), 1460, 428, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (49, N'WBA3V5C5XFP343527', 2, 26, CAST(N'1905-06-19' AS Date), 1583, 445, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (50, N'1G6DE5E5XC0016413', 2, 27, CAST(N'1905-06-19' AS Date), 1601, 446, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (51, N'1FTSF3A50AE770400', 2, 27, CAST(N'1905-06-28' AS Date), 1505, 447, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (52, N'1FTEX1CM5BK565807', 2, 27, CAST(N'1905-07-01' AS Date), 1518, 448, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (53, N'1G6AH5S31F0348385', 2, 27, CAST(N'1905-06-20' AS Date), 1781, 449, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (54, N'1N4AB7APXDN538514', 2, 27, CAST(N'1905-06-21' AS Date), 1404, 456, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (55, N'3C6LD4AT3CG450587', 2, 27, CAST(N'1905-07-04' AS Date), 1744, 458, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (56, N'3GYFNCEY2BS887540', 2, 27, CAST(N'1905-06-16' AS Date), 1468, 460, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (57, N'1GYS4FEJ9CR310756', 2, 27, CAST(N'1905-07-11' AS Date), 1535, 464, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (58, N'WAUBFCFL8CN296660', 2, 27, CAST(N'1905-06-18' AS Date), 1573, 480, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (59, N'2T1BURHE5EC940812', 2, 27, CAST(N'1905-07-10' AS Date), 1679, 481, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (60, N'WAULT58EX5A470410', 2, 28, CAST(N'1905-07-08' AS Date), 1604, 487, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (61, N'JN8AF5MR7ET518545', 2, 29, CAST(N'1905-07-05' AS Date), 1614, 498, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (62, N'WAUAC48H96K683520', 2, 30, CAST(N'1905-07-03' AS Date), 1649, 509, 1, 3)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (63, N'WAUHGAFC8FN632100', 2, 30, CAST(N'1905-07-09' AS Date), 1711, 601, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (64, N'WAUWFBFL6AA160138', 2, 30, CAST(N'1905-07-09' AS Date), 1406, 602, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (65, N'WAUEH48H68K095273', 2, 30, CAST(N'1905-06-26' AS Date), 1736, 626, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (66, N'WAUEH74F76N744161', 2, 30, CAST(N'1905-06-17' AS Date), 1490, 628, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (67, N'1J4RG4GK7AC818854', 2, 30, CAST(N'1905-06-22' AS Date), 1636, 640, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (68, N'KNADH4A36B6877082', 2, 30, CAST(N'1905-06-28' AS Date), 1753, 670, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (69, N'3GYFNGEY9BS444647', 2, 30, CAST(N'1905-07-02' AS Date), 1419, 671, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (70, N'WP0AB2A87FK108949', 2, 30, CAST(N'1905-06-28' AS Date), 1791, 690, 1, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (71, N'3VWML7AJXEM569531', 3, 31, CAST(N'1905-06-15' AS Date), 1472, 793, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (72, N'WBSBR93493P275260', 3, 31, CAST(N'1905-07-02' AS Date), 1551, 795, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (73, N'1G6DP567750890960', 3, 31, CAST(N'1905-07-01' AS Date), 1449, 798, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (74, N'1FTEW1CM3DF334371', 3, 32, CAST(N'1905-06-27' AS Date), 1540, 963, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (75, N'WAUDH78E47A363910', 3, 32, CAST(N'1905-06-21' AS Date), 1736, 101, 2, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (76, N'1C4RJEAG6CC011603', 3, 33, CAST(N'1905-07-01' AS Date), 1692, 107, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (77, N'1G6AB5SA9D0113584', 3, 34, CAST(N'1905-06-13' AS Date), 1665, 110, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (78, N'1N6BF0KM6FN922689', 3, 35, CAST(N'1905-06-15' AS Date), 1725, 116, 1, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (79, N'WA1YL64B34N831763', 3, 35, CAST(N'1905-06-17' AS Date), 1710, 118, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (80, N'WBAUP9C58AV223509', 3, 36, CAST(N'1905-07-03' AS Date), 1562, 120, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (81, N'WAUHF98P96A724812', 3, 37, CAST(N'1905-06-13' AS Date), 1512, 127, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (82, N'1FTEX1CM1BF296018', 3, 38, CAST(N'1905-06-14' AS Date), 1638, 128, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (83, N'3LNDL2L33CR462059', 3, 39, CAST(N'1905-06-22' AS Date), 1609, 129, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (84, N'19UUA66218A797800', 3, 39, CAST(N'1905-06-25' AS Date), 1603, 133, 1, 3)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (85, N'ZFBCFACH5FZ996096', 3, 40, CAST(N'1905-06-17' AS Date), 1669, 145, 2, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (86, N'4T1BF1FK2EU831999', 3, 40, CAST(N'1905-07-07' AS Date), 1468, 170, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (87, N'2G4WS55J341869989', 3, 41, CAST(N'1905-06-28' AS Date), 1546, 180, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (88, N'1G6DN57U260742856', 3, 42, CAST(N'1905-06-17' AS Date), 1608, 201, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (89, N'YV1382MW1A2097161', 3, 42, CAST(N'1905-06-19' AS Date), 1757, 202, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (90, N'WA1LMAFE9DD722859', 3, 43, CAST(N'1905-06-26' AS Date), 1505, 203, 3, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (91, N'1FAHP3E28CL132877', 3, 44, CAST(N'1905-06-25' AS Date), 1651, 204, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (92, N'WBAUP7C52BV069773', 3, 45, CAST(N'1905-06-17' AS Date), 1675, 210, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (93, N'1ZVBP8JZ2D5191071', 3, 45, CAST(N'1905-06-18' AS Date), 1459, 215, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (94, N'3C63D2GL5CG863137', 3, 46, CAST(N'1905-07-03' AS Date), 1576, 217, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (95, N'1G6KF57952U735337', 3, 46, CAST(N'1905-06-16' AS Date), 1421, 223, 1, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (96, N'5XYKT3A62FG416932', 3, 47, CAST(N'1905-06-22' AS Date), 1518, 228, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (97, N'WBANV1C59AC580740', 3, 48, CAST(N'1905-07-04' AS Date), 1682, 233, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (98, N'WAUFGAFC6DN013144', 3, 49, CAST(N'1905-06-28' AS Date), 1508, 235, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (99, N'3VWKX7AJ2DM808838', 3, 50, CAST(N'1905-06-17' AS Date), 1475, 236, 3, 1)
GO
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (100, N'1G6DJ1E37D0628461', 3, 51, CAST(N'1905-06-12' AS Date), 1768, 245, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (101, N'5FRYD4H97GB588815', 3, 52, CAST(N'1905-06-20' AS Date), 1737, 276, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (102, N'SCBDU3ZA7CC107541', 3, 52, CAST(N'1905-06-27' AS Date), 1680, 277, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (103, N'3VWF17AT3FM605285', 3, 52, CAST(N'1905-06-13' AS Date), 1539, 280, 1, 3)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (104, N'1LNHL9DK8EG585379', 3, 53, CAST(N'1905-06-25' AS Date), 1757, 286, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (105, N'JN8AZ2KR3DT115699', 3, 54, CAST(N'1905-07-11' AS Date), 1725, 295, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (106, N'JN1CV6FEXCM381103', 3, 55, CAST(N'1905-06-25' AS Date), 1698, 301, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (107, N'1G6DH5E5XC0462438', 3, 56, CAST(N'1905-07-09' AS Date), 1705, 302, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (108, N'TRURD38J381614210', 3, 56, CAST(N'1905-06-15' AS Date), 1767, 307, 2, 3)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (109, N'4T1BD1FK6FU133645', 3, 56, CAST(N'1905-07-10' AS Date), 1668, 310, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (110, N'2T1BURHE4FC565514', 3, 57, CAST(N'1905-07-03' AS Date), 1571, 311, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (111, N'5TDBW5G12FS063304', 3, 57, CAST(N'1905-06-26' AS Date), 1783, 340, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (112, N'WAULFAFR3DA033269', 3, 57, CAST(N'1905-07-01' AS Date), 1659, 345, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (113, N'1G6DK8ED9B0319764', 3, 58, CAST(N'1905-06-17' AS Date), 1720, 370, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (114, N'3VW4A7AT6DM813925', 3, 59, CAST(N'1905-07-09' AS Date), 1744, 371, 1, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (115, N'WVWAB7AJ0CW557264', 3, 60, CAST(N'1905-07-09' AS Date), 1667, 373, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (116, N'4A31K2DF7BE138498', 3, 59, CAST(N'1905-07-08' AS Date), 1745, 110, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (117, N'JN1AZ4EH7AM509399', 4, 61, CAST(N'1905-06-30' AS Date), 1775, 116, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (118, N'2T3BFREV2EW071669', 4, 62, CAST(N'1905-06-14' AS Date), 1779, 118, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (119, N'YV1612FH2D1519917', 4, 62, CAST(N'1905-06-30' AS Date), 1769, 120, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (120, N'JH4KA96631C195497', 4, 62, CAST(N'1905-06-12' AS Date), 1528, 127, 3, 2)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (121, N'WBAEK13597C722490', 4, 63, CAST(N'1905-06-13' AS Date), 1496, 128, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (122, N'1GYS3HKJ9FR278172', 4, 64, CAST(N'1905-07-03' AS Date), 1420, 129, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (123, N'WAUD2AFD1EN207208', 4, 65, CAST(N'1905-07-05' AS Date), 1763, 133, 2, 3)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (124, N'WAULL44E35N431957', 4, 65, CAST(N'1905-06-14' AS Date), 1460, 145, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (125, N'KNAFU6A20B5806571', 4, 66, CAST(N'1905-06-29' AS Date), 1526, 170, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (126, N'SAJWA2GTXEM305896', 4, 67, CAST(N'1905-06-17' AS Date), 1771, 180, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (127, N'WAULL44E95N690503', 4, 68, CAST(N'1905-07-09' AS Date), 1601, 201, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (128, N'WAUGFAFC5DN926548', 4, 69, CAST(N'1905-06-14' AS Date), 1663, 202, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (129, N'5TDBM5G19BS020076', 4, 70, CAST(N'1905-07-01' AS Date), 1594, 203, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (130, N'3N1AB6AP7BL573385', 4, 71, CAST(N'1905-06-20' AS Date), 1515, 204, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (131, N'5XYZT3LB7FG893235', 4, 72, CAST(N'1905-07-05' AS Date), 1662, 210, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (132, N'JH4KC1F78EC530392', 4, 73, CAST(N'1905-06-26' AS Date), 1718, 215, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (133, N'2G4WE587581834383', 4, 74, CAST(N'1905-06-26' AS Date), 1577, 217, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (134, N'WAUDF48H98K345526', 4, 75, CAST(N'1905-06-30' AS Date), 1469, 223, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (135, N'WBA3G7C54EF309612', 4, 75, CAST(N'1905-06-30' AS Date), 1453, 228, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (136, N'1G6DD8E31E0169171', 1, 3, CAST(N'1905-07-08' AS Date), 1633, 233, 1, 3)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (137, N'YV1902FH3D1001332', 1, 4, CAST(N'1905-07-11' AS Date), 1797, 235, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (138, N'3N1CN7AP5FL866147', 1, 5, CAST(N'1905-06-28' AS Date), 1706, 236, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (139, N'YV4902NC8F1531985', 1, 5, CAST(N'1905-07-06' AS Date), 1685, 245, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (140, N'KL4CJFSB9FB654370', 1, 5, CAST(N'1905-06-15' AS Date), 1664, 276, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (141, N'JN1BV7APXFM374795', 1, 5, CAST(N'1905-06-16' AS Date), 1756, 277, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (142, N'WAUAFAFH7EN465064', 1, 5, CAST(N'1905-06-22' AS Date), 1534, 280, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (143, N'WAUVC68E33A401568', 1, 6, CAST(N'1905-06-28' AS Date), 1716, 286, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (144, N'KMHTC6AD4EU662541', 1, 5, CAST(N'1905-06-22' AS Date), 1610, 295, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (145, N'5UXFG43539L241999', 1, 6, CAST(N'1905-07-04' AS Date), 1597, 301, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (146, N'1GYS3FEJ8CR664092', 1, 7, CAST(N'1905-06-18' AS Date), 1701, 302, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (147, N'WBAKN9C51FD688174', 1, 8, CAST(N'1905-06-30' AS Date), 1691, 307, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (148, N'5NMSG3AB7AH234028', 1, 9, CAST(N'1905-06-29' AS Date), 1447, 310, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (149, N'SALAB2V67FA465605', 1, 10, CAST(N'1905-06-30' AS Date), 1723, 311, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (150, N'JN1CY0APXAM160384', 1, 10, CAST(N'1905-06-29' AS Date), 1722, 340, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (151, N'WBAUP7C58DV367411', 1, 10, CAST(N'1905-06-29' AS Date), 1622, 345, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (152, N'WAUAFAFL0FN838290', 1, 10, CAST(N'1905-07-09' AS Date), 1725, 370, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (153, N'1LNHL9EK9FG365197', 1, 10, CAST(N'1905-07-07' AS Date), 1456, 371, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (154, N'YV1672MK0D2114467', 1, 10, CAST(N'1905-06-26' AS Date), 1480, 373, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (155, N'WAUKG98E56A006286', 1, 76, CAST(N'1905-07-01' AS Date), 1481, 377, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (156, N'SAJWA4EB7EL432469', 1, 77, CAST(N'1905-06-26' AS Date), 1438, 383, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (157, N'3LNHL2GC0AR226381', 1, 78, CAST(N'1905-06-14' AS Date), 1611, 385, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (158, N'WAUVFAFH7BN873285', 1, 79, CAST(N'1905-06-28' AS Date), 1581, 387, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (159, N'SALAG2D47AA801263', 1, 80, CAST(N'1905-06-15' AS Date), 1527, 399, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (160, N'WBSWD9C57AP228332', 1, 80, CAST(N'1905-06-29' AS Date), 1426, 403, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (161, N'1FTWW3B53AE587413', 1, 80, CAST(N'1905-06-29' AS Date), 1674, 406, 3, 3)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (162, N'4USBU53567L936239', 1, 81, CAST(N'1905-06-13' AS Date), 1596, 408, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (163, N'1FTWF3D57AE486873', 1, 81, CAST(N'1905-07-06' AS Date), 1656, 415, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (164, N'2G4WD582261511218', 1, 11, CAST(N'1905-06-16' AS Date), 1731, 416, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (165, N'WBAGN83515D855874', 2, 12, CAST(N'1905-06-27' AS Date), 1763, 417, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (166, N'2C3CDXL97FH493561', 2, 13, CAST(N'1905-06-22' AS Date), 1454, 215, 1, 3)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (167, N'WAUKD78P89A662503', 2, 14, CAST(N'1905-06-16' AS Date), 1450, 217, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (168, N'JM3TB2MA6A0887683', 2, 15, CAST(N'1905-07-06' AS Date), 1675, 223, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (169, N'5TDBK3EH2BS734111', 2, 16, CAST(N'1905-07-11' AS Date), 1567, 228, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (170, N'WBABV13466J082217', 2, 17, CAST(N'1905-06-15' AS Date), 1499, 233, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (171, N'WBAPM7C57AE459062', 2, 17, CAST(N'1905-06-29' AS Date), 1696, 235, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (172, N'2FMPK3K98FB482688', 2, 17, CAST(N'1905-06-29' AS Date), 1678, 236, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (173, N'WAUKFAFL5EA281418', 2, 18, CAST(N'1905-06-27' AS Date), 1442, 245, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (174, N'WAUVT68E94A410180', 2, 19, CAST(N'1905-07-01' AS Date), 1663, 276, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (175, N'2B3CK2CV1AH775495', 2, 19, CAST(N'1905-06-24' AS Date), 1526, 277, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (176, N'1HGCR2E55EA286661', 2, 19, CAST(N'1905-06-14' AS Date), 1523, 280, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (177, N'JH4CU2F68BC631071', 2, 19, CAST(N'1905-06-16' AS Date), 1770, 286, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (178, N'2HNYB1H68DH924015', 2, 20, CAST(N'1905-06-14' AS Date), 1773, 295, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (179, N'1FTEW1E86AF818093', 2, 21, CAST(N'1905-06-17' AS Date), 1437, 301, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (180, N'3C6TD4HTXCG839880', 2, 21, CAST(N'1905-07-09' AS Date), 1488, 302, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (181, N'WVGAV7AX3BW390470', 2, 21, CAST(N'1905-07-03' AS Date), 1493, 307, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (182, N'WAUUL78E45A200167', 2, 82, CAST(N'1905-06-20' AS Date), 1532, 310, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (183, N'JTMHY7AJ9B4091499', 2, 83, CAST(N'1905-07-04' AS Date), 1694, 311, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (184, N'SAJWA0FS8FP468222', 2, 84, CAST(N'1905-06-29' AS Date), 1614, 340, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (185, N'JM1NC2LF9D0043475', 3, 85, CAST(N'1905-06-21' AS Date), 1483, 345, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (186, N'1GD422CGXEF170253', 3, 85, CAST(N'1905-06-12' AS Date), 1579, 370, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (187, N'JN1BV7APXFM590680', 3, 85, CAST(N'1905-06-25' AS Date), 1762, 371, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (188, N'JHMZF1C46CS958531', 3, 86, CAST(N'1905-06-14' AS Date), 1572, 373, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (189, N'WAUGGAFR1DA366441', 3, 86, CAST(N'1905-06-27' AS Date), 1753, 377, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (190, N'WA1WMAFE2DD971257', 3, 87, CAST(N'1905-06-21' AS Date), 1487, 383, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (191, N'WA1AV94L37D000070', 3, 87, CAST(N'1905-07-08' AS Date), 1702, 385, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (192, N'WVWAA7AJ5CW398762', 3, 87, CAST(N'1905-07-06' AS Date), 1587, 301, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (193, N'1G6AP5SX1E0768734', 3, 87, CAST(N'1905-06-23' AS Date), 1713, 302, 3, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (194, N'WBAWV13557P451979', 3, 88, CAST(N'1905-06-15' AS Date), 1560, 307, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (195, N'1G6DA1E30E0416888', 3, 88, CAST(N'1905-07-02' AS Date), 1506, 310, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (196, N'SALFR2BG8FH292196', 3, 89, CAST(N'1905-07-09' AS Date), 1769, 311, 2, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (197, N'TRUDD38J481844056', 3, 31, CAST(N'1905-07-07' AS Date), 1567, 340, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (198, N'WDDHH8HB5BA767975', 3, 31, CAST(N'1905-06-19' AS Date), 1788, 345, 1, 1)
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (199, N'WA1CV74LX9D994734', 3, 31, CAST(N'1905-07-11' AS Date), 1784, 370, 2, 1)
GO
INSERT [dbo].[Car] ([ID], [VIN], [ManufacturerID], [CarModelID], [Year], [Weight], [Color], [EngineType], [TypeOfDriveID]) VALUES (200, N'1FTSX2A58AE041570', 3, 32, CAST(N'1905-06-18' AS Date), 1651, 371, 2, 1)
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[CarModel] ON 

INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (1, N'1-Series')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (2, N'2-Series')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (3, N'New Class 1602, 1802, 2002')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (4, N'3-Series')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (5, N'3-Series, M3')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (6, N'4-Series, M4')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (7, N'3-Series GT')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (8, N'New Class 1500, 1600, 1800, 2000')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (9, N'5-Series')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (10, N'5-Series, M5')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (11, N'X7')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (12, N'Cimarron')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (13, N'BLS')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (14, N'ATS')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (15, N'ELR')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (16, N'Catera')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (17, N'CTS')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (18, N'Series 60')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (19, N'Series 61')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (20, N'Series 65')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (21, N'Series 62')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (22, N'6200')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (23, N'Series 60 (Sixty Special)')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (24, N'Fleetwood Brougham')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (25, N'Brougham')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (26, N'Fleetwood')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (27, N'Series 75')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (28, N'Fleetwood Limousine')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (29, N'Fleetwood 75')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (30, N'Eldorado')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (31, N'Cee''d')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (32, N'Sephia')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (33, N'Cerato / Spectra')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (34, N'Forte')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (35, N'Forte / K3')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (36, N'Shuma')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (37, N'Concord')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (38, N'Clarus')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (39, N'Magentis / Optima')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (40, N'Magentis / Optima / K5')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (41, N'Stinger')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (42, N'Potentia')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (43, N'Enterprise')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (44, N'Opirus / Amanti')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (45, N'Cadenza / K7')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (46, N'Quoris / K9 / K900')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (47, N'Elan')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (48, N'Venga')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (49, N'Carens')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (50, N'Carens / Rondo')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (51, N'Joice')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (52, N'Carnival / Sedona')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (53, N'Retona')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (54, N'Stonic')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (55, N'Niro')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (56, N'Sportage')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (57, N'Sorento')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (58, N'Mohave / Borrego')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (59, N'Bongo')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (60, N'Bongo Frontier')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (61, N'Fusca')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (62, N'Gol')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (63, N'Voyage / Fox')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (64, N'Voyage')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (65, N'Parati')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (66, N'Fox')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (67, N'Brasilia')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (68, N'Apollo')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (69, N'Logus')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (70, N'Pointer')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (71, N'Santana')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (72, N'Quantum')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (73, N'SpaceFox / Suran / SportVan / Fox Plus')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (74, N'SP2')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (75, N'Saveiro')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (76, N'5-Series GT')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (77, N'6-Series GT')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (78, N'New Six CS')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (79, N'X4')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (80, N'X5')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (81, N'X6')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (82, N'Escalade')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (83, N'Allanté')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (84, N'XLR')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (85, N'Picanto')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (86, N'Pride')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (87, N'Rio')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (88, N'Soul')
INSERT [dbo].[CarModel] ([ID], [Name]) VALUES (89, N'Avella')
SET IDENTITY_INSERT [dbo].[CarModel] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'A')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (2, N'B')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (3, N'C')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (4, N'D')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (5, N'D1E')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (6, N'D1')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (7, N'Tb')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([ID], [Name]) VALUES (1, N'Global Gillette')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (2, N'Coca-Cola')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (3, N'Harley-Davidson Motor Company')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (4, N'Corona')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (5, N'Johnnie Walker')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (6, N'SAP')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (7, N'Smirnoff')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (8, N'Toyota Motor Corporation')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (9, N'Caterpillar Inc.')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (10, N'Avon')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (11, N'Budweiser Stag Brewing Company')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (12, N'IBM')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (13, N'Chase')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (14, N'NTT Data')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (15, N'Intel Corporation')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (16, N'Sony')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (17, N'Tesco Corporation')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (18, N'Microsoft')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (19, N'McDonald''s')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (20, N'VISA')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (21, N'Zara')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (22, N'Morgan Stanley')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (23, N'Mitsubishi')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (24, N'Audi')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (25, N'eBay')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (26, N'Ralph Lauren Corporation')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (27, N'Wal-Mart')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (28, N'Panasonic Corporation')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (29, N'Nike, Inc.')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (30, N'Nissan Motor Co., Ltd.')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (31, N'MTV')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (32, N'Cartier SA')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (33, N'Nescafé')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (34, N'Allianz')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (35, N'Ferrari S.p.A.')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (36, N'Kleenex')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (37, N'Tiffany & Co.')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (38, N'3M')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (39, N'Shell Oil Company')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (40, N'Adobe Systems')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (41, N'IKEA')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (42, N'Nokia')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (43, N'Sprite')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (44, N'Xerox')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (45, N'Samsung Group')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (46, N'Google')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (47, N'Louis Vuitton')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (48, N'Apple Inc.')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (49, N'Verizon Communications')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (50, N'Credit Suisse')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (51, N'Wells Fargo')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (52, N'Yahoo!')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (53, N'Porsche')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (54, N'Moët et Chandon')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (55, N'Hyundai')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (56, N'Honda Motor Company, Ltd')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (57, N'Beko')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (58, N'Deere & Company')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (59, N'Volkswagen Group')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (60, N'Pampers')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (61, N'BlackBerry')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (62, N'Jack Daniel''s')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (63, N'Facebook, Inc.')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (64, N'United Parcel Service')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (65, N'Adidas')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (66, N'Siemens AG')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (67, N'Citigroup')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (68, N'Amazon.com')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (69, N'AT&T')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (70, N'Starbucks')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (71, N'Prada')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (72, N'Gap Inc.')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (73, N'Kia Motors')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (74, N'Cisco Systems, Inc.')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (75, N'Home Depot')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (76, N'Vodafone')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (77, N'Hewlett-Packard')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (78, N'Hermès')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (79, N'Oracle Corporation')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (80, N'Canon')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (81, N'KFC')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (82, N'General Electric')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (83, N'BMW')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (84, N'The Walt Disney Company')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (85, N'American Express')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (86, N'Burberry')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (87, N'Pizza Hut')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (88, N'H&M')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (89, N'Heineken Brewery')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (90, N'PepsiCo')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (91, N'Bank of America')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (92, N'Nintendo')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (93, N'Johnson & Johnson')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (94, N'HSBC')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (95, N'Kellogg Company')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (96, N'MasterCard')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (97, N'Gucci')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (98, N'Mercedes-Benz')
INSERT [dbo].[Company] ([ID], [Name]) VALUES (99, N'L''Oréal')
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Driver] ON 

INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (1, N'Alonso', N'Hopkins', N'Caleb', N'2303', N'160716', N'760832', N'452 Cobblestone St.', NULL, 1, 1, N'+7(970)383-8933', N'skippy@icloud.com', N'/Images/001-happy-18.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (2, N'Kaydence', N'Sellers', N'Susannah', N'5563', N'160745', N'807042', N'Hyattsville, MD 20782', NULL, 2, 2, N'+7(867)708-4447', N'isotopian@sbcglobal.net', N'/Images/002-cool-5.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (3, N'Finnegan', N'Bray', N'Brighton', N'3719', N'717453', N'83282', N'9648 Philmont Lane', NULL, 3, 3, N'+7(221)428-7850', N'isaacson@att.net', N'/Images/003-happy-17.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (4, N'Gideon', N'Arias', N'Varian', N'5810', N'721066', N'768289', N'Hanover Park, IL 60133', NULL, 4, 4, N'+7(786)274-7872', N'mugwump@mac.com', N'/Images/004-surprised-9.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (5, N'Case', N'Schultz', N'Aiden', N'2208', N'937197', N'780691', N'8438 North Fairground Court', NULL, 5, 5, N'+7(365)752-6445', N'mcmillan@optonline.net', N'/Images/005-shocked-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (6, N'Pierre', N'Alvarado', N'Harriet', N'7184', N'275223', N'845839', N'Woodstock, GA 30188', NULL, 6, 6, N'+7(446)639-6043', N'dinther@hotmail.com', N'/Images/006-shocked-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (7, N'Esteban', N'Bell', N'Cameron', N'9563', N'574791', N'94009', N'148 Catherine Dr.', NULL, 7, 7, N'+7(555)444-8316', N'pizza@yahoo.com', N'/Images/007-nervous-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (8, N'Spencer', N'Anderson', N'Meaghan', N'9008', N'379623', N'674783', N'Lithonia, GA 30038', NULL, 8, 8, N'+7(392)682-4442', N'murty@outlook.com', N'/Images/008-nervous-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (9, N'Seth', N'Sweeney', N'Jax', N'3810', N'530169', N'845247', N'708 6th Drive', NULL, 9, 9, N'+7(836)429-0386', N'aegreene@me.com', N'/Images/009-angry-6.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (10, N'Lincoln', N'Mason', N'Emeline', N'5387', N'689700', N'252988', N'Egg Harbor Township, NJ 08234', NULL, 10, 10, N'+7(283)945-3092', N'jnolan@aol.com', N'/Images/010-drool.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (11, N'Lindsay', N'Curtis', N'Syllable', N'1152', N'481271', N'777867', N'8992 Union Rd.', NULL, 11, 11, N'+7(621)359-3669', N'msherr@optonline.net', N'/Images/011-tired-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (12, N'Noah', N'Daugherty', N'Thomas', N'2924', N'764363', N'504859', N'Villa Park, IL 60181', NULL, 12, 12, N'+7(440)561-0314', N'ranasta@icloud.com', N'/Images/012-tongue-7.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (13, N'Darien', N'Sellers', N'Nadeen', N'5110', N'869140', N'779085', N'12 Windsor St.', NULL, 13, 13, N'+7(331)918-2434', N'punkis@hotmail.com', N'/Images/013-tongue-6.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (14, N'Jaylene', N'Schneider', N'Xavier', N'6948', N'84332', N'144573', N'Waynesboro, PA 17268', NULL, 14, 14, N'+7(944)627-0176', N'pereinar@yahoo.com', N'/Images/014-tongue-5.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (15, N'Leonard', N'Schmitt', N'Vincent', N'7045', N'366325', N'864380', N'549 Lake View Dr.', NULL, 15, 15, N'+7(621)405-7195', N'tskirvin@mac.com', N'/Images/015-smile-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (16, N'Maya', N'Richardson', N'Heath', N'7100', N'947091', N'265294', N'Garland, TX 75043', NULL, 16, 16, N'+7(837)639-1067', N'kewley@sbcglobal.net', N'/Images/016-sleeping-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (17, N'Thalia', N'Delacruz', N'Caprice', N'9169', N'340517', N'137788', N'314 N. Gulf Lane', NULL, 17, 17, N'+7(769)610-7084', N'ehood@icloud.com', N'/Images/017-nervous.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (18, N'Maci', N'Baird', N'Dustin', N'3097', N'188032', N'340075', N'Hollywood, FL 33020', NULL, 18, 18, N'+7(308)686-7622', N'ilial@aol.com', N'/Images/018-surprised-8.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (19, N'Ace', N'Stephenson', N'Amity', N'7796', N'170860', N'531408', N'3 Cooper Street', NULL, 19, 19, N'+7(319)872-3287', N'elmer@comcast.net', N'/Images/019-tongue-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (20, N'Robert', N'Castro', N'Isaiah', N'5001', N'550223', N'912556', N'Coventry, RI 02816', NULL, 20, 20, N'+7(341)620-5356', N'scarolan@live.com', N'/Images/020-happy-16.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (21, N'Efrain', N'Stark', N'Jared', N'4204', N'741281', N'838795', N'53 E. Marvon St.', NULL, 21, 21, N'+7(266)561-7456', N'bwcarty@yahoo.com', N'/Images/021-wink-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (22, N'Katelynn', N'Montgomery', N'Drake', N'1209', N'731500', N'520544', N'Jamaica Plain, MA 02130', NULL, 22, 22, N'+7(408)673-0059', N'facet@outlook.com', N'/Images/022-laughing-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (23, N'Sammy', N'Freeman', N'Lane', N'1085', N'749551', N'902946', N'15 Indian Summer St.', NULL, 23, 23, N'+7(906)825-5704', N'metzzo@att.net', N'/Images/023-laughing-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (24, N'Jamal', N'Stokes', N'Rayleen', N'7125', N'277444', N'684826', N'Canton, GA 30114', NULL, 24, 24, N'+7(866)732-4338', N'slaff@aol.com', N'/Images/024-sweat-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (25, N'Lilliana', N'Bell', N'Quintin', N'4858', N'465200', N'299125', N'1 Rockville Ave.', NULL, 25, 25, N'+7(744)876-9856', N'caidaperl@mac.com', N'/Images/025-happy-15.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (26, N'Jaidyn', N'Ali', N'Kaitlin', N'9255', N'131955', N'623940', N'Piedmont, SC 29673', NULL, 26, 26, N'+7(872)230-3310', N'jigsaw@verizon.net', N'/Images/026-happy-14.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (27, N'Solomon', N'Nixon', N'Jolee', N'3965', N'425455', N'243802', N'154 Galvin Ave.', NULL, 27, 27, N'+7(572)467-2895', N'hoyer@optonline.net', N'/Images/027-laughing.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (28, N'Isaias', N'Mcdowell', N'Kalan', N'4368', N'409875', N'697427', N'Savannah, GA 31404', NULL, 28, 28, N'+7(451)768-6075', N'danneng@msn.com', N'/Images/028-happy-13.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (29, N'Neveah', N'Dean', N'Evony', N'9283', N'299023', N'503601', N'56 Annadale Dr.', NULL, 29, 29, N'+7(555)802-6671', N'burniske@outlook.com', N'/Images/029-happy-12.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (30, N'Koen', N'Waters', N'Abraham', N'4065', N'664366', N'732787', N'Lititz, PA 17543', NULL, 30, 30, N'+7(833)460-5788', N'jipsen@sbcglobal.net', N'/Images/030-crying-8.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (31, N'Cale', N'Odom', N'Ann', N'4877', N'252066', N'650754', N'7285 Locust Drive', NULL, 31, 31, N'+7(234)895-8976', N'agapow@hotmail.com', N'/Images/031-crying-7.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (32, N'Layton', N'Ruiz', N'Aryn', N'8656', N'317830', N'924502', N'Jackson Heights, NY 11372', NULL, 32, 32, N'+7(682)469-8567', N'mobileip@icloud.com', N'/Images/032-bored.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (33, N'Monserrat', N'Patrick', N'Coralie', N'1583', N'513755', N'670778', N'935 West Ave.', NULL, 33, 33, N'+7(682)555-7940', N'mglee@yahoo.com', N'/Images/033-cool-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (34, N'Kamden', N'Hardin', N'Ray', N'2179', N'517256', N'939472', N'Columbus, GA 31904', NULL, 34, 34, N'+7(575)985-7625', N'animats@yahoo.ca', N'/Images/034-angry-5.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (35, N'Janiya', N'Neal', N'Irene', N'5244', N'495362', N'172365', N'720 Summerhouse Street', NULL, 35, 35, N'+7(313)507-8540', N'drewf@me.com', N'/Images/035-sad-14.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (36, N'Cornelius', N'Winters', N'James', N'9584', N'586486', N'424571', N'Maryville, TN 37803', NULL, 36, 36, N'+7(608)783-0267', N'slanglois@msn.com', N'/Images/036-angry-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (37, N'Kaden', N'Love', N'Neil', N'1850', N'453434', N'478037', N'139 N. Grand St.', NULL, 37, 37, N'+7(688)656-7203', N'notaprguy@verizon.net', N'/Images/037-happy-11.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (38, N'Finley', N'Mills', N'Ace', N'4286', N'976952', N'843098', N'Irwin, PA 15642', NULL, 38, 38, N'+7(530)402-7915', N'yruan@sbcglobal.net', N'/Images/038-angry-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (39, N'Markus', N'Henry', N'Edward', N'2767', N'784535', N'900432', N'400 Amerige St.', NULL, 39, 39, N'+7(262)635-2834', N'bmorrow@me.com', N'/Images/039-cyclops-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (40, N'Romeo', N'Singleton', N'Preston', N'7677', N'990002', N'425361', N'Evans, GA 30809', NULL, 40, 40, N'+7(487)957-3536', N'adillon@verizon.net', N'/Images/040-surprised-7.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (41, N'Ethen', N'Glenn', N'Kate', N'6342', N'37367', N'815003', N'225 Iroquois St.', NULL, 41, 41, N'+7(918)285-4740', N'kimvette@me.com', N'/Images/041-thinking-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (42, N'Abbey', N'Gordon', N'Berlynn', N'8909', N'475995', N'60302', N'Vienna, VA 22180', NULL, 42, 42, N'+7(412)706-8937', N'emcleod@outlook.com', N'/Images/042-book.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (43, N'Presley', N'Vasquez', N'Sheridan', N'9144', N'720543', N'529399', N'44 Ocean Ave.', NULL, 43, 43, N'+7(454)353-8089', N'stomv@aol.com', N'/Images/043-baby-boy.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (44, N'Alexis', N'Levine', N'Juan', N'6021', N'143882', N'191499', N'Long Beach, NY 11561', NULL, 44, 44, N'+7(623)716-7237', N'msusa@comcast.net', N'/Images/044-dead-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (45, N'Steve', N'Miles', N'Lydon', N'4607', N'499410', N'292234', N'192 West Foster St.', NULL, 45, 45, N'+7(594)615-8545', N'dougj@yahoo.com', N'/Images/045-star.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (46, N'Kayley', N'Cuevas', N'Tyson', N'4676', N'263545', N'194258', N'Long Branch, NJ 07740', NULL, 46, 46, N'+7(647)885-2301', N'jlbaumga@gmail.com', N'/Images/046-dubious.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (47, N'Annabelle', N'Hebert', N'Annora', N'6571', N'27113', N'415905', N'43 SE. Cross Court', NULL, 47, 47, N'+7(822)693-3953', N'temmink@mac.com', N'/Images/047-phone-call.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (48, N'Carolina', N'Casey', N'Timothy', N'2307', N'511412', N'598986', N'Centereach, NY 11720', NULL, 48, 48, N'+7(887)236-8493', N'nighthawk@msn.com', N'/Images/048-moon.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (49, N'Beckham', N'Roach', N'Elias', N'4756', N'956293', N'906312', N'946 Yukon Lane', NULL, 49, 49, N'+7(531)597-0196', N'qmacro@outlook.com', N'/Images/049-robot.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (50, N'Seamus', N'Pugh', N'Jackson', N'4693', N'133588', N'989757', N'Winter Springs, FL 32708', NULL, 50, 50, N'+7(506)774-1574', N'stewwy@att.net', N'/Images/050-flower.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (51, N'Imani', N'Calderon', N'Sullivan', N'7598', N'90859', N'46335', N'330 Poplar Lane', NULL, 51, 51, N'+7(639)813-8035', N'blixem@msn.com', N'/Images/051-happy-10.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (52, N'Marisol', N'Roach', N'Dezi', N'2416', N'240325', N'245515', N'Titusville, FL 32780', NULL, 52, 52, N'+7(883)455-5204', N'mccurley@optonline.net', N'/Images/052-happy-9.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (53, N'Kane', N'Jacobson', N'Emerson', N'3896', N'957754', N'368276', N'626 Leatherwood St.', NULL, 53, 53, N'+7(833)914-4764', N'jacks@mac.com', N'/Images/053-tired-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (54, N'Anya', N'Higgins', N'Erin', N'6573', N'581276', N'372963', N'Lynn, MA 01902', NULL, 54, 54, N'+7(810)945-3933', N'nwiger@att.net', N'/Images/054-ugly-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (55, N'Branson', N'Richard', N'Linnea', N'2225', N'886655', N'446339', N'9971 N. Rockville Avenue', NULL, 55, 55, N'+7(995)610-9002', N'muadip@me.com', N'/Images/055-tongue-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (56, N'Kyle', N'Mathis', N'Raine', N'8966', N'340666', N'490162', N'Duluth, GA 30096', NULL, 56, 56, N'+7(394)581-3937', N'gavinls@yahoo.com', N'/Images/056-vampire.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (57, N'Jamiya', N'Cross', N'Trevor', N'1754', N'958143', N'246531', N'9542 Sutor Drive', NULL, 57, 57, N'+7(732)375-2363', N'nicktrig@me.com', N'/Images/057-music-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (58, N'Selah', N'Keller', N'Merle', N'4434', N'406702', N'268770', N'Phoenixville, PA 19460', NULL, 58, 58, N'+7(587)444-2070', N'lbecchi@me.com', N'/Images/058-popcorn.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (59, N'Larry', N'Watson', N'Blayne', N'4859', N'211563', N'898596', N'299 E. George St.', NULL, 59, 59, N'+7(845)438-1802', N'willg@att.net', N'/Images/059-nurse.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (60, N'Braeden', N'Shea', N'Abe', N'5348', N'104186', N'316595', N'Westport, CT 06880', NULL, 60, 60, N'+7(320)478-3865', N'rnelson@yahoo.com', N'/Images/060-sad-13.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (61, N'Allisson', N'Woodard', N'Joan', N'9216', N'132859', N'635754', N'7671 Tunnel Street', NULL, 61, 61, N'+7(486)828-8733', N'roesch@aol.com', N'/Images/061-graduated-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (62, N'Amy', N'Garner', N'Tanner', N'6127', N'199319', N'509105', N'Fair Lawn, NJ 07410', NULL, 62, 62, N'+7(497)215-8724', N'pthomsen@verizon.net', N'/Images/062-happy-8.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (63, N'Saniyah', N'Choi', N'Debree', N'1102', N'719495', N'815229', N'41 Harvard Drive', NULL, 63, 63, N'+7(399)887-3591', N'itstatus@yahoo.ca', N'/Images/063-hungry.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (64, N'Reagan', N'Simmons', N'Sharon', N'2020', N'814747', N'470174', N'Windsor, CT 06095', NULL, 64, 64, N'+7(205)278-4756', N'marcs@verizon.net', N'/Images/064-police.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (65, N'Coby', N'Robertson', N'Juliet', N'4083', N'683928', N'133197', N'7219 Prospect Drive', NULL, 65, 65, N'+7(260)814-7458', N'tellis@yahoo.ca', N'/Images/065-crying-6.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (66, N'Dakota', N'Haney', N'Marguerite', N'1270', N'718764', N'946776', N'Rolla, MO 65401', NULL, 66, 66, N'+7(302)844-3480', N'scotfl@att.net', N'/Images/066-happy-7.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (67, N'Malia', N'Rivas', N'Louis', N'3871', N'532007', N'875661', N'697 Cypress Lane', NULL, 67, 67, N'+7(449)380-7477', N'jramio@optonline.net', N'/Images/067-sun.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (68, N'Lily', N'Green', N'Lynn', N'9827', N'633690', N'976908', N'Arlington Heights, IL 60004', NULL, 68, 68, N'+7(280)214-8022', N'mastinfo@gmail.com', N'/Images/068-father-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (69, N'Reilly', N'Nielsen', N'Marcella', N'9350', N'821275', N'836368', N'7762 North County St.', NULL, 69, 69, N'+7(967)763-6475', N'ateniese@outlook.com', N'/Images/069-happy-6.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (70, N'Ryleigh', N'Brooks', N'Leonie', N'2681', N'769203', N'532086', N'Holly Springs, NC 27540', NULL, 70, 70, N'+7(625)810-5235', N'ismail@hotmail.com', N'/Images/070-late.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (71, N'Brendan', N'Ewing', N'Adele', N'4152', N'160995', N'626951', N'7773 Ridge Dr.', NULL, 71, 71, N'+7(975)483-5566', N'oechslin@optonline.net', N'/Images/071-heart.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (72, N'Cheyenne', N'Kirk', N'Julian', N'4306', N'595389', N'40675', N'New Haven, CT 06511', NULL, 72, 72, N'+7(718)850-2518', N'jugalator@att.net', N'/Images/072-sick-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (73, N'Jacoby', N'Rojas', N'Rose', N'9367', N'402446', N'7428', N'551 Spruce St.', NULL, 73, 73, N'+7(550)645-2520', N'subir@verizon.net', N'/Images/073-sad-12.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (74, N'Keshawn', N'Cummings', N'Paul', N'4536', N'115339', N'249425', N'Mount Holly, NJ 08060', NULL, 74, 74, N'+7(551)270-4620', N'bryam@verizon.net', N'/Images/074-in-love-10.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (75, N'Mohammed', N'Crawford', N'Amelia', N'8478', N'213639', N'327248', N'116 Woodside St.', NULL, 75, 75, N'+7(489)444-3438', N'jpflip@optonline.net', N'/Images/075-shocked-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (76, N'Nancy', N'Bryan', N'Devon', N'1871', N'347268', N'990658', N'Bridgewater, NJ 08807', NULL, 76, 76, N'+7(401)862-1637', N'mgemmons@comcast.net', N'/Images/076-happy-5.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (77, N'Maxwell', N'Lynn', N'Ellory', N'1567', N'431190', N'707963', N'9817 Manor St.', NULL, 77, 77, N'+7(507)625-4900', N'csilvers@icloud.com', N'/Images/077-shocked-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (78, N'Zack', N'Khan', N'Gabriel', N'9952', N'372202', N'670847', N'West Des Moines, IA 50265', NULL, 78, 78, N'+7(458)566-0054', N'karasik@msn.com', N'/Images/078-cool-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (79, N'Selina', N'Walls', N'Ashten', N'8168', N'514525', N'434380', N'9 Prince Street', NULL, 79, 79, N'+7(979)346-6593', N'wetter@yahoo.ca', N'/Images/079-crying-5.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (80, N'Jerry', N'Garner', N'Everett', N'8239', N'393741', N'255295', N'Brookline, MA 02446', NULL, 80, 80, N'+7(320)547-9952', N'thassine@me.com', N'/Images/080-zombie.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (81, N'Kaila', N'Carroll', N'Grey', N'2909', N'822374', N'535063', N'549 Marvon St.', NULL, 81, 81, N'+7(429)809-1931', N'sassen@msn.com', N'/Images/081-pain.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (82, N'Sean', N'Conway', N'Garrison', N'5367', N'598823', N'325417', N'Dundalk, MD 21222', NULL, 82, 82, N'+7(464)285-9954', N'jandrese@yahoo.ca', N'/Images/082-cyclops.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (83, N'Makaila', N'Cantu', N'Fernando', N'5298', N'472573', N'825989', N'1 Theatre Drive', NULL, 83, 83, N'+7(748)461-4491', N'tmccarth@live.com', N'/Images/083-sweat.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (84, N'Jacquelyn', N'Mccall', N'Sherleen', N'3605', N'373737', N'964951', N'Lumberton, NC 28358', NULL, 84, 84, N'+7(578)935-1637', N'gtewari@icloud.com', N'/Images/084-thief.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (85, N'Milton', N'Swanson', N'Chase', N'8146', N'691253', N'765391', N'673 Hamilton Road', NULL, 85, 85, N'+7(927)652-4631', N'hampton@yahoo.com', N'/Images/085-sad-11.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (86, N'Rodolfo', N'Lynn', N'Zion', N'7932', N'623470', N'852333', N'Farmingdale, NY 11735', NULL, 86, 86, N'+7(595)615-6057', N'jesse@me.com', N'/Images/086-kiss-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (87, N'Paula', N'Walls', N'Breean', N'7817', N'774559', N'929343', N'9662 Bay Ave.', NULL, 87, 87, N'+7(751)240-3137', N'jugalator@me.com', N'/Images/087-father-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (88, N'Adison', N'Olson', N'Henry', N'4402', N'114286', N'550100', N'Hamburg, NY 14075', NULL, 88, 88, N'+7(626)974-2035', N'bhima@sbcglobal.net', N'/Images/088-father.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (89, N'Jacob', N'Haynes', N'Marcellus', N'2794', N'857949', N'735633', N'8604 Fairfield Ave.', NULL, 89, 89, N'+7(201)979-1451', N'gommix@comcast.net', N'/Images/089-angel-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (90, N'Corinne', N'Roberts', N'Suzan', N'7429', N'823005', N'329850', N'Wisconsin Rapids, WI 54494', NULL, 90, 90, N'+7(493)219-3942', N'symbolic@verizon.net', N'/Images/090-happy-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (91, N'Aimee', N'Ewing', N'Lane', N'6306', N'285690', N'230064', N'56 Vale St.', NULL, 91, 91, N'+7(407)485-5030', N'bruck@outlook.com', N'/Images/091-sad-10.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (92, N'Alejandro', N'Cordova', N'Hollyn', N'9370', N'315564', N'249749', N'Mount Juliet, TN 37122', NULL, 92, 92, N'+7(919)478-2497', N'jeteve@optonline.net', N'/Images/092-outrage-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (93, N'Byron', N'Haynes', N'Bram', N'1685', N'42988', N'97229', N'9523 Linda Lane', NULL, 93, 93, N'+7(482)802-9580', N'jsnover@comcast.net', N'/Images/093-ugly-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (94, N'Genevieve', N'Keith', N'David', N'5467', N'865823', N'316039', N'Tullahoma, TN 37388', NULL, 94, 94, N'+7(455)944-6449', N'hakim@comcast.net', N'/Images/094-ugly-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (95, N'Dane', N'Obrien', N'Shane', N'9596', N'712362', N'813449', N'3 Ashley Ave.', NULL, 95, 95, N'+7(710)388-2563', N'dexter@sbcglobal.net', N'/Images/095-scared.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (96, N'Nayeli', N'Church', N'Kent', N'9527', N'410913', N'790714', N'Ann Arbor, MI 48103', NULL, 96, 96, N'+7(759)452-3846', N'jlbaumga@hotmail.com', N'/Images/096-tongue-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (97, N'Ashtyn', N'Jimenez', N'Rhett', N'6760', N'404116', N'515537', N'9851 East Prince Street', NULL, 97, 97, N'+7(687)801-1332', N'djupedal@hotmail.com', N'/Images/097-sad-9.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (98, N'Kimberly', N'Wilkerson', N'Carelyn', N'9484', N'965470', N'262017', N'Dothan, AL 36301', NULL, 98, 98, N'+7(691)336-3494', N'daveewart@verizon.net', N'/Images/098-nerd-9.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (99, N'Tripp', N'Curtis', N'Apollo', N'6426', N'682782', N'201742', N'8329 North Greenview St.', NULL, 99, 99, N'+7(493)274-3888', N'msherr@sbcglobal.net', N'/Images/099-greed-2.png', NULL)
GO
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (100, N'Eleanor', N'Zavala', N'George', N'3709', N'656706', N'905558', N'Hartford, CT 06106', NULL, 1, 100, N'+7(983)470-4528', N'crusader@sbcglobal.net', N'/Images/100-whistle.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (101, N'Harper', N'Thomas', N'Jae', N'4948', N'205524', N'243277', N'215 Purple Finch Lane', NULL, 2, 101, N'+7(436)951-8996', N'mdielmann@sbcglobal.net', N'/Images/101-nerd-8.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (102, N'Maximo', N'Stephenson', N'Dex', N'8134', N'605243', N'119462', N'Annapolis, MD 21401', NULL, 3, 102, N'+7(210)889-7840', N'ovprit@me.com', N'/Images/102-muted-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (103, N'Kiara', N'James', N'Jeremy', N'7133', N'997003', N'791278', N'63 53rd Ave.', NULL, 4, 103, N'+7(390)499-7403', N'calin@att.net', N'/Images/103-in-love-9.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (104, N'Isabella', N'Fuller', N'Naomi', N'4021', N'304017', N'306011', N'Hagerstown, MD 21740', NULL, 5, 104, N'+7(805)721-8540', N'thowell@yahoo.ca', N'/Images/104-in-love-8.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (105, N'Cynthia', N'Garrison', N'Matilda', N'3516', N'398883', N'21763', N'2 Greenrose Rd.', NULL, 6, 105, N'+7(578)220-5882', N'mpiotr@yahoo.com', N'/Images/105-kiss-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (106, N'Donte', N'Flowers', N'Brock', N'8533', N'684076', N'494549', N'Maspeth, NY 11378', NULL, 7, 106, N'+7(415)631-8358', N'bester@gmail.com', N'/Images/106-in-love-7.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (107, N'Asia', N'Rivera', N'Carmden', N'1618', N'439727', N'262275', N'298 N. Hudson Court', NULL, 8, 107, N'+7(900)903-0657', N'imightb@gmail.com', N'/Images/107-ugly.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (108, N'Trace', N'Hahn', N'Clelia', N'2835', N'991998', N'464652', N'Howell, NJ 07731', NULL, 9, 108, N'+7(879)442-6528', N'jschauma@icloud.com', N'/Images/108-nerd-7.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (109, N'Mohammed', N'Farley', N'Levi', N'7748', N'504230', N'200443', N'3 Peg Shop St.', NULL, 10, 109, N'+7(649)374-4690', N'syrinx@gmail.com', N'/Images/109-nerd-6.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (110, N'Nicholas', N'Velez', N'Dawn', N'4853', N'175687', N'971839', N'Bayonne, NJ 07002', NULL, 11, 110, N'+7(487)871-5975', N'konit@aol.com', N'/Images/110-crying-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (111, N'Jamir', N'Curtis', N'Tavian', N'3983', N'947212', N'30097', N'648 Hill Field St.', NULL, 12, 111, N'+7(503)572-6773', N'wonderkid@hotmail.com', N'/Images/111-muted-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (112, N'Cyrus', N'Rose', N'Jacklyn', N'7435', N'360206', N'655574', N'South Richmond Hill, NY 11419', NULL, 13, 112, N'+7(709)756-6389', N'pjacklam@verizon.net', N'/Images/112-nerd-5.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (113, N'Dakota', N'Torres', N'Cash', N'4559', N'179023', N'592365', N'477 Oakland Street', NULL, 14, 113, N'+7(931)652-7478', N'tokuhirom@live.com', N'/Images/113-kiss-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (114, N'Matias', N'Valencia', N'Reagan', N'2102', N'137023', N'279901', N'Lynnwood, WA 98037', NULL, 15, 114, N'+7(524)449-7554', N'adillon@comcast.net', N'/Images/114-greed-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (115, N'Rocco', N'Harding', N'Gwendolen', N'2018', N'304278', N'690136', N'4 Division Lane', NULL, 16, 115, N'+7(347)807-8932', N'bcevc@yahoo.ca', N'/Images/115-pirate-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (116, N'Maya', N'Clark', N'Evelyn', N'4625', N'441301', N'224776', N'Champlin, MN 55316', NULL, 17, 116, N'+7(675)694-8839', N'crobles@me.com', N'/Images/116-music.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (117, N'Bryan', N'Hays', N'Wade', N'8451', N'370682', N'475381', N'8021 Shadow Brook Dr.', NULL, 18, 117, N'+7(779)966-8126', N'tjensen@verizon.net', N'/Images/117-confused-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (118, N'Jessie', N'Nelson', N'Jack', N'7035', N'527026', N'89070', N'Lancaster, NY 14086', NULL, 19, 118, N'+7(791)357-4942', N'gozer@icloud.com', N'/Images/118-nerd-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (119, N'Joy', N'Franklin', N'Warren', N'2846', N'798890', N'15158', N'7073 Hall Avenue', NULL, 20, 119, N'+7(292)662-7836', N'brbarret@yahoo.ca', N'/Images/119-greed.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (120, N'Carlie', N'Lang', N'Rebecca', N'9368', N'90494', N'983441', N'West Babylon, NY 11704', NULL, 21, 120, N'+7(952)374-4396', N'mcnihil@me.com', N'/Images/120-nerd-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (121, N'Issac', N'Hurley', N'Blanche', N'7906', N'721186', N'930722', N'985B Winding Way Dr.', NULL, 22, 121, N'+7(758)849-9991', N'damian@yahoo.com', N'/Images/121-crying-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (122, N'Ariel', N'Sims', N'Bailey', N'9254', N'479522', N'866890', N'South Windsor, CT 06074', NULL, 23, 122, N'+7(534)687-2128', N'neonatus@aol.com', N'/Images/122-cheering.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (123, N'Braedon', N'Delgado', N'Oliver', N'3627', N'384983', N'821333', N'570 Old Bayberry Street', NULL, 24, 123, N'+7(642)548-4829', N'tellis@icloud.com', N'/Images/123-surprised-6.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (124, N'Christian', N'Suarez', N'Lee', N'5989', N'222522', N'74910', N'Billerica, MA 01821', NULL, 25, 124, N'+7(980)531-5346', N'frode@live.com', N'/Images/124-muted-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (125, N'Lilah', N'Marks', N'Anthony', N'3584', N'358162', N'882011', N'9122 South Addison St.', NULL, 26, 125, N'+7(628)326-1104', N'sjava@aol.com', N'/Images/125-sick-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (126, N'Jeffrey', N'Rowland', N'Gillian', N'4406', N'46042', N'450845', N'East Lansing, MI 48823', NULL, 27, 126, N'+7(669)335-7511', N'harryh@live.com', N'/Images/126-graduated.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (127, N'Hannah', N'Jordan', N'Verena', N'5511', N'931653', N'233625', N'14 West Fifth St.', NULL, 28, 127, N'+7(399)344-8840', N'elflord@me.com', N'/Images/127-angry-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (128, N'Peyton', N'Hinton', N'Benjamin', N'8020', N'284910', N'672826', N'Skokie, IL 60076', NULL, 29, 128, N'+7(643)676-5328', N'ramollin@mac.com', N'/Images/128-in-love-6.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (129, N'Clayton', N'Forbes', N'Zachary', N'8660', N'236405', N'422773', N'7267 W. Roehampton St.', NULL, 30, 129, N'+7(535)983-7587', N'kronvold@mac.com', N'/Images/129-cool-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (130, N'Salvatore', N'Cabrera', N'Krystan', N'7218', N'277801', N'348484', N'Harrisonburg, VA 22801', NULL, 31, 130, N'+7(310)925-8844', N'louise@aol.com', N'/Images/130-confused-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (131, N'Andre', N'Taylor', N'Felix', N'4813', N'710684', N'233687', N'82 Oak Meadow Dr.', NULL, 32, 1, N'+7(457)847-6033', N'nanop@verizon.net', N'/Images/131-sad-8.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (132, N'Kadin', N'Mcclain', N'Riley', N'8704', N'683064', N'28020', N'Cambridge, MA 02138', NULL, 33, 2, N'+7(330)730-7648', N'gtewari@sbcglobal.net', N'/Images/132-nerd-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (133, N'Jaida', N'Nichols', N'Lucinda', N'9908', N'341967', N'683123', N'864 Highland Drive', NULL, 34, 3, N'+7(619)883-4911', N'ylchang@mac.com', N'/Images/133-birthday-boy.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (134, N'Reid', N'Church', N'Candice', N'6752', N'159699', N'228468', N'Alliance, OH 44601', NULL, 35, 4, N'+7(482)744-7133', N'gommix@yahoo.com', N'/Images/134-surprised-5.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (135, N'Karley', N'Harrington', N'Kathryn', N'8059', N'911426', N'882058', N'9465 St Paul Avenue', NULL, 36, 5, N'+7(369)537-4704', N'uncle@sbcglobal.net', N'/Images/135-selfie.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (136, N'Beau', N'Rivers', N'Lillian', N'8452', N'55461', N'577380', N'Massillon, OH 44646', NULL, 37, 6, N'+7(540)239-8104', N'smcnabb@live.com', N'/Images/136-tongue-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (137, N'Riley', N'Bentley', N'Hugh', N'4452', N'331700', N'279775', N'7651 South La Sierra Dr.', NULL, 38, 7, N'+7(863)714-2111', N'shrapnull@aol.com', N'/Images/137-smart-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (138, N'Ellis', N'Choi', N'Julina', N'3520', N'765331', N'185983', N'Centreville, VA 20120', NULL, 39, 8, N'+7(839)694-4168', N'djpig@sbcglobal.net', N'/Images/138-smart.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (139, N'Jaylyn', N'Leon', N'Ellison', N'8629', N'761047', N'629180', N'3 Alton Lane', NULL, 40, 9, N'+7(983)868-6473', N'oechslin@hotmail.com', N'/Images/139-surprised-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (140, N'Drew', N'Mayer', N'Carlen', N'2381', N'911641', N'336638', N'Glen Allen, VA 23059', NULL, 41, 10, N'+7(325)574-7514', N'xnormal@verizon.net', N'/Images/140-3d-glasses.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (141, N'Ashleigh', N'Walters', N'Claude', N'3634', N'590673', N'418814', N'9441 W. Pineknoll Drive', NULL, 42, 11, N'+7(921)683-0258', N'atmarks@icloud.com', N'/Images/141-in-love-5.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (142, N'Scott', N'Dickerson', N'Arden', N'5913', N'725569', N'579121', N'Florence, SC 29501', NULL, 43, 12, N'+7(503)446-7180', N'makarow@comcast.net', N'/Images/142-sleeping.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (143, N'Kolton', N'Knight', N'Miriam', N'7702', N'344201', N'254837', N'7070 Shady Street', NULL, 44, 13, N'+7(467)243-5219', N'raides@yahoo.com', N'/Images/143-pirate.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (144, N'Izabelle', N'Boyle', N'Naveen', N'2262', N'625946', N'196936', N'Lewiston, ME 04240', NULL, 45, 14, N'+7(633)700-7724', N'hwestiii@mac.com', N'/Images/144-santa-claus.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (145, N'Haylie', N'Singleton', N'Sue', N'1646', N'243340', N'134470', N'146 East Bank Street', NULL, 46, 15, N'+7(632)874-7209', N'scitext@gmail.com', N'/Images/145-wink.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (146, N'Sariah', N'Lin', N'Olive', N'2153', N'460491', N'905724', N'Billings, MT 59101', NULL, 47, 16, N'+7(368)599-1877', N'gward@yahoo.ca', N'/Images/146-in-love-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (147, N'Chace', N'Spears', N'Elodie', N'3126', N'716773', N'124048', N'8723 Cedar Swamp Drive', NULL, 48, 17, N'+7(324)886-1499', N'bockelboy@outlook.com', N'/Images/147-tired.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (148, N'Liam', N'Frazier', N'Korin', N'8828', N'972758', N'885712', N'Norman, OK 73072', NULL, 49, 18, N'+7(374)356-4166', N'tubesteak@comcast.net', N'/Images/148-bang.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (149, N'Joseph', N'Stokes', N'William', N'8114', N'880420', N'561214', N'8419 E. Harvey Drive', NULL, 50, 19, N'+7(868)982-2419', N'krueger@mac.com', N'/Images/149-baby.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (150, N'Lorelei', N'Hurley', N'Coralie', N'8085', N'811955', N'969805', N'Groton, CT 06340', NULL, 51, 20, N'+7(781)785-5837', N'skaufman@optonline.net', N'/Images/150-tongue.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (151, N'Miguel', N'Leon', N'Haiden', N'1318', N'208906', N'140377', N'179 Manchester St.', NULL, 52, 21, N'+7(489)361-6374', N'tezbo@live.com', N'/Images/151-sick-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (152, N'Melina', N'Hamilton', N'Isaac', N'3115', N'642377', N'74940', N'Chelmsford, MA 01824', NULL, 53, 22, N'+7(872)856-7001', N'crowl@icloud.com', N'/Images/152-outrage.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (153, N'Serena', N'Duke', N'Arthur', N'5150', N'553212', N'190255', N'70 Cambridge Ave.', NULL, 54, 23, N'+7(812)814-4854', N'plover@hotmail.com', N'/Images/153-injury.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (154, N'Kristen', N'Dillon', N'Kylie', N'4169', N'626192', N'521443', N'Durham, NC 27703', NULL, 55, 24, N'+7(803)510-4214', N'calin@aol.com', N'/Images/154-dead.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (155, N'Saniyah', N'Hawkins', N'Josiah', N'7466', N'33192', N'845900', N'566 S. Cherry Street', NULL, 56, 25, N'+7(869)369-9524', N'timtroyr@live.com', N'/Images/155-rich-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (156, N'Thalia', N'Leach', N'Nicolas', N'2646', N'768816', N'584534', N'Forney, TX 75126', NULL, 57, 26, N'+7(464)585-3155', N'keutzer@yahoo.com', N'/Images/156-sick.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (157, N'Irene', N'Caldwell', N'Noah', N'5732', N'336554', N'660042', N'83 NE. Hill Dr.', NULL, 58, 27, N'+7(703)958-7186', N'thurston@outlook.com', N'/Images/157-angel.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (158, N'Nikhil', N'Bowen', N'Glenn', N'5254', N'555116', N'207488', N'Norwood, MA 02062', NULL, 59, 28, N'+7(515)615-0912', N'mbalazin@att.net', N'/Images/158-nerd-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (159, N'Jolie', N'Charles', N'Matteo', N'3285', N'403999', N'586366', N'556 Summerhouse Street', NULL, 60, 29, N'+7(854)941-5210', N'dkasak@gmail.com', N'/Images/159-crying-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (160, N'Xavier', N'Baxter', N'Joseph', N'1373', N'588622', N'962553', N'Nottingham, MD 21236', NULL, 61, 30, N'+7(380)573-4186', N'esbeck@comcast.net', N'/Images/160-crying-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (161, N'Lukas', N'Dean', N'Ellice', N'1890', N'691040', N'594473', N'9750 Hawthorne Ave.', NULL, 62, 31, N'+7(297)369-0265', N'novanet@aol.com', N'/Images/161-muted-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (162, N'Athena', N'King', N'Lilibeth', N'3307', N'217825', N'236159', N'Muskogee, OK 74403', NULL, 63, 32, N'+7(671)293-5634', N'mhouston@me.com', N'/Images/162-surprised-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (163, N'Adan', N'Noble', N'Bree', N'3286', N'297169', N'238674', N'97 Elmwood Street', NULL, 64, 33, N'+7(305)214-6934', N'bahwi@yahoo.com', N'/Images/163-crying.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (164, N'Kiley', N'Pham', N'Madeleine', N'2401', N'289619', N'924581', N'Seymour, IN 47274', NULL, 65, 34, N'+7(812)919-9643', N'chrisj@outlook.com', N'/Images/164-sad-7.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (165, N'Steven', N'Johnston', N'Kai', N'8507', N'252786', N'812525', N'308 Studebaker Drive', NULL, 66, 35, N'+7(754)769-3349', N'louise@gmail.com', N'/Images/165-cool-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (166, N'Ayana', N'Hart', N'Dash', N'9342', N'187671', N'123262', N'Algonquin, IL 60102', NULL, 67, 36, N'+7(206)323-2722', N'qrczak@me.com', N'/Images/166-happy-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (167, N'Aileen', N'Copeland', N'Seth', N'1067', N'401389', N'840534', N'15 Marsh St.', NULL, 68, 37, N'+7(273)495-7160', N'arachne@hotmail.com', N'/Images/167-thinking-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (168, N'Emery', N'Pitts', N'Eli', N'2273', N'445653', N'327317', N'Garden City, NY 11530', NULL, 69, 38, N'+7(463)932-3808', N'mfburgo@icloud.com', N'/Images/168-muted.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (169, N'Vicente', N'Chavez', N'Bernice', N'6403', N'754163', N'917835', N'8614 Charles Street', NULL, 70, 39, N'+7(551)789-0645', N'karasik@att.net', N'/Images/169-confused.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (170, N'Cherish', N'Monroe', N'Vanessa', N'3912', N'930948', N'254859', N'Wake Forest, NC 27587', NULL, 71, 40, N'+7(574)759-7866', N'hauma@icloud.com', N'/Images/170-happy-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (171, N'Karley', N'Petersen', N'Rory', N'4008', N'604291', N'450994', N'57 Gulf Avenue', NULL, 72, 41, N'+7(852)802-5653', N'scitext@me.com', N'/Images/171-thinking.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (172, N'Alondra', N'Le', N'Clark', N'3059', N'930219', N'301844', N'South Lyon, MI 48178', NULL, 73, 42, N'+7(342)453-0606', N'matthijs@live.com', N'/Images/172-nerd.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (173, N'Dorian', N'Bird', N'Judd', N'5208', N'664172', N'833457', N'694 Linden St.', NULL, 74, 43, N'+7(434)574-4540', N'bryam@icloud.com', N'/Images/173-in-love-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (174, N'Karley', N'Goodwin', N'Noel', N'6338', N'777372', N'522008', N'Missoula, MT 59801', NULL, 75, 44, N'+7(425)783-2253', N'tellis@att.net', N'/Images/174-hypnotized.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (175, N'Killian', N'Davidson', N'Janetta', N'8029', N'73589', N'357874', N'8440 Lyme St.', NULL, 76, 45, N'+7(889)449-4391', N'makarow@verizon.net', N'/Images/175-cool.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (176, N'Ava', N'Melton', N'Annabel', N'1788', N'509266', N'809566', N'Zeeland, MI 49464', NULL, 77, 46, N'+7(825)301-8250', N'citadel@msn.com', N'/Images/176-shocked.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (177, N'Adam', N'Horton', N'Blake', N'2735', N'502335', N'933854', N'7632 Oakwood Rd.', NULL, 78, 47, N'+7(397)334-2086', N'jaxweb@me.com', N'/Images/177-easter.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (178, N'Jaydin', N'Singh', N'Jordon', N'7540', N'934686', N'651032', N'Pembroke Pines, FL 33028', NULL, 79, 48, N'+7(241)570-3040', N'mcsporran@aol.com', N'/Images/178-surprised-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (179, N'Lexie', N'Mckinney', N'Charles', N'9803', N'515191', N'938289', N'881 Temple St.', NULL, 80, 49, N'+7(713)462-8265', N'tubesteak@mac.com', N'/Images/179-surprised-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (180, N'Niko', N'Calderon', N'Troy', N'7220', N'353462', N'163048', N'South El Monte, CA 91733', NULL, 81, 50, N'+7(854)822-2331', N'kludge@verizon.net', N'/Images/180-surprised.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (181, N'Terrence', N'Acevedo', N'Viola', N'9575', N'262338', N'906781', N'9591 Honey Creek St.', NULL, 82, 51, N'+7(439)713-6117', N'lahvak@hotmail.com', N'/Images/181-furious.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (182, N'Madisyn', N'May', N'Byron', N'7751', N'986773', N'13897', N'Webster, NY 14580', NULL, 83, 52, N'+7(230)906-8815', N'raides@sbcglobal.net', N'/Images/182-sad-6.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (183, N'Jadon', N'Ponce', N'Doran', N'9853', N'763831', N'457951', N'7018 Pilgrim Street', NULL, 84, 53, N'+7(598)895-2899', N'gfxguy@aol.com', N'/Images/183-sad-5.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (184, N'Jaylen', N'Thornton', N'Tobias', N'2868', N'392150', N'998746', N'Bismarck, ND 58501', NULL, 85, 54, N'+7(429)678-1872', N'krueger@msn.com', N'/Images/184-sad-4.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (185, N'Brendan', N'Kelly', N'Damien', N'7019', N'883500', N'537973', N'697 Westminster St.', NULL, 86, 55, N'+7(276)750-1655', N'shang@yahoo.ca', N'/Images/185-sad-3.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (186, N'Helena', N'Houston', N'Murphy', N'1529', N'516117', N'374799', N'Harleysville, PA 19438', NULL, 87, 56, N'+7(805)953-2020', N'kalpol@comcast.net', N'/Images/186-angry-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (187, N'Madalyn', N'Moon', N'Carleen', N'7513', N'42100', N'519988', N'959 Birchpond St.', NULL, 88, 57, N'+7(611)670-2147', N'kildjean@msn.com', N'/Images/187-rich.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (188, N'Marcelo', N'Johns', N'Louisa', N'5292', N'664723', N'936784', N'Euless, TX 76039', NULL, 89, 58, N'+7(242)487-7082', N'treeves@comcast.net', N'/Images/188-sad-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (189, N'Jay', N'Campos', N'Georgina', N'1446', N'216584', N'901170', N'67 Pumpkin Hill Lane', NULL, 90, 58, N'+7(939)641-7992', N'timtroyr@icloud.com', N'/Images/189-happy-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (190, N'Khalil', N'Sullivan', N'Rylie', N'6353', N'693874', N'525378', N'Yorktown Heights, NY 10598', NULL, 91, 60, N'+7(669)482-2353', N'world@att.net', N'/Images/190-sad-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (191, N'Nikhil', N'Merritt', N'Claudia', N'8638', N'615943', N'809450', N'5 NE. Newcastle Drive', NULL, 92, 61, N'+7(801)814-0510', N'kspiteri@icloud.com', N'/Images/191-sad.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (192, N'Blaine', N'Melendez', N'Vivian', N'5428', N'298274', N'921280', N'Ithaca, NY 14850', NULL, 93, 62, N'+7(362)338-4199', N'rtanter@att.net', N'/Images/192-smile.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (193, N'Clayton', N'Munoz', N'Caylen', N'8862', N'885055', N'225076', N'94 Longbranch St.', NULL, 94, 63, N'+7(897)655-0021', N'twoflower@mac.com', N'/Images/193-in-love-2.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (194, N'Khalil', N'Montgomery', N'Eloise', N'2574', N'326715', N'276634', N'Mount Prospect, IL 60056', NULL, 95, 64, N'+7(710)859-3522', N'howler@msn.com', N'/Images/194-happy.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (195, N'Bruce', N'Medina', N'Elein', N'7843', N'990305', N'242952', N'566 Gulf St.', NULL, 96, 65, N'+7(612)934-2623', N'yfreund@sbcglobal.net', N'/Images/195-kiss-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (196, N'Lesly', N'Landry', N'Gregory', N'5688', N'765287', N'140550', N'Wantagh, NY 11793', NULL, 97, 66, N'+7(896)396-9500', N'nogin@msn.com', N'/Images/196-in-love-1.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (197, N'Alyson', N'Hartman', N'Lee', N'7217', N'461000', N'925983', N'518 Clinton Ave.', NULL, 98, 67, N'+7(533)891-1018', N'onestab@live.com', N'/Images/197-in-love.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (198, N'Ellen', N'Contreras', N'Fawn', N'1559', N'96165', N'783035', N'Encino, CA 91316', NULL, 99, 68, N'+7(309)279-3798', N'lcheng@mac.com', N'/Images/198-kiss.png', NULL)
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (199, N'Sofia', N'Barr', N'Kingston', N'3480', N'736537', N'897782', N'370 Ashley Lane', NULL, 81, 69, N'+7(483)664-9876', N'bdthomas@yahoo.com', N'/Images/199-angry.png', NULL)
GO
INSERT [dbo].[Driver] ([ID], [Surname], [Name], [Patronymic], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [CompanyID], [JobID], [Phone], [Email], [Photo], [Description]) VALUES (200, N'Joyce', N'Wilkerson', N'Payten', N'6440', N'241468', N'838036', N'Wausau, WI 54401', NULL, 82, 70, N'+7(765)461-9730', N'hoangle@optonline.net', N'/Images/200-sleepy.png', NULL)
SET IDENTITY_INSERT [dbo].[Driver] OFF
GO
SET IDENTITY_INSERT [dbo].[DriverCar] ON 

INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (1, 1, 1)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (2, 2, 2)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (3, 3, 3)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (4, 4, 4)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (5, 5, 5)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (6, 6, 6)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (7, 7, 7)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (8, 8, 8)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (9, 9, 9)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (10, 10, 10)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (11, 11, 11)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (12, 12, 12)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (13, 13, 13)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (14, 14, 14)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (15, 15, 15)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (16, 16, 16)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (17, 17, 17)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (18, 18, 18)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (19, 19, 19)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (20, 20, 20)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (21, 21, 21)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (22, 22, 22)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (23, 23, 23)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (24, 24, 24)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (25, 25, 25)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (26, 26, 26)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (27, 27, 27)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (28, 28, 28)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (29, 29, 29)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (30, 30, 30)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (31, 31, 31)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (32, 32, 32)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (33, 33, 33)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (34, 34, 34)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (35, 35, 35)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (36, 36, 36)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (37, 37, 37)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (38, 38, 38)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (39, 39, 39)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (40, 40, 40)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (41, 41, 41)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (42, 42, 42)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (43, 43, 43)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (44, 44, 44)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (45, 45, 45)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (46, 46, 46)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (47, 47, 47)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (48, 48, 48)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (49, 49, 49)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (50, 50, 50)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (51, 51, 51)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (52, 52, 52)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (53, 53, 53)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (54, 54, 54)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (55, 55, 55)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (56, 56, 56)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (57, 57, 57)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (58, 58, 58)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (59, 59, 59)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (60, 60, 60)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (61, 61, 61)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (62, 62, 62)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (63, 63, 63)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (64, 64, 64)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (65, 65, 65)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (66, 66, 66)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (67, 67, 67)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (68, 68, 68)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (69, 69, 69)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (70, 70, 70)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (71, 71, 71)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (72, 72, 72)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (73, 73, 73)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (74, 74, 74)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (75, 75, 75)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (76, 76, 76)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (77, 77, 77)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (78, 78, 78)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (79, 79, 79)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (80, 80, 80)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (81, 81, 81)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (82, 82, 82)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (83, 83, 83)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (84, 84, 84)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (85, 85, 85)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (86, 86, 86)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (87, 87, 87)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (88, 88, 88)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (89, 89, 89)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (90, 90, 90)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (91, 91, 91)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (92, 92, 92)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (93, 93, 93)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (94, 94, 94)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (95, 95, 95)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (96, 96, 96)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (97, 97, 97)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (98, 98, 98)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (99, 99, 99)
GO
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (100, 100, 100)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (101, 101, 101)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (102, 102, 102)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (103, 103, 103)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (104, 104, 104)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (105, 105, 105)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (106, 106, 106)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (107, 107, 107)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (108, 108, 108)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (109, 109, 109)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (110, 110, 110)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (111, 111, 111)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (112, 112, 112)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (113, 113, 113)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (114, 114, 114)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (115, 115, 115)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (116, 116, 116)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (117, 117, 117)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (118, 118, 118)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (119, 119, 119)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (120, 120, 120)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (121, 121, 121)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (122, 122, 122)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (123, 123, 123)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (124, 124, 124)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (125, 125, 125)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (126, 126, 126)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (127, 127, 127)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (128, 128, 128)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (129, 129, 129)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (130, 130, 130)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (131, 131, 131)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (132, 132, 132)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (133, 133, 133)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (134, 134, 134)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (135, 135, 135)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (136, 136, 136)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (137, 137, 137)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (138, 138, 138)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (139, 139, 139)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (140, 140, 140)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (141, 141, 141)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (142, 142, 142)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (143, 143, 143)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (144, 144, 144)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (145, 145, 145)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (146, 146, 146)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (147, 147, 147)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (148, 148, 148)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (149, 149, 149)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (150, 150, 150)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (151, 151, 151)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (152, 152, 152)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (153, 153, 153)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (154, 154, 154)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (155, 155, 155)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (156, 156, 156)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (157, 157, 157)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (158, 158, 158)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (159, 159, 159)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (160, 160, 160)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (161, 161, 161)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (162, 162, 162)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (163, 163, 163)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (164, 164, 164)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (165, 165, 165)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (166, 166, 166)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (167, 167, 167)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (168, 168, 168)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (169, 169, 169)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (170, 170, 170)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (171, 171, 171)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (172, 172, 172)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (173, 173, 173)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (174, 174, 174)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (175, 175, 175)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (176, 176, 176)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (177, 177, 177)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (178, 178, 178)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (179, 179, 179)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (180, 180, 180)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (181, 181, 181)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (182, 182, 182)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (183, 183, 183)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (184, 184, 184)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (185, 185, 185)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (186, 186, 186)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (187, 187, 187)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (188, 188, 188)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (189, 189, 189)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (190, 190, 190)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (191, 191, 191)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (192, 192, 192)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (193, 193, 193)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (194, 194, 194)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (195, 195, 195)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (196, 196, 196)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (197, 197, 197)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (198, 198, 198)
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (199, 199, 199)
GO
INSERT [dbo].[DriverCar] ([ID], [DriverID], [CarID]) VALUES (200, 200, 200)
SET IDENTITY_INSERT [dbo].[DriverCar] OFF
GO
SET IDENTITY_INSERT [dbo].[DriverLicense] ON 

INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (1, 1, 1)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (2, 2, 2)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (3, 3, 3)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (4, 4, 4)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (5, 5, 5)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (6, 6, 6)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (7, 7, 7)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (8, 8, 8)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (9, 9, 9)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (10, 10, 10)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (11, 11, 11)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (12, 12, 12)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (13, 13, 13)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (14, 14, 14)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (15, 15, 15)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (16, 16, 16)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (17, 17, 17)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (18, 18, 18)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (19, 19, 19)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (20, 20, 20)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (21, 21, 21)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (22, 22, 22)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (23, 23, 23)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (24, 24, 24)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (25, 25, 25)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (26, 26, 26)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (27, 27, 27)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (28, 28, 28)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (29, 29, 29)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (30, 30, 30)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (31, 31, 31)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (32, 32, 32)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (33, 33, 33)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (34, 34, 34)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (35, 35, 35)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (36, 36, 36)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (37, 37, 37)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (38, 38, 38)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (39, 39, 39)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (40, 40, 40)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (41, 41, 41)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (42, 42, 42)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (43, 43, 43)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (44, 44, 44)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (45, 45, 45)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (46, 46, 46)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (47, 47, 47)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (48, 48, 48)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (49, 49, 49)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (50, 50, 50)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (51, 51, 51)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (52, 52, 52)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (53, 53, 53)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (54, 54, 54)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (55, 55, 55)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (56, 56, 56)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (57, 57, 57)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (58, 58, 58)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (59, 59, 59)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (60, 60, 60)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (61, 61, 61)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (62, 62, 62)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (63, 63, 63)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (64, 64, 64)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (65, 65, 65)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (66, 66, 66)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (67, 67, 67)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (68, 68, 68)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (69, 69, 69)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (70, 70, 70)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (71, 71, 71)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (72, 72, 72)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (73, 73, 73)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (74, 74, 74)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (75, 75, 75)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (76, 76, 76)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (77, 77, 77)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (78, 78, 78)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (79, 79, 79)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (80, 80, 80)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (81, 81, 81)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (82, 82, 82)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (83, 83, 83)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (84, 84, 84)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (85, 85, 85)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (86, 86, 86)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (87, 87, 87)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (88, 88, 88)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (89, 89, 89)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (90, 90, 90)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (91, 91, 91)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (92, 92, 92)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (93, 93, 93)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (94, 94, 94)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (95, 95, 95)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (96, 96, 96)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (97, 97, 97)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (98, 98, 98)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (99, 99, 99)
GO
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (100, 100, 100)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (101, 101, 101)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (102, 102, 102)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (103, 103, 103)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (104, 104, 104)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (105, 105, 105)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (106, 106, 106)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (107, 107, 107)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (108, 108, 108)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (109, 109, 109)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (110, 110, 110)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (111, 111, 111)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (112, 112, 112)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (113, 113, 113)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (114, 114, 114)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (115, 115, 115)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (116, 116, 116)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (117, 117, 117)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (118, 118, 118)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (119, 119, 119)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (120, 120, 120)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (121, 121, 121)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (122, 122, 122)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (123, 123, 123)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (124, 124, 124)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (125, 125, 125)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (126, 126, 126)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (127, 127, 127)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (128, 128, 128)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (129, 129, 129)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (130, 130, 130)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (131, 131, 131)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (132, 132, 132)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (133, 133, 133)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (134, 134, 134)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (135, 135, 135)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (136, 136, 136)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (137, 137, 137)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (138, 138, 138)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (139, 139, 139)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (140, 140, 140)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (141, 141, 141)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (142, 142, 142)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (143, 143, 143)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (144, 144, 144)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (145, 145, 145)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (146, 146, 146)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (147, 147, 147)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (148, 148, 148)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (149, 149, 149)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (150, 150, 150)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (151, 151, 151)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (152, 152, 152)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (153, 153, 153)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (154, 154, 154)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (155, 155, 155)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (156, 156, 156)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (157, 157, 157)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (158, 158, 158)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (159, 159, 159)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (160, 160, 160)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (161, 161, 161)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (162, 162, 162)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (163, 163, 163)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (164, 164, 164)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (165, 165, 165)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (166, 166, 166)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (167, 167, 167)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (168, 168, 168)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (169, 169, 169)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (170, 170, 170)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (171, 171, 171)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (172, 172, 172)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (173, 173, 173)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (174, 174, 174)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (175, 175, 175)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (176, 176, 176)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (177, 177, 177)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (178, 178, 178)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (179, 179, 179)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (180, 180, 180)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (181, 181, 181)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (182, 182, 182)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (183, 183, 183)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (184, 184, 184)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (185, 185, 185)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (186, 186, 186)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (187, 187, 187)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (188, 188, 188)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (189, 189, 189)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (190, 190, 190)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (191, 191, 191)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (192, 192, 192)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (193, 193, 193)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (194, 194, 194)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (195, 195, 195)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (196, 196, 196)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (197, 197, 197)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (198, 198, 198)
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (199, 199, 199)
GO
INSERT [dbo].[DriverLicense] ([ID], [DriverID], [LicenseID]) VALUES (200, 200, 200)
SET IDENTITY_INSERT [dbo].[DriverLicense] OFF
GO
SET IDENTITY_INSERT [dbo].[JobName] ON 

INSERT [dbo].[JobName] ([ID], [Name]) VALUES (1, N'Reporter')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (2, N'Elementary School Teacher')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (3, N'Childcare worker')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (4, N'Loan Officer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (5, N'Drafter')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (6, N'Cost Estimator')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (7, N'Clinical Laboratory Technician')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (8, N'Electrician')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (9, N'Referee')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (10, N'Judge')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (11, N'Security Guard')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (12, N'Budget analyst')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (13, N'Painter')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (14, N'Occupational Therapist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (15, N'Physical Therapist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (16, N'Photographer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (17, N'Cashier')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (18, N'Educator')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (19, N'Professional athlete')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (20, N'Janitor')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (21, N'Massage Therapist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (22, N'Psychologist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (23, N'IT Manager')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (24, N'Anthropologist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (25, N'Executive Assistant')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (26, N'Artist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (27, N'Mechanical Engineer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (28, N'Firefighter')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (29, N'Carpenter')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (30, N'Actuary')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (31, N'Compliance Officer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (32, N'Computer Systems Administrator')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (33, N'HR Specialist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (34, N'Recreation & Fitness Worker')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (35, N'Financial Advisor')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (36, N'Auto Mechanic')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (37, N'Web Developer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (38, N'Civil Engineer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (39, N'Chemist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (40, N'Recreational Therapist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (41, N'Microbiologist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (42, N'Event Planner')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (43, N'Coach')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (44, N'Radiologic Technologist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (45, N'Market Research Analyst')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (46, N'Housekeeper')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (47, N'Computer Programmer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (48, N'Secretary')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (49, N'Bus Driver')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (50, N'Systems Analyst')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (51, N'Chef')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (52, N'Registered Nurse')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (53, N'Surveyor')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (54, N'Urban Planner')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (55, N'Middle School Teacher')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (56, N'Speech-Language Pathologist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (57, N'Personal Care Aide')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (58, N'Database administrator')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (59, N'Art Director')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (60, N'Landscaper & Groundskeeper')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (61, N'Court Reporter')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (62, N'Bookkeeping clerk')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (63, N'Landscape Architect')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (64, N'College Professor')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (65, N'Respiratory Therapist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (66, N'Mason')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (67, N'Veterinarian')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (68, N'Architect')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (69, N'Accountant')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (70, N'School Counselor')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (71, N'Computer Support Specialist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (72, N'Historian')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (73, N'Computer Hardware Engineer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (74, N'Designer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (75, N'Hairdresser')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (76, N'Lawyer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (77, N'Real Estate Agent')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (78, N'Customer Service Representative')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (79, N'Fitness Trainer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (80, N'Social Worker')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (81, N'Economist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (82, N'Writer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (83, N'Logistician')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (84, N'Environmental scientist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (85, N'Patrol Officer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (86, N'Plumber')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (87, N'Dancer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (88, N'Pharmacist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (89, N'Truck Driver')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (90, N'Medical Secretary')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (91, N'Diagnostic Medical Sonographer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (92, N'High School Teacher')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (93, N'Marriage & Family Therapist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (94, N'Editor')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (95, N'Substance Abuse Counselor')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (96, N'Public Relations Specialist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (97, N'Computer Systems Analyst')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (98, N'Preschool Teacher')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (99, N'Dentist')
GO
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (100, N'Teacher Assistant')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (101, N'Musician')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (102, N'Paralegal')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (103, N'Software Developer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (104, N'Zoologist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (105, N'Medical Assistant')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (106, N'Desktop publisher')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (107, N'Actor')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (108, N'Sports Coach')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (109, N'Dental Hygienist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (110, N'School Psychologist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (111, N'Librarian')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (112, N'Telemarketer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (113, N'Interpreter & Translator')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (114, N'Food Scientist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (115, N'Marketing Manager')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (116, N'Insurance Agent')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (117, N'Farmer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (118, N'Human Resources Assistant')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (119, N'Paramedic')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (120, N'Automotive mechanic')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (121, N'Receptionist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (122, N'Construction Manager')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (123, N'Physician')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (124, N'Mathematician')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (125, N'Electrical Engineer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (126, N'Physicist')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (127, N'Police Officer')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (128, N'Maintenance & Repair Worker')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (129, N'Statistician')
INSERT [dbo].[JobName] ([ID], [Name]) VALUES (130, N'Epidemiologist')
SET IDENTITY_INSERT [dbo].[JobName] OFF
GO
SET IDENTITY_INSERT [dbo].[License] ON 

INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (1, CAST(N'2019-01-13' AS Date), CAST(N'2027-07-03' AS Date), N'56 40', N'613073', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (2, CAST(N'2018-08-02' AS Date), CAST(N'2023-09-21' AS Date), N'74 65', N'904246', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (3, CAST(N'2018-12-31' AS Date), CAST(N'2025-01-25' AS Date), N'67 50', N'769897', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (4, CAST(N'2019-02-26' AS Date), CAST(N'2021-10-30' AS Date), N'44 67', N'967541', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (5, CAST(N'2019-03-12' AS Date), CAST(N'2025-06-03' AS Date), N'93 60', N'117922', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (6, CAST(N'2018-05-29' AS Date), CAST(N'2021-07-15' AS Date), N'96 40', N'750187', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (7, CAST(N'2018-09-20' AS Date), CAST(N'2019-07-10' AS Date), N'11 48', N'615982', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (8, CAST(N'2018-06-21' AS Date), CAST(N'2022-11-18' AS Date), N'61 61', N'864298', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (9, CAST(N'2019-05-14' AS Date), CAST(N'2020-11-18' AS Date), N'95 66', N'936083', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (10, CAST(N'2019-02-28' AS Date), CAST(N'2019-10-15' AS Date), N'17 54', N'167771', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (11, CAST(N'2018-06-23' AS Date), CAST(N'2022-06-14' AS Date), N'89 65', N'820437', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (12, CAST(N'2019-02-01' AS Date), CAST(N'2027-05-06' AS Date), N'13 45', N'505754', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (13, CAST(N'2019-04-11' AS Date), CAST(N'2020-01-08' AS Date), N'68 45', N'157412', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (14, CAST(N'2018-10-20' AS Date), CAST(N'2021-08-28' AS Date), N'37 63', N'724944', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (15, CAST(N'2018-11-04' AS Date), CAST(N'2020-08-18' AS Date), N'57 53', N'428231', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (16, CAST(N'2018-08-23' AS Date), CAST(N'2024-01-30' AS Date), N'21 59', N'855910', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (17, CAST(N'2019-02-08' AS Date), CAST(N'2024-08-16' AS Date), N'57 71', N'562291', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (18, CAST(N'2018-12-31' AS Date), CAST(N'2023-10-03' AS Date), N'95 50', N'828023', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (19, CAST(N'2018-08-05' AS Date), CAST(N'2028-01-24' AS Date), N'22 69', N'366545', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (20, CAST(N'2018-12-09' AS Date), CAST(N'2020-04-19' AS Date), N'34 49', N'882286', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (21, CAST(N'2018-11-22' AS Date), CAST(N'2020-06-14' AS Date), N'34 53', N'766347', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (22, CAST(N'2018-12-11' AS Date), CAST(N'2027-08-22' AS Date), N'22 52', N'107095', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (23, CAST(N'2019-02-11' AS Date), CAST(N'2028-05-02' AS Date), N'22 59', N'191387', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (24, CAST(N'2019-02-12' AS Date), CAST(N'2028-02-26' AS Date), N'55 67', N'914299', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (25, CAST(N'2018-06-28' AS Date), CAST(N'2025-06-14' AS Date), N'37 55', N'538095', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (26, CAST(N'2018-05-23' AS Date), CAST(N'2027-02-17' AS Date), N'23 65', N'140143', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (27, CAST(N'2018-10-09' AS Date), CAST(N'2019-11-02' AS Date), N'76 44', N'231262', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (28, CAST(N'2018-06-06' AS Date), CAST(N'2020-06-20' AS Date), N'71 80', N'465917', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (29, CAST(N'2019-02-13' AS Date), CAST(N'2021-03-19' AS Date), N'88 54', N'797589', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (30, CAST(N'2018-06-25' AS Date), CAST(N'2022-11-05' AS Date), N'92 43', N'289084', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (31, CAST(N'2019-02-15' AS Date), CAST(N'2025-06-24' AS Date), N'24 57', N'286769', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (32, CAST(N'2018-08-15' AS Date), CAST(N'2024-08-25' AS Date), N'90 62', N'811272', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (33, CAST(N'2019-01-05' AS Date), CAST(N'2021-06-11' AS Date), N'81 60', N'668818', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (34, CAST(N'2018-09-25' AS Date), CAST(N'2027-10-07' AS Date), N'49 54', N'493125', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (35, CAST(N'2018-09-19' AS Date), CAST(N'2028-04-08' AS Date), N'28 58', N'111698', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (36, CAST(N'2018-11-14' AS Date), CAST(N'2026-09-10' AS Date), N'62 68', N'279896', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (37, CAST(N'2018-12-16' AS Date), CAST(N'2022-07-25' AS Date), N'31 69', N'987280', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (38, CAST(N'2018-08-30' AS Date), CAST(N'2019-06-04' AS Date), N'62 57', N'783363', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (39, CAST(N'2018-06-24' AS Date), CAST(N'2028-01-27' AS Date), N'71 46', N'913695', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (40, CAST(N'2019-02-17' AS Date), CAST(N'2026-05-15' AS Date), N'90 66', N'607418', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (41, CAST(N'2018-09-01' AS Date), CAST(N'2023-01-25' AS Date), N'37 48', N'951841', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (42, CAST(N'2018-10-13' AS Date), CAST(N'2022-09-26' AS Date), N'95 70', N'754064', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (43, CAST(N'2018-10-25' AS Date), CAST(N'2023-09-16' AS Date), N'81 74', N'301902', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (44, CAST(N'2018-09-24' AS Date), CAST(N'2023-05-23' AS Date), N'98 73', N'370750', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (45, CAST(N'2018-10-07' AS Date), CAST(N'2021-01-08' AS Date), N'92 63', N'836793', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (46, CAST(N'2019-01-30' AS Date), CAST(N'2024-01-08' AS Date), N'85 67', N'433962', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (47, CAST(N'2019-02-11' AS Date), CAST(N'2019-07-20' AS Date), N'68 53', N'739807', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (48, CAST(N'2019-01-26' AS Date), CAST(N'2021-08-13' AS Date), N'84 59', N'127815', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (49, CAST(N'2018-06-17' AS Date), CAST(N'2020-04-19' AS Date), N'65 58', N'972443', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (50, CAST(N'2019-03-21' AS Date), CAST(N'2028-03-11' AS Date), N'11 79', N'215392', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (51, CAST(N'2018-11-29' AS Date), CAST(N'2024-03-22' AS Date), N'47 50', N'682392', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (52, CAST(N'2019-03-14' AS Date), CAST(N'2024-10-02' AS Date), N'57 80', N'704668', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (53, CAST(N'2018-09-26' AS Date), CAST(N'2021-10-09' AS Date), N'83 51', N'612336', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (54, CAST(N'2019-02-25' AS Date), CAST(N'2020-04-15' AS Date), N'88 48', N'700693', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (55, CAST(N'2018-10-17' AS Date), CAST(N'2022-07-04' AS Date), N'45 56', N'360521', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (56, CAST(N'2018-10-13' AS Date), CAST(N'2025-11-13' AS Date), N'35 50', N'716066', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (57, CAST(N'2019-01-04' AS Date), CAST(N'2025-08-18' AS Date), N'44 43', N'378433', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (58, CAST(N'2018-12-31' AS Date), CAST(N'2025-04-19' AS Date), N'70 44', N'504351', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (59, CAST(N'2019-03-16' AS Date), CAST(N'2025-08-16' AS Date), N'44 65', N'130693', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (60, CAST(N'2018-12-24' AS Date), CAST(N'2021-07-11' AS Date), N'87 44', N'923347', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (61, CAST(N'2018-08-12' AS Date), CAST(N'2020-07-30' AS Date), N'83 78', N'995967', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (62, CAST(N'2019-01-07' AS Date), CAST(N'2026-04-27' AS Date), N'99 73', N'996427', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (63, CAST(N'2019-01-06' AS Date), CAST(N'2022-06-15' AS Date), N'71 53', N'413313', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (64, CAST(N'2019-05-18' AS Date), CAST(N'2026-10-19' AS Date), N'43 43', N'983635', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (65, CAST(N'2019-03-01' AS Date), CAST(N'2020-04-19' AS Date), N'25 61', N'922773', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (66, CAST(N'2018-10-29' AS Date), CAST(N'2022-02-26' AS Date), N'58 78', N'165905', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (67, CAST(N'2019-04-22' AS Date), CAST(N'2022-12-14' AS Date), N'72 42', N'458530', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (68, CAST(N'2018-06-02' AS Date), CAST(N'2026-10-26' AS Date), N'54 58', N'150506', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (69, CAST(N'2019-01-31' AS Date), CAST(N'2025-10-22' AS Date), N'69 76', N'403371', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (70, CAST(N'2019-03-26' AS Date), CAST(N'2027-05-16' AS Date), N'45 65', N'502480', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (71, CAST(N'2018-10-01' AS Date), CAST(N'2025-04-03' AS Date), N'56 47', N'346550', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (72, CAST(N'2018-07-14' AS Date), CAST(N'2027-02-10' AS Date), N'59 40', N'123897', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (73, CAST(N'2018-11-03' AS Date), CAST(N'2023-09-19' AS Date), N'75 67', N'880032', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (74, CAST(N'2018-08-20' AS Date), CAST(N'2021-11-07' AS Date), N'53 69', N'329732', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (75, CAST(N'2019-01-30' AS Date), CAST(N'2024-01-19' AS Date), N'42 65', N'754604', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (76, CAST(N'2018-10-13' AS Date), CAST(N'2025-09-25' AS Date), N'45 71', N'347925', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (77, CAST(N'2019-02-11' AS Date), CAST(N'2022-11-06' AS Date), N'18 49', N'397861', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (78, CAST(N'2018-08-14' AS Date), CAST(N'2021-01-30' AS Date), N'97 55', N'409226', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (79, CAST(N'2018-07-10' AS Date), CAST(N'2021-02-22' AS Date), N'17 61', N'996073', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (80, CAST(N'2018-10-17' AS Date), CAST(N'2023-07-20' AS Date), N'88 60', N'686627', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (81, CAST(N'2018-10-31' AS Date), CAST(N'2028-01-19' AS Date), N'33 68', N'892304', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (82, CAST(N'2019-05-07' AS Date), CAST(N'2024-11-04' AS Date), N'96 45', N'996326', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (83, CAST(N'2019-02-28' AS Date), CAST(N'2024-03-02' AS Date), N'53 72', N'524117', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (84, CAST(N'2019-01-16' AS Date), CAST(N'2021-01-23' AS Date), N'30 76', N'820189', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (85, CAST(N'2019-04-05' AS Date), CAST(N'2020-09-10' AS Date), N'31 53', N'732792', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (86, CAST(N'2018-05-31' AS Date), CAST(N'2024-07-30' AS Date), N'27 54', N'500373', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (87, CAST(N'2018-09-18' AS Date), CAST(N'2022-04-24' AS Date), N'97 52', N'660653', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (88, CAST(N'2018-10-31' AS Date), CAST(N'2020-01-21' AS Date), N'16 45', N'771049', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (89, CAST(N'2018-08-04' AS Date), CAST(N'2027-01-17' AS Date), N'64 45', N'186021', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (90, CAST(N'2018-11-07' AS Date), CAST(N'2021-04-17' AS Date), N'50 45', N'725156', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (91, CAST(N'2019-04-14' AS Date), CAST(N'2022-07-18' AS Date), N'29 65', N'213322', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (92, CAST(N'2019-02-23' AS Date), CAST(N'2020-01-27' AS Date), N'31 41', N'340685', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (93, CAST(N'2019-02-06' AS Date), CAST(N'2019-10-17' AS Date), N'60 71', N'733903', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (94, CAST(N'2018-05-27' AS Date), CAST(N'2023-09-29' AS Date), N'54 49', N'298803', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (95, CAST(N'2018-08-05' AS Date), CAST(N'2022-11-16' AS Date), N'71 58', N'321618', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (96, CAST(N'2018-11-06' AS Date), CAST(N'2024-12-24' AS Date), N'85 53', N'424706', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (97, CAST(N'2019-02-06' AS Date), CAST(N'2019-06-19' AS Date), N'29 63', N'456353', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (98, CAST(N'2019-01-21' AS Date), CAST(N'2025-10-16' AS Date), N'57 59', N'552536', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (99, CAST(N'2018-08-17' AS Date), CAST(N'2021-03-17' AS Date), N'55 65', N'355405', 1)
GO
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (100, CAST(N'2019-02-15' AS Date), CAST(N'2022-05-09' AS Date), N'51 57', N'441335', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (101, CAST(N'2019-01-13' AS Date), CAST(N'2025-08-29' AS Date), N'59 49', N'144483', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (102, CAST(N'2018-08-02' AS Date), CAST(N'2019-07-06' AS Date), N'76 63', N'351410', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (103, CAST(N'2018-12-31' AS Date), CAST(N'2019-05-25' AS Date), N'70 45', N'177463', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (104, CAST(N'2019-02-26' AS Date), CAST(N'2026-12-12' AS Date), N'51 69', N'640455', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (105, CAST(N'2019-03-12' AS Date), CAST(N'2022-01-03' AS Date), N'87 58', N'537518', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (106, CAST(N'2018-05-29' AS Date), CAST(N'2019-06-20' AS Date), N'14 48', N'206175', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (107, CAST(N'2018-09-20' AS Date), CAST(N'2022-12-06' AS Date), N'98 62', N'646552', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (108, CAST(N'2018-06-21' AS Date), CAST(N'2023-08-21' AS Date), N'92 52', N'511894', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (109, CAST(N'2019-05-14' AS Date), CAST(N'2022-07-23' AS Date), N'69 65', N'215700', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (110, CAST(N'2019-02-28' AS Date), CAST(N'2027-04-07' AS Date), N'53 44', N'602449', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (111, CAST(N'2018-06-23' AS Date), CAST(N'2027-11-16' AS Date), N'56 62', N'189864', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (112, CAST(N'2019-02-01' AS Date), CAST(N'2024-02-11' AS Date), N'44 55', N'179449', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (113, CAST(N'2019-04-11' AS Date), CAST(N'2021-08-06' AS Date), N'14 46', N'984592', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (114, CAST(N'2018-10-20' AS Date), CAST(N'2023-04-03' AS Date), N'38 75', N'480183', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (115, CAST(N'2018-11-04' AS Date), CAST(N'2028-01-13' AS Date), N'45 48', N'143560', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (116, CAST(N'2018-08-23' AS Date), CAST(N'2025-03-08' AS Date), N'87 75', N'143198', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (117, CAST(N'2019-02-08' AS Date), CAST(N'2021-07-10' AS Date), N'44 56', N'698959', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (118, CAST(N'2018-12-31' AS Date), CAST(N'2021-06-23' AS Date), N'57 74', N'218810', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (119, CAST(N'2018-08-05' AS Date), CAST(N'2026-07-05' AS Date), N'73 72', N'870584', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (120, CAST(N'2018-12-09' AS Date), CAST(N'2023-05-20' AS Date), N'24 62', N'735138', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (121, CAST(N'2018-11-22' AS Date), CAST(N'2022-03-05' AS Date), N'60 70', N'112930', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (122, CAST(N'2018-12-11' AS Date), CAST(N'2022-01-13' AS Date), N'45 76', N'922777', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (123, CAST(N'2019-02-11' AS Date), CAST(N'2025-09-03' AS Date), N'45 62', N'434160', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (124, CAST(N'2019-02-12' AS Date), CAST(N'2021-08-12' AS Date), N'80 67', N'198658', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (125, CAST(N'2018-06-28' AS Date), CAST(N'2026-11-07' AS Date), N'36 51', N'955678', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (126, CAST(N'2018-05-23' AS Date), CAST(N'2019-01-26' AS Date), N'56 73', N'570962', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (127, CAST(N'2018-10-09' AS Date), CAST(N'2025-08-08' AS Date), N'80 43', N'244787', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (128, CAST(N'2018-06-06' AS Date), CAST(N'2028-02-08' AS Date), N'61 43', N'360486', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (129, CAST(N'2019-02-13' AS Date), CAST(N'2028-05-11' AS Date), N'77 64', N'593417', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (130, CAST(N'2018-06-25' AS Date), CAST(N'2020-11-10' AS Date), N'78 69', N'300408', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (131, CAST(N'2019-02-15' AS Date), CAST(N'2027-07-14' AS Date), N'92 61', N'564412', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (132, CAST(N'2018-08-15' AS Date), CAST(N'2019-04-06' AS Date), N'86 50', N'649001', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (133, CAST(N'2019-01-05' AS Date), CAST(N'2021-10-31' AS Date), N'80 51', N'417594', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (134, CAST(N'2018-09-25' AS Date), CAST(N'2023-08-09' AS Date), N'81 65', N'173583', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (135, CAST(N'2018-09-19' AS Date), CAST(N'2027-05-20' AS Date), N'61 63', N'107404', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (136, CAST(N'2018-11-14' AS Date), CAST(N'2026-02-12' AS Date), N'64 55', N'604567', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (137, CAST(N'2018-12-16' AS Date), CAST(N'2026-12-19' AS Date), N'41 77', N'152038', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (138, CAST(N'2018-08-30' AS Date), CAST(N'2023-12-18' AS Date), N'47 75', N'631972', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (139, CAST(N'2018-06-24' AS Date), CAST(N'2019-03-28' AS Date), N'58 56', N'389246', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (140, CAST(N'2019-02-17' AS Date), CAST(N'2023-06-24' AS Date), N'56 65', N'672465', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (141, CAST(N'2018-09-01' AS Date), CAST(N'2019-06-02' AS Date), N'13 52', N'375141', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (142, CAST(N'2018-10-13' AS Date), CAST(N'2023-09-02' AS Date), N'95 80', N'672343', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (143, CAST(N'2018-10-25' AS Date), CAST(N'2028-04-14' AS Date), N'94 60', N'114388', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (144, CAST(N'2018-09-24' AS Date), CAST(N'2022-06-26' AS Date), N'79 46', N'834138', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (145, CAST(N'2018-10-07' AS Date), CAST(N'2023-03-25' AS Date), N'41 60', N'943122', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (146, CAST(N'2019-01-30' AS Date), CAST(N'2024-12-12' AS Date), N'93 58', N'978442', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (147, CAST(N'2019-02-11' AS Date), CAST(N'2028-02-26' AS Date), N'75 77', N'669648', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (148, CAST(N'2019-01-26' AS Date), CAST(N'2025-10-29' AS Date), N'89 63', N'563046', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (149, CAST(N'2018-06-17' AS Date), CAST(N'2025-12-10' AS Date), N'85 59', N'935502', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (150, CAST(N'2019-03-21' AS Date), CAST(N'2020-10-17' AS Date), N'56 47', N'618832', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (151, CAST(N'2018-11-29' AS Date), CAST(N'2022-01-20' AS Date), N'18 44', N'286148', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (152, CAST(N'2019-03-14' AS Date), CAST(N'2024-06-13' AS Date), N'15 42', N'848910', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (153, CAST(N'2018-09-26' AS Date), CAST(N'2019-12-14' AS Date), N'86 48', N'153332', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (154, CAST(N'2019-02-25' AS Date), CAST(N'2027-12-23' AS Date), N'21 64', N'281543', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (155, CAST(N'2018-10-17' AS Date), CAST(N'2019-06-24' AS Date), N'44 65', N'689019', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (156, CAST(N'2018-10-13' AS Date), CAST(N'2022-12-01' AS Date), N'63 73', N'339944', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (157, CAST(N'2019-01-04' AS Date), CAST(N'2020-10-22' AS Date), N'80 43', N'838745', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (158, CAST(N'2018-12-31' AS Date), CAST(N'2026-08-09' AS Date), N'41 74', N'833772', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (159, CAST(N'2019-03-16' AS Date), CAST(N'2023-05-07' AS Date), N'70 53', N'197719', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (160, CAST(N'2018-12-24' AS Date), CAST(N'2025-01-15' AS Date), N'53 47', N'642355', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (161, CAST(N'2018-08-12' AS Date), CAST(N'2022-02-10' AS Date), N'39 45', N'599900', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (162, CAST(N'2019-01-07' AS Date), CAST(N'2023-09-12' AS Date), N'99 70', N'313651', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (163, CAST(N'2019-01-06' AS Date), CAST(N'2026-01-09' AS Date), N'53 78', N'482016', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (164, CAST(N'2019-05-18' AS Date), CAST(N'2025-05-30' AS Date), N'82 47', N'608653', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (165, CAST(N'2019-03-01' AS Date), CAST(N'2019-08-09' AS Date), N'32 76', N'726052', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (166, CAST(N'2018-10-29' AS Date), CAST(N'2026-04-18' AS Date), N'10 56', N'710506', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (167, CAST(N'2019-04-22' AS Date), CAST(N'2027-05-07' AS Date), N'44 47', N'857224', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (168, CAST(N'2018-06-02' AS Date), CAST(N'2022-01-03' AS Date), N'15 44', N'216181', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (169, CAST(N'2019-01-31' AS Date), CAST(N'2028-01-25' AS Date), N'90 60', N'267003', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (170, CAST(N'2019-03-26' AS Date), CAST(N'2026-03-24' AS Date), N'25 57', N'211673', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (171, CAST(N'2018-10-01' AS Date), CAST(N'2027-06-21' AS Date), N'72 63', N'140335', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (172, CAST(N'2018-07-14' AS Date), CAST(N'2025-12-25' AS Date), N'81 46', N'112671', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (173, CAST(N'2018-11-03' AS Date), CAST(N'2025-01-09' AS Date), N'53 72', N'121874', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (174, CAST(N'2018-08-20' AS Date), CAST(N'2023-04-03' AS Date), N'38 55', N'988267', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (175, CAST(N'2019-01-30' AS Date), CAST(N'2027-05-27' AS Date), N'93 66', N'407687', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (176, CAST(N'2018-10-13' AS Date), CAST(N'2026-07-07' AS Date), N'71 50', N'321250', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (177, CAST(N'2019-02-11' AS Date), CAST(N'2020-09-03' AS Date), N'55 48', N'283081', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (178, CAST(N'2018-08-14' AS Date), CAST(N'2020-12-15' AS Date), N'18 41', N'954617', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (179, CAST(N'2018-07-10' AS Date), CAST(N'2021-05-04' AS Date), N'72 60', N'808111', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (180, CAST(N'2018-10-17' AS Date), CAST(N'2021-01-08' AS Date), N'88 53', N'584291', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (181, CAST(N'2018-10-31' AS Date), CAST(N'2026-09-02' AS Date), N'51 42', N'920836', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (182, CAST(N'2019-05-07' AS Date), CAST(N'2025-10-16' AS Date), N'52 74', N'843119', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (183, CAST(N'2019-02-28' AS Date), CAST(N'2027-10-12' AS Date), N'87 69', N'608724', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (184, CAST(N'2019-01-16' AS Date), CAST(N'2024-02-23' AS Date), N'22 78', N'602987', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (185, CAST(N'2019-04-05' AS Date), CAST(N'2019-06-14' AS Date), N'29 60', N'390525', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (186, CAST(N'2018-05-31' AS Date), CAST(N'2025-07-24' AS Date), N'79 56', N'112224', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (187, CAST(N'2018-09-18' AS Date), CAST(N'2020-08-26' AS Date), N'11 56', N'742127', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (188, CAST(N'2018-10-31' AS Date), CAST(N'2021-08-29' AS Date), N'52 42', N'884090', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (189, CAST(N'2018-08-04' AS Date), CAST(N'2023-08-15' AS Date), N'89 58', N'989847', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (190, CAST(N'2018-11-07' AS Date), CAST(N'2022-09-23' AS Date), N'40 46', N'106016', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (191, CAST(N'2019-04-14' AS Date), CAST(N'2024-03-06' AS Date), N'87 66', N'120201', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (192, CAST(N'2019-02-23' AS Date), CAST(N'2021-01-25' AS Date), N'90 65', N'677102', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (193, CAST(N'2019-02-06' AS Date), CAST(N'2019-05-26' AS Date), N'70 72', N'962735', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (194, CAST(N'2018-05-27' AS Date), CAST(N'2025-06-03' AS Date), N'85 80', N'622744', 4)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (195, CAST(N'2018-08-05' AS Date), CAST(N'2020-04-10' AS Date), N'82 46', N'115947', 2)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (196, CAST(N'2018-11-06' AS Date), CAST(N'2021-12-10' AS Date), N'19 74', N'705660', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (197, CAST(N'2019-02-06' AS Date), CAST(N'2026-12-26' AS Date), N'39 46', N'518387', 3)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (198, CAST(N'2019-01-21' AS Date), CAST(N'2022-12-18' AS Date), N'63 60', N'909624', 1)
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (199, CAST(N'2018-08-17' AS Date), CAST(N'2028-01-28' AS Date), N'33 65', N'198629', 1)
GO
INSERT [dbo].[License] ([ID], [LicenseDate], [ExpireDate], [LicenceSeries], [LicenceNumber], [StatusID]) VALUES (200, CAST(N'2019-02-15' AS Date), CAST(N'2025-09-02' AS Date), N'75 68', N'533909', 1)
SET IDENTITY_INSERT [dbo].[License] OFF
GO
SET IDENTITY_INSERT [dbo].[LicenseCategory] ON 

INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (1, 1, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (2, 2, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (3, 3, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (4, 3, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (5, 4, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (6, 5, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (7, 6, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (8, 7, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (9, 7, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (10, 8, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (11, 9, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (12, 10, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (13, 11, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (14, 12, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (15, 13, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (16, 14, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (17, 15, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (18, 16, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (19, 17, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (20, 17, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (21, 18, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (22, 19, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (23, 20, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (24, 21, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (25, 22, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (26, 23, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (27, 24, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (28, 24, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (29, 25, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (30, 26, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (31, 27, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (32, 28, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (33, 29, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (34, 30, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (35, 31, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (36, 32, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (37, 33, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (38, 34, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (39, 35, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (40, 35, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (41, 36, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (42, 36, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (43, 37, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (44, 37, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (45, 38, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (46, 38, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (47, 39, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (48, 39, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (49, 40, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (50, 40, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (51, 41, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (52, 41, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (53, 42, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (54, 42, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (55, 43, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (56, 43, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (57, 44, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (58, 44, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (59, 45, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (60, 45, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (61, 46, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (62, 46, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (63, 47, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (64, 47, 1)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (65, 48, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (66, 49, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (67, 50, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (68, 51, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (69, 52, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (70, 53, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (71, 53, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (72, 54, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (73, 55, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (74, 56, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (75, 57, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (76, 57, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (77, 58, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (78, 58, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (79, 59, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (80, 59, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (81, 60, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (82, 60, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (83, 61, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (84, 61, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (85, 62, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (86, 62, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (87, 63, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (88, 63, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (89, 64, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (90, 64, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (91, 65, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (92, 65, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (93, 66, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (94, 66, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (95, 67, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (96, 67, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (97, 68, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (98, 68, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (99, 69, 4)
GO
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (100, 69, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (101, 70, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (102, 70, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (103, 71, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (104, 71, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (105, 72, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (106, 72, 3)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (107, 73, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (108, 74, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (109, 75, 4)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (110, 76, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (111, 77, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (112, 78, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (113, 79, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (114, 80, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (115, 81, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (116, 82, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (117, 83, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (118, 84, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (119, 85, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (120, 86, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (121, 87, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (122, 88, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (123, 89, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (124, 90, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (125, 91, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (126, 92, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (127, 93, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (128, 94, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (129, 95, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (130, 95, 5)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (131, 96, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (132, 97, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (133, 98, 6)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (134, 99, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (135, 100, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (136, 101, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (137, 102, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (138, 103, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (139, 104, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (140, 105, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (141, 106, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (142, 107, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (143, 108, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (144, 109, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (145, 110, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (146, 111, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (147, 112, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (148, 113, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (149, 114, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (150, 115, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (151, 116, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (152, 117, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (153, 118, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (154, 119, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (155, 120, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (156, 121, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (157, 122, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (158, 123, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (159, 124, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (160, 125, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (161, 126, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (162, 127, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (163, 128, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (164, 129, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (165, 130, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (166, 131, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (167, 132, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (168, 133, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (169, 134, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (170, 135, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (171, 136, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (172, 137, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (173, 138, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (174, 139, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (175, 140, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (176, 141, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (177, 142, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (178, 143, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (179, 144, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (180, 145, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (181, 146, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (182, 147, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (183, 148, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (184, 149, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (185, 150, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (186, 151, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (187, 152, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (188, 153, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (189, 154, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (190, 155, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (191, 156, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (192, 157, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (193, 158, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (194, 159, 7)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (195, 160, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (196, 161, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (197, 162, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (198, 163, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (199, 164, 2)
GO
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (200, 165, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (201, 166, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (202, 167, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (203, 168, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (204, 169, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (205, 170, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (206, 171, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (207, 172, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (208, 173, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (209, 174, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (210, 175, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (211, 176, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (212, 177, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (213, 178, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (214, 179, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (215, 180, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (216, 181, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (217, 182, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (218, 183, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (219, 184, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (220, 185, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (221, 186, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (222, 187, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (223, 188, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (224, 189, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (225, 190, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (226, 191, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (227, 192, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (228, 193, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (229, 194, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (230, 195, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (231, 196, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (232, 197, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (233, 198, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (234, 199, 2)
INSERT [dbo].[LicenseCategory] ([ID], [LicenseID], [CategoryID]) VALUES (235, 200, 2)
SET IDENTITY_INSERT [dbo].[LicenseCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (1, N'BMW')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (2, N'Cadillac')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (3, N'Kia')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (4, N'Volkswagen')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[ManufacturerCarModel] ON 

INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (1, 1, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (2, 2, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (3, 3, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (4, 4, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (5, 5, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (6, 6, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (7, 7, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (8, 8, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (9, 9, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (10, 10, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (11, 11, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (12, 12, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (13, 13, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (14, 14, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (15, 15, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (16, 16, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (17, 17, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (18, 18, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (19, 19, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (20, 20, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (21, 21, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (22, 22, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (23, 23, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (24, 24, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (25, 25, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (26, 26, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (27, 27, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (28, 28, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (29, 29, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (30, 30, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (31, 31, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (32, 32, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (33, 33, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (34, 34, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (35, 35, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (36, 36, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (37, 37, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (38, 38, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (39, 39, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (40, 40, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (41, 41, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (42, 42, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (43, 43, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (44, 44, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (45, 45, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (46, 46, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (47, 47, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (48, 48, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (49, 49, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (50, 50, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (51, 51, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (52, 52, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (53, 53, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (54, 54, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (55, 55, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (56, 56, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (57, 57, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (58, 58, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (59, 59, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (60, 60, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (61, 61, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (62, 62, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (63, 63, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (64, 64, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (65, 65, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (66, 66, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (67, 67, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (68, 68, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (69, 69, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (70, 70, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (71, 71, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (72, 72, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (73, 73, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (74, 74, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (75, 75, 4)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (76, 76, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (77, 77, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (78, 78, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (79, 79, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (80, 80, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (81, 81, 1)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (82, 82, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (83, 83, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (84, 84, 2)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (85, 85, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (86, 86, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (87, 87, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (88, 88, 3)
INSERT [dbo].[ManufacturerCarModel] ([ID], [CarModelID], [ManufacturerID]) VALUES (89, 89, 3)
SET IDENTITY_INSERT [dbo].[ManufacturerCarModel] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [Name]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([ID], [Name]) VALUES (2, N'Expire')
INSERT [dbo].[Status] ([ID], [Name]) VALUES (3, N'Paused')
INSERT [dbo].[Status] ([ID], [Name]) VALUES (4, N'Withdrawn')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfDrive] ON 

INSERT [dbo].[TypeOfDrive] ([ID], [Name]) VALUES (1, N'front-wheel drive
')
INSERT [dbo].[TypeOfDrive] ([ID], [Name]) VALUES (2, N'full drive
')
INSERT [dbo].[TypeOfDrive] ([ID], [Name]) VALUES (3, N'rear drive
')
SET IDENTITY_INSERT [dbo].[TypeOfDrive] OFF
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_CarModel] FOREIGN KEY([CarModelID])
REFERENCES [dbo].[CarModel] ([ID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_CarModel]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Manufacturer]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_TypeOfDrive] FOREIGN KEY([TypeOfDriveID])
REFERENCES [dbo].[TypeOfDrive] ([ID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_TypeOfDrive]
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_Company]
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_JobName] FOREIGN KEY([JobID])
REFERENCES [dbo].[JobName] ([ID])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_JobName]
GO
ALTER TABLE [dbo].[DriverCar]  WITH CHECK ADD  CONSTRAINT [FK_DriverCar_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[Car] ([ID])
GO
ALTER TABLE [dbo].[DriverCar] CHECK CONSTRAINT [FK_DriverCar_Car]
GO
ALTER TABLE [dbo].[DriverCar]  WITH CHECK ADD  CONSTRAINT [FK_DriverCar_Driver] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Driver] ([ID])
GO
ALTER TABLE [dbo].[DriverCar] CHECK CONSTRAINT [FK_DriverCar_Driver]
GO
ALTER TABLE [dbo].[DriverLicense]  WITH CHECK ADD  CONSTRAINT [FK_DriverLicense_Driver] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Driver] ([ID])
GO
ALTER TABLE [dbo].[DriverLicense] CHECK CONSTRAINT [FK_DriverLicense_Driver]
GO
ALTER TABLE [dbo].[DriverLicense]  WITH CHECK ADD  CONSTRAINT [FK_DriverLicense_License] FOREIGN KEY([LicenseID])
REFERENCES [dbo].[License] ([ID])
GO
ALTER TABLE [dbo].[DriverLicense] CHECK CONSTRAINT [FK_DriverLicense_License]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [FK_License_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [FK_License_Status]
GO
ALTER TABLE [dbo].[LicenseCategory]  WITH CHECK ADD  CONSTRAINT [FK_LicenseCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[LicenseCategory] CHECK CONSTRAINT [FK_LicenseCategory_Category]
GO
ALTER TABLE [dbo].[LicenseCategory]  WITH CHECK ADD  CONSTRAINT [FK_LicenseCategory_License] FOREIGN KEY([LicenseID])
REFERENCES [dbo].[License] ([ID])
GO
ALTER TABLE [dbo].[LicenseCategory] CHECK CONSTRAINT [FK_LicenseCategory_License]
GO
ALTER TABLE [dbo].[ManufacturerCarModel]  WITH CHECK ADD  CONSTRAINT [FK_ManufacturerCarModel_CarModel] FOREIGN KEY([CarModelID])
REFERENCES [dbo].[CarModel] ([ID])
GO
ALTER TABLE [dbo].[ManufacturerCarModel] CHECK CONSTRAINT [FK_ManufacturerCarModel_CarModel]
GO
ALTER TABLE [dbo].[ManufacturerCarModel]  WITH CHECK ADD  CONSTRAINT [FK_ManufacturerCarModel_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[ManufacturerCarModel] CHECK CONSTRAINT [FK_ManufacturerCarModel_Manufacturer]
GO
USE [master]
GO
ALTER DATABASE [GIBDD_Gorlanov_619] SET  READ_WRITE 
GO
