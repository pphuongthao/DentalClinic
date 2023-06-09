USE [master]
GO
/****** Object:  Database [DentalClinicTest]    Script Date: 5/6/2023 12:31:39 AM ******/
CREATE DATABASE [DentalClinicTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DentalClinicTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DentalClinicTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DentalClinicTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DentalClinicTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DentalClinicTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DentalClinicTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DentalClinicTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DentalClinicTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DentalClinicTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DentalClinicTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DentalClinicTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [DentalClinicTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DentalClinicTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DentalClinicTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DentalClinicTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DentalClinicTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DentalClinicTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DentalClinicTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DentalClinicTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DentalClinicTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DentalClinicTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DentalClinicTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DentalClinicTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DentalClinicTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DentalClinicTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DentalClinicTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DentalClinicTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DentalClinicTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DentalClinicTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DentalClinicTest] SET  MULTI_USER 
GO
ALTER DATABASE [DentalClinicTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DentalClinicTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DentalClinicTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DentalClinicTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DentalClinicTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DentalClinicTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DentalClinicTest] SET QUERY_STORE = OFF
GO
USE [DentalClinicTest]
GO
/****** Object:  Table [dbo].[code_confirm]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[code_confirm](
	[CodeConfirmId] [varchar](36) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[Code] [varchar](6) NULL,
	[ExpiryTime] [bigint] NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_code_confirm] PRIMARY KEY CLUSTERED 
(
	[CodeConfirmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_feedback]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_feedback](
	[CustomerFeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](500) NULL,
	[Avatar] [varchar](max) NULL,
	[Contents] [nvarchar](max) NULL,
 CONSTRAINT [PK_customer_feedback] PRIMARY KEY CLUSTERED 
(
	[CustomerFeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctor]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[DoctorId] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SearchName] [varchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Avatar] [varchar](500) NULL,
	[Rate] [int] NULL,
	[Enable] [bit] NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goods_receipt]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goods_receipt](
	[GoodsReceiptId] [varchar](36) NOT NULL,
	[Supplier] [nvarchar](255) NULL,
	[Status] [varchar](50) NULL,
	[TotalAmount] [decimal](30, 8) NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_goods_receipt] PRIMARY KEY CLUSTERED 
(
	[GoodsReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goods_receipt_detail]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goods_receipt_detail](
	[GoodsReceiptDetailId] [varchar](36) NOT NULL,
	[MedicineId] [varchar](36) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](30, 8) NULL,
	[TotalPrice] [decimal](30, 8) NULL,
	[GoodsReceiptId] [varchar](36) NULL,
 CONSTRAINT [PK_goods_receipt_detail] PRIMARY KEY CLUSTERED 
(
	[GoodsReceiptDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medicine]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicine](
	[MedicineId] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](30, 8) NULL,
 CONSTRAINT [PK_medicine] PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Slug] [varchar](255) NULL,
	[SearchTitle] [varchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[Thumbnail] [varchar](500) NULL,
	[NewsContent] [nvarchar](max) NULL,
	[CreateTime] [bigint] NULL,
	[Enable] [bit] NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[ServiceId] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SearchName] [varchar](255) NULL,
	[Thumbnail] [varchar](500) NULL,
	[ExpectTime] [bigint] NULL,
	[Description] [nvarchar](max) NULL,
	[ServiceCategoryId] [varchar](36) NULL,
	[Price] [decimal](30, 8) NULL,
	[CreateTime] [bigint] NULL,
	[Enable] [bit] NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_category]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_category](
	[ServiceCategoryId] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Enable] [bit] NULL,
	[ShowInHomePage] [bit] NULL,
 CONSTRAINT [PK_service_category] PRIMARY KEY CLUSTERED 
(
	[ServiceCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slide]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slide](
	[SlideId] [varchar](36) NOT NULL,
	[Image] [varchar](500) NULL,
	[LinkWeb] [varchar](max) NULL,
	[Area] [varchar](50) NULL,
 CONSTRAINT [PK_slide] PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[system_about]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_about](
	[SystemAboutId] [varchar](36) NOT NULL,
	[HtmlContents] [nvarchar](max) NULL,
 CONSTRAINT [PK_system_about] PRIMARY KEY CLUSTERED 
(
	[SystemAboutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[system_config]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_config](
	[SystemConfigId] [varchar](36) NOT NULL,
	[NameField] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_system_config] PRIMARY KEY CLUSTERED 
(
	[SystemConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[UserId] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SearchName] [varchar](255) NULL,
	[Avatar] [varchar](500) NULL,
	[Account] [varchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[Password] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Status] [varchar](50) NULL,
	[CreateTime] [bigint] NULL,
	[Enable] [bit] NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](500) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_admin]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_admin](
	[UserAdminId] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Account] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Token] [varchar](max) NULL,
	[CreateTime] [bigint] NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_user_admin] PRIMARY KEY CLUSTERED 
(
	[UserAdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_appointment]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_appointment](
	[UserAppointmentId] [varchar](36) NOT NULL,
	[UserId] [varchar](36) NULL,
	[Name] [nvarchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](255) NULL,
	[Address] [nvarchar](max) NULL,
	[DoctorId] [varchar](36) NULL,
	[Hour] [int] NULL,
	[Minute] [int] NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Status] [varchar](50) NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_user_appointment] PRIMARY KEY CLUSTERED 
(
	[UserAppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_appointment_service]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_appointment_service](
	[UserAppointmentServiceId] [varchar](36) NOT NULL,
	[UserAppointmentId] [varchar](36) NULL,
	[ServiceId] [varchar](36) NULL,
 CONSTRAINT [PK_user_appointment_service] PRIMARY KEY CLUSTERED 
(
	[UserAppointmentServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_bill]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_bill](
	[UserBillId] [varchar](36) NOT NULL,
	[UserId] [varchar](36) NULL,
	[UserAppointmentId] [varchar](36) NULL,
	[Name] [nvarchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](255) NULL,
	[TotalAmount] [decimal](30, 8) NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_user_bill] PRIMARY KEY CLUSTERED 
(
	[UserBillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_bill_detail]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_bill_detail](
	[UserBillDetailId] [varchar](36) NOT NULL,
	[UserBillId] [varchar](36) NULL,
	[ServiceId] [varchar](36) NULL,
	[ServiceName] [nvarchar](255) NULL,
	[Price] [decimal](30, 8) NULL,
 CONSTRAINT [PK_user_bill_detail] PRIMARY KEY CLUSTERED 
(
	[UserBillDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_bill_medicine_detail]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_bill_medicine_detail](
	[UserBillMedicineDetailId] [varchar](36) NOT NULL,
	[UserBillId] [varchar](36) NULL,
	[MedicineId] [varchar](36) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](30, 8) NULL,
	[TotalPrice] [decimal](30, 8) NULL,
 CONSTRAINT [PK_user_bill_medicine_detail] PRIMARY KEY CLUSTERED 
(
	[UserBillMedicineDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_feedback]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_feedback](
	[UserFeedbackId] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Avatar] [varchar](500) NULL,
	[Contents] [nvarchar](max) NULL,
	[RateStar] [int] NULL,
 CONSTRAINT [PK_user_feedback] PRIMARY KEY CLUSTERED 
(
	[UserFeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_token]    Script Date: 5/6/2023 12:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_token](
	[UserTokenId] [varchar](36) NOT NULL,
	[UserId] [varchar](36) NULL,
	[Token] [varchar](max) NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_user_token] PRIMARY KEY CLUSTERED 
(
	[UserTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customer_feedback] ON 

INSERT [dbo].[customer_feedback] ([CustomerFeedbackId], [CustomerName], [Avatar], [Contents]) VALUES (1, N'Phương Thảo', N'/files/avatar/be21516a-baee-4d6d-91c7-5aca49651611.jpg', N'Tẩy trắng răng bằng laser là việc thoa thuốc làm trắng vào bề mặt răng, sau đó sử dụng ánh sáng laser chiếu xạ sâu vào cấu trúc răng nhằm hoạt hóa thuốc tẩy trắng giúp răng trắng và sáng hơn.')
INSERT [dbo].[customer_feedback] ([CustomerFeedbackId], [CustomerName], [Avatar], [Contents]) VALUES (2, N'Mai Linh', N'/files/avatar/4de36cc1-8116-47c1-8503-51bba56949c8.jpg', N'Về mặt bản chất, tia laser không có hề có tác dụng tẩy trắng mà chỉ thúc đẩy hoạt động của thuốc tẩy trắng răng. Bởi vậy, nếu không sử dụng thuốc tẩy trắng răng trước khi chiếu tia laser, phương pháp này không mang lại hiệu quả tẩy trắng răng như mong đợi.')
INSERT [dbo].[customer_feedback] ([CustomerFeedbackId], [CustomerName], [Avatar], [Contents]) VALUES (3, N'Phương Anh', N'/files/avatar/165b7c31-9058-4f9f-a3b1-47f88e738230.jpg', N'Hiện nay, phương pháp làm răng trắng bằng đèn hợp quang chiếu ánh sáng xanh là phương pháp được các chuyên gia đánh giá cao  về mức độ hiệu quả lẫn tính an toàn ở thời điểm hiện tại.')
SET IDENTITY_INSERT [dbo].[customer_feedback] OFF
GO
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Avatar], [Rate], [Enable], [CreateTime]) VALUES (N'154d7e36-ae63-4f96-a08e-c59deafa8d64', N'Vũ Thị Phương Thảo', N'Vu Thi Phuong Thao', N'<p>Kinh nghiệm 15 năm</p>
', N'/files/doctor/d2973dfa-6320-41e9-bcd7-39368cf33bb4.jpg', 5, 1, 0)
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Avatar], [Rate], [Enable], [CreateTime]) VALUES (N'27ceffae-8c1b-4e1a-ba0a-f3e4ed894385', N'Bác sĩ Thảo', N'Bac si Thao', N'<p>Tr&igrave;nh độ chuy&ecirc;n m&ocirc;n cao</p>
', N'/files/doctor/e115dc1b-a1f6-4074-85ce-e8aa1f216a4e.jpg', 5, 1, 1682477737347)
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Avatar], [Rate], [Enable], [CreateTime]) VALUES (N'5ffe3af8-7f1f-46c1-914b-e069722be540', N'Vu Minh Phương', N'Vu Minh Phuong', N'<p>B&aacute;c sĩ chuy&ecirc;n răng</p>
', N'/files/doctor/9b6d26aa-079c-4be2-8d80-f1161f14c0da.jpg', 4, 1, 0)
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Avatar], [Rate], [Enable], [CreateTime]) VALUES (N'813ec3ce-9ea7-4ab8-b311-65be0e18a244', N'Phương Thảo', N'Phuong Thao', N'<p>Kinh nghiệm 15 năm</p>
', N'/files/doctor/542fa912-3b82-45ff-95d8-35dd786f1f56.jpg', 5, 1, 0)
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Avatar], [Rate], [Enable], [CreateTime]) VALUES (N'b1f5f895-0fdc-4e59-a12c-d3d70a70f558', N'Phương Anh', N'Phuong Anh', N'<p>bac si</p>
', N'/files/doctor/fd5416b8-02c5-4aae-a296-255bf2e82a0d.jpg', 5, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (4, N'Tin tức phòng khám', NULL, NULL, N'Thông tin nổi bật', N'/files/news/377901e0-03ea-4526-a13f-3f58fa2e6d13.jpg', N'<p>Th&ocirc;ng b&aacute;o lịch nghỉ lễ 30/4</p>
', 0, 1)
INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (5, N'Phòng khám thông báo lịch nghỉ lễ', NULL, N'Phong kham thong bao lich nghi le', N'Nghỉ lễ 30/4 -1/5', N'/files/news/36e75deb-c3c2-45fb-a350-273054fb8b78.jpg', N'<p>Đ&acirc;y l&agrave; nội dung</p>
', 1683185871719, 1)
INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (8, N'Phòng khám nha khoa Phương Thảo', NULL, N'Phong kham nha khoa Phuong Thao', N'Đây là mô tả', N'/files/news/67b2789e-9a33-4472-a6d1-10c41edf43d3.jpg', N'<p>Đ&acirc;y l&agrave; nội dung</p>
', 1683186165847, 1)
INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (9, N'test', NULL, N'test', N'test', N'/files/news/f6500463-fce6-4954-a166-5a85ef57e4fe.jpg', N'<p>test</p>
', 1683213426475, 1)
SET IDENTITY_INSERT [dbo].[news] OFF
GO
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'253aabd2-c85e-4ada-8d9f-0da00c529def', N'aaa update', N'aaa update', N'/files/service/bd909cbc-501b-4175-b257-6314d24f8212.jpg', 30, N'<p>day la mo ta</p>
', N'49988abe-a870-4194-bdee-e3776a27f043', CAST(8765000.00000000 AS Decimal(30, 8)), 1681443009416, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'5c9a1c2a-0a87-449b-8cc1-4d9e154d4014', N'test', N'test', N'/files/service/29b5fe71-3ad9-4540-9cb2-8ab0344924ad.jpg', 30, N'<p>test</p>
', N'49988abe-a870-4194-bdee-e3776a27f043', CAST(2000000.00000000 AS Decimal(30, 8)), 1683258367202, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'af81ffa5-8301-4bcf-b318-a0756026fbdf', N'abc', N'abc', N'/files/service/6d137637-18fc-44b9-8382-283166edb4a2.jpg', 0, N'<p>bbbabgdshsjsusjsjsk</p>
', N'ac0471c3-480b-4183-86d2-0f81e1c53699', CAST(47800.00000000 AS Decimal(30, 8)), 1681439551284, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'dd860f5a-2630-4cb6-bf44-6fd917bfd96c', N'Nhổ răng số 8', N'Nho rang so 8', N'/files/service/f35a29b6-11ba-4edf-900b-d434c510a53f.jpg', 30, N'<p>Nhổ theo phương ph&aacute;p hiện đại gi&uacute;p giảm đau tối đa</p>
', N'ac0471c3-480b-4183-86d2-0f81e1c53699', CAST(3000000.00000000 AS Decimal(30, 8)), 1683185004986, 1)
GO
INSERT [dbo].[service_category] ([ServiceCategoryId], [Name], [Enable], [ShowInHomePage]) VALUES (N'49988abe-a870-4194-bdee-e3776a27f043', N'Niềng răng', 1, 1)
INSERT [dbo].[service_category] ([ServiceCategoryId], [Name], [Enable], [ShowInHomePage]) VALUES (N'7ef34c09-27e6-4109-96e0-0755b2b8e2a1', N'test', 1, 0)
INSERT [dbo].[service_category] ([ServiceCategoryId], [Name], [Enable], [ShowInHomePage]) VALUES (N'ac0471c3-480b-4183-86d2-0f81e1c53699', N'Lấy cao răng', 1, 1)
INSERT [dbo].[service_category] ([ServiceCategoryId], [Name], [Enable], [ShowInHomePage]) VALUES (N'b2057cca-a810-4e89-9bc1-1f4e8ba8e6e6', N'Làm trắng răng', 1, 1)
GO
INSERT [dbo].[slide] ([SlideId], [Image], [LinkWeb], [Area]) VALUES (N'051de014-887b-43d2-ac54-aa32006ef82c', N'/files/slides/b809d816-ea01-4ec3-b520-8bf336717fd6.jpg', N'https://xml.com.vn', N'home-slide')
INSERT [dbo].[slide] ([SlideId], [Image], [LinkWeb], [Area]) VALUES (N'9a8bb0db-76cc-4c10-8942-74126c686d54', N'/files/slides/fb23929a-853a-41cf-b207-f91da6d07462.jpg', N'https://flowers.com.vn', N'banner-1')
GO
INSERT [dbo].[system_about] ([SystemAboutId], [HtmlContents]) VALUES (N'about', N'<p>abc</p>
')
GO
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'1', N'Vũ Thị Phương Thảo', N'Vu Thi Phuong Thao', N'/files/avatar/1a39c4ce-4c23-434f-a5d8-0647062f6539.jpg', N'phuongthao', N'0365186564', NULL, N'thaovu13092001@gmail.com', N'Ðang kích ho?t', NULL, 1, 0, N'Kiến Xương - Thái Bình')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Vũ Thị Phương Thảo', N'Vu Thi Phuong Thao', N'/files/avatar/9a2f5c9b-56f8-4f5a-b64e-ded9939944e0.jpg', N'thaoday', N'0987456342', N'2bb506fb1eceac8fdee5a1af76e706c5', N'thaovu1309@gmail.com', NULL, NULL, 1, 0, N'Hà Nội')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'acaef832-49a4-49d7-82ac-12aa751ec4d6', N'Test', N'Test', N'/files/avatar/1aee0920-efb6-42e8-b989-b288d7d0d4b1.jpg', N'test', N'0983621832', N'3c3ebeb0b044d2a3eaacfbebdfec6db7', N'anh@gmail.com', NULL, NULL, 1, 0, N'Hà Nội')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', N'Thảo Update', N'Thao Update', N'/files/avatar/7be82ae0-4d7e-4cfb-8d36-3140878098ac.jpg', N'test2', N'0987654321', N'6415d7b1f4d05b15856253c72d09667d', N'test@gmail.com', NULL, NULL, 1, NULL, N'99 Nguyễn Chí Thanh')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Vũ Minh Phương', NULL, NULL, N'minhphuong98', NULL, N'14b42459aa2c8a0bd36cc3bde41c5932', N'vuminhphuong98@gmail.com', NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[user_admin] ([UserAdminId], [Name], [Account], [Password], [Token], [CreateTime], [Role]) VALUES (N'0a59cf36-cd77-402e-bc61-7b987899ea7e', N'ThaoVTP', N'admin1', N'e92c23e64dd3962ca41f921f1fe15b63', N'DentalClinic Vm0xd1IyRnRWa2RhU0ZKWFlrWndVRlp0TURGU01rWlZWVmhHVG1Fd2JEUmFSRUozWld4c1dGVnVVbWhXZWxJMFdXMTBZV05GTlVSaU0yeFNZV3RaZWxVeU5VOWlNVmw0VjJ0V1ZtSnJjSEZaVjNOM1pVWmtjbFp0Um14V1dFSjNXV3RvZDFSc1dYaFdWRVpWVm5wR1QxcFdWWGRsVmxwVlUyczVVMDFWY0hsV1JtaDNZMnN4Y2sxWVVsVmlWMmhRVld0V1lXUkdVWGhWYTNCc1VtNUNlRlZ0TUhoWlZscEdWbGhvV0ZZelFtRmFWM014VTBkU1NXSkZOV3hpUm5CNVZsY3dNVk50U2xaa1JteFZWMGRvVkZsWWNITmpSbHB4VW10MGJGSnVRa2hXVjNNMVlUSktWbGR1YkZkV00yaDJXVmN4VjJSSFZrWlRiRlpvVFZWd1JWZFdWbFpOVmxwWVUydG9hbEl3V205WldIQkRUbFphUmxkdGRGVk5hMVl6Vkd4U1lWZHJNSGhUYkVKV1lURmFTRlJzV210ak1WSlpZVWRvVjJKWVkzbFdha1p2WWpGU1YxZHJhRlppYTBwV1ZGWmFTMlJXVWxWUlZGWlRWakJaTWxadE1VZFdNREZIVm1wYVYwMXVhSEpXVkVwUFYwWldjMVpzVm1saVNFSjJWMVpTUjFNeFpGZGhNM0JxVTBVMVUxWnNVbGRUUmxwMFkwVk9XRkl3Y0VsV1YzUXdWbFphYzFacVVsZGhNVlkwVld4YVIyUkdTbk5VYXpWVFVsVlpNRlp0ZEZkWlYwVjRVMjVLVGxadFVuQlZNRlpoVmtaWmQxZHJkRnBXYkVwWldsVm9TMVJzU25OVGJHeGFUVVphYUZaRVJrdFdWbHBWVTJ4d1dGTkZTa1ZXYTFKSFYyMVdSMWR1UmxaV1JFRTVXVlJaTkUxWFJUVk9Na1YwVDFScmVscHBNREJaYlU1cVRGUnJNVmt5VFhSWlYwcHNXVEpGTUZwcVdYbFplazE0WldFNE5EVTJNekl0WldOak5TMDBOek5tTFdKbE5UZ3ROemN3WlRJMU1tVTBZelptY2I2MWY4YTAtYmVhOS00MTNmLTk2ODctNjg0NGFkOTkyYzQ2', 1681719640621, N'ADMIN')
INSERT [dbo].[user_admin] ([UserAdminId], [Name], [Account], [Password], [Token], [CreateTime], [Role]) VALUES (N'9317820c-efcd-4266-a167-8fe51a50c7f3', N'admin', N'admin', N'6a475fb1fd8ec276485a2c6231c13de1', N'', 0, N'ADMIN')
GO
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime]) VALUES (N'1335215c-98ac-465a-8f9b-6aebaea26d23', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Nguyễn Đăng Duy', N'0987265171', N'duyn@gmail.com', NULL, N'b1f5f895-0fdc-4e59-a12c-d3d70a70f558', 9, 0, 6, 5, 2023, N'PENDING', 1682665595168)
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime]) VALUES (N'14e967e2-01be-4069-a674-fedb39d9de7c', N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', N'Thảo Update', N'0987654321', N'test@gmail.com', NULL, N'27ceffae-8c1b-4e1a-ba0a-f3e4ed894385', 8, 30, 17, 5, 2023, N'PENDING', 1683106123374)
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime]) VALUES (N'15c5d3be-bc68-45ce-8bb2-d198d81d8583', N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', N'Thảo Update', N'0987654321', N'test@gmail.com', NULL, N'5ffe3af8-7f1f-46c1-914b-e069722be540', 9, 30, 16, 5, 2023, N'PENDING', 1683106139957)
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime]) VALUES (N'2d07854d-feda-414d-838a-28d8fbfa1c13', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Vũ Thị Phương Thảo', N'0365186564', N'thaovu13092001@gmail.com', NULL, N'27ceffae-8c1b-4e1a-ba0a-f3e4ed894385', 8, 30, 29, 4, 2023, N'PENDING', 1682657834831)
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime]) VALUES (N'2d474021-e446-4061-acac-c1024982459b', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Vũ Thị Phương Thảo', N'0987456342', N'thaovu1309@gmail.com', NULL, N'154d7e36-ae63-4f96-a08e-c59deafa8d64', 8, 30, 10, 5, 2023, N'PENDING', 1683298414963)
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime]) VALUES (N'4989c732-f1e5-456b-8d7a-34df2be8aedd', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Vũ Thị Phương Thảo', N'0987456342', N'thaovu1309@gmail.com', NULL, N'813ec3ce-9ea7-4ab8-b311-65be0e18a244', 8, 30, 11, 5, 2023, N'PENDING', 1683174006049)
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime]) VALUES (N'84c47fe1-4e09-49fa-8095-b8d6febb4b54', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Bùi Mai Linh', N'0932617827', N'mailinhbui@gmail.com', NULL, N'5ffe3af8-7f1f-46c1-914b-e069722be540', 8, 0, 3, 5, 2023, N'PENDING', 1682667075213)
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime]) VALUES (N'8e9149d1-0ef5-4ce1-bcf0-921a660b0d0b', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', NULL, NULL, NULL, NULL, N'5ffe3af8-7f1f-46c1-914b-e069722be540', 8, 30, 10, 5, 2023, N'PENDING', 1683083033940)
GO
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'01c69a6d-15f8-4cf8-8f98-877fbb397959', N'8e9149d1-0ef5-4ce1-bcf0-921a660b0d0b', N'253aabd2-c85e-4ada-8d9f-0da00c529def')
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'0ba992b4-6b22-476b-bed2-36ae8ef5ae27', N'15c5d3be-bc68-45ce-8bb2-d198d81d8583', N'253aabd2-c85e-4ada-8d9f-0da00c529def')
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'44b7d359-9325-4e57-888b-75c41e18659b', N'1335215c-98ac-465a-8f9b-6aebaea26d23', N'af81ffa5-8301-4bcf-b318-a0756026fbdf')
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'5306ac1f-a4aa-457b-8599-e7d82991bf79', N'84c47fe1-4e09-49fa-8095-b8d6febb4b54', N'253aabd2-c85e-4ada-8d9f-0da00c529def')
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'7334ecdf-829d-45f5-aadd-9df5f5ab91d6', N'4989c732-f1e5-456b-8d7a-34df2be8aedd', N'253aabd2-c85e-4ada-8d9f-0da00c529def')
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'ba0b3989-c7b7-458a-b9ff-20ea36a9cb00', N'14e967e2-01be-4069-a674-fedb39d9de7c', N'253aabd2-c85e-4ada-8d9f-0da00c529def')
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'c0b1e221-8d85-48b2-959c-ca2b5a6586d7', N'15c5d3be-bc68-45ce-8bb2-d198d81d8583', N'af81ffa5-8301-4bcf-b318-a0756026fbdf')
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'c6d752d8-9a46-47a4-9ab5-e2e9ab87a5cc', N'2d474021-e446-4061-acac-c1024982459b', N'dd860f5a-2630-4cb6-bf44-6fd917bfd96c')
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'd3b67825-4c6f-4c94-a4a0-cc19e27480c7', N'2d07854d-feda-414d-838a-28d8fbfa1c13', N'253aabd2-c85e-4ada-8d9f-0da00c529def')
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId]) VALUES (N'd8093497-5564-463e-b7c8-537b17bfcad1', N'2d07854d-feda-414d-838a-28d8fbfa1c13', N'af81ffa5-8301-4bcf-b318-a0756026fbdf')
GO
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'433cdf05-8838-4733-a25e-d5fa4b5e9c2e', N'e848d550-acfb-4c12-8f39-201d8b7ae786', NULL, 1682604266079)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'a406dd3d-4601-4f15-98c0-432d2d38cf4a', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'DentalClinic Vm0xd1NtUXlWa2RUYmxKWFltdHdUMVp0TURGU01rWlZWVmhHVG1Fd2JEUmFSRUozWld4d1ZXRkhkRTloYXpCNlYydFNibVJGTlZWWFdHeFBVWHBCZDFkclpFOWhhM2hZVTFSR1QyRnNiREJYVjNCcVpXczVXRkp0ZEU1V1IyaHhWRzF3Um1WdFNuSlhia0pQVVRJNU5WVlhjRWROTVU1MVZHeGtXbFpVUlRKV1Z6VkxZVzFHY2sxSWFGaGhNVnBvV2xaV2QyTkhTa2xqUlRWWFVsaENkMVl4WkhkV2JWRjNUbGhTV0dKWGVFOVdha1poWTFaa2MxcEZaR2hoZW14SlZqSXhNRmxXV1hoV1dHaFlWbXhLU0ZsVlduZGpWbXcyVTIxR1YxSXdOSHBXUnpCNFZHc3hWazVWYUd0VFIzaFBXbGQ0WVdOc1ZuUk9WWEJwVmxoU1dsWkdhRzlaVmtwVlZteG9WbUZyV2t4YVZWcDNVakZXY2s5WGRHbFdWbkExVm14a05HSXlSblJXYmxKc1VsVndWbGxVUmt0VU1WSnpWbFJXV0ZKck5UQlVWbFV4VkcxS1NHUXpjRmRTVm5CVVZUSnplRkpyT1ZaaFJrNVlVbXR3VVZaWGRHRldiVlpIV2toT1ZWZEhhRzlWYkZKWFVteFplRlZyZEZWV2JHdzBXVEJvUTFkR1dqWlNiR1JoVWtWR05GVXdXbE5rUlRGWVVtMW9hRTB3U2pKV2ExcFRVekZWZVZSc2FGWmlSbHBXV1cxNGQySXhiRlZTYTNSWVZtMTBObGt3YUU5VmJGcFZWbXRvV21FeFNrUldNR1JMVWpGT2NscEhSbGRXYkZZMFZrZDRWbVZHU2xkU2JrNVNZa2RTVkZsVVJuSmxWbHB5Vm0xR2FFMVZOVEJXVm1odllWWk9SbGRzYUZkTlJuQk1WbFZhWVdOc1pISmFSVGxUWWtWd05sWnNaREJrTVZKelUyeFdVMVpGY0dGWlZFcFRaR3hhVmxkc2NHeFNhM0JXVlZaUmQxQlVXbWxQUjBac1dsZEZlRXhVUVRCWlYwVjBUa1JHYlU1VE1XbE9WR041VEZSTmVGcEVWWGhaTWxreldtcFpkMDVCUFQwek1qQTRZV1EzTnkwek1ETmtMVFExTXpRdFlXSXlNaTB4TlRKalltSTJNR013TTJVPTc4M2NlMGI0LTEwZTktNDgzOC04YjE4LWZhYWZlMDZmMDgyNQ==', 1683281879786)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'd03f9dab-e307-40ad-9e1d-92165bde0404', N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', N'DentalClinic Vm0xd1MwNUdWWGxTYmtwT1YwVTFjRlV3WXpGU01rWlZWVmhHVG1Fd2JEUmFSRUozWldzMVZWTlljRTVTUmxwelYyMHhWbVJGTVVoWFZFNWhZVlJCZDFSclVrSk9SWGhWV25wQ1RsWkZNVEJVVm1SV1RsWndWVlZ0YUU1aGF6RTJWMVpTY2s1WFNuSlhia0pQVVRJNU5WVlhjRWROTVU1MVZHeE9WMkpIVWtaV1Z6VkxZVzFHY2sxSWFGaGhNVnBvV2xaV2QyTkhTa2xqUlRWWFVtMTBNMVpHV2xOV01rVjNUa2hzVkZkSGFHaFpWM2hMWTJ4U1ZsVnNaR2hXVkVaV1ZteFNVMVF4V2tkaVJGWlZZa1pLVUZsWGN6Rk9iRTUwWkVVMVUxSXpUalZXUnpGM1lUSkZkMDVWYUd0VFIzaFBXbGQ0WVdOc1ZuUk9WWEJwVmxoU1dsWkdhRzlaVmtwMVVXeG9WVll6YUV4YVZWcDNVakZXY2s5WGRHbFdWbkExVm14a05HSXlSblJXYmxKc1VsVndWbGxVU2xOVk1WSlhWbGhvVDJKRk5UQmFWVnAzWVZaYWRWRnVaRmRTVm5CeVZsZHpNVlpyTVZaaFJscFlVbXR3VVZaWGNFSmtNbFpYVlc1T1ZWZEhVbEJWYkZKRFRsWldjMVZyT1ZWV2JIQkhXVlJPYzFkSFJYaFRiRkphVmpOT05Ga3hXbkpsYlU1R1RsWmtUbFpzYTNkV2EyUTBZVEZWZVZSc2FGWmlSbHBXV1cxNGQySXhiRlZTYTNSWVZtMTBObGt3YUU5VmJGcFZWbXRvVjJKWVFrUldiRlY0VWpGT2RGSnRSbE5TVlZrd1YxUkNWbVZHU2xkU2JrcFFWak5vYjFSWE5XcGxSbHB5Vm0xR1ZrMXJjSGxVVldoclZHeGFjMWRzYUZkTlJuQk1WbFphVjJOc2NFZFViWFJUWWtWdmQxWkdXbFpOVjBwSFYyNVdVbUV4Y0ZkV2JuQkdaREZrVjFwRlpHcE5WWEI0VmxaUmQxQlVUWHBhYlUxNVRtcEplRXhVYkcxTlJGVjBUa2RWTTFwcE1XbE9iVTE0VEZkWk5VMXFWVEZhVkUwMFQxUkJNazEzUFQwd01HWmtNVEExTWkwMFpqSmxMVFExWkdFdE9XRmpaQzAyWVRJeVpqWmtNR0kzTWprPWRkNDQ2MWVhLTNhMGYtNGM1Yy1iMDJkLWM2MWU0ZmZmOTBiNg==', 1683104645873)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'e2a8ceb2-3e31-4fbc-a7f0-4b9e97551795', N'acaef832-49a4-49d7-82ac-12aa751ec4d6', N'DentalClinic Vm0xd1NtVkhVWGhXYmtwUFZtMVNjRlZyWXpGU01rWlZWVmhHVG1Fd2JEUmFSRUozWldzMU5sVnRkRTVoYkZZMFYydGtTbVJGTVVWVmJYUlBWWHBCZDFSWGNGZGhhM2hWWWtkNFVGSXdiREJYV0hCT1RXc3hObFJ0ZEU1U1Jtd3pWREZTYjJKWFNuSlhia0pQVVRJNU5WVlhjRWROTVU1MVZHMUdWbUpWY0ZaV1Z6VkxZVzFHY2sxSWFGaGhNVnBvV2xaV2QyTkhTa2xqUlRWWFVsUldlRlpHVWt0V01rWlhZMFpvVkZkSFVtRlpWM1JHWkRGU2NscEdTbXhXYlhoV1ZrY3hORmRzV1hkWGJrWllZbFJHVEZsclduTmtSbFowVFZkR1YwMUVRalZXTW5SclUyc3dkMDVWYUd0VFIzaFBXbGQ0WVdOc1ZuUk9WWEJwVmxoU1dsWkdhRzloYkVwVlZteG9WVll6YUV4YVZWcDNVakZXY2s5WGRHbFdWbkExVm14a05HSXlSblJXYmxKc1VsVndWbGxVU2xOVFJteFlaVWhPV0ZKc2NEQlVWbHBEVlRGS1ZWSlVSbGRTVm5CVVZsZHpNVll5U2tkV2JGcFlVbXR3VVZaWGRHdE9SMDV6Vlc1V2FFMHlVbEJWYkZKSFRVWldkRTFZWkZWV2JIQkhWbTF3VjFkR1duUlZhMlJWVmtWRmVGWnNXa3RrUjFaSFkwZDRhVkpZUWpWV2EyTjNaVVpWZVZSc2FGWmlSbHBXV1cxNGQySXhiRlZTYTNSWVZtMTBObGt3YUU5VmJGcFZWbXRrVlZac1NrUldiR1JMVWpGT2NrOVhSbGROTURFMFZtMTBWbVZHU2xkU2JrNVNZa2RTVDFadGVISmtNVnB5Vm0xR2FFMVZNVFZWTW5ocllWWktSMk5IUmxWV1JWcE1WbFZhVjJOV1NuVlVhemxYWWxaS05sWnNaREJrTVZGNFUyNVdVbUp0YUZsWlYzTXhUVEZrVjFkcmRGUlNNRnBLVlRGUmQxQlhTVFJPVkZKc1RucGplRXhYVVhoT1JFbDBUa2RGTkZsVE1EVk9WMWsxVEZkRmQxbFVWWGhaVkVsNVRucFNiRTlCUFQwd056TTFOVE13TUMxaU0yVTBMVFEzWWprdE9XRXpOaTFoT1dWaE16bGtOVGhoWlRRPTYxYTYyYWRhLTU3NzItNDU0My04YmY3LTU4NmJjNWFjODkwYw==', 1683088579216)
GO
USE [master]
GO
ALTER DATABASE [DentalClinicTest] SET  READ_WRITE 
GO
