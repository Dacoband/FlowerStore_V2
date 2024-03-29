USE [master]
GO
/****** Object:  Database [flower_shop]    Script Date: 12/5/2023 10:34:22 PM ******/
CREATE DATABASE [flower_shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'flower_shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\flower_shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'flower_shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\flower_shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [flower_shop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [flower_shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [flower_shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [flower_shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [flower_shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [flower_shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [flower_shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [flower_shop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [flower_shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [flower_shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [flower_shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [flower_shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [flower_shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [flower_shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [flower_shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [flower_shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [flower_shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [flower_shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [flower_shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [flower_shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [flower_shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [flower_shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [flower_shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [flower_shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [flower_shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [flower_shop] SET  MULTI_USER 
GO
ALTER DATABASE [flower_shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [flower_shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [flower_shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [flower_shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [flower_shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [flower_shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [flower_shop] SET QUERY_STORE = ON
GO
ALTER DATABASE [flower_shop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [flower_shop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/5/2023 10:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[role] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/5/2023 10:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[phone_number] [varchar](255) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[role] [varchar](255) NOT NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/5/2023 10:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
	[flower_season] [varchar](255) NOT NULL,
	[flower_meaning] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/5/2023 10:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[birth_date] [date] NOT NULL,
	[phone_number] [varchar](255) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[status] [bit] NOT NULL,
	[orders] [varchar](255) NOT NULL,
	[flag] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/5/2023 10:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[feedback_content] [varchar](255) NOT NULL,
	[feedback_date] [date] NOT NULL,
	[rating] [int] NOT NULL,
	[ranking] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flower]    Script Date: 12/5/2023 10:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flower](
	[flower_id] [int] IDENTITY(1,1) NOT NULL,
	[flower_name] [varchar](255) NOT NULL,
	[flower_color] [varchar](255) NOT NULL,
	[flower_price] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[import_date] [date] NOT NULL,
	[category_id] [int] NOT NULL,
	[image] [varchar](255) NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[flower_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 12/5/2023 10:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[flower_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[flower_unit_price] [int] NOT NULL,
	[total_price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/5/2023 10:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NOT NULL,
	[delivery_date] [date] NOT NULL,
	[status] [bit] NOT NULL,
	[shipping_cost] [int] NOT NULL,
	[total_value] [int] NOT NULL,
	[payment_method] [varchar](255) NOT NULL,
	[delivery_address] [varchar](255) NOT NULL,
	[customer_id] [int] NOT NULL,
	[flower_id] [int] NOT NULL,
	[flower_total_price] [int] NOT NULL,
	[shipping_total_price] [int] NOT NULL,
	[total_payment] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 12/5/2023 10:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[email] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[birth_date] [date] NOT NULL,
	[phone_number] [varchar](255) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [flag]
GO
ALTER TABLE [dbo].[Flower] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Flower] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Shipper] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [fk_Admin_Account] FOREIGN KEY([email])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [fk_Admin_Account]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [fk_Customer_Account] FOREIGN KEY([email])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [fk_Customer_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [fk_Feedback_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [fk_Feedback_Order]
GO
ALTER TABLE [dbo].[Flower]  WITH CHECK ADD  CONSTRAINT [fk_Flower_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Flower] CHECK CONSTRAINT [fk_Flower_Category]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [fk_OrderDetail_Flower] FOREIGN KEY([flower_id])
REFERENCES [dbo].[Flower] ([flower_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [fk_OrderDetail_Flower]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [fk_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [fk_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_Order_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_Order_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_Order_Flower] FOREIGN KEY([flower_id])
REFERENCES [dbo].[Flower] ([flower_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_Order_Flower]
GO
ALTER TABLE [dbo].[Shipper]  WITH CHECK ADD  CONSTRAINT [fk_Shipper_Account] FOREIGN KEY([email])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Shipper] CHECK CONSTRAINT [fk_Shipper_Account]
GO
USE [master]
GO
ALTER DATABASE [flower_shop] SET  READ_WRITE 
GO
