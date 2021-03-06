USE [master]
GO
/****** Object:  Database [70-461]    Script Date: 3/1/2021 11:39:46 PM ******/
CREATE DATABASE [70-461]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'70-461', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\70-461.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'70-461_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\70-461_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [70-461] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [70-461].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [70-461] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [70-461] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [70-461] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [70-461] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [70-461] SET ARITHABORT OFF 
GO
ALTER DATABASE [70-461] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [70-461] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [70-461] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [70-461] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [70-461] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [70-461] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [70-461] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [70-461] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [70-461] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [70-461] SET  DISABLE_BROKER 
GO
ALTER DATABASE [70-461] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [70-461] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [70-461] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [70-461] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [70-461] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [70-461] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [70-461] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [70-461] SET RECOVERY FULL 
GO
ALTER DATABASE [70-461] SET  MULTI_USER 
GO
ALTER DATABASE [70-461] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [70-461] SET DB_CHAINING OFF 
GO
ALTER DATABASE [70-461] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [70-461] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [70-461] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [70-461] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'70-461', N'ON'
GO
ALTER DATABASE [70-461] SET QUERY_STORE = OFF
GO
USE [70-461]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [int] NULL,
	[Address_1] [nvarchar](max) NULL,
	[Address_2] [nvarchar](max) NULL,
	[Postal Code] [nvarchar](10) NULL,
	[City] [nvarchar](100) NULL,
	[Landmark] [nvarchar](max) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[product_details] [int] NOT NULL,
	[saved_for_later] [int] NULL,
	[quantity] [int] NULL,
	[time_added] [datetime] NULL,
	[purchased] [nchar](10) NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Cart item] PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Customer_name] [nvarchar](50) NULL,
	[Date Of Birth] [date] NULL,
	[Mobile number] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discount_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[discount] [float] NULL,
	[type] [int] NULL,
	[created] [datetime] NULL,
	[valid] [datetime] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordered_items]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordered_items](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_details] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Ordered_items] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [int] NOT NULL,
	[Address_id] [int] NOT NULL,
	[Discount_id] [int] NOT NULL,
	[order_date] [datetime] NULL,
	[order_total] [int] NULL,
	[shipping_date] [datetime] NULL,
	[Is_delievered] [nvarchar](50) NULL,
	[Is_payment] [nvarchar](50) NULL,
	[order_no] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product details]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product details](
	[product_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[size] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product details] PRIMARY KEY CLUSTERED 
(
	[product_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] NOT NULL,
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](100) NULL,
	[video_url] [nvarchar](100) NULL,
	[price] [int] NULL,
	[product_image] [image] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[tag_id] [int] NOT NULL,
	[product_id] [int] NULL,
	[tag] [nvarchar](100) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Customer] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer] ([Customer_id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Customer]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([Customer_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product details] FOREIGN KEY([product_details])
REFERENCES [dbo].[Product details] ([product_detail_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product details]
GO
ALTER TABLE [dbo].[Ordered_items]  WITH CHECK ADD  CONSTRAINT [FK_Ordered_items_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Ordered_items] CHECK CONSTRAINT [FK_Ordered_items_Orders]
GO
ALTER TABLE [dbo].[Ordered_items]  WITH CHECK ADD  CONSTRAINT [FK_Ordered_items_Product details] FOREIGN KEY([product_details])
REFERENCES [dbo].[Product details] ([product_detail_id])
GO
ALTER TABLE [dbo].[Ordered_items] CHECK CONSTRAINT [FK_Ordered_items_Product details]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Address] FOREIGN KEY([Address_id])
REFERENCES [dbo].[Address] ([Address_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Address]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer] ([Customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Discount] FOREIGN KEY([Discount_id])
REFERENCES [dbo].[Discount] ([discount_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Discount]
GO
ALTER TABLE [dbo].[Product details]  WITH CHECK ADD  CONSTRAINT [FK_Product details_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Product details] CHECK CONSTRAINT [FK_Product details_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_Products]
GO
/****** Object:  StoredProcedure [dbo].[modify_cart]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modify_cart](@user_id int, @product_id int) as
begin
  delete from Cart where (product_id=@product_id and cart_item_id in (select cart_item_id from Customer where Customer_id=@user_id));
end
GO
/****** Object:  StoredProcedure [dbo].[view_cart_itemsv]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[view_cart_itemsv](@user_id int) as  
begin 
	select * from Products where product_id in(
        select product_id from [dbo].[Cart] where (cart_item_id in (
            select cart_item_id from Customer where Customer_id =@user_id
        ))
	)
end 

GO
/****** Object:  StoredProcedure [dbo].[view_history]    Script Date: 3/1/2021 11:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[view_history](@user_id int) as
begin
 select product_id, quantity from [dbo].[Cart]
 where (cart_item_id in (select cart_item_id from Customer where Customer_id=@user_id) and purchased='YES')
end


GO
USE [master]
GO
ALTER DATABASE [70-461] SET  READ_WRITE 
GO
