USE [master]
GO
/****** Object:  Database [user28]    Script Date: 16.05.2023 12:05:17 ******/
CREATE DATABASE [user28]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user28', FILENAME = N'/var/opt/mssql/data/user28.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'user28_log', FILENAME = N'/var/opt/mssql/data/user28_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user28].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user28] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user28] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user28] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user28] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user28] SET ARITHABORT OFF 
GO
ALTER DATABASE [user28] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [user28] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user28] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user28] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user28] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user28] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user28] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user28] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user28] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user28] SET  ENABLE_BROKER 
GO
ALTER DATABASE [user28] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user28] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user28] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user28] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user28] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user28] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user28] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user28] SET RECOVERY FULL 
GO
ALTER DATABASE [user28] SET  MULTI_USER 
GO
ALTER DATABASE [user28] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user28] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user28] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user28] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [user28]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16.05.2023 12:05:18 ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 16.05.2023 12:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[BIrthday] [date] NOT NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitle]    Script Date: 16.05.2023 12:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_JobTitle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16.05.2023 12:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExecutorID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[ManagerID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[StatusID] [int] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[TotalPrice] [money] NULL,
	[IsArchive] [bit] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 16.05.2023 12:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[ID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 16.05.2023 12:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](6) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 16.05.2023 12:05:18 ******/
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
/****** Object:  Table [dbo].[TypeLogin]    Script Date: 16.05.2023 12:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeLogin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeLogin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.05.2023 12:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[PassportSeries] [nvarchar](50) NULL,
	[PassportNumber] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[TypeLoginID] [int] NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_User2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'Срочно')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (2, N'Не срочно')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (1, N'Потапов', N'Макар', N'Иванович', N'+7(781)285-5837', CAST(N'1990-01-03' AS Date), 12.89)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (2, N'Ефремова', N'Елизавета', N'Романовна', N'+7(230)906-8810', CAST(N'1999-05-21' AS Date), 17.9)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (3, N'Кузнецова', N'Анастасия', N'Денисовна', N'+7(555)444-8311', CAST(N'1992-09-19' AS Date), 31.11)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (4, N'Васильева', N'Алиса', N'Ивановна', N'+7(392)682-4441', CAST(N'1979-12-29' AS Date), NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (5, N'Поликарпов', N'Матвей', N'Лукич', N'+7(836)429-0343', CAST(N'1999-05-08' AS Date), NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (6, N'Антонова', N'Алия', N'Марковна', N'+7(283)945-5692', CAST(N'1994-11-06' AS Date), NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (7, N'Александрова', N'Полина', N'Дмитриевна', N'+7(991)359-3669', CAST(N'1994-04-21' AS Date), NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (8, N'Кудряшова', N'Марина', N'Мироновна', N'+7(440)561-0674', CAST(N'1975-02-25' AS Date), 23.2)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (9, N'Зотов', N'Платон', N'Захарович', N'+7(331)118-2434', CAST(N'1975-05-13' AS Date), 11.66)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (10, N'Глебова', N'Ксения', N'Савельевна', N'+7(493)219-1942', CAST(N'1974-11-25' AS Date), NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (11, N'Виноградов', N'Борис', N'Станиславович', N'+7(407)481-5030', CAST(N'1990-02-23' AS Date), NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (12, N'Федорова', N'Ева', N'Максимовна', N'+7(919)418-2497', CAST(N'1977-07-13' AS Date), NULL)
INSERT [dbo].[Client] ([ID], [Surname], [Name], [Patronymic], [Phone], [BIrthday], [Discount]) VALUES (13, N'Смирнов', N'Максим', N'Владиславович', N'+7(790)388-2563', CAST(N'1975-12-23' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[JobTitle] ON 

INSERT [dbo].[JobTitle] ([ID], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[JobTitle] ([ID], [Name]) VALUES (2, N'Исполнитель')
INSERT [dbo].[JobTitle] ([ID], [Name]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[JobTitle] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (1, 2, 4, 1, CAST(N'2023-02-12T11:56:09.000' AS DateTime), NULL, 1, N'', NULL, 0, 1)
INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (2, 13, 5, 4, CAST(N'2023-02-03T07:55:24.000' AS DateTime), NULL, 1, N'', NULL, 0, 2)
INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (3, 15, 6, 9, CAST(N'2023-02-12T00:08:45.000' AS DateTime), CAST(N'2023-02-12T11:08:11.000' AS DateTime), 2, N'', 600.8700, 1, 2)
INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (4, 16, 7, 10, CAST(N'2023-02-12T18:28:26.000' AS DateTime), CAST(N'2023-02-12T20:30:31.000' AS DateTime), 2, N'Со слов: перестал включаться', 765.8700, 0, 1)
INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (5, 18, 3, 11, CAST(N'2023-02-07T00:23:48.000' AS DateTime), CAST(N'2023-02-17T00:07:00.000' AS DateTime), 2, N'', 1137.3600, 1, 2)
INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (6, 20, 4, 12, CAST(N'2023-02-10T13:57:53.000' AS DateTime), CAST(N'2023-02-12T13:00:53.000' AS DateTime), 2, N'', 320.3200, 0, 2)
INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (7, 21, 7, 4, CAST(N'2023-02-12T09:45:27.000' AS DateTime), NULL, 1, N'Необходимо настроить ПК по индивидуальным параметрам', NULL, 0, 1)
INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (8, 23, 8, 9, CAST(N'2023-02-10T11:04:57.000' AS DateTime), NULL, 1, N'', NULL, 0, 2)
INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (9, 25, 9, 22, CAST(N'2023-02-07T22:34:04.000' AS DateTime), NULL, 1, N'', NULL, 0, 1)
INSERT [dbo].[Order] ([ID], [ExecutorID], [ClientID], [ManagerID], [CreationDate], [EndDate], [StatusID], [Description], [TotalPrice], [IsArchive], [CategoryID]) VALUES (10, 5, 1, 24, CAST(N'2023-02-08T14:07:22.000' AS DateTime), CAST(N'2023-02-11T15:05:00.000' AS DateTime), 2, N'', 427.5900, 0, 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (1, 1, 4)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (2, 1, 18)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (3, 2, 10)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (4, 2, 11)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (5, 2, 13)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (6, 3, 19)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (7, 4, 5)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (8, 5, 13)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (9, 6, 2)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (10, 7, 11)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (11, 8, 7)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (12, 8, 1)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (13, 9, 18)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (14, 9, 11)
INSERT [dbo].[OrderService] ([ID], [OrderID], [ServiceID]) VALUES (15, 10, 17)
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (1, N'37AZBV', N'Ремонт/Замена корпуса ноутбука', 190.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (2, N'ZD111U', N'Чистка операционной системы от ошибок и мусорных файлов', 320.3200)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (3, N'XTWDYK', N'Диагностика ноутбука', 350.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (4, N'UKSRK5', N'Диагностика компьютерной техники', 450.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (5, N'4N440U', N'Замена процессора на ноутбуке', 765.8700)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (6, N'RCRAAB', N'Восстановление случайно удаленных данных из корзины', 850.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (7, N'63QII7', N'Ремонт/Замена клавиатуры ноутбука', 870.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (8, N'L1G3MY', N'Профилактика - Чистка ноутбука от пыли + замена термопасты', 870.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (9, N'35OD6D', N'Установка драйверов устройств', 900.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (10, N'J31RKJ', N'Форматирование и создание раздела жесткого диска', 1000.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (11, N'3K03X7', N'Индивидуальная настройка ОС', 1100.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (12, N'BDVJ4Y', N'Дефрагментация жесткого диска', 1500.0000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (13, N'K5U65W', N'Установка специализированных утилит', 1650.9800)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (14, N'RV63GY', N'Удаление вирусов с компьютера (без установки антивируса)', 1700.8000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (15, N'H0326A', N'Удаление вирусов с карт памяти и флешек', 2310.1000)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (16, N'VE6DVF', N'Разблокировка Windows без переустановки (удаление банера)', 2400.2300)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (17, N'593NWV', N'Установка мультимедиа и интернет программ (плеер, браузер и пр,)', 490.8700)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (18, N'GVDGCW', N'Установка ОС', 540.9900)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (19, N'6ZTZ1D', N'Установка антивируса (без стоимости лицензии)', 600.8700)
INSERT [dbo].[Service] ([ID], [Code], [Title], [Price]) VALUES (20, N'8VDT28', N'Ремонт блока питания ноутбука', 650.9800)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [Name]) VALUES (1, N'Новый')
INSERT [dbo].[Status] ([ID], [Name]) VALUES (2, N'Завершён')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeLogin] ON 

INSERT [dbo].[TypeLogin] ([ID], [Name]) VALUES (1, N'Успешно')
INSERT [dbo].[TypeLogin] ([ID], [Name]) VALUES (2, N'Не успешно')
SET IDENTITY_INSERT [dbo].[TypeLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (1, 1, N'Акимов', N'Ян', N'Алексеевич', N'gohufreilagrau-3818@yopmail.com', N'akimovya', N'bn069Caj', N'+7(781)785-5837', N'2367', N'558134', CAST(N'1993-07-03' AS Date), 1, N'/Images/1.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (2, 2, N'Гончарова', N'Ульяна', N'Львовна', N'xawugosune-1385@yopmail.com', N'goncharovaul', N'pW4qZhL!', N'+7(230)906-8815', N'7101', N'669343', CAST(N'1975-06-22' AS Date), 1, N'/Images/2.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (3, 3, N'Анохина', N'Елизавета', N'Матвеевна', N'leuttevitrafo1998@mail.ru', N'anochinaem', N'y6UNmaJg', N'+7(555)444-8316', N'3455', N'719630', CAST(N'1991-08-16' AS Date), 1, N'/Images/3.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (4, 1, N'Николаев', N'Илья', N'Владиславович', N'frapreubrulloba1141@yandex.ru', N'nickolaeviv', N'ebOt@4y$', N'+7(392)682-4442', N'2377', N'871623', CAST(N'1970-12-22' AS Date), 1, N'/Images/4.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (5, 2, N'Уткин', N'Дмитрий', N'Платонович', N'zapramaxesu-7741@yopmail.com', N'utkindp', N'zQt8g@GH', N'+7(836)429-0386', N'8755', N'921148', CAST(N'1999-05-04' AS Date), 2, NULL)
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (6, 2, N'Куликова', N'Стефания', N'Никитична', N'rouzecroummegre-3899@yopmail.com', N'kulikovasn', N'TCmE7Jon', N'+7(283)945-3092', N'4355', N'104594', CAST(N'1994-12-06' AS Date), 1, NULL)
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (7, 2, N'Волков', N'Егор', N'Матвеевич', N'ziyeuddocrabri-4748@@yopmail.com', N'volkovem', N'pbgO3Vv5', N'+7(621)359-3669', N'2791', N'114390', CAST(N'1995-03-28' AS Date), 1, N'/Images/5.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (8, 3, N'Соколова', N'Софья', N'Георгиевна', N'ketameissoinnei-1951@yopmail.com', N'sokolovasg', N'lITaH?Bs', N'+7(440)561-0314', N'5582', N'126286', CAST(N'1977-03-27' AS Date), 2, N'/Images/6.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (9, 1, N'Голубева', N'Полина', N'Андреевна', N'yipraubaponou-5849@yopmail.com', N'golubevapa', N's|ke*p@~', N'+7(331)918-2434', N'2978', N'133653', CAST(N'1975-04-12' AS Date), 1, N'/Images/7.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (10, 1, N'Вишневская', N'Мария', N'Андреевна', N'crapedocouca-3572@yopmail.com', N'vishnevskayama', N'OCaywHJZ', N'+7(493)219-3942', N'7512', N'141956', CAST(N'1975-12-23' AS Date), 1, N'/Images/8.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (11, 1, N'Васильева', N'Арина', N'Данииловна', N'ceigoixakaunni-9227@yopmail.com', N'vasilevad', N'DAWuV%#u', N'+7(407)485-5030', N'5046', N'158433', CAST(N'2000-01-22' AS Date), 2, N'/Images/9.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (12, 1, N'Павлов', N'Дмитрий', N'Максимович', N'yeimmeiwauzomo-7054@yopmail.com', N'pavlovdm', N'ptoED%zE', N'+7(919)478-2497', N'2460', N'169505', CAST(N'1983-10-03' AS Date), 2, N'/Images/.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (13, 2, N'Горбунова', N'Мирослава', N'Артуровна', N'pixil59@gmail.com', N'gorbunovama', N'ZFR2~Zl*', N'+7(482)802-9580', N'3412', N'174593', CAST(N'1998-03-03' AS Date), 1, NULL)
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (14, 1, N'Демина', N'София', N'Романовна', N'deummecillummu-4992@mail.ru
', N'deminasr', N'D%DVKyDN', N'+7(455)944-6449', N'4950', N'183034', CAST(N'1993-06-08' AS Date), 2, NULL)
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (15, 2, N'Петрова', N'Алина', N'Робертовна', N'vilagajaunne-5170@yandex.ru', N'petrovaar', N'z7ZE?8N5', N'+7(710)388-2563', N'5829', N'219464', CAST(N'1980-09-23' AS Date), 1, N'/Images/10.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (16, 2, N'Плотников', N'Григорий', N'Александрович', N'frusubroppotou656@yandex.ru', N'plotnikovga', N'yh+S4@yc', N'+7(759)452-3846', N'6443', N'208059', CAST(N'1991-03-13' AS Date), 1, N'/Images/11.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (17, 2, N'Прохорова', N'Есения', N'Тимофеевна', N'vhopkins@lewis-mullen.com', N'prochorovaet', N'wLF186dB', N'+7(687)801-1332', N'7079', N'213265', CAST(N'1998-04-14' AS Date), NULL, N'/Images/12.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (18, 2, N'Чернов', N'Алексей', N'Егорович', N'nlewis@yahoo.com', N'chernovae', N'Sjkr*1zV', N'+7(425)783-2253', N'8207', N'522702', CAST(N'1980-04-16' AS Date), 1, N'/Images/13.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (19, 1, N'Горбунов', N'Степан', N'Артёмович', N'garciadavid@mckinney-mcbride.com', N'gorbunovsa', N'hFhK%$JI', N'+7(889)449-4391', N'9307', N'232158', CAST(N'1993-07-23' AS Date), 1, N'/Images/14.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (20, 2, N'Рябинина', N'Софья', N'Артёмовна', N'loudittoimmolau1900@gmail.com', N'ryabininasa', N'&yw1da4K', N'+7(825)301-8250', N'1357', N'242839', CAST(N'1990-06-01' AS Date), NULL, NULL)
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (21, 2, N'Козлова', N'Яна', N'Даниловна', N'hittuprofassa4984@mail.com', N'kozlovayd', N'wCH7dl3k', N'+7(397)334-2086', N'1167', N'256636', CAST(N'1987-12-21' AS Date), NULL, NULL)
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (22, 1, N'Лукьянова', N'Ульяна', N'Олеговна', N'freineiciweijau888@yandex.ru', N'lyckyanovayo', N'JadQ24D5', N'+7(241)570-3040', N'1768', N'266986', CAST(N'1981-10-22' AS Date), NULL, NULL)
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (23, 2, N'Кондрашова', N'Арина', N'Ивановна', N'jessica84@hotmail.com', N'kondrashovai', N'YlBz$8vJ', N'+7(713)462-8265', N'1710', N'427875', CAST(N'1976-12-22' AS Date), 2, N'/Images/15.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (24, 1, N'Быкова', N'Виктория', N'Тимуровна', N'nokupekidda2001@gmail.com', N'bykovavt', N'nx8Z$K98', N'+7(854)822-2331', N'1806', N'289145', CAST(N'1973-06-14' AS Date), NULL, N'/Images/16.jpg')
INSERT [dbo].[User] ([ID], [JobID], [Surname], [Name], [Patronymic], [Email], [Login], [Password], [Phone], [PassportSeries], [PassportNumber], [Birthday], [TypeLoginID], [Image]) VALUES (25, 2, N'Гуляев', N'Тимофей', N'Даниилович', N'ginaritter@schneider-buchanan.com', N'gylyaevtd', N'lz$kp1?f', N'+7(439)713-6117', N'1587', N'291249', CAST(N'1987-02-05' AS Date), 2, N'/Images/17.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([ExecutorID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User1] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User1]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Order]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Service]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_JobTitle] FOREIGN KEY([JobID])
REFERENCES [dbo].[JobTitle] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_JobTitle]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_TypeLogin] FOREIGN KEY([TypeLoginID])
REFERENCES [dbo].[TypeLogin] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_TypeLogin]
GO
USE [master]
GO
ALTER DATABASE [user28] SET  READ_WRITE 
GO
