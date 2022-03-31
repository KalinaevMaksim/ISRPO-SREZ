USE [master]
GO
/****** Object:  Database [SREZ-1]    Script Date: 31.03.2022 12:05:25 ******/
CREATE DATABASE [SREZ-1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SREZ-1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SREZ-1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SREZ-1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SREZ-1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SREZ-1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SREZ-1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SREZ-1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SREZ-1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SREZ-1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SREZ-1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SREZ-1] SET ARITHABORT OFF 
GO
ALTER DATABASE [SREZ-1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SREZ-1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SREZ-1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SREZ-1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SREZ-1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SREZ-1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SREZ-1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SREZ-1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SREZ-1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SREZ-1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SREZ-1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SREZ-1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SREZ-1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SREZ-1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SREZ-1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SREZ-1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SREZ-1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SREZ-1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SREZ-1] SET  MULTI_USER 
GO
ALTER DATABASE [SREZ-1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SREZ-1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SREZ-1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SREZ-1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SREZ-1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SREZ-1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SREZ-1] SET QUERY_STORE = OFF
GO
USE [SREZ-1]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 31.03.2022 12:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[RegionName(EN)] [nvarchar](256) NOT NULL,
	[RegionName(RU)] [nvarchar](256) NOT NULL,
	[SubjectCode] [int] NULL,
	[OKATO] [int] NULL,
	[ISO 3166-2] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegionsCode]    Script Date: 31.03.2022 12:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionsCode](
	[RegionsCodeID] [int] IDENTITY(1,1) NOT NULL,
	[RegionID] [int] NULL,
	[Code] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RegionsCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (1, N'Republic of Adygea', N'Республика Адыгея', 1, 79, N'RU-AD')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (2, N'Altai Republic', N'Республика Алтай', 4, 84, N'RU-AL')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (3, N'Republic of Bashkortostan', N'Республика Башкортостан', 2, 80, N'RU-BA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (4, N'The Republic of Buryatia', N'Республика Бурятия', 3, 81, N'RU-BU')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (5, N'The Republic of Dagestan', N'Республика Дагестан', 5, 82, N'RU-DA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (6, N'The Republic of Ingushetia', N'Республика Ингушетия', 6, 26, N'RU-IN')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (7, N'Kabardino-Balkaria Republic', N'Кабардино-Балкарская республика', 7, 83, N'RU-KB')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (8, N'Republic of Kalmykia', N'Республика Калмыкия', 8, 85, N'RU-KL')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (9, N'Karachay-Cherkess Republic', N'Карачаево-Черкесская республика', 9, 91, N'RU-KC')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (10, N'Republic of Karelia', N'Республика Карелия', 10, 86, N'RU-KR')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (11, N'Komi Republic', N'Республика Коми', 11, 87, N'RU-KO')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (12, N'Republic of Crimea', N'Республика Крым', 91, 35, N'RU-CR')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (13, N'Mari El Republic', N'Республика Марий Эл', 12, 88, N'RU-ME')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (14, N'The Republic of Mordovia', N'Республика Мордовия', 13, 89, N'RU-MO')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (15, N'The Republic of Sakha (Yakutia)', N'Республика Саха (Якутия)', 14, 98, N'RU-SA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (16, N'Republic of North Ossetia - Alania', N'Республика Северная Осетия — Алания', 15, 90, N'RU-SE')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (17, N'Republic of Tatarstan', N'Республика Татарстан', 16, 92, N'RU-TA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (18, N'Tyva Republic', N'Республика Тыва', 17, 93, N'RU-TY')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (19, N'Udmurtia', N'Удмуртская республика', 18, 94, N'RU-UD')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (20, N'The Republic of Khakassia', N'Республика Хакасия', 19, 95, N'RU-KK')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (21, N'Chechen Republic', N'Чеченская республика', 20, 96, N'RU-CE')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (22, N'Chuvash Republic', N'Чувашская республика', 21, 97, N'RU-CU')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (23, N'Altai region', N'Алтайский край', 22, 1, N'RU-ALT')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (24, N'Transbaikal region', N'Забайкальский край', 75, 76, N'RU-ZAB')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (25, N'Kamchatka Krai', N'Камчатский край', 41, 30, N'RU-KAM')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (26, N'Krasnodar region', N'Краснодарский край', 23, 3, N'RU-KDA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (27, N'Krasnoyarsk region', N'Красноярский край', 24, 4, N'RU-KYA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (28, N'Perm region', N'Пермский край', 59, 57, N'RU-PER')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (29, N'Primorsky Krai', N'Приморский край', 25, 5, N'RU-PRI')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (30, N'Stavropol region', N'Ставропольский край', 26, 7, N'RU-STA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (31, N'Khabarovsk region', N'Хабаровский край', 27, 8, N'RU-KHA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (32, N'Amur region', N'Амурская область', 28, 10, N'RU-AMU')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (33, N'Arkhangelsk region', N'Архангельская область', 29, 11, N'RU-ARK')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (34, N'Astrakhan region', N'Астраханская область', 30, 12, N'RU-AST')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (35, N'Belgorod region', N'Белгородская область', 31, 14, N'RU-BEL')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (36, N'Bryansk region', N'Брянская область', 32, 15, N'RU-BRY')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (37, N'Vladimir region', N'Владимирская область', 33, 17, N'RU-VLA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (38, N'Volgograd region', N'Волгоградская область', 34, 18, N'RU-VGG')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (39, N'Vologodskaya Oblast', N'Вологодская область', 35, 19, N'RU-VLG')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (40, N'Voronezh region', N'Воронежская область', 36, 20, N'RU-VOR')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (41, N'Ivanovo region', N'Ивановская область', 37, 24, N'RU-IVA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (42, N'Irkutsk region', N'Иркутская область', 38, 25, N'RU-IRK')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (43, N'Kaliningrad region', N'Калининградская область', 39, 27, N'RU-KGD')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (44, N'Kaluga region', N'Калужская область', 40, 29, N'RU-KLU')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (45, N'Kemerovo region', N'Кемеровская область', 42, 32, N'RU-KEM')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (46, N'Kirov region', N'Кировская область', 43, 33, N'RU-KIR')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (47, N'Kostroma region', N'Костромская область', 44, 34, N'RU-KOS')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (48, N'Kurgan region', N'Курганская область', 45, 37, N'RU-KGN')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (49, N'Kursk region', N'Курская область', 46, 38, N'RU-KRS')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (50, N'Leningrad region', N'Ленинградская область', 47, 41, N'RU-LEN')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (51, N'Lipetsk region', N'Липецкая область', 48, 42, N'RU-LIP')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (52, N'Magadan Region', N'Магаданская область', 49, 44, N'RU-MAG')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (53, N'Moscow region', N'Московская область', 50, 46, N'RU-MOS')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (54, N'Murmansk region', N'Мурманская область', 51, 47, N'RU-MUR')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (55, N'Nizhny Novgorod Region', N'Нижегородская область', 52, 22, N'RU-NIZ')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (56, N'Novgorod region', N'Новгородская область', 53, 49, N'RU-NGR')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (57, N'Novosibirsk region', N'Новосибирская область', 54, 50, N'RU-NVS')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (58, N'Omsk region', N'Омская область', 55, 52, N'RU-OMS')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (59, N'Orenburg region', N'Оренбургская область', 56, 53, N'RU-ORE')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (60, N'Oryol Region', N'Орловская область', 57, 54, N'RU-ORL')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (61, N'Penza region', N'Пензенская область', 58, 56, N'RU-PNZ')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (62, N'Pskov region', N'Псковская область', 60, 58, N'RU-PSK')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (63, N'Rostov region', N'Ростовская область', 61, 60, N'RU-ROS')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (64, N'Ryazan Oblast', N'Рязанская область', 62, 61, N'RU-RYA')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (65, N'Samara Region', N'Самарская область', 63, 36, N'RU-SAM')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (66, N'Saratov region', N'Саратовская область', 64, 63, N'RU-SAR')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (67, N'Sakhalin region', N'Сахалинская область', 65, 64, N'RU-SAK')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (68, N'Sverdlovsk region', N'Свердловская область', 66, 65, N'RU-SVE')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (69, N'Smolensk region', N'Смоленская область', 67, 66, N'RU-SMO')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (70, N'Tambov Region', N'Тамбовская область', 68, 68, N'RU-TAM')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (71, N'Tver region', N'Тверская область', 69, 28, N'RU-TVE')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (72, N'Tomsk region', N'Томская область', 70, 69, N'RU-TOM')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (73, N'Tula region', N'Тульская область', 71, 70, N'RU-TUL')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (74, N'Tyumen region', N'Тюменская область', 72, 71, N'RU-TYU')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (75, N'Ulyanovsk region', N'Ульяновская область', 73, 73, N'RU-ULY')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (76, N'Chelyabinsk region', N'Челябинская область', 74, 75, N'RU-CHE')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (77, N'Yaroslavskaya oblast', N'Ярославская область', 76, 78, N'RU-YAR')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (78, N'Moscow', N'Москва', 77, 45, N'RU-MOW')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (79, N'St. Petersburg', N'Санкт-Петербург', 78, 40, N'RU-SPE')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (80, N'Sevastopol', N'Севастополь', 92, 67, N'RU-SEV')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (81, N'Jewish Autonomous Region', N'Еврейская автономная область', 79, 99, N'RU-YEV')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (82, N'Nenets Autonomous Okrug', N'Ненецкий автономный округ', 83, 99, N'RU-NEN')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (83, N'Khanty-Mansi Autonomous Area - Ugra', N'Ханты-Мансийский автономный округ - Югра', 86, 718, N'RU-KHM')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (84, N'Chukotka Autonomous Region', N'Чукотский автономный округ', 87, 77, N'RU-CHU')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (85, N'Yamalo-Nenets Autonomous District', N'Ямало-Ненецкий автономный округ', 89, 719, N'RU-YAN')
INSERT [dbo].[Region] ([RegionID], [RegionName(EN)], [RegionName(RU)], [SubjectCode], [OKATO], [ISO 3166-2]) VALUES (86, N'Baikonur (Kazakhstan)', N'Байконур (Казахстан)', NULL, NULL, N'')
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[RegionsCode] ON 

INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (1, 1, 1)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (2, 2, 4)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (3, 3, 102)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (4, 3, 2)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (5, 4, 3)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (6, 5, 5)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (7, 6, 6)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (8, 7, 7)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (9, 8, 8)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (10, 9, 9)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (11, 10, 10)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (12, 11, 111)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (13, 11, 11)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (15, 13, 12)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (16, 14, 113)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (17, 14, 13)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (18, 15, 14)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (19, 16, 15)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (20, 17, 16)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (21, 17, 116)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (22, 18, 17)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (23, 19, 18)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (24, 20, 19)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (25, 21, 95)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (26, 22, 121)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (27, 22, 21)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (28, 23, 22)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (29, 24, 75)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (30, 24, 80)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (31, 25, 41)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (32, 26, 23)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (33, 26, 93)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (34, 26, 123)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (35, 27, 24)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (36, 27, 124)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (37, 27, 84)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (38, 27, 88)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (39, 28, 159)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (40, 28, 81)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (41, 28, 59)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (42, 29, 125)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (43, 29, 25)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (44, 30, 126)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (45, 30, 26)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (46, 31, 27)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (47, 32, 28)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (48, 33, 29)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (49, 34, 30)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (50, 35, 31)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (51, 36, 32)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (52, 37, 33)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (53, 38, 134)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (54, 38, 34)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (55, 39, 35)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (56, 40, 136)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (57, 40, 36)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (58, 41, 37)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (59, 42, 38)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (60, 42, 138)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (61, 42, 85)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (62, 43, 91)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (63, 43, 39)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (64, 44, 40)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (65, 45, 142)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (66, 45, 42)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (67, 46, 43)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (68, 47, 44)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (69, 48, 45)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (70, 49, 46)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (71, 50, 47)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (72, 51, 48)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (73, 52, 49)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (74, 53, 50)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (75, 53, 90)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (76, 53, 150)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (77, 53, 190)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (78, 53, 750)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (79, 54, 51)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (80, 55, 52)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (81, 55, 152)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (82, 56, 53)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (83, 57, 54)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (84, 57, 154)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (85, 58, 55)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (86, 59, 56)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (87, 60, 57)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (88, 61, 58)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (89, 62, 60)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (90, 63, 61)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (91, 63, 161)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (92, 64, 62)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (93, 65, 63)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (94, 65, 163)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (95, 66, 64)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (96, 66, 164)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (97, 67, 65)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (98, 68, 66)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (99, 68, 96)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (100, 68, 196)
GO
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (101, 69, 67)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (102, 70, 68)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (103, 71, 69)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (104, 72, 70)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (105, 73, 71)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (106, 74, 72)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (107, 75, 73)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (108, 75, 173)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (109, 76, 74)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (110, 76, 174)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (111, 77, 76)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (112, 78, 77)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (113, 78, 97)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (114, 78, 99)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (115, 78, 177)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (116, 78, 197)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (117, 78, 199)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (118, 78, 777)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (119, 79, 78)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (120, 79, 98)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (121, 79, 178)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (122, 80, 92)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (123, 81, 79)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (124, 82, 83)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (125, 83, 86)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (126, 83, 186)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (127, 84, 87)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (128, 85, 89)
INSERT [dbo].[RegionsCode] ([RegionsCodeID], [RegionID], [Code]) VALUES (129, 86, 94)
SET IDENTITY_INSERT [dbo].[RegionsCode] OFF
GO
ALTER TABLE [dbo].[RegionsCode]  WITH CHECK ADD FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
USE [master]
GO
ALTER DATABASE [SREZ-1] SET  READ_WRITE 
GO
