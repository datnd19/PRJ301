﻿USE [master]
GO
/****** Object:  Database [Ecommerce]    Script Date: 10-Nov-23 2:48:39 PM ******/
CREATE DATABASE [Ecommerce]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ecommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [Ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ecommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ecommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ecommerce] SET QUERY_STORE = OFF
GO
USE [Ecommerce]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[user_id] [int] NULL,
	[product_color_id] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[description] [nvarchar](250) NULL,
	[create_at] [date] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[total_money] [float] NULL,
	[name] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
	[message] [nvarchar](250) NULL,
	[create_at] [date] NULL,
	[status_id] [int] NULL,
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_color_id] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[description] [nvarchar](250) NULL,
	[category_id] [int] NULL,
	[create_at] [date] NULL,
	[star] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[product_color_id] [int] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](250) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](250) NULL,
	[image] [nvarchar](250) NULL,
	[product_id] [int] NULL,
	[create_at] [date] NULL,
	[sold_quantity] [int] NULL,
 CONSTRAINT [PK_product_color] PRIMARY KEY CLUSTERED 
(
	[product_color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](250) NULL,
	[user_id] [int] NULL,
	[product_color_id] [int] NULL,
	[image] [nvarchar](250) NULL,
	[star] [int] NULL,
	[create_at] [date] NULL,
 CONSTRAINT [PK_review] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping](
	[shipping_id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](250) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_shipping] PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](250) NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 10-Nov-23 2:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](250) NULL,
	[password] [nvarchar](250) NULL,
	[username] [nvarchar](250) NULL,
	[fullname] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[avatar] [nvarchar](250) NULL,
	[role] [int] NULL,
	[create_at] [date] NULL,
	[phone] [nvarchar](250) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cart] ([user_id], [product_color_id], [quantity]) VALUES (22, 13, 3)
