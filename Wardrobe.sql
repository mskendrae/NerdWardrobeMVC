USE [master]
GO
/****** Object:  Database [NerdWardrobe]    Script Date: 10/21/2016 10:10:04 AM ******/
CREATE DATABASE [NerdWardrobe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NerdWardrobe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\NerdWardrobe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NerdWardrobe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\NerdWardrobe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NerdWardrobe] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NerdWardrobe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NerdWardrobe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NerdWardrobe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NerdWardrobe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NerdWardrobe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NerdWardrobe] SET ARITHABORT OFF 
GO
ALTER DATABASE [NerdWardrobe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NerdWardrobe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NerdWardrobe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NerdWardrobe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NerdWardrobe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NerdWardrobe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NerdWardrobe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NerdWardrobe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NerdWardrobe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NerdWardrobe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NerdWardrobe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NerdWardrobe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NerdWardrobe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NerdWardrobe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NerdWardrobe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NerdWardrobe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NerdWardrobe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NerdWardrobe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NerdWardrobe] SET  MULTI_USER 
GO
ALTER DATABASE [NerdWardrobe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NerdWardrobe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NerdWardrobe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NerdWardrobe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NerdWardrobe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NerdWardrobe] SET QUERY_STORE = OFF
GO
USE [NerdWardrobe]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NerdWardrobe]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 10/21/2016 10:10:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[AccessoriesID] [int] IDENTITY(1,1) NOT NULL,
	[AccessName] [nvarchar](50) NOT NULL,
	[AccessType] [nvarchar](50) NOT NULL,
	[AccessColor] [nvarchar](50) NULL,
	[AccessPhoto] [nchar](150) NULL,
	[OccassionID] [int] NULL,
	[SeasonID] [int] NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[AccessoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occassion]    Script Date: 10/21/2016 10:10:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occassion](
	[OccassionID] [int] IDENTITY(1,1) NOT NULL,
	[OccassionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Occassion] PRIMARY KEY CLUSTERED 
(
	[OccassionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outfile]    Script Date: 10/21/2016 10:10:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outfile](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[ShirtID] [int] NULL,
	[PantsId] [int] NULL,
	[AccessoriesID] [int] NULL,
	[ShoesID] [int] NULL,
 CONSTRAINT [PK_Outfile] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pants]    Script Date: 10/21/2016 10:10:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pants](
	[PantsId] [int] IDENTITY(1,1) NOT NULL,
	[PantsName] [nvarchar](50) NOT NULL,
	[PantsType] [nvarchar](50) NOT NULL,
	[PantsColor] [nvarchar](50) NOT NULL,
	[PantsPhoto] [nvarchar](150) NULL,
	[OccassionID] [int] NULL,
	[SeasonID] [int] NULL,
 CONSTRAINT [PK_Pants] PRIMARY KEY CLUSTERED 
(
	[PantsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Season]    Script Date: 10/21/2016 10:10:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[SeasonName] [nchar](10) NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shirts]    Script Date: 10/21/2016 10:10:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shirts](
	[ShirtID] [int] IDENTITY(1,1) NOT NULL,
	[ShirtName] [nvarchar](100) NOT NULL,
	[ShirtType] [nvarchar](50) NOT NULL,
	[ShirtColor] [nvarchar](50) NOT NULL,
	[ShirtPhoto] [nvarchar](150) NULL,
	[OccassionID] [int] NULL,
	[SeasonID] [int] NULL,
 CONSTRAINT [PK_Shirts] PRIMARY KEY CLUSTERED 
(
	[ShirtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoes]    Script Date: 10/21/2016 10:10:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoes](
	[ShoesID] [int] IDENTITY(1,1) NOT NULL,
	[ShoeName] [nvarchar](50) NOT NULL,
	[ShoeType] [nvarchar](50) NOT NULL,
	[ShoeColor] [nvarchar](50) NOT NULL,
	[ShoePhoto] [nvarchar](150) NULL,
	[OccassionID] [int] NULL,
	[SeasonID] [int] NULL,
 CONSTRAINT [PK_Shoes] PRIMARY KEY CLUSTERED 
(
	[ShoesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accessories] ON 

INSERT [dbo].[Accessories] ([AccessoriesID], [AccessName], [AccessType], [AccessColor], [AccessPhoto], [OccassionID], [SeasonID]) VALUES (1, N'Dark Side Lanyard', N'Lanyard', N'Black', N'~/images/darksidelan.jpeg                                                                                                                             ', 2, 2)
INSERT [dbo].[Accessories] ([AccessoriesID], [AccessName], [AccessType], [AccessColor], [AccessPhoto], [OccassionID], [SeasonID]) VALUES (3, N'Rebel Dog Tags', N'Necklace', N'Silver', N'~/images/dog-tag.jpg                                                                                                                                  ', 2, 3)
INSERT [dbo].[Accessories] ([AccessoriesID], [AccessName], [AccessType], [AccessColor], [AccessPhoto], [OccassionID], [SeasonID]) VALUES (4, N'First Order Dog Tags', N'Dog Tags', N'Silver', N'~/images/FO_DogTags.jpeg                                                                                                                              ', 2, 2)
SET IDENTITY_INSERT [dbo].[Accessories] OFF
SET IDENTITY_INSERT [dbo].[Occassion] ON 

INSERT [dbo].[Occassion] ([OccassionID], [OccassionName]) VALUES (1, N'Convention Attire')
INSERT [dbo].[Occassion] ([OccassionID], [OccassionName]) VALUES (2, N'Everyday Nerd')
INSERT [dbo].[Occassion] ([OccassionID], [OccassionName]) VALUES (3, N'Formal Nerd')
SET IDENTITY_INSERT [dbo].[Occassion] OFF
SET IDENTITY_INSERT [dbo].[Pants] ON 

INSERT [dbo].[Pants] ([PantsId], [PantsName], [PantsType], [PantsColor], [PantsPhoto], [OccassionID], [SeasonID]) VALUES (1, N'Star Skirt', N'Skirt', N'Blue', N'~/images/starskirt.gif', 1, 2)
INSERT [dbo].[Pants] ([PantsId], [PantsName], [PantsType], [PantsColor], [PantsPhoto], [OccassionID], [SeasonID]) VALUES (2, N'Star Wars Leggings', N'Leggings', N'Tan', N'~/images/SW_legging.jpg', 2, 1)
INSERT [dbo].[Pants] ([PantsId], [PantsName], [PantsType], [PantsColor], [PantsPhoto], [OccassionID], [SeasonID]) VALUES (3, N'Trooper Leggings', N'Leggings', N'White', N'~/images/TrooperLeggings.jpg', 2, 2)
INSERT [dbo].[Pants] ([PantsId], [PantsName], [PantsType], [PantsColor], [PantsPhoto], [OccassionID], [SeasonID]) VALUES (4, N'Jeans', N'Jeans', N'Black', N'~/images/jeans2.jpg', 2, 3)
SET IDENTITY_INSERT [dbo].[Pants] OFF
SET IDENTITY_INSERT [dbo].[Season] ON 

INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (1, N'Fall      ')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (2, N'Summer    ')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (3, N'Winter    ')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (4, N'Spring    ')
SET IDENTITY_INSERT [dbo].[Season] OFF
SET IDENTITY_INSERT [dbo].[Shirts] ON 

INSERT [dbo].[Shirts] ([ShirtID], [ShirtName], [ShirtType], [ShirtColor], [ShirtPhoto], [OccassionID], [SeasonID]) VALUES (1, N'FireFly Shiny', N'T-shirt', N'Tan', N'~/images/shiny.jpg', 2, 1)
INSERT [dbo].[Shirts] ([ShirtID], [ShirtName], [ShirtType], [ShirtColor], [ShirtPhoto], [OccassionID], [SeasonID]) VALUES (2, N'Sci Fi Series Ships', N'T-shirt', N'Black', N'~/images/ships.jpg', 2, 2)
INSERT [dbo].[Shirts] ([ShirtID], [ShirtName], [ShirtType], [ShirtColor], [ShirtPhoto], [OccassionID], [SeasonID]) VALUES (3, N'Star Wars Shirt', N'T-shirt', N'Black', N'~/images/SW_Shirt2.jpg', 3, 2)
INSERT [dbo].[Shirts] ([ShirtID], [ShirtName], [ShirtType], [ShirtColor], [ShirtPhoto], [OccassionID], [SeasonID]) VALUES (4, N'Toothless Shirt', N'T-shirt', N'Blue', N'~/images/toothless.jpg', 2, 3)
SET IDENTITY_INSERT [dbo].[Shirts] OFF
SET IDENTITY_INSERT [dbo].[Shoes] ON 

INSERT [dbo].[Shoes] ([ShoesID], [ShoeName], [ShoeType], [ShoeColor], [ShoePhoto], [OccassionID], [SeasonID]) VALUES (1, N'Grunge Boots', N'Boots', N'Black', N'~/images/boots.jpeg', 1, 1)
INSERT [dbo].[Shoes] ([ShoesID], [ShoeName], [ShoeType], [ShoeColor], [ShoePhoto], [OccassionID], [SeasonID]) VALUES (2, N'Star Wars Flats', N'Flats', N'Black', N'~/images/flats.jpg', 2, 2)
INSERT [dbo].[Shoes] ([ShoesID], [ShoeName], [ShoeType], [ShoeColor], [ShoePhoto], [OccassionID], [SeasonID]) VALUES (3, N'Bounty Hunter', N'Tennis Shoe', N'Light Colors', N'~/images/bounty-hunter.jpg', 2, 1)
INSERT [dbo].[Shoes] ([ShoesID], [ShoeName], [ShoeType], [ShoeColor], [ShoePhoto], [OccassionID], [SeasonID]) VALUES (4, N'Vans - Laced', N'Tennis Shoe', N'Dark Blue', N'~/images/vans.jpg', 2, 1)
SET IDENTITY_INSERT [dbo].[Shoes] OFF
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Occassion] FOREIGN KEY([OccassionID])
REFERENCES [dbo].[Occassion] ([OccassionID])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Occassion]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Season]
GO
ALTER TABLE [dbo].[Outfile]  WITH CHECK ADD  CONSTRAINT [FK_Outfile_Accessories1] FOREIGN KEY([AccessoriesID])
REFERENCES [dbo].[Accessories] ([AccessoriesID])
GO
ALTER TABLE [dbo].[Outfile] CHECK CONSTRAINT [FK_Outfile_Accessories1]
GO
ALTER TABLE [dbo].[Outfile]  WITH CHECK ADD  CONSTRAINT [FK_Outfile_Pants] FOREIGN KEY([PantsId])
REFERENCES [dbo].[Pants] ([PantsId])
GO
ALTER TABLE [dbo].[Outfile] CHECK CONSTRAINT [FK_Outfile_Pants]
GO
ALTER TABLE [dbo].[Outfile]  WITH CHECK ADD  CONSTRAINT [FK_Outfile_Shirts] FOREIGN KEY([ShirtID])
REFERENCES [dbo].[Shirts] ([ShirtID])
GO
ALTER TABLE [dbo].[Outfile] CHECK CONSTRAINT [FK_Outfile_Shirts]
GO
ALTER TABLE [dbo].[Outfile]  WITH CHECK ADD  CONSTRAINT [FK_Outfile_Shoes] FOREIGN KEY([ShoesID])
REFERENCES [dbo].[Shoes] ([ShoesID])
GO
ALTER TABLE [dbo].[Outfile] CHECK CONSTRAINT [FK_Outfile_Shoes]
GO
ALTER TABLE [dbo].[Pants]  WITH CHECK ADD  CONSTRAINT [FK_Pants_Occassion] FOREIGN KEY([OccassionID])
REFERENCES [dbo].[Occassion] ([OccassionID])
GO
ALTER TABLE [dbo].[Pants] CHECK CONSTRAINT [FK_Pants_Occassion]
GO
ALTER TABLE [dbo].[Pants]  WITH CHECK ADD  CONSTRAINT [FK_Pants_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Pants] CHECK CONSTRAINT [FK_Pants_Season]
GO
ALTER TABLE [dbo].[Shirts]  WITH CHECK ADD  CONSTRAINT [FK_Shirts_Occassion] FOREIGN KEY([OccassionID])
REFERENCES [dbo].[Occassion] ([OccassionID])
GO
ALTER TABLE [dbo].[Shirts] CHECK CONSTRAINT [FK_Shirts_Occassion]
GO
ALTER TABLE [dbo].[Shirts]  WITH CHECK ADD  CONSTRAINT [FK_Shirts_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Shirts] CHECK CONSTRAINT [FK_Shirts_Season]
GO
ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD  CONSTRAINT [FK_Shoes_Occassion] FOREIGN KEY([OccassionID])
REFERENCES [dbo].[Occassion] ([OccassionID])
GO
ALTER TABLE [dbo].[Shoes] CHECK CONSTRAINT [FK_Shoes_Occassion]
GO
ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD  CONSTRAINT [FK_Shoes_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Shoes] CHECK CONSTRAINT [FK_Shoes_Season]
GO
USE [master]
GO
ALTER DATABASE [NerdWardrobe] SET  READ_WRITE 
GO
