USE [master]
GO
/****** Object:  Database [Hermes]    Script Date: 27.04.2022 15:23:00 ******/
CREATE DATABASE [Hermes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hermes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hermes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hermes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hermes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hermes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hermes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hermes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hermes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hermes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hermes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hermes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hermes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hermes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hermes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hermes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hermes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hermes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hermes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hermes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hermes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hermes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hermes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hermes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hermes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hermes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hermes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hermes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hermes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hermes] SET RECOVERY FULL 
GO
ALTER DATABASE [Hermes] SET  MULTI_USER 
GO
ALTER DATABASE [Hermes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hermes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hermes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hermes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hermes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hermes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hermes', N'ON'
GO
ALTER DATABASE [Hermes] SET QUERY_STORE = OFF
GO
USE [Hermes]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 27.04.2022 15:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[BirthDate] [date] NOT NULL,
	[PhoneNumber] [nvarchar](30) NULL,
	[Email] [nvarchar](100) NULL,
	[AddedDate] [date] NULL,
	[Photo] [varbinary](max) NULL,
	[SexId] [int] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientTag]    Script Date: 27.04.2022 15:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientTag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sex]    Script Date: 27.04.2022 15:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 27.04.2022 15:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27.04.2022 15:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 27.04.2022 15:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Firstname], [Lastname], [Patronymic], [BirthDate], [PhoneNumber], [Email], [AddedDate], [Photo], [SexId]) VALUES (1, N'Дмитрий', N'Иванов', N'Васильевич', CAST(N'1975-06-02' AS Date), N'79332749901', N'Dmitriy.Ivanov@yandex.ru', CAST(N'2020-03-03' AS Date), NULL, 1)
INSERT [dbo].[Client] ([Id], [Firstname], [Lastname], [Patronymic], [BirthDate], [PhoneNumber], [Email], [AddedDate], [Photo], [SexId]) VALUES (2, N'Иван', N'Кимов', N'Лионтьевич', CAST(N'1993-11-13' AS Date), N'88027468292', N'ivan_kimov@mail.ru', CAST(N'2019-12-15' AS Date), NULL, 1)
INSERT [dbo].[Client] ([Id], [Firstname], [Lastname], [Patronymic], [BirthDate], [PhoneNumber], [Email], [AddedDate], [Photo], [SexId]) VALUES (3, N'Мария', N'Бурятова', N'Георгиевна', CAST(N'1993-09-07' AS Date), N'84269369538', N'Mariya93@gmail.com', CAST(N'2020-07-20' AS Date), NULL, 2)
INSERT [dbo].[Client] ([Id], [Firstname], [Lastname], [Patronymic], [BirthDate], [PhoneNumber], [Email], [AddedDate], [Photo], [SexId]) VALUES (4, N'Камила', N'Сафиуллина', N'Булатовна', CAST(N'1988-01-22' AS Date), N'71160689035', N'SaffKam@yandex.ru', CAST(N'2020-05-17' AS Date), NULL, 2)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientTag] ON 

INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (1, 2, 1)
INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (2, 3, 1)
INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (3, 4, 1)
INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (4, 2, 2)
INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (5, 1, 2)
INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (6, 4, 3)
INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (7, 5, 3)
INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (8, 2, 3)
INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (9, 1, 4)
INSERT [dbo].[ClientTag] ([Id], [TagId], [ClientId]) VALUES (10, 5, 4)
SET IDENTITY_INSERT [dbo].[ClientTag] OFF
GO
SET IDENTITY_INSERT [dbo].[Sex] ON 

INSERT [dbo].[Sex] ([Id], [Name]) VALUES (1, N'Мужчина')
INSERT [dbo].[Sex] ([Id], [Name]) VALUES (2, N'Женщина')
SET IDENTITY_INSERT [dbo].[Sex] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([Id], [Name], [Color]) VALUES (1, N'Комедия', N'#AA8F66')
INSERT [dbo].[Tag] ([Id], [Name], [Color]) VALUES (2, N'Драма', N'#ED9B40')
INSERT [dbo].[Tag] ([Id], [Name], [Color]) VALUES (3, N'Приключение', N'#FFEEDB')
INSERT [dbo].[Tag] ([Id], [Name], [Color]) VALUES (4, N'Боевик', N'#61C9A8')
INSERT [dbo].[Tag] ([Id], [Name], [Color]) VALUES (5, N'Байопик', N'#BA3B46')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password]) VALUES (1, N'Administrator', N'Administrator514')
INSERT [dbo].[User] ([Id], [Login], [Password]) VALUES (2, N'User', N'User6724')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Visit] ON 

INSERT [dbo].[Visit] ([Id], [ClientId], [Date]) VALUES (1, 1, CAST(N'2020-09-02' AS Date))
INSERT [dbo].[Visit] ([Id], [ClientId], [Date]) VALUES (2, 2, CAST(N'2020-09-03' AS Date))
INSERT [dbo].[Visit] ([Id], [ClientId], [Date]) VALUES (3, 3, CAST(N'2020-09-04' AS Date))
INSERT [dbo].[Visit] ([Id], [ClientId], [Date]) VALUES (4, 4, CAST(N'2020-09-05' AS Date))
INSERT [dbo].[Visit] ([Id], [ClientId], [Date]) VALUES (5, 1, CAST(N'2020-09-06' AS Date))
INSERT [dbo].[Visit] ([Id], [ClientId], [Date]) VALUES (6, 2, CAST(N'2020-09-07' AS Date))
INSERT [dbo].[Visit] ([Id], [ClientId], [Date]) VALUES (7, 3, CAST(N'2020-09-08' AS Date))
INSERT [dbo].[Visit] ([Id], [ClientId], [Date]) VALUES (8, 4, CAST(N'2020-09-09' AS Date))
SET IDENTITY_INSERT [dbo].[Visit] OFF
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Sex] FOREIGN KEY([SexId])
REFERENCES [dbo].[Sex] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Sex]
GO
ALTER TABLE [dbo].[ClientTag]  WITH CHECK ADD  CONSTRAINT [FK_ClientTag_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[ClientTag] CHECK CONSTRAINT [FK_ClientTag_Client]
GO
ALTER TABLE [dbo].[ClientTag]  WITH CHECK ADD  CONSTRAINT [FK_ClientTag_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[ClientTag] CHECK CONSTRAINT [FK_ClientTag_Tag]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Client]
GO
USE [master]
GO
ALTER DATABASE [Hermes] SET  READ_WRITE 
GO
