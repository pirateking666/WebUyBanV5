USE [master]
GO
/****** Object:  Database [UyBan]    Script Date: 7/21/2019 4:23:35 PM ******/
CREATE DATABASE [UyBan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UyBan', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UyBan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UyBan_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UyBan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UyBan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UyBan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UyBan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UyBan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UyBan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UyBan] SET ARITHABORT OFF 
GO
ALTER DATABASE [UyBan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UyBan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UyBan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UyBan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UyBan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UyBan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UyBan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UyBan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UyBan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UyBan] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UyBan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UyBan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UyBan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UyBan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UyBan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UyBan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UyBan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UyBan] SET RECOVERY FULL 
GO
ALTER DATABASE [UyBan] SET  MULTI_USER 
GO
ALTER DATABASE [UyBan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UyBan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UyBan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UyBan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UyBan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UyBan', N'ON'
GO
USE [UyBan]
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/21/2019 4:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [char](50) NOT NULL,
	[Password] [char](64) NOT NULL,
	[permissionID] [int] NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[action_permission]    Script Date: 7/21/2019 4:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[action_permission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[permissionID] [int] NOT NULL,
	[dataactiontableID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_action]    Script Date: 7/21/2019 4:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_action](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_action_table]    Script Date: 7/21/2019 4:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_action_table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [char](20) NOT NULL,
	[dataactionID] [int] NOT NULL,
	[TableName_vi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 7/21/2019 4:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateDay] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[NewstyleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newstype]    Script Date: 7/21/2019 4:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newstype](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 7/21/2019 4:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 7/21/2019 4:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Birth] [date] NOT NULL,
	[Gender] [char](3) NOT NULL,
	[Phone] [char](12) NOT NULL,
	[Email] [char](50) NULL,
	[Address] [nvarchar](100) NULL,
	[CreateDay] [datetime] NOT NULL,
	[CreateBy] [int] NULL,
	[accountID] [int] NOT NULL,
 CONSTRAINT [PK__user__3214EC27B82FC353] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([ID], [Username], [Password], [permissionID], [Status]) VALUES (1, N'admin                                             ', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 18, 1)
INSERT [dbo].[account] ([ID], [Username], [Password], [permissionID], [Status]) VALUES (19, N'abc                                               ', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 18, 1)
INSERT [dbo].[account] ([ID], [Username], [Password], [permissionID], [Status]) VALUES (20, N'xyz                                               ', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 24, 1)
INSERT [dbo].[account] ([ID], [Username], [Password], [permissionID], [Status]) VALUES (21, N'hello                                             ', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 18, 1)
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[action_permission] ON 

INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (1, 18, 1)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (2, 18, 2)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (3, 18, 3)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (4, 18, 4)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (5, 18, 5)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (6, 18, 6)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (7, 18, 7)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (8, 18, 8)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (9, 18, 9)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (10, 18, 10)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (11, 18, 11)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (19, 18, 12)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (23, 18, 13)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (24, 18, 14)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (25, 18, 15)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (26, 18, 16)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (12, 19, 5)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (13, 19, 6)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (14, 19, 7)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (15, 19, 8)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (16, 19, 9)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (17, 19, 10)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (18, 19, 11)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (20, 19, 12)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (21, 20, 1)
INSERT [dbo].[action_permission] ([ID], [permissionID], [dataactiontableID]) VALUES (68, 24, 4)
SET IDENTITY_INSERT [dbo].[action_permission] OFF
SET IDENTITY_INSERT [dbo].[data_action] ON 

INSERT [dbo].[data_action] ([ID], [Name]) VALUES (5, N'create    ')
INSERT [dbo].[data_action] ([ID], [Name]) VALUES (8, N'delete    ')
INSERT [dbo].[data_action] ([ID], [Name]) VALUES (6, N'read      ')
INSERT [dbo].[data_action] ([ID], [Name]) VALUES (7, N'update    ')
SET IDENTITY_INSERT [dbo].[data_action] OFF
SET IDENTITY_INSERT [dbo].[data_action_table] ON 

INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (1, N'permission          ', 5, N'Loại quyền')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (2, N'permission          ', 6, N'Loại quyền')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (3, N'permission          ', 7, N'Loại quyền')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (4, N'permission          ', 8, N'Loại quyền')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (5, N'newstype            ', 5, N'Loại bài viết')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (6, N'newstype            ', 6, N'Loại bài viết')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (7, N'newstype            ', 7, N'Loại bài viết')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (8, N'newstype            ', 8, N'Loại bài viết')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (9, N'news                ', 5, N'Bài viết')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (10, N'news                ', 6, N'Bài viết')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (11, N'news                ', 7, N'Bài viết')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (12, N'news                ', 8, N'Bài viết')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (13, N'user                ', 5, N'Người dùng')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (14, N'user                ', 6, N'Người dùng')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (15, N'user                ', 7, N'Người dùng')
INSERT [dbo].[data_action_table] ([ID], [TableName], [dataactionID], [TableName_vi]) VALUES (16, N'user                ', 8, N'Người dùng')
SET IDENTITY_INSERT [dbo].[data_action_table] OFF
SET IDENTITY_INSERT [dbo].[permission] ON 