INSERT [dbo].[cart] ([user_id], [product_color_id], [quantity]) VALUES (4, 9, 1)
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [name], [description], [create_at]) VALUES (1, N'Iphone', N'Expensive Luxury', CAST(N'2023-10-06' AS Date))
INSERT [dbo].[category] ([category_id], [name], [description], [create_at]) VALUES (2, N'Samsung', N'Amazing, one of the best brand in the world', CAST(N'2023-10-08' AS Date))
INSERT [dbo].[category] ([category_id], [name], [description], [create_at]) VALUES (8, N'Xiaomi', N'Cheap and suitable for student', CAST(N'2023-10-08' AS Date))
INSERT [dbo].[category] ([category_id], [name], [description], [create_at]) VALUES (9, N'Oppo', N'Good camera', CAST(N'2023-10-08' AS Date))
INSERT [dbo].[category] ([category_id], [name], [description], [create_at]) VALUES (10, N'Vivo', N'Good battery and High performance', CAST(N'2023-10-08' AS Date))
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (54, 3, 704, N'dat nguyen', N'124 ,Phuong Phu Lam,Quan Ha Dong,Thanh pho Ha Noi', N'0397917086', N'ship on sunday', CAST(N'2023-10-30' AS Date), 5, 3)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (55, 3, 1753, N'dat nguyen', N'124,Phuong Phu Lam,Quan Ha Dong,Thanh pho Ha Noi', N'0397917086', N'ship on sunday', CAST(N'2023-10-30' AS Date), 4, 2)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (56, 8, 3504.5, N'duc anh', N'hoa lac,Xa Dai Dong,Huyen Trang Dinh,Tinh Lang Son', N'1234512312', N'123', CAST(N'2023-10-30' AS Date), 4, 3)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (57, 3, 1702, N'dat nguyen', N'hoa lac,Phuong Phu Lam,Quan Ha Dong,Thanh pho Ha Noi', N'0397917086', N'123', CAST(N'2023-10-30' AS Date), 4, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (58, 3, 1504, N'dat nguyen', N'hoa lac,Xa Hong Thai,Huyen Van Lang,Tinh Lang Son', N'0397917086', N'123', CAST(N'2023-10-30' AS Date), 5, 3)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (59, 3, 504, N'dat nguyen', N'hoa lac,Phuong Minh Nong,Thanh pho Viet Tri,Tinh Phu Tho', N'0397917086', N'csa', CAST(N'2023-10-31' AS Date), 5, 3)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (60, 3, 1702, N'dat nguyen', N'hoa lac,Xa My Phuong,Huyen Ba Be,Tinh Bac Kan', N'0397917086', N'', CAST(N'2023-11-02' AS Date), 3, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (61, 3, 1052, N'dat nguyen', N'hoa lac,Xa Lung Ho,Huyen Yen Minh,Tinh Ha Giang', N'0397917086', N'', CAST(N'2023-11-02' AS Date), 2, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (62, 3, 1502, N'dat nguyen', N'hoa lac,Xa Ngo Xa,Huyen Cam Khe,Tinh Phu Tho', N'0397917086', N'', CAST(N'2023-11-02' AS Date), 1, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (63, 3, 502, N'dat nguyen', N'hoa lac,Xa Giap Son,Huyen Luc Ngan,Tinh Bac Giang', N'0397917086', N'', CAST(N'2023-11-02' AS Date), 4, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (64, 3, 602, N'dat nguyen', N'hoa lac,Xa Tung Vai,Huyen Quan Ba,Tinh Ha Giang', N'0397917086', N'', CAST(N'2023-11-06' AS Date), 4, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (65, 4, 1052, N'dat nguyen', N'hoa lac,Phuong Lao Cai,Thanh pho Lao Cai,Tinh Lao Cai', N'0926942710', N'', CAST(N'2023-11-08' AS Date), 1, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (66, 4, 1502, N'dat nguyen', N'hoa lac,Xa Nguyet Duc,Huyen Thuan Thanh,Tinh Bac Ninh', N'0926942710', N'', CAST(N'2023-11-08' AS Date), 1, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (67, 3, 702, N'dat nguyen', N'hoa lac,Thi tran Dong Van,Huyen Dong Van,Tinh Ha Giang', N'0397917086', N'', CAST(N'2023-11-08' AS Date), 1, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (68, 3, 702, N'dat nguyen', N'hoa lac,Thi tran Dong Van,Huyen Dong Van,Tinh Ha Giang', N'0397917086', N'', CAST(N'2023-11-08' AS Date), 5, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (69, 4, 1002, N'dat nguyen', N'hoa lac,Phuong Tran Phu,Thanh pho Ha Giang,Tinh Ha Giang', N'0926942710', N'', CAST(N'2023-11-08' AS Date), 4, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (70, 4, 1002, N'dat nguyen', N'hoa lac,Xa An Thuong,Huyen Yen The,Tinh Bac Giang', N'0926942710', N'12', CAST(N'2023-11-08' AS Date), 1, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (71, 3, 1652, N'dat nguyen', N'hoa lac,Xa Son Vi,Huyen Lam Thao,Tinh Phu Tho', N'0397917086', N'312', CAST(N'2023-11-08' AS Date), 4, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (72, 3, 952, N'dat nguyen', N'hoa lac,Xa Khau Vai,Huyen Meo Vac,Tinh Ha Giang', N'0397917086', N'123', CAST(N'2023-11-08' AS Date), 4, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (73, 3, 1002, N'dat nguyen', N'hoa lac,Xa Diem Mac,Huyen Dinh Hoa,Tinh Thai Nguyen', N'0397917086', N'123', CAST(N'2023-11-10' AS Date), 4, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (74, 3, 1504, N'dat nguyen', N'hoa lac,Xa Van Chai,Huyen Dong Van,Tinh Ha Giang', N'0397917086', N'', CAST(N'2023-11-10' AS Date), 1, 3)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (75, 3, 502, N'dat nguyen', N'hoa lac,Xa Hoang Kim,Huyen Me Linh,Thanh pho Ha Noi', N'0397917086', N'', CAST(N'2023-11-10' AS Date), 1, 1)
INSERT [dbo].[order] ([order_id], [user_id], [total_money], [name], [address], [phone], [message], [create_at], [status_id], [shipping_id]) VALUES (76, 3, 1002, N'dat nguyen', N'hoa lac,Thi tran Dong Van,Huyen Dong Van,Tinh Ha Giang', N'0397917086', N'', CAST(N'2023-11-10' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (41, 54, 9, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (42, 55, 9, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (43, 55, 13, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (44, 56, 5, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (45, 56, 1, 2)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (46, 57, 9, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (47, 57, 1, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (48, 58, 2, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (49, 59, 10, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (50, 60, 9, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (51, 60, 1, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (52, 61, 13, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (53, 62, 2, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (54, 63, 10, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (55, 64, 12, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (56, 65, 13, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (57, 66, 2, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (58, 67, 9, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (59, 69, 1, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (60, 70, 1, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (61, 71, 13, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (62, 71, 12, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (63, 72, 10, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (64, 72, 18, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (65, 73, 10, 2)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (66, 74, 2, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (67, 75, 10, 1)
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [product_color_id], [quantity]) VALUES (68, 76, 1, 1)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (1, N'Iphone 11', N'Good battery, nice design', 1, CAST(N'2023-10-27' AS Date), 5)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (2, N'Samsung z-flip5 ', N'Good', 2, CAST(N'2023-10-26' AS Date), 5)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (6, N'Iphone13', N'', 1, CAST(N'2023-10-15' AS Date), 0)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (7, N'Iphone14', N'good', 1, CAST(N'2023-10-16' AS Date), 5)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (8, N'iphone15', N'', 1, CAST(N'2023-10-15' AS Date), 0)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (9, N'samsung s23 ultra', N'so good', 2, CAST(N'2023-10-16' AS Date), 0)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (14, N'Xiaomi 12 5G', N'Amazing with their price', 8, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (15, N'Xiaomi 13T Pro 5G ', N'Very good', 8, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (16, N'OPPO Reno10 Pro+', N'Good', 9, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (17, N'OPPO Find X5', N'Good', 9, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (18, N'vivo V25 5G', N'Good', 10, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product] ([product_id], [name], [description], [category_id], [create_at], [star]) VALUES (19, N'vivo V27e', N'Good', 10, CAST(N'2023-10-26' AS Date), 0)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_color] ON 

INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (1, N'red', 11, 1000, N'Good', N'iphone14red.jpg', 7, CAST(N'2023-10-09' AS Date), 7)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (2, N'skyblue', 24, 1500, N'Good', N'samsungs23ultraxanhskyblue.jpg', 9, CAST(N'2023-10-10' AS Date), 3)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (4, N'purple', 27, 1100, N'good', N'iphone14purple1.jpg', 7, CAST(N'2023-10-10' AS Date), 0)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (5, N'xanh lime', 26, 1500.5, N'Good', N'samsungs23ultraxanhlime.jpg', 9, CAST(N'2023-10-10' AS Date), 1)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (9, N'green', 24, 700, N'good', N'iphone11green.png', 1, CAST(N'2023-10-16' AS Date), 4)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (10, N'purple', 25, 500, N'Good', N'xiaomi125gpurple.jpg', 14, CAST(N'2023-10-26' AS Date), 5)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (11, N'gray', 30, 500, N'Good', N'xiaomi125ggray.jpg', 14, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (12, N'green', 28, 600, N'Good', N'xiaomi13tpro5ggreen.jpg', 15, CAST(N'2023-10-26' AS Date), 2)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (13, N'gray', 26, 1050, N'Good', N'samsungzflip5gray.jpg', 2, CAST(N'2023-10-26' AS Date), 4)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (14, N'green', 30, 1000, N'good', N'samsungzflip5green.jpg', 2, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (15, N'gray', 30, 850, N'Good', N'opporeno10+grey.jpg', 16, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (16, N'purple', 30, 850, N'Good', N'opporeno10pro+5gpurple.jpg', 16, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (17, N'white', 30, 450, N'good', N'OppoFindX5Pro5Gwhite.jpg', 17, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (18, N'green', 29, 450, N'Good', N'vivov25pro5ggreen.jpg', 18, CAST(N'2023-10-26' AS Date), 1)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (19, N'black', 30, 450, N'good', N'vivov25pro5gblack.jpg', 18, CAST(N'2023-10-26' AS Date), 0)
INSERT [dbo].[product_color] ([product_color_id], [color], [quantity], [price], [description], [image], [product_id], [create_at], [sold_quantity]) VALUES (20, N'purple', 30, 500, N'Good', N'vivov27epurple.jpg', 19, CAST(N'2023-10-26' AS Date), 0)
SET IDENTITY_INSERT [dbo].[product_color] OFF
GO
SET IDENTITY_INSERT [dbo].[review] ON 

INSERT [dbo].[review] ([review_id], [description], [user_id], [product_color_id], [image], [star], [create_at]) VALUES (31, N'good', 3, 9, N'iphone11green.png', 5, CAST(N'2023-10-30' AS Date))
INSERT [dbo].[review] ([review_id], [description], [user_id], [product_color_id], [image], [star], [create_at]) VALUES (32, N'good', 3, 13, N'samsungzflip5gray.jpg', 5, CAST(N'2023-10-30' AS Date))
INSERT [dbo].[review] ([review_id], [description], [user_id], [product_color_id], [image], [star], [create_at]) VALUES (33, N'good', 3, 1, N'iphone11green.png', 5, CAST(N'2023-10-30' AS Date))
SET IDENTITY_INSERT [dbo].[review] OFF
GO
SET IDENTITY_INSERT [dbo].[shipping] ON 

INSERT [dbo].[shipping] ([shipping_id], [type], [price]) VALUES (1, N'Normal (Receive after 5-6 days)', 2)
INSERT [dbo].[shipping] ([shipping_id], [type], [price]) VALUES (2, N'Fast (Receive after 3-4 days)', 3)
INSERT [dbo].[shipping] ([shipping_id], [type], [price]) VALUES (3, N'Express (Receive after 1-2 days)', 4)
SET IDENTITY_INSERT [dbo].[shipping] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([status_id], [description]) VALUES (1, N'Pending')
INSERT [dbo].[status] ([status_id], [description]) VALUES (2, N'Approved')
INSERT [dbo].[status] ([status_id], [description]) VALUES (3, N'Shipping')
INSERT [dbo].[status] ([status_id], [description]) VALUES (4, N'Received')
INSERT [dbo].[status] ([status_id], [description]) VALUES (5, N'Cancel')
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (3, N'datndhe172134@fpt.edu.vn', N'dat123', N'datnd', N'dat nguyen', N'hoa lac', N'admin.png', 0, CAST(N'2023-10-03' AS Date), N'0397917086')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (4, N'nguyendacdat300303@gmail.com', N'dat123', N'dat', N'dat nguyen', N'hoa lac', N'defaultavatar.png', 1, CAST(N'2023-10-03' AS Date), N'0926942710')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (6, N'manhhp@gmail.com', N'manhyeuquynh', N'manhhp', N'minh manh', N'Hai Phong', N'', 1, CAST(N'2023-10-03' AS Date), N'0123456789')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (8, N'ducanh14052003@gmail.com', N'ducanh123', N'ducanh', N'', N'hoa lac', N'defaultavatar.png', 2, CAST(N'2023-10-04' AS Date), N'1234512312')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (10, N'minhduc@gmail.com', N'ductao123', N'ductao', N'', N'ha dong', N'defaultavatar.png', 2, CAST(N'2023-10-04' AS Date), N'0987123425')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (11, N'test2@gmail.com', N'dat123', N'cr7goat', N'', N'Ha Dong', N'defaultavatar.png', 2, CAST(N'2023-10-04' AS Date), N'0123512121')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (12, N'Longphhe172194@fpt.edu.vn', N'long123', N'longngu', N'Huy long', N'Hai Phong', N'defaultavatar.png', 2, CAST(N'2023-10-05' AS Date), N'0912356212')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (13, N'test3@gmail.com', N'123456dat', N'siuu', N'cr7', N'hoa lac', N'', 2, CAST(N'2023-10-05' AS Date), N'1236876123')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (14, N'test6@gmail.com', N'test123', N'test update', N'test', N'hoa lac', N'defaultavatar.png', 2, CAST(N'2023-10-05' AS Date), N'0213462131')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (15, N'12312@mgail.com', N'dat123', N'test123', N'test', N'hoa lac', N'defaultavatar.png', 2, CAST(N'2023-10-06' AS Date), N'0672123411')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (16, N'test23@gmail.com', N'dat123', N'123123', N'dat123456', N'Phú Lãm, Hà Đông', N'defaultavatar.png', 2, CAST(N'2023-10-06' AS Date), N'0978123462')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (18, N'ronaldo@gmail.com', N'ronaldo123', N'ronaldosiuuuu', N'ronaldo', N'portugal', N'', 0, CAST(N'2023-10-24' AS Date), N'1234598760')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (19, N'datndhe172134@fpt.edu.vn21', N'123456d', N'datnd19', N'dat nguyen1', N'hoa lac', N'', 0, CAST(N'2023-10-29' AS Date), N'0397917082')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (20, N'datndhe172134@fpt.edu.vnac', N'123456a', N'rone19', N'dat nguyen', N'hoa lac', N'', 0, CAST(N'2023-10-29' AS Date), N'0926942712')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (21, N'datndhe172134@fpt.edu.vncaxc', N'1234567a', N'ac', N'dat nguyen', N'hoa lac', N'', 1, CAST(N'2023-10-29' AS Date), N'0926942718')
INSERT [dbo].[user] ([user_id], [email], [password], [username], [fullname], [address], [avatar], [role], [create_at], [phone]) VALUES (22, N'datndhe172134@fpt.edu.vn78', N'123456a', N'datndkkk', N'', N'hoa lac', N'defaultavatar.png', 2, CAST(N'2023-10-29' AS Date), N'0397917080')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product_color] FOREIGN KEY([product_color_id])
REFERENCES [dbo].[product_color] ([product_color_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product_color]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_user]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[shipping] ([shipping_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_shipping]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([status_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_status]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_user]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_product_color] FOREIGN KEY([product_color_id])
REFERENCES [dbo].[product_color] ([product_color_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_product_color]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FK_product_color_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FK_product_color_product]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK_review_product_color] FOREIGN KEY([product_color_id])
REFERENCES [dbo].[product_color] ([product_color_id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK_review_product_color]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK_review_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK_review_user]
GO
USE [master]
GO
ALTER DATABASE [Ecommerce] SET  READ_WRITE 
GO
