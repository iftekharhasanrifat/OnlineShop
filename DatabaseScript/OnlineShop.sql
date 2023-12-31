USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 11/24/2023 1:04:23 AM ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShop', N'ON'
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNo] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[ProductColor] [nvarchar](max) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[SpecialTagId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialTags]    Script Date: 11/24/2023 1:04:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialTags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SpecialTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.23')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231031132146_addProductTypeTable', N'6.0.23')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231031164115_addSpecialTagTable', N'6.0.23')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231031164839_updateSpecialTagTable', N'6.0.23')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231031194221_addProductTable', N'6.0.23')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231114170939_addOrderAndOrderDetailsTable', N'6.0.23')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231114171104_addOrderAndOrderDetailTable', N'6.0.23')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231121083840_addColumnToUseertable', N'6.0.23')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4a502ee1-443a-44dc-89f6-338a69468a53', N'User', N'USER', N'3bdbb869-f7ec-4a77-8de1-66da02137ccc')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9c9ec7f4-8e9c-45c5-8feb-701e024abc37', N'superadmin', N'SUPERADMIN', N'cd19fe48-edba-4b7f-a942-3b7566c7e333')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'eb45afb8-d7bd-4b88-9009-fe2c5fa9c401', N'admin', N'ADMIN', N'd3144162-267e-47d2-aab9-7c140e6fe7e2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'94382d26-b32e-4579-a790-b30d38dd8905', N'4a502ee1-443a-44dc-89f6-338a69468a53')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ea9d7da6-134b-4c22-bce4-71e958a64de4', N'4a502ee1-443a-44dc-89f6-338a69468a53')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eb442b4e-354d-43ae-a71f-c46fc42d7ea1', N'4a502ee1-443a-44dc-89f6-338a69468a53')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f74b63ec-19b7-4425-bb74-abf4fd956406', N'4a502ee1-443a-44dc-89f6-338a69468a53')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a9b1142c-0908-42cb-b972-81ddcd8ba6cc', N'9c9ec7f4-8e9c-45c5-8feb-701e024abc37')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a9b1142c-0908-42cb-b972-81ddcd8ba6cc', N'eb45afb8-d7bd-4b88-9009-fe2c5fa9c401')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ea9d7da6-134b-4c22-bce4-71e958a64de4', N'eb45afb8-d7bd-4b88-9009-fe2c5fa9c401')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName]) VALUES (N'94382d26-b32e-4579-a790-b30d38dd8905', N'risat@gmail.com', N'RISAT@GMAIL.COM', N'risat@gmail.com', N'RISAT@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAECDDFLPgmpOKlRnxxhZ6yAMQn2PnchELY4uFPyekPBp5/RM0TkBVZSsT/Fxxa+9CIw==', N'J5QY6HYX5FMXCIETLLVFUONYVIFAO2P5', N'd1ad59b2-1f03-4c41-ab1e-e3f56241d29c', NULL, 0, 0, NULL, 1, 0, N'ApplicatonUser', N'Abu', N'Taher')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName]) VALUES (N'a9b1142c-0908-42cb-b972-81ddcd8ba6cc', N'iftekharhasanrifat@gmail.com', N'IFTEKHARHASANRIFAT@GMAIL.COM', N'iftekharhasanrifat@gmail.com', N'IFTEKHARHASANRIFAT@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEGlFUfKdI6j+O0APeMoNSMrY6JO7DuN4zPwRHodNeDmq+KocBqOxC/hlyuxmGvkYzg==', N'ZJ4V53EZIBWZA5GQPEFDB3GXPLWI4DLO', N'e0afe6d6-d874-44d9-bd13-6ef6168f2485', NULL, 0, 0, CAST(N'2023-11-22T21:30:40.2811006+06:00' AS DateTimeOffset), 1, 0, N'ApplicatonUser', N'Iftekhar', N'Hasan')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName]) VALUES (N'ea9d7da6-134b-4c22-bce4-71e958a64de4', N'iftekharhasanrifat2@gmail.com', N'IFTEKHARHASANRIFAT2@GMAIL.COM', N'iftekharhasanrifat2@gmail.com', N'IFTEKHARHASANRIFAT2@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEEVwUUVCTgcnmoO36kCBCinmDNz59QP9efpU1VrzfCYzhFx/YLWOCszZdnRhu49zQw==', N'HCKOMYZEEW2XZCUC5SPGATLDBHIPDGZS', N'f8de69e3-0fba-4077-80b7-1e9f42c05e5f', NULL, 0, 0, NULL, 1, 0, N'ApplicatonUser', N'Iftekhar', N'Taher')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName]) VALUES (N'eb442b4e-354d-43ae-a71f-c46fc42d7ea1', N'iftekharhasanrifat4@gmail.com', N'IFTEKHARHASANRIFAT4@GMAIL.COM', N'iftekharhasanrifat4@gmail.com', N'IFTEKHARHASANRIFAT4@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEGMa1SLYxyV52eUnx638HfTfvD1QrMIlOvXd0D5A69cTELBLm0MQJFJ6xGHMsr5TCw==', N'AFBAR6HX5L5WSSP3RL2EUVGQJS62OFBO', N'af28510f-bf6b-438c-a487-c0b474e542fe', NULL, 0, 0, NULL, 1, 0, N'ApplicatonUser', N'Iftekhar', N'Hasan Rifat')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName]) VALUES (N'f74b63ec-19b7-4425-bb74-abf4fd956406', N'iftekharhasanrifat3@gmail.com', N'IFTEKHARHASANRIFAT3@GMAIL.COM', N'iftekharhasanrifat3@gmail.com', N'IFTEKHARHASANRIFAT3@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEMrWtlLoGUcuLarMCUfSLAqa6IZpqcsQftCCNhk0rBqTZUWgGMZk5pgtoNACcv828w==', N'MJWG6R2B3GYKSY2JNEM2WKBOBYR4C4WK', N'2dee76a9-821c-45cf-a398-10b113944f2a', NULL, 0, 0, NULL, 1, 0, N'ApplicatonUser', N'Abu', N'Rifat')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId]) VALUES (1, 1, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId]) VALUES (2, 1, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId]) VALUES (1002, 1002, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId]) VALUES (1003, 1002, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId]) VALUES (1004, 1003, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId]) VALUES (1005, 1003, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId]) VALUES (1006, 1003, 10)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (1, N'001', N'Rifat', N'01812794985', N'iftekharhasanrifat@gmail.com', N'Mogoltooly, Commerce College road, Agrabad, Chattogram.', CAST(N'2023-11-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (2, N'002', N'Rifat', N'01812794985', N'iftekharhasanrifat@gmail.com', N'Mogoltooly, Commerce College road, Agrabad, Chattogram.', CAST(N'2023-11-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (3, N'003', N'Rifat', N'01812794985', N'iftekharhasanrifat@gmail.com', N'Mogoltooly, Commerce College road, Agrabad, Chattogram.', CAST(N'2023-11-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (4, N'004', N'Rifat', N'01812794985', N'iftekharhasanrifat@gmail.com', N'Mogoltooly, Commerce College road, Agrabad, Chattogram.', CAST(N'2023-11-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (5, N'005', N'Rifat', N'01812794985', N'iftekharhasanrifat@gmail.com', N'Mogoltooly, Commerce College road, Agrabad, Chattogram.', CAST(N'2023-11-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (6, N'006', N'Rifat', N'01812794985', N'iftekharhasanrifat@gmail.com', N'Mogoltooly, Commerce College road, Agrabad, Chattogram.', CAST(N'2023-11-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (1002, N'007', N'asas', N'01812794985', N'iftekharhasanrifat@gmail.com', N'Mogoltooly, Commerce College road, Agrabad, Chattogram.', CAST(N'2023-11-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (1003, N'008', N'asas', N'01812794985', N'iftekharhasanrifat@gmail.com', N'Mogoltooly, Commerce College road, Agrabad, Chattogram.', CAST(N'2023-11-24T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (5, N'Apple Laptop 601', CAST(40000.00 AS Decimal(18, 2)), N'Images/Apple.jpg', N'White', 1, 9, 5)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (9, N'Iphone 15 pro', CAST(150000.00 AS Decimal(18, 2)), N'Images/Iphone 15 pro.png', N'white', 1, 6, 8)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (10, N'Iphone 14 pro', CAST(40000.00 AS Decimal(18, 2)), N'Images/Iphone 14 pro.webp', N'white', 1, 6, 8)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (11, N'Iphone 7', CAST(35000.00 AS Decimal(18, 2)), N'Images/Untitled-design-3-2.jpg', N'white', 1, 6, 8)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (12, N'Dell Latitude', CAST(25000.00 AS Decimal(18, 2)), N'Images/Dell Latitude.webp', N'white', 1, 31, 9)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (13, N'Dell Latitude e1', CAST(35000.00 AS Decimal(18, 2)), N'Images/latitudee1.jpg', N'white', 1, 31, 9)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (14, N'Dell Latitude e64', CAST(40000.00 AS Decimal(18, 2)), N'Images/e64.webp', N'Black', 1, 31, 9)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (15, N'Hp Elitebook 840', CAST(27000.00 AS Decimal(18, 2)), N'Images/HP-EliteBook-840-G5-Price-in-Bangladesh.webp', N'White', 1, 31, 9)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (16, N'Iphone 12', CAST(100000.00 AS Decimal(18, 2)), N'Images/iPhone-12-Hero.png', N'Black', 1, 6, 8)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (17, N'iphone 11 pro max', CAST(70000.00 AS Decimal(18, 2)), N'Images/CherryRed_443d2569-a0c8-4495-b1a4-65aca3bde2b9.webp', N'red', 1, 6, 8)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (18, N'hp elitebook 8470p', CAST(40000.00 AS Decimal(18, 2)), N'Images/giant_61205.jpg', N'white', 1, 31, 9)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Image], [ProductColor], [IsAvailable], [ProductTypeId], [SpecialTagId]) VALUES (19, N'Oneplus 7 pro', CAST(52000.00 AS Decimal(18, 2)), N'Images/NoImage.jpg', N'White', 0, 6, 11)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([Id], [ProductType]) VALUES (6, N'Mobile')
INSERT [dbo].[ProductTypes] ([Id], [ProductType]) VALUES (9, N'Computer')
INSERT [dbo].[ProductTypes] ([Id], [ProductType]) VALUES (29, N'Remote')
INSERT [dbo].[ProductTypes] ([Id], [ProductType]) VALUES (30, N'TV')
INSERT [dbo].[ProductTypes] ([Id], [ProductType]) VALUES (31, N'Laptop')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[SpecialTags] ON 

INSERT [dbo].[SpecialTags] ([Id], [Name]) VALUES (5, N'Apple Laptop')
INSERT [dbo].[SpecialTags] ([Id], [Name]) VALUES (6, N'Samsung Laptop')
INSERT [dbo].[SpecialTags] ([Id], [Name]) VALUES (8, N'IOS')
INSERT [dbo].[SpecialTags] ([Id], [Name]) VALUES (9, N'Laptop')
INSERT [dbo].[SpecialTags] ([Id], [Name]) VALUES (10, N'Mobile')
INSERT [dbo].[SpecialTags] ([Id], [Name]) VALUES (11, N'Android')
SET IDENTITY_INSERT [dbo].[SpecialTags] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_ProductId]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductId] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductTypeId]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductTypeId] ON [dbo].[Products]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_SpecialTagId]    Script Date: 11/24/2023 1:04:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_SpecialTagId] ON [dbo].[Products]
(
	[SpecialTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes_ProductTypeId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SpecialTags_SpecialTagId] FOREIGN KEY([SpecialTagId])
REFERENCES [dbo].[SpecialTags] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SpecialTags_SpecialTagId]
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