INSERT [dbo].[permission] ([ID], [Name]) VALUES (20, N'adasd')
INSERT [dbo].[permission] ([ID], [Name]) VALUES (19, N'Biên tập viên')
INSERT [dbo].[permission] ([ID], [Name]) VALUES (24, N'helo')
INSERT [dbo].[permission] ([ID], [Name]) VALUES (18, N'Quản trị viên')
SET IDENTITY_INSERT [dbo].[permission] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([ID], [FirstName], [LastName], [Birth], [Gender], [Phone], [Email], [Address], [CreateDay], [CreateBy], [accountID]) VALUES (1, N'Nguyen', N'Tan', CAST(N'1996-11-18' AS Date), N'Nam', N'0906971622  ', N'nghoangtan96@gmail.com                            ', N'abc xyz tp hcm', CAST(N'2019-06-06T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[user] ([ID], [FirstName], [LastName], [Birth], [Gender], [Phone], [Email], [Address], [CreateDay], [CreateBy], [accountID]) VALUES (16, N'Nguyen', N'Tan', CAST(N'2019-02-15' AS Date), N'Nam', N'0906971622  ', N'abc@gmail.com                                     ', NULL, CAST(N'2019-06-07T23:06:54.087' AS DateTime), 1, 19)
INSERT [dbo].[user] ([ID], [FirstName], [LastName], [Birth], [Gender], [Phone], [Email], [Address], [CreateDay], [CreateBy], [accountID]) VALUES (17, N'Nguyen', N'Tan', CAST(N'2019-02-15' AS Date), N'Nam', N'0906971622  ', N'abc@gmail.com                                     ', NULL, CAST(N'2019-06-08T07:44:03.703' AS DateTime), 1, 20)
INSERT [dbo].[user] ([ID], [FirstName], [LastName], [Birth], [Gender], [Phone], [Email], [Address], [CreateDay], [CreateBy], [accountID]) VALUES (18, N'Nguyen', N'Tan', CAST(N'2019-02-15' AS Date), N'Nam', N'0906971622  ', N'abc@gmail.com                                     ', NULL, CAST(N'2019-06-08T09:55:42.740' AS DateTime), 1, 21)
SET IDENTITY_INSERT [dbo].[user] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_UN]    Script Date: 7/21/2019 4:23:35 PM ******/
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [UQ_UN] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [AK_AP]    Script Date: 7/21/2019 4:23:35 PM ******/
ALTER TABLE [dbo].[action_permission] ADD  CONSTRAINT [AK_AP] UNIQUE NONCLUSTERED 
(
	[permissionID] ASC,
	[dataactiontableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__data_act__737584F68764DDEE]    Script Date: 7/21/2019 4:23:35 PM ******/
ALTER TABLE [dbo].[data_action] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_DAT]    Script Date: 7/21/2019 4:23:35 PM ******/
ALTER TABLE [dbo].[data_action_table] ADD  CONSTRAINT [AK_DAT] UNIQUE NONCLUSTERED 
(
	[TableName] ASC,
	[dataactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__newstype__737584F60FB2848A]    Script Date: 7/21/2019 4:23:35 PM ******/
ALTER TABLE [dbo].[newstype] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__permissi__737584F61B13360A]    Script Date: 7/21/2019 4:23:35 PM ******/
ALTER TABLE [dbo].[permission] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account]  WITH NOCHECK ADD FOREIGN KEY([permissionID])
REFERENCES [dbo].[permission] ([ID])
GO
ALTER TABLE [dbo].[action_permission]  WITH CHECK ADD FOREIGN KEY([dataactiontableID])
REFERENCES [dbo].[data_action_table] ([ID])
GO
ALTER TABLE [dbo].[action_permission]  WITH CHECK ADD FOREIGN KEY([permissionID])
REFERENCES [dbo].[permission] ([ID])
GO
ALTER TABLE [dbo].[data_action_table]  WITH CHECK ADD FOREIGN KEY([dataactionID])
REFERENCES [dbo].[data_action] ([ID])
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD  CONSTRAINT [FK__news__CreateBy__5165187F] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[news] CHECK CONSTRAINT [FK__news__CreateBy__5165187F]
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD FOREIGN KEY([NewstyleID])
REFERENCES [dbo].[newstype] ([ID])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK__user__accountID__4E88ABD4] FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([ID])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK__user__accountID__4E88ABD4]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK__user__CreateBy__4D94879B] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK__user__CreateBy__4D94879B]
GO
USE [master]
GO
ALTER DATABASE [UyBan] SET  READ_WRITE 
GO
