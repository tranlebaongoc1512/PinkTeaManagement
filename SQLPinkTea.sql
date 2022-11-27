USE [master]
GO
DROP DATABASE [PinkTeaManagement]
GO
CREATE DATABASE [PinkTeaManagement]
GO
USE [PinkTeaManagement]
GO

--Table Roles
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Table Users
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[phoneNumber] [char](10) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Table Order
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[date] [Date] NULL,
	[total] [float] NULL,
	CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO	

--Table Category
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO	

--Table Product
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[image] [nvarchar](50) NULL,
	[categoryID] [nvarchar](50),
	CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO	

--Table OrderDetail
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [nvarchar](50) NOT NULL,
	[orderID] [nvarchar](50) NULL,
	[productID] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO	

--Insert data

INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'US', N'User')
GO

INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [email], [password], [roleID]) VALUES (N'tranlebaongoc', N'Tran Le Bao Ngoc', '0912345678', N'27/7C Yersin', N'tranlebaongoc1512@gmail.com', N'1', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [email], [password], [roleID]) VALUES (N'nguyenngocduy', N'Nguyen Ngoc Duy', '0384294657', N'52 Nguyen Cu Trinh', N'nguyenngocduy@gmail.com', N'1', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [email], [password], [roleID]) VALUES (N'nguyenlebaongan', N'Nguyen Le Bao Ngan', '0923748212', N'21 Man Thien', N'nguyenlebaongan@gmail.com', N'1', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [email], [password], [roleID]) VALUES (N'nguyenthibangchau', N'Nguyen Thi Bang Chau', '0123456789', N'25 Nguyen Xien', N'nguyenthibangchau@gmail.com', N'1', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [email], [password], [roleID]) VALUES (N'phamhuyentran', N'Pham Huyen Tran', '0935647284', N'12/3 Nguyen Van Tang', N'phamhuyentran@gmail.com', N'1', N'US')
GO

INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'MT', N'Milk Tea')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'FT', N'Fruit Tea')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'IB', N'Ice Blended')
GO

INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [image], [categoryID]) VALUES (N'MT01', N'Matcha Milk Tea', 2, 1000 , N'product01.jpg', N'MT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [image], [categoryID]) VALUES (N'MT02', N'Strawberry Milk Tea',2.5, 1000, N'product02.jpg', N'MT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [image], [categoryID]) VALUES (N'FT01', N'Peach Orange Lemongrass Tea', 2, 1000, N'product03.jpg', N'FT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [image], [categoryID]) VALUES (N'FT02', N'Olong Lotus Tea', 2.5, 1000, N'product04.jpg',N'FT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [image], [categoryID]) VALUES (N'IB01', N'Matcha Ice Blended', 2, 1000, N'product05.jpg',N'IB')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [image], [categoryID]) VALUES (N'IB02', N'Chocolate Ice Blended', 2.25, 1000, N'product06.jpg',N'IB')
GO
