USE [master]
GO
/****** Object:  Database [StudentManager]    Script Date: 10/13/2019 4:55:44 PM ******/
CREATE DATABASE [StudentManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentManager', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StudentManager.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentManager_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StudentManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentManager] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentManager] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentManager] SET  MULTI_USER 
GO
ALTER DATABASE [StudentManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StudentManager]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 10/13/2019 4:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](100) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassStudent]    Script Date: 10/13/2019 4:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassStudent](
	[id] [int] NULL,
	[class_id] [int] NULL,
	[student_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DayOff]    Script Date: 10/13/2019 4:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayOff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[day_off] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/13/2019 4:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[age] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([id], [class_name]) VALUES (1, N'Cơ sở dữ liệu')
INSERT [dbo].[Classes] ([id], [class_name]) VALUES (2, N'Lập trình Java')
INSERT [dbo].[Classes] ([id], [class_name]) VALUES (3, N'Lập trình PHP')
INSERT [dbo].[Classes] ([id], [class_name]) VALUES (4, N'Lập trình C#')
INSERT [dbo].[Classes] ([id], [class_name]) VALUES (5, N'Lập trình hướng đối tượng')
INSERT [dbo].[Classes] ([id], [class_name]) VALUES (6, N'L?p h?c abc')
SET IDENTITY_INSERT [dbo].[Classes] OFF
INSERT [dbo].[ClassStudent] ([id], [class_id], [student_id]) VALUES (NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[DayOff] ON 

INSERT [dbo].[DayOff] ([id], [student_id], [day_off]) VALUES (2, 1, CAST(0x4A400B00 AS Date))
INSERT [dbo].[DayOff] ([id], [student_id], [day_off]) VALUES (3, 5, CAST(0x42400B00 AS Date))
INSERT [dbo].[DayOff] ([id], [student_id], [day_off]) VALUES (4, 4, CAST(0x52400B00 AS Date))
SET IDENTITY_INSERT [dbo].[DayOff] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([id], [name], [age]) VALUES (1, N'Nguyễn Văn Tú', 20)
INSERT [dbo].[Student] ([id], [name], [age]) VALUES (2, N'Trần Văn Phúc', 22)
INSERT [dbo].[Student] ([id], [name], [age]) VALUES (3, N'Đăng Tấn Trường', 18)
INSERT [dbo].[Student] ([id], [name], [age]) VALUES (4, N'Võ Thị Hồng 19', 21)
INSERT [dbo].[Student] ([id], [name], [age]) VALUES (5, N'Lâm Văn Dung ', 23)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_class_name]    Script Date: 10/13/2019 4:55:44 PM ******/
CREATE NONCLUSTERED INDEX [index_class_name] ON [dbo].[Classes]
(
	[class_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_name]    Script Date: 10/13/2019 4:55:44 PM ******/
CREATE NONCLUSTERED INDEX [index_name] ON [dbo].[Student]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [StudentManager] SET  READ_WRITE 
GO
