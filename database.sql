USE [master]
GO
/****** Object:  Database [DentalClinicTest]    Script Date: 6/13/2023 9:32:10 PM ******/
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
/****** Object:  Table [dbo].[appointment_status]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment_status](
	[AppointmentStatusId] [varchar](36) NOT NULL,
	[UserAppointmentId] [varchar](36) NULL,
	[Status] [varchar](50) NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_appointment_status] PRIMARY KEY CLUSTERED 
(
	[AppointmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_feedback]    Script Date: 6/13/2023 9:32:10 PM ******/
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
/****** Object:  Table [dbo].[doctor]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[DoctorId] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SearchName] [varchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Qualification] [nvarchar](255) NULL,
	[Avatar] [varchar](500) NULL,
	[Enable] [bit] NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 6/13/2023 9:32:10 PM ******/
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
/****** Object:  Table [dbo].[notification]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[NotificationId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](36) NULL,
	[Title] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[IsRead] [bit] NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reason_reject]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reason_reject](
	[ReasonRejectId] [varchar](36) NOT NULL,
	[UserAppointmentId] [varchar](36) NULL,
	[Message] [nvarchar](500) NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_reason_reject] PRIMARY KEY CLUSTERED 
(
	[ReasonRejectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_daily]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_daily](
	[ReportDailyId] [varchar](36) NOT NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[TotalPrice] [decimal](30, 8) NULL,
 CONSTRAINT [PK_ReportDaily] PRIMARY KEY CLUSTERED 
(
	[ReportDailyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_monthly]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_monthly](
	[ReportMonthlyId] [varchar](36) NOT NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[TotalPrice] [decimal](30, 8) NULL,
 CONSTRAINT [PK_ReportMonthly] PRIMARY KEY CLUSTERED 
(
	[ReportMonthlyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_yearly]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_yearly](
	[ReportYearlyId] [varchar](36) NOT NULL,
	[Year] [int] NULL,
	[TotalPrice] [decimal](30, 8) NULL,
 CONSTRAINT [PK_report_yearly] PRIMARY KEY CLUSTERED 
(
	[ReportYearlyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[ServiceId] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SearchName] [varchar](255) NULL,
	[Thumbnail] [varchar](500) NULL,
	[ExpectTime] [int] NULL,
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
/****** Object:  Table [dbo].[service_category]    Script Date: 6/13/2023 9:32:10 PM ******/
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
/****** Object:  Table [dbo].[slide]    Script Date: 6/13/2023 9:32:10 PM ******/
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
/****** Object:  Table [dbo].[system_about]    Script Date: 6/13/2023 9:32:10 PM ******/
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
/****** Object:  Table [dbo].[system_config]    Script Date: 6/13/2023 9:32:10 PM ******/
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
/****** Object:  Table [dbo].[system_transaction]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_transaction](
	[SystemTransactionId] [varchar](36) NOT NULL,
	[Amount] [decimal](30, 8) NULL,
	[Message] [nvarchar](255) NULL,
	[CreateTime] [bigint] NULL,
 CONSTRAINT [PK_system_transaction] PRIMARY KEY CLUSTERED 
(
	[SystemTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[system_wallet]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_wallet](
	[SystemWalletId] [varchar](36) NOT NULL,
	[Balance] [decimal](30, 8) NULL,
 CONSTRAINT [PK_system_wallet] PRIMARY KEY CLUSTERED 
(
	[SystemWalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 6/13/2023 9:32:10 PM ******/
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
	[Status] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[user_admin]    Script Date: 6/13/2023 9:32:10 PM ******/
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
/****** Object:  Table [dbo].[user_appointment]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_appointment](
	[UserAppointmentId] [varchar](36) NOT NULL,
	[UserId] [varchar](36) NULL,
	[AppointmentCode] [varchar](20) NULL,
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
	[TotalExpectTime] [int] NULL,
	[TotalAmount] [decimal](30, 8) NULL,
	[Remind] [varchar](50) NULL,
	[UserNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_user_appointment] PRIMARY KEY CLUSTERED 
(
	[UserAppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_appointment_service]    Script Date: 6/13/2023 9:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_appointment_service](
	[UserAppointmentServiceId] [varchar](36) NOT NULL,
	[UserAppointmentId] [varchar](36) NULL,
	[ServiceId] [varchar](36) NULL,
	[ExpectTime] [int] NULL,
 CONSTRAINT [PK_user_appointment_service] PRIMARY KEY CLUSTERED 
(
	[UserAppointmentServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_token]    Script Date: 6/13/2023 9:32:10 PM ******/
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
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'020b04c8-2cb7-4b7f-9b1e-b58c0eeac974', N'6cd7036a-852e-4d93-b6f8-b93bd6638ece', N'USER_CANCEL', 1683875224327)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'050deed5-78e1-4d37-8b81-bb43ae8bd568', N'ffc54707-655f-4b8f-912e-d13fd4e8cf80', N'DONE', 1686582934810)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'0658efbe-4266-48a6-891f-9b5b70a627a9', N'd361e1d6-95be-4118-9695-0fb988098459', N'RECEIVE', 1686148853554)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'0805a953-9d96-4df3-ae28-a93988ed3477', N'4477659a-91bd-43a2-9923-f94e4dcd4ad0', N'CONFIRM_ARRIVE', 1686329470993)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'096c70c6-a2e2-46bc-9d45-291ac04f4517', N'86270b9b-b2c0-411b-b243-3dccc8a00e31', N'RECEIVE', 1686128183689)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'0b982a48-de62-47fd-ad78-52b2d5acd1aa', N'6217cad2-f544-4626-8a9f-85a9d2dbe7c2', N'RECEIVE', 1684170568997)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'0d2af839-a3e2-4d0f-8ffb-b8598343ba5b', N'203d7f85-157e-4cad-b2c7-a8073894deec', N'RECEIVE', 1686305623806)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'0f9a3bf3-1036-4786-b377-8bf283489ade', N'203d7f85-157e-4cad-b2c7-a8073894deec', N'USER_CANCEL', 1686322318364)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'129a0c6b-86f8-45c2-9234-614990946404', N'6ce70915-70a7-4680-8bef-c3a01c3ca2b9', N'RECEIVE', 1685292307780)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'153263a2-815b-4629-97a3-a4e4f10bf1e2', N'1e99ac8a-b899-48a1-b87d-2e2a896fbd0a', N'RECEIVE', 1683962715945)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'1772ba4f-f5fc-43bb-a64e-c851c466a836', N'cc9a6c1f-7eca-42e9-b65d-f47cbeff6972', N'DONE', 1684126114317)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'191fb475-1b8a-4a5d-a970-5165be669de9', N'a51ad246-60ba-4978-bf7c-6ec4bff8ca34', N'RECEIVE', 1684853993727)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'1bea6752-d40c-4457-99a3-92ae4161ff28', N'ead274b2-58ea-4cdb-938b-7a222782f80b', N'CONFIRM_ARRIVE', 1683962161683)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'1da6dcc9-0e81-46ec-96f3-13d54ca9809a', N'a51ad246-60ba-4978-bf7c-6ec4bff8ca34', N'CONFIRM_ARRIVE', 1684854000131)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'2ad1dbb6-e245-4b50-b664-765fda695308', N'ffc54707-655f-4b8f-912e-d13fd4e8cf80', N'USER_CANCEL', 1686364783471)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'2c077db9-b3c4-4fa9-a111-72b4d4541aac', N'07f27dc2-e3ec-4ef8-ac69-1159fea91d21', N'RECEIVE', 1686306908859)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'2da7c52a-27b8-4a0a-9c1a-7968d92e460d', N'd7d9f4b0-adfa-4470-a6a3-d972bf4edfd2', N'CONFIRM_ARRIVE', 1683962616262)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'2df7ab6c-08db-4762-a75f-42f2c1b4217e', N'16daabb1-6cd1-4290-a355-b4333e76c70c', N'USER_CANCEL', 1685461843757)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'2e45bee2-75fa-4920-8a95-69e1b1a4075b', N'07d26c0e-dd44-4dde-acf3-f21ee7b63b09', N'RECEIVE', 1684169438975)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'35c40b63-6ce1-4532-a86a-c23de0ab1974', N'3a4398f1-0e13-4df6-bd4c-55b7168ef0c0', N'RECEIVE', 1683986367603)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'3649593c-75fa-4607-9d56-d6be0f14bb38', N'6e172aff-cb36-4f7e-9bf1-614896511720', N'DONE', 1686306284648)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'3db44a25-4f7d-4792-89cc-0acdd6e27059', N'8b9b8879-6d07-479e-a4db-d18adadbcd5d', N'RECEIVE', 1684853982282)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'3f7c4579-295d-49a7-876b-414d470bfd59', N'61fb4284-682a-4c35-a644-b95cf5cc3938', N'RECEIVE', 1684999844401)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'4025fd80-9644-48a5-a2e5-308e124339e6', N'ed350ba5-67f8-4bca-983a-ab441c6a5aaf', N'RECEIVE', 1685112929724)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'4068f149-5840-463e-9443-bdc502ddc593', N'ebe56651-42ca-42de-8873-cd0dcfc77319', N'USER_CANCEL', 1684854150328)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'408ab91e-8676-4750-8981-c85e50e26aeb', N'd786622e-afc8-4d25-8c48-141b6686cbf5', N'RECEIVE', 1684125188614)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'409cf640-8bfb-4496-bac7-1e449baf1284', N'cb889f12-ed2c-4f44-84fb-77d5071ad087', N'RECEIVE', 1685462766871)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'4324beb9-e730-4a58-b266-020dd2860f4c', N'ec8a5ed0-8fd6-42a4-95d4-13cb701b94cc', N'USER_CANCEL', 1685503162133)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'44e8198e-87be-47dd-875d-d4fbeed4a357', N'1025fb68-901c-49cb-baec-49ff198a6357', N'RECEIVE', 1684169740229)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'475e9ada-579e-4fe4-a890-0d76abe59d3e', N'0f4f36a9-3925-4939-8d4a-af9c75d68833', N'SYSTEM_CANCEL', 1684854236791)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'489f7e15-2656-4ab6-a2ff-cbf410f6ec35', N'80d9d395-68fb-4437-ab59-cb087b330fba', N'RECEIVE', 1686322015936)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'492e8881-b00d-41cd-a3d8-2c3217be656d', N'd783f273-64e9-4918-b6b8-cf8ddad59079', N'RECEIVE', 1684308485426)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'4b5553bb-7524-4ab0-a828-0b9ed9ec7f91', N'a51ad246-60ba-4978-bf7c-6ec4bff8ca34', N'DONE', 1684854002971)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'4ced7d89-a1cd-4fc9-b1b9-c3985dc899d1', N'2341b7fa-c423-467f-8e71-7dafcec67cd8', N'RECEIVE', 1683867253334)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'4ede8e07-901e-4ce3-b9da-100cde1bda4f', N'6956fedc-11c6-47ce-8a40-ffd427b34484', N'RECEIVE', 1685759674002)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'58db6a00-2f66-4344-a00e-8ac5a545a3e2', N'40c934dc-3bb4-4279-8fe5-682145e8b7ab', N'RECEIVE', 1686322178646)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'59a1263e-d739-4f82-a520-913003a8aac7', N'61fb4284-682a-4c35-a644-b95cf5cc3938', N'CONFIRM_ARRIVE', 1684999852170)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'5cb73937-f3d7-4c7c-a2e0-0b78a2602862', N'd33f34bb-46bc-4e8b-be06-b1514374e361', N'CONFIRM_ARRIVE', 1683985476866)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'5f23475d-bb4b-44e1-b5ae-0c63f77e9adc', N'959301b8-d01b-459c-b117-67ab15c6cbf7', N'RECEIVE', 1683985085179)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'5f81b2cf-53f7-414d-a0dc-e0488cd5f60f', N'306d24c2-84b5-41a3-9764-d16a1353f653', N'RECEIVE', 1685462783170)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'62552f98-5487-43d3-9907-e2d7b6b8ae0c', N'cc596f21-1cdf-4ba0-9085-ee993267623e', N'RECEIVE', 1686333273903)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'62d91a47-9cad-4d0b-9b9a-112b342bd505', N'ead274b2-58ea-4cdb-938b-7a222782f80b', N'DONE', 1683962174919)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'633a1a74-adb4-43d6-baf0-f66eee0e9ae3', N'cc596f21-1cdf-4ba0-9085-ee993267623e', N'DONE', 1686333304771)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'6af18484-c05e-48a8-933e-99681219c2fc', N'd807c6f3-5808-41c4-9d70-1318153a9b05', N'DONE', 1683867201938)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'6b7171a0-0ea6-40d8-9e77-b101de19c9bb', N'd954352b-9ed5-4f4c-af06-f766f6ab30e5', N'CONFIRM_ARRIVE', 1685725464917)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'71c31b33-ef44-40c0-981b-f721ef1e6c72', N'203d7f85-157e-4cad-b2c7-a8073894deec', N'CONFIRM_ARRIVE', 1686305633324)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'77010fde-0ad2-43ef-ab97-05c7e07a047f', N'f61888e3-9b61-458a-a524-2b2562f67b4c', N'RECEIVE', 1685158427544)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'79a2a5ff-3afb-4946-8e24-12501f0fbf04', N'fc4c6f73-c925-464a-8914-b8bb981604ba', N'RECEIVE', 1684169271897)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'7bfa78cf-3797-4d0e-95ed-9a11c2e2e7ce', N'd49c9957-ff91-451a-b60a-b4fd2cf8dd3c', N'RECEIVE', 1683970572327)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'7c9a8c80-8a4c-4f26-9989-1a9a93330b4f', N'a2e20fc4-92df-4059-8421-c53c2fb8071a', N'RECEIVE', 1686152186196)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'7ca515d8-0ab0-4062-82bf-0f34243c51cd', N'cb950807-68e9-4dff-82f8-9e8e95521f46', N'RECEIVE', 1683867727048)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'7d501c89-49e4-4844-ac98-1e46b02e2bab', N'0b0a12b9-f90a-4158-a853-5b1b8a4ce103', N'RECEIVE', 1685758755161)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'7d556bc9-1092-4afa-8e51-f5c282fc1f85', N'3437e75c-810a-42cc-a6ad-6fdbdc23e7fc', N'DONE', 1684290598931)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'7d8ba758-4a47-4796-8b46-e0eabf788cc0', N'cbf6e4f4-f73e-4596-95cc-393cdb5adec7', N'SYSTEM_CANCEL', 1685592658832)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'7df9be12-0bc0-4f8d-91ac-245b1e64e5b5', N'3437e75c-810a-42cc-a6ad-6fdbdc23e7fc', N'CONFIRM_ARRIVE', 1684290593513)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'7e963c5a-c57b-493a-9ff0-55fd73b9eb44', N'109b6c37-f849-4f9f-b141-71d6750e2f3f', N'RECEIVE', 1685760015655)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'7f9e17aa-0a24-4332-b6b3-1f9bd9199f6a', N'd05ac192-b93d-475e-a55f-2ce068899408', N'RECEIVE', 1686364673670)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'8423be66-0ff5-49b7-96e8-e66962388040', N'ed350ba5-67f8-4bca-983a-ab441c6a5aaf', N'DONE', 1685112943394)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'85f6c6f6-5e23-47ee-abef-fa18789c3543', N'ffc54707-655f-4b8f-912e-d13fd4e8cf80', N'RECEIVE', 1686582918053)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'898de63b-0609-4c4d-aceb-a9736352c004', N'1e99ac8a-b899-48a1-b87d-2e2a896fbd0a', N'DONE', 1683962766297)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'8a01226e-5cae-448f-8c3e-efc1e0383d2f', N'dfabc76a-e028-4c4c-b62e-29828a5151e9', N'RECEIVE', 1685760186908)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'8b5876b0-4d0c-4ae3-a344-b3af05dbcbce', N'cb1ba450-4b9a-493e-9299-d630bf7d738e', N'RECEIVE', 1685156754475)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'8d9eec77-d5a6-44cf-969d-cc6127588bf1', N'3437e75c-810a-42cc-a6ad-6fdbdc23e7fc', N'RECEIVE', 1684290581620)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'8f1d5fd7-d135-430a-8342-a6d457ad99a3', N'2beeb8ca-3df8-4bc9-9fff-eaa0ba13ca3e', N'DONE', 1683987169267)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'91c8b9cd-20e9-43d0-8a4f-596df9914656', N'959301b8-d01b-459c-b117-67ab15c6cbf7', N'CONFIRM_ARRIVE', 1683985130013)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'93367448-91dc-4f4d-a9d6-55a2376b4f2c', N'b07779a7-880e-44af-9cdb-b15de5e0f225', N'RECEIVE', 1686309487026)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'94192c6e-acb9-453f-aa3e-a04cb995abb5', N'6e172aff-cb36-4f7e-9bf1-614896511720', N'CONFIRM_ARRIVE', 1686306282035)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'9715335b-e69c-4758-8cb6-b66f3affa406', N'b17dcd5e-3396-49a5-87fe-2699484e34df', N'RECEIVE', 1686128661345)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'97adb557-59e0-46a6-a258-bf91c37ab6ec', N'd49c9957-ff91-451a-b60a-b4fd2cf8dd3c', N'DONE', 1683985048447)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'97d87cac-90c3-4920-9d67-7626c1b238ac', N'd7d9f4b0-adfa-4470-a6a3-d972bf4edfd2', N'RECEIVE', 1683962508720)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'986bbd3b-aef5-4092-89b2-4a38e7a31562', N'ffc54707-655f-4b8f-912e-d13fd4e8cf80', N'CONFIRM_ARRIVE', 1686582929383)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'9a0cfa10-dc08-4a44-9fa7-dc5798653105', N'93fada53-9341-4d4e-8f7f-6c85fc3778fa', N'RECEIVE', 1683947945768)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'9cf1b951-e3d8-4615-aa46-969eb5397588', N'd33f34bb-46bc-4e8b-be06-b1514374e361', N'DONE', 1683985480579)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'9e9a9071-cb7a-4202-881d-459b5c732b5d', N'ec8a5ed0-8fd6-42a4-95d4-13cb701b94cc', N'RECEIVE', 1685422552952)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'a3886151-d580-4b22-bb6a-b9715a89b063', N'd807c6f3-5808-41c4-9d70-1318153a9b05', N'RECEIVE', 1683865496087)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'a48c8b98-2aa1-4a9c-8697-ddaa1e6d5358', N'3a4398f1-0e13-4df6-bd4c-55b7168ef0c0', N'DONE', 1683986378195)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'a508a741-7c25-474e-9751-7ed0333ff077', N'2beeb8ca-3df8-4bc9-9fff-eaa0ba13ca3e', N'RECEIVE', 1683987159010)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'a7e20e9e-4092-40ae-8a01-c78d95a6238b', N'7be17eb6-a307-4e11-b69e-f94ced1d3d23', N'RECEIVE', 1684204231971)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'a7e22e14-9f47-4cd2-899a-fd89ec1e4208', N'd49c9957-ff91-451a-b60a-b4fd2cf8dd3c', N'CONFIRM_ARRIVE', 1683970586182)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'af5bb4bd-0dfd-4887-a6fb-8549cb78e9ce', N'2fa78b6c-3556-4bde-83de-2d92e44e31ed', N'SYSTEM_CANCEL', 1683865491418)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'b022bb91-9cac-48db-81a0-c607c0709ac7', N'd33f34bb-46bc-4e8b-be06-b1514374e361', N'RECEIVE', 1683985472575)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'b2097933-3b67-498e-b73d-0374679ac1e7', N'fd3cc83e-5349-430c-9004-11232da82104', N'DONE', 1686365186458)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'b83c9fb4-c1f0-47b6-b297-3e43375d2604', N'1e99ac8a-b899-48a1-b87d-2e2a896fbd0a', N'CONFIRM_ARRIVE', 1683962735553)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'b8a84310-2436-4a9f-9d6f-ff309803d125', N'9d8507d6-6c6c-481f-a1f5-952f4b32a89f', N'RECEIVE', 1684163753874)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'b96ff652-1646-4284-9610-2e5ad51f908b', N'2f4c1958-b4c7-4db4-8b8b-6b5dc043469b', N'RECEIVE', 1685760264913)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'ba6cdde9-a260-496a-a39f-1ae5776361ce', N'7f9b3d41-2689-4dd6-980e-3f97562bf822', N'CONFIRM_ARRIVE', 1686306384754)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'bab3d0d8-b5a8-418b-8d2b-8399181a8150', N'93fada53-9341-4d4e-8f7f-6c85fc3778fa', N'CONFIRM_ARRIVE', 1683962359388)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'bb0846db-7b4d-439f-8532-e1ea92c00dd9', N'd92840bd-6d11-411e-bb20-f104774fc7b6', N'RECEIVE', 1686360149635)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'bccf0c3b-458e-4a5d-90c5-efa5d497b0c2', N'9f0b703d-2549-424f-97e0-0f8bfe4c6538', N'RECEIVE', 1684143071134)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'bcd65414-9bd5-40d1-865f-06676e57bef4', N'b0e8b7c3-c7b8-4d6b-bfe8-178045a5916e', N'RECEIVE', 1686149876872)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'bf97d6bb-8495-4dba-9dd5-8ee2a82b7b02', N'766c0a3e-602e-47a2-a5a4-474124463509', N'RECEIVE', 1685158484007)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'c300bb48-369d-460f-aa4e-e841bec039ba', N'40c934dc-3bb4-4279-8fe5-682145e8b7ab', N'DONE', 1686322195963)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'c48dbcaf-2883-44db-80df-061572c74643', N'2492a8a3-0146-4c54-a29b-44f06ace8d12', N'RECEIVE', 1686148612037)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'c614ca89-dedd-4efd-b232-3bd5a7527919', N'cc596f21-1cdf-4ba0-9085-ee993267623e', N'CONFIRM_ARRIVE', 1686333291264)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'cf1daccd-d8c1-4bbd-bbb1-b7f50d26e4c9', N'fd3cc83e-5349-430c-9004-11232da82104', N'RECEIVE', 1686365146608)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'cf79ae58-4093-493f-9780-55a3cd5ed1a1', N'7f9b3d41-2689-4dd6-980e-3f97562bf822', N'RECEIVE', 1686306369031)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'd1968e78-024c-4e8a-918b-a6d5de41be2f', N'cb950807-68e9-4dff-82f8-9e8e95521f46', N'DONE', 1683947961301)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'd324ebfe-b8d3-4e88-8794-7fb2a7933db0', N'fd3cc83e-5349-430c-9004-11232da82104', N'CONFIRM_ARRIVE', 1686365180919)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'd69f18bf-effe-466b-a695-2d5a8eef7a4f', N'ce938ed1-7e2f-435e-a38b-993c6f6b6572', N'USER_CANCEL', 1685508448959)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'd6f123ec-131b-48e5-9426-57184dbfa413', N'570332c1-ec79-405e-a094-1ce66f460a3f', N'RECEIVE', 1684170265835)
GO
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'd712889a-e379-40ab-88e4-67ae2382c011', N'ead274b2-58ea-4cdb-938b-7a222782f80b', N'RECEIVE', 1683961943158)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'd866ced3-1eee-4944-aaa2-87cb248f214d', N'40c934dc-3bb4-4279-8fe5-682145e8b7ab', N'CONFIRM_ARRIVE', 1686322189376)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'dba11298-658b-43b9-9fbb-6e47bf3c36c1', N'289d704e-c388-4f04-8b46-36e160286e9b', N'DONE', 1686365274091)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'df9cf5d2-4176-448d-ba24-901a324c83bb', N'040c22b3-e0d2-4d9b-984c-6f9888397fc0', N'USER_CANCEL', 1685544645692)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'e0b9f7f5-b401-4313-ae65-dc56a115240d', N'66fafe55-4e5b-4493-b06d-2f53268da350', N'RECEIVE', 1684854243011)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'e328f153-ef25-4447-9eaa-09367192a90b', N'ce90773b-079e-40d6-92f7-cc54fef5ae52', N'RECEIVE', 1685374937854)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'e3e55c8a-6f8a-46fe-a4c1-5445f6b80feb', N'dd3ea5a1-29f8-4217-9b62-5fa47eb8cc73', N'RECEIVE', 1683962602014)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'e6a25a68-137d-45b6-a394-dd3dda40fddf', N'cc9a6c1f-7eca-42e9-b65d-f47cbeff6972', N'RECEIVE', 1684125547582)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'e8e270d6-d811-406e-ad52-a9472e019f92', N'6e172aff-cb36-4f7e-9bf1-614896511720', N'RECEIVE', 1686306274193)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'eccbb04b-23fd-4fc5-b480-b8bd31f77f1f', N'3a4398f1-0e13-4df6-bd4c-55b7168ef0c0', N'CONFIRM_ARRIVE', 1683986374180)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'ed2e91c7-3b52-420f-9226-c60847779499', N'2beeb8ca-3df8-4bc9-9fff-eaa0ba13ca3e', N'CONFIRM_ARRIVE', 1683987165564)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'ef8bd19e-eb2e-4ec1-b21c-988a7a6fca90', N'cc9a6c1f-7eca-42e9-b65d-f47cbeff6972', N'CONFIRM_ARRIVE', 1684126105346)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'f6717773-0789-46af-83ff-2af213a29161', N'ed350ba5-67f8-4bca-983a-ab441c6a5aaf', N'CONFIRM_ARRIVE', 1685112940220)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'f9070ce9-98a7-4d5a-a771-bcbaa2adeeb0', N'959301b8-d01b-459c-b117-67ab15c6cbf7', N'DONE', 1683985133842)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'f942139a-1a16-4722-9251-d9bd7d578ee8', N'192e16ad-064d-4491-90cb-dfd24baaa2d5', N'RECEIVE', 1684169339829)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'f9f366ea-538d-47af-b89c-5e9d6802843c', N'61fb4284-682a-4c35-a644-b95cf5cc3938', N'DONE', 1684999855881)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'fb48c2b4-b770-4eca-a3cd-3c75e4fa13b9', N'16c110f0-9e63-4c91-bd0a-87029fe7c076', N'RECEIVE', 1685158754679)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'fc2feb73-d3c2-4664-a502-586d60591cf2', N'4477659a-91bd-43a2-9923-f94e4dcd4ad0', N'RECEIVE', 1686329417757)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'ff6b2e46-4fcc-4767-80e2-7f43a4009af9', N'e397eb1d-0899-4eac-ae7d-06db1f931504', N'RECEIVE', 1686129071831)
INSERT [dbo].[appointment_status] ([AppointmentStatusId], [UserAppointmentId], [Status], [CreateTime]) VALUES (N'ff74a771-7c69-464b-8eb1-9cc623da250b', N'd954352b-9ed5-4f4c-af06-f766f6ab30e5', N'RECEIVE', 1685725452445)
GO
SET IDENTITY_INSERT [dbo].[customer_feedback] ON 

INSERT [dbo].[customer_feedback] ([CustomerFeedbackId], [CustomerName], [Avatar], [Contents]) VALUES (1, N'Phương Thảo', N'/files/avatar/be21516a-baee-4d6d-91c7-5aca49651611.jpg', N'Tẩy trắng răng bằng laser là việc thoa thuốc làm trắng vào bề mặt răng, sau đó sử dụng ánh sáng laser chiếu xạ sâu vào cấu trúc răng nhằm hoạt hóa thuốc tẩy trắng giúp răng trắng và sáng hơn.')
INSERT [dbo].[customer_feedback] ([CustomerFeedbackId], [CustomerName], [Avatar], [Contents]) VALUES (2, N'Mai Linh', N'/files/avatar/4de36cc1-8116-47c1-8503-51bba56949c8.jpg', N'Về mặt bản chất, tia laser không có hề có tác dụng tẩy trắng mà chỉ thúc đẩy hoạt động của thuốc tẩy trắng răng. Bởi vậy, nếu không sử dụng thuốc tẩy trắng răng trước khi chiếu tia laser, phương pháp này không mang lại hiệu quả tẩy trắng răng như mong đợi.')
INSERT [dbo].[customer_feedback] ([CustomerFeedbackId], [CustomerName], [Avatar], [Contents]) VALUES (3, N'Phương Anh', N'/files/avatar/165b7c31-9058-4f9f-a3b1-47f88e738230.jpg', N'Hiện nay, phương pháp làm răng trắng bằng đèn hợp quang chiếu ánh sáng xanh là phương pháp được các chuyên gia đánh giá cao  về mức độ hiệu quả lẫn tính an toàn ở thời điểm hiện tại.')
SET IDENTITY_INSERT [dbo].[customer_feedback] OFF
GO
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Qualification], [Avatar], [Enable], [CreateTime]) VALUES (N'154d7e36-ae63-4f96-a08e-c59deafa8d64', N'Bác sĩ Nguyễn Hồng Quân', N'Bac si Nguyen Hong Quan', N'<p>L&agrave; b&aacute;c sĩ trưởng tại cơ sở 24 Trần Duy Hưng, b&aacute;c sĩ Nguyễn Hồng Qu&acirc;n lu&ocirc;n lu&ocirc;n nỗ lực để đem lại h&agrave;m răng chắc khỏe nhất, đẹp nhất cho mỗi kh&aacute;ch h&agrave;ng của m&igrave;nh. Kh&ocirc;ng chỉ tham gia c&aacute;c kh&oacute;a học đ&agrave;o tạo n&acirc;ng cao chuy&ecirc;n m&ocirc;n trong nước, b&aacute;c sĩ Qu&acirc;n c&ograve;n chủ động học tập c&aacute;c kĩ thuật nha khoa hiện đại bậc nhất tr&ecirc;n thế giới.</p>
', N'Implant nha khoa, phục hình', N'/files/doctor/77010d1b-a1e0-4261-8778-bdf071ea1c9a.jpg', 1, 0)
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Qualification], [Avatar], [Enable], [CreateTime]) VALUES (N'1d3bc730-c434-4b3e-af0e-4e40fd6f8c6f', N'Bác sĩ Tuấn', N'Bac si Tuan', N'<p>L&agrave; b&aacute;c sĩ trưởng tại cơ sở 24 Trần Duy Hưng, b&aacute;c sĩ Tuấn&nbsp;lu&ocirc;n lu&ocirc;n nỗ lực để đem lại h&agrave;m răng chắc khỏe nhất, đẹp nhất cho mỗi kh&aacute;ch h&agrave;ng của m&igrave;nh. Kh&ocirc;ng chỉ tham gia c&aacute;c kh&oacute;a học đ&agrave;o tạo n&acirc;ng cao chuy&ecirc;n m&ocirc;n trong nước, b&aacute;c sĩ Tuấn&nbsp;c&ograve;n chủ động học tập c&aacute;c kĩ thuật nha khoa hiện đại bậc nhất tr&ecirc;n thế giới.</p>
', N'Implant nha khoa, nha khoa thẩm mỹ', N'/files/doctor/7a39ef5a-dd72-4536-b7b4-13b6a70891b5.jpg', 1, 1683344858669)
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Qualification], [Avatar], [Enable], [CreateTime]) VALUES (N'27ceffae-8c1b-4e1a-ba0a-f3e4ed894385', N'Bác sĩ Phạm Văn Tú', N'Bac si Pham Van Tu', N'<p>Sau qu&aacute; tr&igrave;nh học tập v&agrave; tu nghiệp tại Nga, b&aacute;c sĩ Phạm Văn T&uacute; trở về Việt Nam v&agrave; l&agrave;m việc. Với những kiến thức v&agrave; kinh nghiệm t&iacute;ch lũy, b&aacute;c sĩ T&uacute; đ&atilde; gi&uacute;p rất nhiều kh&aacute;ch h&agrave;ng tự tin hơn với nụ cười của m&igrave;nh. B&aacute;c sĩ T&uacute; hiện đang l&agrave; b&aacute;c sĩ trưởng tại cơ sở 69 Trần Đăng Ninh.</p>
', N'Chuyên về niềng răng', N'/files/doctor/79a51078-de9a-4f19-a3b8-ea23e81e239e.jpg', 1, 1682477737347)
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Qualification], [Avatar], [Enable], [CreateTime]) VALUES (N'3eddd1ee-cfa7-4926-9914-d67146104699', N'Bác sĩ Nguyễn Thị Quỳnh', N'Bac si Nguyen Thi Quynh', N'<p>B&aacute;c sĩ Quỳnh Nguyễn với tr&ecirc;n 10 năm kinh nghiệm trong lĩnh vực chỉnh nha hiện đang điều trị tr&ecirc;n 1.000 ca l&acirc;m s&agrave;ng. Trong qu&aacute; tr&igrave;nh học tập v&agrave; tu nghiệp tại c&aacute;c trường đại học trong v&agrave; ngo&agrave;i nước, b&aacute;c sĩ Quỳnh đ&atilde; đạt được nhiều chứng chỉ quan trọng trong đ&oacute; phải kể đến chứng nhận Platium chỉnh nha khay trong suốt Invisalign. Với mong muốn đem lại những trải nghiệm dịch vụ v&agrave; kết quả tốt nhất cho kh&aacute;ch h&agrave;ng, b&aacute;c sĩ Quỳnh kh&ocirc;ng ngừng học hỏi những phương ph&aacute;p, kỹ thuật chỉnh nha hiện đại nhất.</p>
', N'Nha khoa tổng quát, nội nha', N'/files/doctor/060336c2-aefe-4871-b1d5-bb701db478a5.jpg', 1, 1683344929958)
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Qualification], [Avatar], [Enable], [CreateTime]) VALUES (N'813ec3ce-9ea7-4ab8-b311-65be0e18a244', N'Bác sĩ Hoàng Văn Tùng', N'Bac si Hoang Van Tung', N'<p>B&aacute;c sĩ Ho&agrave;ng Văn T&ugrave;ng l&agrave; b&aacute;c sĩ gi&agrave;u kinh nghiệm v&agrave; c&oacute; chuy&ecirc;n m&ocirc;n cao . Tốt nghiệp chuy&ecirc;n ng&agrave;nh b&aacute;c sĩ Răng h&agrave;m mặt tại Đại học Y H&agrave; Nội sau đ&oacute; tiếp tục tu nghiệp tại đất nước Nga với nền nha khoa ph&aacute;t triển. Tại đ&acirc;y, b&aacute;c sĩ T&ugrave;ng đ&atilde; nhận chứng chỉ B&aacute;c sĩ chuy&ecirc;n khoa tại Học viện Y khoa Quốc Gia VORONEZ mang t&ecirc;n N.N.Burdenko. Với gần 20 năm kinh nghiệm, b&aacute;c sĩ T&ugrave;ng hiện l&agrave; b&aacute;c sĩ trưởng tại cơ sở số 06 Th&aacute;i H&agrave;.</p>
', N'Phẫu thuật trong miệng và định hình chỉnh nha', N'/files/doctor/7dd6f21f-4172-49c6-83c2-970266ed2446.jpg', 1, 0)
INSERT [dbo].[doctor] ([DoctorId], [Name], [SearchName], [Description], [Qualification], [Avatar], [Enable], [CreateTime]) VALUES (N'b1f5f895-0fdc-4e59-a12c-d3d70a70f558', N'Bác sĩ Lê Thị Thúy', N'Bac si Le Thi Thuy', N'<p>Tốt nghiệp Đại Học Y H&agrave; Nội chuy&ecirc;n khoa Răng h&agrave;m mặt. Sau khi ra trường, b&aacute;c sĩ Th&uacute;y lựa chọn Nha khoa Quốc tế&nbsp; để l&agrave;m việc. L&agrave; một m&ocirc;i trường tốt n&ecirc;n b&aacute;c sĩ c&oacute; cơ hội học hỏi thực tế từ c&aacute;c b&aacute;c sĩ chuy&ecirc;n m&ocirc;n, gi&agrave;u kinh nghiệm. B&ecirc;n cạnh đ&oacute;, b&aacute;c sĩ thường xuy&ecirc;n học c&aacute;c kh&oacute;a đ&agrave;o tạo từ c&aacute;c trung t&acirc;m nha khoa uy t&iacute;n trong v&agrave; ngo&agrave;i nước.</p>
', N'Chuyên răng trẻ em', N'/files/doctor/9b4962f5-e12e-435f-91d8-ef1b0b7520cb.jpg', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (4, N'Back to school - Ưu đãi cực cool', NULL, NULL, N'Hãy chào đón năm học mới với nụ cười thật tươi, tự tin đón những điều tốt đẹp sắp tới. Từ 01/08/2022 đến 31/08/2022, Nha khoa Quốc tế Việt Đức gửi tới quý khách hàng chương trình ưu đãi đặc biệt.', N'/files/news/a69f91fc-5f3e-4d41-9d26-d0e7a5b5c586.jpg', N'<p>TẶNG TỚI 30% CHO 20 KH&Aacute;CH H&Agrave;NG ĐĂNG K&Yacute; ĐẶT LỊCH SỚM NHẤT</p>

<p><img alt="" height="402" src="https://static.nhakhoavietduc.com.vn/2022/08/02/uu-dai-thang-8-2.jpg" width="600" /></p>

<p>ƯU Đ&Atilde;I NHỔ RĂNG KH&Ocirc;N&nbsp;ĐỒNG GI&Aacute; 1 TRIỆU/ ĐỒNG&nbsp;V&Agrave;O THỨ 3 H&Agrave;NG TUẦN.</p>

<p>Ưu đ&atilde;i 30%&nbsp;cho kh&aacute;ch h&agrave;ng TẨY TRẮNG RĂNG</p>

<p>Ưu đ&atilde;i 30%&nbsp;cho kh&aacute;ch h&agrave;ng CẮT LỢI THẨM MỸ</p>

<p>Ưu đ&atilde;i 20%&nbsp;NIỀNG RĂNG&nbsp;cho kh&aacute;ch h&agrave;ng l&agrave; học sinh, sinh vi&ecirc;n.</p>

<p>Ưu đ&atilde;i 15%&nbsp;cho kh&aacute;ch h&agrave;ng BỌC RĂNG SỨ CAO CẤP</p>

<p>Ưu đ&atilde;i 15%&nbsp;cho kh&aacute;ch h&agrave;ng CẤY RĂNG IMPLANT</p>

<p>Mỗi kh&aacute;ch h&agrave;ng khi quyết định lựa chọn Nha khoa Quốc tế Việt Đức l&agrave; đ&atilde; quyết định trao trọn niềm tin cho ch&uacute;ng t&ocirc;i.</p>

<p>V&agrave;&nbsp;<a href="https://nhakhoavietduc.com.vn/chung-toi-la-ai"><strong>Nha khoa Quốc tế Việt Đức</strong></a>&nbsp;tự h&agrave;o mang lại nụ cười ki&ecirc;u h&atilde;nh cho tất cả kh&aacute;ch h&agrave;ng th&acirc;n y&ecirc;u!</p>

<p>Hơn 17 năm h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển, Nha khoa Quốc tế Việt Đức l&agrave; một trong số &iacute;t những nha khoa đạt chuẩn quốc tế với hệ thống nha khoa lớn mạnh trải d&agrave;i từ Bắc v&agrave;o Nam.</p>

<p>Với mục ti&ecirc;u x&acirc;y dựng hệ thống nha khoa chất lượng cao, mang đến cho kh&aacute;ch h&agrave;ng những dịch vụ tốt nhất đạt ti&ecirc;u chuẩn quốc tế, Nha khoa Quốc tế Việt Đức đ&atilde; quy tụ đội ngũ y b&aacute;c sĩ c&oacute; tr&igrave;nh độ chuy&ecirc;n m&ocirc;n cao được dẫn dắt bởi Ts. B&aacute;c sĩ Trịnh Đức Mậu - B&agrave;n tay v&agrave;ng Nha khoa Việt Nam. C&aacute;c b&aacute;c sĩ đều được đ&agrave;o tạo tu nghiệp trong v&agrave; ngo&agrave;i nước, gi&agrave;u kinh nghiệm ở cả hai lĩnh vực nha khoa v&agrave; thẩm mỹ. Đồng thời Nha khoa Quốc tế Việt Đức cũng trang bị những c&ocirc;ng nghệ, m&aacute;y m&oacute;c ti&ecirc;n tiến hiện đại nhất, đảm bảo quy tr&igrave;nh thực hiện hiệu quả, an to&agrave;n v&agrave; tăng th&ecirc;m nhiều lợi &iacute;ch cho kh&aacute;ch h&agrave;ng.</p>

<p><img alt="" height="399" src="https://static.nhakhoavietduc.com.vn/2022/07/07/nha-khoa-chat-luong-4.jpg" width="600" /></p>

<p>Nha khoa kết hợp ph&aacute;t triển h&agrave;i h&ograve;a giữa nha khoa v&agrave; thẩm mỹ l&agrave; đi&ecirc;̉m mạnh khác của Nha khoa Qu&ocirc;́c t&ecirc;́ Vi&ecirc;̣t Đức với những nha khoa khác.&nbsp; Sự k&ecirc;́t hợp giữa nha khoa v&agrave; thẩm mỹ kh&ocirc;ng chỉ mang đến cho kh&aacute;ch h&agrave;ng h&agrave;m răng chắc khỏe, v&agrave; c&ograve;n kiến tạo nụ cười đẹp ph&ugrave; hợp với từng khu&ocirc;n mặt th&ocirc;ng qua t&aacute;c động điều chỉnh cung h&agrave;m, đưa khu&ocirc;n mặt về tỉ lệ chuẩn, c&acirc;n đối.</p>

<p>Nha khoa quốc tế Việt Đức đ&atilde; thiết kế v&agrave; kiến tạo th&agrave;nh c&ocirc;ng hơn 30.000 nụ cười qua c&aacute;c dịch vụ: Niềng răng tạo cằm Vline- Đẹp bền vững, kh&ocirc;ng phải phẫu thuật; Bọc răng sứ c&ocirc;ng nghệ Nano Ceramic- Tạo nụ cười tự nhi&ecirc;n, kh&ocirc;ng x&acirc;m lấn, kh&ocirc;ng đau&hellip;</p>

<p><img alt="" height="399" src="https://static.nhakhoavietduc.com.vn/2022/07/07/nha-khoa-chat-luong-3.jpg" width="600" /></p>
', 0, 1)
INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (5, N'Phòng khám thông báo lịch nghỉ lễ', NULL, N'Phong kham thong bao lich nghi le', N'Nghỉ lễ 30/4 -1/5', N'/files/news/be3f93d7-ce76-4530-a9d7-05fb85029f40.jpg', N'<p>Đ&acirc;y l&agrave; nội dung</p>
', 1683185871719, 1)
INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (8, N'Nụ cười đẹp giúp chinh phục đỉnh cao', NULL, N'Phong kham nha khoa Phuong Thao', N'Nụ cười rạng rỡ, khỏe đẹp không chỉ mang ý nghĩa chức năng mà còn là ngôn ngữ giao tiếp, kết nối thế giới, cánh cửa của thành công. ', N'/files/news/90b42752-af55-49d6-a584-40afc2a56d5f.jpg', N'<p>Một vẻ ngo&agrave;i chỉn chu, một phong th&aacute;i chuy&ecirc;n nghiệp l&agrave;m n&ecirc;n những thương vụ bạc tỷ, v&agrave; điều khiến họ c&agrave;ng quyền lực hơn đ&oacute; ch&iacute;nh l&agrave; khu&ocirc;n miệng lu&ocirc;n nở nụ cười của sự lịch thiệp, hiếu kh&aacute;ch v&agrave; th&ocirc;ng th&aacute;i. Đ&oacute; ch&iacute;nh l&agrave; &ldquo;sức mạnh mềm&rdquo; gi&uacute;p c&aacute;c doanh nh&acirc;n ng&agrave;y c&agrave;ng th&agrave;nh c&ocirc;ng.</p>

<p><img alt="" height="900" src="https://static.nhakhoavietduc.com.vn/2022/10/26/doanh-nhan-2.jpg" width="598" /></p>

<p>L&agrave; một phụ nữ hiện đại, th&ocirc;ng minh, chị Th&uacute;y Anh rất coi trọng &ldquo;sức mạnh&rdquo; của nụ cười. V&agrave; chị cũng l&agrave; người y&ecirc;u c&aacute;i đẹp, đặt ra nhiều ti&ecirc;u chuẩn k&eacute;p cho nụ cười mới của m&igrave;nh.</p>

<p>&ldquo;M&igrave;nh kh&aacute; kh&oacute; t&iacute;nh trong việc lựa chọn nha khoa cho gia đ&igrave;nh. M&igrave;nh t&igrave;m hiểu rất l&acirc;u v&agrave; quyết định chọn Nha khoa Quốc tế Việt Đức cho 2 b&eacute; nh&agrave; m&igrave;nh niềng răng từ sớm. Rồi con niềng răng đẹp qu&aacute;, bố mẹ cũng l&agrave;m răng sứ lu&ocirc;n. Sau khi l&agrave;m răng sứ m&igrave;nh rất h&agrave;i l&ograve;ng chất lượng dịch vụ tại đ&acirc;y.&rdquo;</p>

<p><img alt="" height="600" src="https://static.nhakhoavietduc.com.vn/2022/10/26/doanh-nhan-3.jpg" width="600" /></p>

<p><img alt="" height="600" src="https://static.nhakhoavietduc.com.vn/2022/10/26/doanh-nhan-4.jpg" width="600" /></p>

<p><img alt="" height="600" src="https://static.nhakhoavietduc.com.vn/2022/10/26/doanh-nhan-5.jpg" width="600" /></p>

<p>V&agrave; c&aacute;c b&aacute;c sĩ tại Nha khoa Quốc tế Việt Đức đ&atilde; kh&ocirc;ng l&agrave;m chị thất vọng.</p>

<p><strong>Nha khoa Quốc tế Việt Đức - Nơi kiến tạo nụ cười đẹp</strong></p>

<p>Nha khoa Quốc tế Việt Đức l&agrave; một trong những trung t&acirc;m nha khoa top đầu Việt Nam với đội ngũ chuy&ecirc;n gia, y b&aacute;c sĩ đầu ng&agrave;nh được dẫn dắt bởi TS.BS Trịnh Đức Mậu c&ugrave;ng trang thiết bị y tế ti&ecirc;n tiến theo ti&ecirc;u chuẩn quốc tế với hệ thống nha khoa trải d&agrave;i từ Bắc v&agrave;o Nam.</p>

<p>Mỗi sản phẩm răng sứ tại Nha khoa Quốc tế Việt Đức đều được tạo n&ecirc;n bởi sự kết hợp h&agrave;i h&ograve;a giữa c&ocirc;ng nghệ hiện đại c&ugrave;ng với b&agrave;n tay tinh tế t&agrave;i hoa của người chế t&aacute;c. Mỗi chiếc răng sứ xinh xinh đều chứa đựng t&acirc;m huyết của đội ngũ y b&aacute;c sĩ, kĩ thuật vi&ecirc;n chuy&ecirc;n nghiệp tại Nha khoa Quốc tế Việt Đức Thiết kế nụ cười DSD (Digital Smile Design) cho ph&eacute;p thiết kế form răng đẹp tự nhi&ecirc;n, h&agrave;i h&ograve;a với gương mặt.</p>

<p>Sắc sứ trong, độ thấu quang tốt, y như răng thật. Tương th&iacute;ch sinh học cao, độ bền gấp 5 lần răng thật. Chất liệu sứ cao cấp, kh&ocirc;ng lưu mảng b&aacute;m, dễ d&agrave;ng vệ sinh.</p>

<p>Tất cả tạo n&ecirc;n nụ cười tự nhi&ecirc;n nhất, đẹp nhất cho kh&aacute;ch h&agrave;ng!</p>
', 1683186165847, 1)
INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (9, N'Tự tin hơn - Hạnh phúc hơn', NULL, N'test', N'Mỗi phụ nữ đều xứng đáng được nhận những điều tốt đẹp nhất! Nhân ngày 8/3, Nha khoa Phương Thảo gửi tới quý khách hàng chương trình ưu đãi đặc biệt tới 30%', N'/files/news/46bf1da1-4e77-4927-b848-87e8ddd48656.jpg', N'<p>Xinh đẹp, dịu d&agrave;ng, mang một tr&aacute;i tim ấm &aacute;p v&agrave; trở th&agrave;nh một phần kh&ocirc;ng thể thiếu của thế giới. Trong x&atilde; hội hiện đại, người phụ nữ ng&agrave;y c&agrave;ng khẳng định m&igrave;nh, tr&acirc;n trọng bản th&acirc;n, lu&ocirc;n tỏa s&aacute;ng rực rỡ tạo n&ecirc;n nhiều gi&aacute; trị tuyệt vời cho cuộc sống.&nbsp;</p>

<p>Người phụ nữ tự tin lu&ocirc;n biết c&aacute;ch mang đến cho m&igrave;nh cuộc sống hạnh ph&uacute;c!</p>

<p><img alt="" height="400" src="https://static.nhakhoavietduc.com.vn/2023/03/10/8-3-web-2.jpg" width="600" /></p>

<p>Nh&acirc;n ng&agrave;y Quốc tế Phụ nữ 8/3, Nha khoa Quốc tế Việt Đức gửi tới qu&yacute; kh&aacute;ch h&agrave;ng chương tr&igrave;nh ưu đ&atilde;i đặc biệt tới 30% cho 20 kh&aacute;ch h&agrave;ng đăng k&yacute; v&agrave; đặt lịch sớm nhất từ&nbsp;03/03 &ndash; 31/03/2023:</p>

<p>TẶNG 30%&nbsp;cho kh&aacute;ch h&agrave;ng NHỔ RĂNG KH&Ocirc;N</p>

<p>TẶNG 30%&nbsp;cho kh&aacute;ch h&agrave;ng TẨY TRẮNG RĂNG</p>

<p>TẶNG 20%&nbsp;cho kh&aacute;ch h&agrave;ng NIỀNG RĂNG</p>

<p>TẶNG 10%&nbsp;cho kh&aacute;ch h&agrave;ng BỌC RĂNG SỨ CAO CẤP</p>

<p>TẶNG 10%&nbsp;cho kh&aacute;ch h&agrave;ng CẤY RĂNG IMPLANT</p>

<p>Mỗi kh&aacute;ch h&agrave;ng khi quyết định lựa chọn Nha khoa Quốc tế Việt Đức l&agrave; đ&atilde; quyết định trao trọn niềm tin cho ch&uacute;ng t&ocirc;i.</p>

<p>V&agrave;&nbsp;<a href="https://nhakhoavietduc.com.vn/chung-toi-la-ai"><strong>Nha khoa Quốc tế Việt Đức</strong></a>&nbsp;tự h&agrave;o mang lại nụ cười ki&ecirc;u h&atilde;nh cho tất cả kh&aacute;ch h&agrave;ng th&acirc;n y&ecirc;u!</p>

<p>Gần 20 năm h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển, Nha khoa Quốc tế Việt Đức l&agrave; một trong số &iacute;t những nha khoa đạt chuẩn quốc tế với hệ thống nha khoa lớn mạnh trải d&agrave;i từ Bắc v&agrave;o Nam.</p>

<p>Với mục ti&ecirc;u x&acirc;y dựng hệ thống nha khoa chất lượng cao, mang đến cho kh&aacute;ch h&agrave;ng những dịch vụ tốt nhất đạt ti&ecirc;u chuẩn quốc tế, Nha khoa Quốc tế Việt Đức đ&atilde; quy tụ đội ngũ y b&aacute;c sĩ c&oacute; tr&igrave;nh độ chuy&ecirc;n m&ocirc;n cao được dẫn dắt bởi Ts. B&aacute;c sĩ Trịnh Đức Mậu - B&agrave;n tay v&agrave;ng Nha khoa Việt Nam. C&aacute;c b&aacute;c sĩ đều được đ&agrave;o tạo tu nghiệp trong v&agrave; ngo&agrave;i nước, gi&agrave;u kinh nghiệm ở cả hai lĩnh vực nha khoa v&agrave; thẩm mỹ. Đồng thời Nha khoa Quốc tế Việt Đức cũng trang bị những c&ocirc;ng nghệ, m&aacute;y m&oacute;c ti&ecirc;n tiến hiện đại nhất, đảm bảo quy tr&igrave;nh thực hiện hiệu quả, an to&agrave;n v&agrave; tăng th&ecirc;m nhiều lợi &iacute;ch cho kh&aacute;ch h&agrave;ng.</p>

<p><img alt="" height="399" src="https://static.nhakhoavietduc.com.vn/2022/07/07/nha-khoa-chat-luong-4.jpg" width="600" /></p>

<p>Nha khoa kết hợp ph&aacute;t triển h&agrave;i h&ograve;a giữa nha khoa v&agrave; thẩm mỹ l&agrave; đi&ecirc;̉m mạnh khác của Nha khoa Qu&ocirc;́c t&ecirc;́ Vi&ecirc;̣t Đức với những nha khoa khác.&nbsp; Sự k&ecirc;́t hợp giữa nha khoa v&agrave; thẩm mỹ kh&ocirc;ng chỉ mang đến cho kh&aacute;ch h&agrave;ng h&agrave;m răng chắc khỏe, v&agrave; c&ograve;n kiến tạo nụ cười đẹp ph&ugrave; hợp với từng khu&ocirc;n mặt th&ocirc;ng qua t&aacute;c động điều chỉnh cung h&agrave;m, đưa khu&ocirc;n mặt về tỉ lệ chuẩn, c&acirc;n đối.</p>

<p>Nha khoa quốc tế Việt Đức đ&atilde; thiết kế v&agrave; kiến tạo th&agrave;nh c&ocirc;ng hơn 30.000 nụ cười qua c&aacute;c dịch vụ: Niềng răng tạo cằm Vline- Đẹp bền vững, kh&ocirc;ng phải phẫu thuật; Bọc răng sứ c&ocirc;ng nghệ Nano Ceramic- Tạo nụ cười tự nhi&ecirc;n, kh&ocirc;ng x&acirc;m lấn, kh&ocirc;ng đau&hellip;</p>

<p><img alt="" height="399" src="https://static.nhakhoavietduc.com.vn/2022/07/07/nha-khoa-chat-luong-3.jpg" width="600" /></p>
', 1683213426475, 1)
INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (10, N'"Nụ cười tiền tỷ" và sự thật', NULL, N'Nu cuoi tien ty  va su that', N'Sức khỏe răng miệng là rất quý. Hàm răng của tôi hôm nay hơn tỷ chứ 10 tỷ tôi cũng làm.', N'/files/news/3cfb3103-8b39-4835-9393-f72f2bbf5836.jpg', N'<p>Mỗi kh&aacute;ch h&agrave;ng đến với Nha khoa Quốc tế Việt Đức l&agrave; một c&acirc;u chuyện riệng.</p>

<p><img alt="" height="600" src="https://static.nhakhoavietduc.com.vn/2022/07/untitled%20folder/cau-chuyen-chu-bich-1.jpg" width="600" /></p>

<p>Ch&uacute; B&iacute;ch (Vũng T&agrave;u) hơn 30 năm mất răng to&agrave;n h&agrave;m, phải sử dụng h&agrave;m th&aacute;o lắp n&ecirc;n việc ăn uống v&ocirc; c&ugrave;ng kh&oacute; khăn, hầu như đều phải ăn đồ xay nhuyễn. Ch&uacute; B&iacute;ch t&acirc;m sự:</p>

<p>&ldquo;V&igrave; kh&ocirc;ng biết Trung t&acirc;m Nha khoa Quốc tế Việt Đức n&agrave;y m&agrave; t&ocirc;i khổ sở mấy chục năm nay. T&ocirc;i mất răng hơn 30 năm nay rồi, khổ sở v&ocirc; c&ugrave;ng. N&oacute;i mọi người kh&ocirc;ng tin chứ mấy chục năm đi đ&acirc;u cũng mang theo m&aacute;y xay b&ecirc;n người để xay nhỏ đồ ăn ra, c&oacute; ăn được đ&acirc;u, to&agrave;n nuốt chửng, khổ v&ocirc; c&ugrave;ng.</p>

<p>Lại c&oacute; bệnh tiểu đường v&agrave; huyết &aacute;p cao hơn 20 năm nay n&ecirc;n đi kh&aacute;m nhiều nơi ở Vũng T&agrave;u kh&ocirc;ng đ&acirc;u d&aacute;m l&agrave;m.&nbsp;</p>

<p>May c&oacute; bạn t&ocirc;i l&agrave; Gi&aacute;o sư Tuấn Anh v&agrave;o Vũng T&agrave;u, gặp t&ocirc;i, thấy t&igrave;nh trạng t&ocirc;i như vậy, bảo t&ocirc;i ra H&agrave; Nội gặp b&aacute;c sĩ Mậu ngay. Nghe n&oacute;i c&oacute; người c&oacute; thể gi&uacute;p được m&igrave;nh, t&ocirc;i mừng v&ocirc; c&ugrave;ng, ngay ng&agrave;y h&ocirc;m sau thu xếp ra H&agrave; Nội. Sau khi b&aacute;c sĩ Mậu kh&aacute;m, chụp phim c&aacute;c thứ t&ocirc;i mới biết m&igrave;nh bị vỡ 1 mảnh xương h&agrave;m do trước đ&acirc;y nhổ răng. T&ocirc;i quyết định theo lộ tr&igrave;nh điều trị của b&aacute;c sĩ, trồng răng.</p>

<p>Chỉ sau 1 th&aacute;ng, m&agrave; t&ocirc;i thay đổi ho&agrave;n to&agrave;n. T&ocirc;i ăn tất cả những đồ g&igrave; cứng nhất, ăn hết cả 1 con g&agrave; m&agrave; t&agrave;i xế 31 tuổi của t&ocirc;i cũng kh&ocirc;ng nhai được, m&agrave; t&ocirc;i ăn được. Mừng v&ocirc; c&ugrave;ng. Sau 1 th&aacute;ng t&ocirc;i tăng chục c&acirc;n. Trước đ&acirc;y nh&igrave;n t&ocirc;i gi&agrave;, gầy, xấu, giờ t&ocirc;i kh&aacute;c ho&agrave;n to&agrave;n rồi.</p>

<p>N&ecirc;n t&ocirc;i khuy&ecirc;n mọi người một c&acirc;u ch&acirc;n th&agrave;nh, c&oacute; bệnh về răng th&igrave; l&agrave;m ngay đi, l&agrave;m lu&ocirc;n đi. Đừng tiếc g&igrave; cả, kh&ocirc;ng g&igrave; bằng sức khỏe của m&igrave;nh. t&ocirc;i n&oacute;i với c&aacute;c con t&ocirc;i, cuộc đời bố giờ chẳng c&ograve;n g&igrave; hạnh ph&uacute;c hơn. H&agrave;m răng h&ocirc;m nay hơn tỷ chứ 10 tỷ t&ocirc;i cũng l&agrave;m. V&igrave; sức khỏe của m&igrave;nh l&agrave; đ&aacute;ng qu&yacute;, sức khỏe t&ocirc;i được như ng&agrave;y h&ocirc;m nay ngo&agrave;i sức tưởng tượng của t&ocirc;i, 10 tỷ t&ocirc;i cũng l&agrave;m. Trước đ&acirc;y t&ocirc;i khổ qu&aacute; rồi, kh&ocirc;ng ăn uống được suốt mấy chục năm, đau đớn, suy sụp thể trạng, tinh thần. Giờ gặp được b&aacute;c sĩ giỏi l&agrave; may mắn cả cuộc đời t&ocirc;i, cảm ơn b&aacute;c sĩ Mậu&rdquo;.</p>
', 1684851761425, 1)
INSERT [dbo].[news] ([NewsId], [Title], [Slug], [SearchTitle], [Description], [Thumbnail], [NewsContent], [CreateTime], [Enable]) VALUES (11, N'Nên hay không nên tẩy trắng răng', NULL, N'Nen hay khong nen tay trang rang', N'Hiện nay, tẩy trắng răng bằng laser là phương pháp được nhiều người áp dụng . Tuy nhiên, trên thực tế, phương pháp này có thực sự an toàn và hiệu quả như quảng cáo?', N'/files/news/653931d3-69f5-4fc9-b225-902cad5fd0f6.jpg', N'<h2><b>1. V&igrave; sao laser c&oacute; t&aacute;c dụng tẩy trắng răng?</b></h2>

<p>Tẩy trắng răng bằng laser&nbsp;l&agrave; việc thoa thuốc l&agrave;m trắng v&agrave;o bề mặt răng, sau đ&oacute; sử dụng &aacute;nh s&aacute;ng laser chiếu xạ s&acirc;u v&agrave;o cấu tr&uacute;c răng nhằm hoạt h&oacute;a thuốc tẩy trắng gi&uacute;p răng trắng v&agrave; s&aacute;ng hơn.</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/co-nen-tay-trang-rang-bang-laser-1.jpg" /></p>

<p><i>Tẩy trắng răng bằng laser c&oacute; thực sự an to&agrave;n, hiệu quả?</i></p>

<p>Về mặt bản chất, tia laser kh&ocirc;ng c&oacute; hề c&oacute; t&aacute;c dụng tẩy trắng m&agrave; chỉ th&uacute;c đẩy hoạt động của thuốc tẩy trắng răng. Bởi vậy, nếu kh&ocirc;ng sử dụng thuốc tẩy trắng răng trước khi chiếu tia laser, phương ph&aacute;p n&agrave;y kh&ocirc;ng mang lại hiệu quả tẩy trắng răng như mong đợi.</p>

<h2><b>2. Tẩy trắng răng bằng laser c&oacute; thực sự an to&agrave;n?</b></h2>

<p>Tẩy trắng răng bằng tia laser&nbsp;kh&ocirc;ng phải l&agrave; phương ph&aacute;p được c&aacute;c chuy&ecirc;n gia đ&aacute;nh gi&aacute; cao về mức độ an to&agrave;n bởi những l&yacute; do sau:</p>

<p>&ndash; Thuốc tẩy trắng c&oacute; chứa những chất h&oacute;a học c&oacute; t&iacute;nh tẩy rửa mạnh, g&acirc;y ảnh hưởng tới men răng.</p>

<p>&ndash; Tia laser t&aacute;c động s&acirc;u v&agrave;o cấu tr&uacute;c răng, ch&acirc;n răng, lợi, nướu khiến khu vực n&agrave;y yếu đi g&acirc;y cảm gi&aacute;c &ecirc; buốt khi ăn đồ qu&aacute; n&oacute;ng hoặc qu&aacute; lạnh sau qu&aacute; tr&igrave;nh&nbsp;tẩy trắng răng bằng laser.</p>

<p>Ch&iacute;nh bởi mức độ an to&agrave;n kh&ocirc;ng cao n&ecirc;n bạn cần c&acirc;n nhắc kỹ c&agrave;ng nếu muốn thực hiện phương ph&aacute;p&nbsp;tẩy trắng răng hiệu quả&nbsp;bằng laser.</p>

<h2><b>3. Phương ph&aacute;p tẩy trắng răng n&agrave;o an to&agrave;n, hiệu quả nhất hiện nay?</b></h2>

<p>Hiện nay, phương ph&aacute;p&nbsp;l&agrave;m răng trắng&nbsp;bằng đ&egrave;n hợp quang chiếu &aacute;nh s&aacute;ng xanh l&agrave; phương ph&aacute;p được c&aacute;c chuy&ecirc;n gia đ&aacute;nh gi&aacute; cao &nbsp;về mức độ hiệu quả lẫn t&iacute;nh an to&agrave;n ở thời điểm hiện tại.</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/co-nen-tay-trang-rang-bang-laser-2.jpg" /></p>

<p><i>Tẩy trắng răng bằng đ&egrave;n hợp quang được c&aacute;c chuy&ecirc;n gia khuy&ecirc;n d&ugrave;ng</i></p>

<p>&Aacute;nh s&aacute;ng xanh được chiếu xạ từ đ&egrave;n hợp quang t&aacute;c động b&oacute;c t&aacute;ch những mảng b&aacute;m v&agrave;ng ố tr&ecirc;n bề mặt răng, gi&uacute;p răng trắng, s&aacute;ng nhanh ch&oacute;ng, hiệu quả. Đặc biệt, do chỉ chiếu xạ l&ecirc;n bề mặt răng n&ecirc;n phương ph&aacute;p n&agrave;y kh&ocirc;ng g&acirc;y ảnh hưởng tới ch&acirc;n răng, lợi, nướu, kh&ocirc;ng g&acirc;y &ecirc; buốt hay ảnh hưởng chức năng ăn nhai của răng.</p>

<p>Tẩy trắng răng bằng đ&egrave;n hợp quang mang lại hiệu quả cũng như đảm bảo độ an to&agrave;n cao hơn hẳn so với phương ph&aacute;p&nbsp;tẩy trắng răng bằng laser th&ocirc;ng thường n&ecirc;n bạn c&oacute; thể tham khảo phương ph&aacute;p n&agrave;y nếu muốn sở hữu h&agrave;m răng trắng, đều m&agrave;u hơn.</p>
', 1684851851640, 1)
SET IDENTITY_INSERT [dbo].[news] OFF
GO
SET IDENTITY_INSERT [dbo].[notification] ON 

INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (1, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H0A1T6DT của bạn đã được tiếp nhận bởi phòng khám.', 1, 1684125191739)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (2, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H0A34N3C của bạn đã được tiếp nhận bởi phòng khám.', 1, 1684125547582)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (3, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 1, 1684126105348)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (4, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H0A34N3C của bạn đã hoàn thành.', 1, 1684126114317)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (5, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Lịch hẹn: 01H0F7V2RE của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684143461696)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (6, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Lịch hẹn: 01H0FCIKFC của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684163757380)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (7, N'557ee6e8-5f56-4b85-b874-335ecf69c76b', N'Thông báo', N'Lịch hẹn: 01H0G4UJPT của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684169292247)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (8, N'557ee6e8-5f56-4b85-b874-335ecf69c76b', N'Thông báo', N'Lịch hẹn: 01H0G516AC của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684169341660)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (9, N'557ee6e8-5f56-4b85-b874-335ecf69c76b', N'Thông báo', N'Lịch hẹn: 01H0G54884 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684169440922)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (10, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Lịch hẹn: 01H0FVODIU của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684169744435)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (11, N'b1a3204b-9c90-47d2-a6c0-6f6cb76d6dd9', N'Thông báo', N'Lịch hẹn: 01H0527HO0 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684170286232)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (12, N'87e200d4-15ab-4e16-b7c2-f82500b92b56', N'Thông báo', N'Lịch hẹn: 01H0524KPE của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684170585570)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (13, N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', N'Thông báo', N'Lịch hẹn: 01H02TSUI4 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684204236383)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (14, N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', N'Thông báo', N'Lịch hẹn: 01H0JODVA0 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684290584681)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (15, N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1684290593513)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (16, N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', N'Thông báo', N'Lịch hẹn: 01H0JODVA0 của bạn đã hoàn thành.', 0, 1684290598932)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (17, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Lịch hẹn: 01H0K9NFUB của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684308488588)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (18, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H14HSAF1 của bạn đã được tiếp nhận bởi phòng khám.', 1, 1684853986688)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (19, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H14HRGMP của bạn đã được tiếp nhận bởi phòng khám.', 1, 1684853996953)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (20, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 1, 1684854000131)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (21, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H14HRGMP của bạn đã hoàn thành.', 1, 1684854002971)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (22, N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', N'Thông báo', N'Bạn đã hủy lịch hẹn: 01H14I36SQ', 0, 1684854150331)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (23, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Lịch hẹn: 01H14HUKB9 của bạn đã bị hủy bởi phòng khám.', 0, 1684854236793)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (24, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Lịch hẹn: 01H14I6DI9 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684854247671)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (25, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Lịch hẹn: 01H18STJ7M của bạn đã được tiếp nhận bởi phòng khám.', 0, 1684999848082)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (26, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1684999852170)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (27, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Lịch hẹn: 01H18STJ7M của bạn đã hoàn thành.', 0, 1684999855881)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (28, N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', N'Thông báo', N'Lịch hẹn: 01H14I3VND của bạn đã được tiếp nhận bởi phòng khám.', 0, 1685112933847)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (29, N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1685112940221)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (30, N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', N'Thông báo', N'Lịch hẹn: 01H14I3VND của bạn đã hoàn thành.', 0, 1685112943396)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (31, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Lịch hẹn: 01H1DIMIC4 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1685156759013)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (32, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Lịch hẹn: 01H1DK9KD5 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1685158431863)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (33, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Lịch hẹn: 01H1DKBEK7 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1685158486616)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (34, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Lịch hẹn: 01H1DKJKO0 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1685158758812)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (35, N'557ee6e8-5f56-4b85-b874-335ecf69c76b', N'Thông báo', N'Lịch hẹn: 01H1HJVBLM của bạn đã được tiếp nhận bởi phòng khám.', 0, 1685292312838)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (36, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H1HOE9GO của bạn đã được tiếp nhận bởi phòng khám.', 1, 1685374941107)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (37, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Lịch hẹn: 01H1LG63OR của bạn đã được tiếp nhận bởi phòng khám.', 0, 1685422556677)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (38, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Bạn đã hủy lịch hẹn: 01H14HU3NT', 0, 1685461843763)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (39, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H1LFKBM2 của bạn đã được tiếp nhận bởi phòng khám.', 1, 1685462771209)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (40, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H1LFDKJ9 của bạn đã được tiếp nhận bởi phòng khám.', 1, 1685462785683)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (41, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Bạn đã hủy lịch hẹn: 01H1LG63OR', 0, 1685503162140)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (42, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Bạn đã hủy lịch hẹn: 01H1MO6ESN', 0, 1685508448969)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (43, N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Thông báo', N'Bạn đã hủy lịch hẹn: 01H1MOBBO8', 0, 1685544645709)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (44, N'052bcf96-251d-4beb-8dfd-9afc80effc1c', N'Thông báo', N'Lịch hẹn: 01H1QGO9HT của bạn đã bị hủy bởi phòng khám.', 0, 1685592658845)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (45, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H1UH1TPV của bạn đã được tiếp nhận bởi phòng khám.', 1, 1685725457656)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (46, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 1, 1685725464917)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (47, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H1VGP9ML của bạn đã được tiếp nhận bởi phòng khám.', 1, 1685758759462)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (48, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H1VHM942 của bạn đã được tiếp nhận bởi phòng khám.', 1, 1685759678521)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (49, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H1VI0LN6 của bạn đã được tiếp nhận bởi phòng khám.', 1, 1685760019451)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (50, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H1VI5U35 của bạn đã được tiếp nhận bởi phòng khám.', 1, 1685760191256)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (51, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H1VI8B3T của bạn đã được tiếp nhận bởi phòng khám.', 1, 1685760268013)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (52, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2AH4431 của bạn đã được tiếp nhận bởi phòng khám.', 1, 1686128187155)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (53, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2AHIOFN của bạn đã được tiếp nhận bởi phòng khám.', 1, 1686128664399)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (54, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2AHT5KM của bạn đã được tiếp nhận bởi phòng khám.', 1, 1686129075447)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (55, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2B4JN8E của bạn đã được tiếp nhận bởi phòng khám.', 1, 1686148616590)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (56, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2B4QUJO của bạn đã được tiếp nhận bởi phòng khám.', 1, 1686148857275)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (57, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2B5DUGJ của bạn đã được tiếp nhận bởi phòng khám.', 1, 1686149880381)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (58, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2B7UG4L của bạn đã được tiếp nhận bởi phòng khám.', 1, 1686152189888)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (59, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2FKM1EU của bạn đã được tiếp nhận bởi phòng khám.', 1, 1686305627636)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (60, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 1, 1686305633325)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (61, N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', N'Thông báo', N'Lịch hẹn: 01H2FQUODN của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686306277802)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (62, N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1686306282035)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (63, N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', N'Thông báo', N'Lịch hẹn: 01H2FQUODN của bạn đã hoàn thành.', 0, 1686306284649)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (64, N'32c53d41-bb6a-42a7-ae15-3e44084f45fe', N'Thông báo', N'Lịch hẹn: 01H2FR27N2 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686306372483)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (65, N'32c53d41-bb6a-42a7-ae15-3e44084f45fe', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1686306384756)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (66, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Lịch hẹn: 01H2FRIIQB của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686306913388)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (67, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Lịch hẹn: 01H2FU15RN của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686309491274)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (68, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2G9V1HD của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686322021366)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (69, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2GA4FB9 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686322183205)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (70, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1686322189376)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (71, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2GA4FB9 của bạn đã hoàn thành.', 0, 1686322195964)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (72, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Bạn đã hủy lịch hẹn: 01H2FKM1EU', 0, 1686322318370)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (73, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2GD5NJC của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686329421712)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (74, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1686329470995)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (75, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Lịch hẹn: 01H2FQRE2U của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686333277580)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (76, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1686333291264)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (77, N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Thông báo', N'Lịch hẹn: 01H2FQRE2U của bạn đã hoàn thành.', 0, 1686333304772)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (78, N'04eac990-0f44-4c2b-b64a-0e6501f623da', N'Thông báo', N'Lịch hẹn: 01H2HEB8O8 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686360154566)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (79, N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'Thông báo', N'Lịch hẹn: 01H2HIILII của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686364677303)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (80, N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'Thông báo', N'Bạn đã hủy lịch hẹn: 01H2HIL8L2', 0, 1686364783479)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (81, N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'Thông báo', N'Lịch hẹn: 01H2HJ3379 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686365149781)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (82, N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1686365180924)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (83, N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'Thông báo', N'Lịch hẹn: 01H2HJ3379 của bạn đã hoàn thành.', 0, 1686365186463)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (84, N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Thông báo', N'Lịch hẹn: 01H2GM99MN của bạn đã hoàn thành.', 0, 1686365274099)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (85, N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'Thông báo', N'Lịch hẹn: 01H2HIL8L2 của bạn đã được tiếp nhận bởi phòng khám.', 0, 1686582922526)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (86, N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'Thông báo', N'Phòng khám xác nhận bạn đã đến phòng khám.', 0, 1686582929383)
INSERT [dbo].[notification] ([NotificationId], [UserId], [Title], [Message], [IsRead], [CreateTime]) VALUES (87, N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'Thông báo', N'Lịch hẹn: 01H2HIL8L2 của bạn đã hoàn thành.', 0, 1686582934811)
SET IDENTITY_INSERT [dbo].[notification] OFF
GO
INSERT [dbo].[reason_reject] ([ReasonRejectId], [UserAppointmentId], [Message], [CreateTime]) VALUES (N'1dcdb1bf-62ca-4b15-8eeb-21bb13fec260', N'cbf6e4f4-f73e-4596-95cc-393cdb5adec7', N'Bác sĩ Phạm Văn Tú bận đột xuất', 1685592658841)
INSERT [dbo].[reason_reject] ([ReasonRejectId], [UserAppointmentId], [Message], [CreateTime]) VALUES (N'1f0f4e9a-e191-4b88-a849-f5efd87f7295', N'ffc54707-655f-4b8f-912e-d13fd4e8cf80', N'Bận', 1686364783474)
INSERT [dbo].[reason_reject] ([ReasonRejectId], [UserAppointmentId], [Message], [CreateTime]) VALUES (N'294e5799-e554-4189-92e0-c922f5a0180d', N'040c22b3-e0d2-4d9b-984c-6f9888397fc0', N'thich thi huy', 1685544645708)
INSERT [dbo].[reason_reject] ([ReasonRejectId], [UserAppointmentId], [Message], [CreateTime]) VALUES (N'6f207ea8-1d8e-4aff-9cff-f0750ac7a9e4', N'ce938ed1-7e2f-435e-a38b-993c6f6b6572', N'Bận', 1685508448963)
INSERT [dbo].[reason_reject] ([ReasonRejectId], [UserAppointmentId], [Message], [CreateTime]) VALUES (N'84f4c58e-55f7-4d56-89cf-91a493a3c06f', N'203d7f85-157e-4cad-b2c7-a8073894deec', N'Bận', 1686322318366)
GO
INSERT [dbo].[report_daily] ([ReportDailyId], [Day], [Month], [Year], [TotalPrice]) VALUES (N'0aed3fca-b2a9-45eb-962c-86e99a69784d', 15, 5, 2023, CAST(0.00000000 AS Decimal(30, 8)))
INSERT [dbo].[report_daily] ([ReportDailyId], [Day], [Month], [Year], [TotalPrice]) VALUES (N'137c184b-6b47-410a-abea-637e813193ac', 10, 6, 2023, CAST(145450000.00000000 AS Decimal(30, 8)))
INSERT [dbo].[report_daily] ([ReportDailyId], [Day], [Month], [Year], [TotalPrice]) VALUES (N'2f354138-5a0e-4453-980b-750fc1113f35', 13, 5, 2023, CAST(22730000.00000000 AS Decimal(30, 8)))
INSERT [dbo].[report_daily] ([ReportDailyId], [Day], [Month], [Year], [TotalPrice]) VALUES (N'3898e406-fc0f-47e8-af6f-c644c3814b02', 26, 5, 2023, CAST(5000000.00000000 AS Decimal(30, 8)))
INSERT [dbo].[report_daily] ([ReportDailyId], [Day], [Month], [Year], [TotalPrice]) VALUES (N'58440edb-00e8-4da6-a8ef-1b79fdd2ff77', 23, 5, 2023, CAST(70000000.00000000 AS Decimal(30, 8)))
INSERT [dbo].[report_daily] ([ReportDailyId], [Day], [Month], [Year], [TotalPrice]) VALUES (N'7157ae17-951e-45cb-8de8-8f93aa4b295b', 12, 6, 2023, CAST(6250000.00000000 AS Decimal(30, 8)))
INSERT [dbo].[report_daily] ([ReportDailyId], [Day], [Month], [Year], [TotalPrice]) VALUES (N'73bd288a-f666-4cfe-9efd-dfc45b3b38bb', 25, 5, 2023, CAST(44000000.00000000 AS Decimal(30, 8)))
INSERT [dbo].[report_daily] ([ReportDailyId], [Day], [Month], [Year], [TotalPrice]) VALUES (N'c5be2dc8-ee76-41f4-bdc7-db357a17cabe', 17, 5, 2023, CAST(47800.00000000 AS Decimal(30, 8)))
INSERT [dbo].[report_daily] ([ReportDailyId], [Day], [Month], [Year], [TotalPrice]) VALUES (N'e5ffaae9-5c90-46ee-9153-7ec78749e618', 9, 6, 2023, CAST(3000000.00000000 AS Decimal(30, 8)))
GO
INSERT [dbo].[report_monthly] ([ReportMonthlyId], [Month], [Year], [TotalPrice]) VALUES (N'76811deb-f484-447d-b79f-5e6e32dedef4', 5, 2023, CAST(141777800.00000000 AS Decimal(30, 8)))
INSERT [dbo].[report_monthly] ([ReportMonthlyId], [Month], [Year], [TotalPrice]) VALUES (N'd3030448-8025-4407-b0a8-f4c12947a0fe', 6, 2023, CAST(154700000.00000000 AS Decimal(30, 8)))
GO
INSERT [dbo].[report_yearly] ([ReportYearlyId], [Year], [TotalPrice]) VALUES (N'3b90f581-fcde-4041-a8c5-acd5b5f32fd9', 2023, CAST(296477800.00000000 AS Decimal(30, 8)))
GO
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'0b1047c4-25e4-491f-904f-912911df7a31', N'Lấy cao răng', N'Lay cao rang', N'/files/service/ccdeee57-0123-4469-8992-2e9cc06bbc4a.jpg', 30, N'<h3><strong>1. TẠI SAO CẦN PHẢI LẤY CAO RĂNG ?&nbsp;</strong></h3>

<p>Cao răng được hiểu một c&aacute;ch đơn giản l&agrave; những mảng b&aacute;m của thức ăn tr&ecirc;n cổ răng, nướu răng&hellip; t&iacute;ch tụ l&acirc;u ng&agrave;y m&agrave; th&agrave;nh. C&aacute;c mảng b&aacute;m<strong>&nbsp;</strong>n&agrave;y nếu để l&acirc;u ng&agrave;y sẽ b&aacute;m d&iacute;nh rất chắc v&agrave;o răng, l&agrave; m&ocirc;i trường thuận lợi để c&aacute;c vi khuẩn t&iacute;ch tụ, khiến cho t&igrave;nh trạng răng trở n&ecirc;n ố v&agrave;ng, xỉn m&agrave;u, l&acirc;u dần c&oacute; thể g&acirc;y vi&ecirc;m nhiễm v&agrave; g&acirc;y ra c&aacute;c bệnh l&yacute; răng miệng nguy hiểm.</p>

<p>C&aacute;c nha sĩ đ&atilde; chỉ ra rằng, trong cao răng tồn tại v&agrave; ẩn chứa tới hơn 500 loại vi khuẩn kh&aacute;c nhau. Những loại vi khuẩn n&agrave;y l&agrave; nguồn gốc của bệnh vi&ecirc;m nướu, vi&ecirc;m ch&acirc;n răng, vi&ecirc;m nha chu&hellip; Ở mức độ nhẹ, n&oacute; sẽ g&acirc;y cho người bệnh những cảm gi&aacute;c v&ocirc; c&ugrave;ng kh&oacute; chịu v&agrave; g&acirc;y ra bất tiện đối với chức năng ăn nhai cũng như những sinh hoạt h&agrave;ng ng&agrave;y. Ở mức độ nặng hơn, những bệnh l&yacute; răng miệng n&agrave;y c&oacute; thể g&acirc;y ra nhiều biến chứng răng miệng v&ocirc; c&ugrave;ng nguy hiểm, thậm ch&iacute; c&oacute; thể khiến răng lung lay hoặc l&agrave;m mất răng.</p>

<h3><strong>2. LẤY CAO RĂNG ĐƯỢC THỰC HIỆN BẰNG PHƯƠNG PH&Aacute;P N&Agrave;O ?</strong></h3>

<p>Lấy cao răng thường được thực hiện bằng 2 phương ph&aacute;p: Đ&oacute; l&agrave; sử dụng những dụng cụ cầm tay hoặc sử dụng m&aacute;y si&ecirc;u &acirc;m. Trong đ&oacute;, dụng cụ cầm tay l&agrave; phương ph&aacute;p cũ, thủ c&ocirc;ng v&agrave; hiện nay chỉ c&ograve;n được &aacute;p dụng tại những nha khoa nhỏ, k&eacute;m chất lượng. Nhược điểm của phương ph&aacute;p n&agrave;y ch&iacute;nh l&agrave; c&oacute; thể g&acirc;y ra &ecirc; buốt, đau đớn, chảy m&aacute;u răng. Ngược lại, kĩ thuật lấy cao răng bằng m&aacute;y si&ecirc;u &acirc;m lại v&ocirc; c&ugrave;ng ti&ecirc;n tiến, hiện đại, khắc phục được tất cả những nhược điểm của kĩ thuật truyền thống.</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/products/lay-cao-rang-sieu-am-2.jpg" /></p>

<p><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Lấy cao răng bằng m&aacute;y si&ecirc;u &acirc;m</em></p>

<h3><strong>3. LẤY CAO RĂNG SI&Ecirc;U &Acirc;M C&Oacute; NHỮNG ƯU ĐIỂM G&Igrave; ?&nbsp;</strong></h3>

<p>Như đ&atilde; đề cập ở ph&iacute;a tr&ecirc;n, lấy cao răng bằng m&aacute;y si&ecirc;u &acirc;m l&agrave; kĩ thuật hiện đại nhất hiện nay, n&oacute; sở hữu nhiều ưu điểm nổi bật v&agrave; vượt trội như:</p>

<ul>
	<li>&nbsp;<strong>Tuyệt đối kh&ocirc;ng đau, kh&ocirc;ng chảy m&aacute;u</strong>: C&ocirc;ng nghệ lấy cao răng bằng m&aacute;y si&ecirc;u &acirc;m sử dụng lực rung từ đầu m&aacute;y t&aacute;c động v&agrave;o c&aacute;c mảng b&aacute;m v&agrave; lấy ch&uacute;ng ra khỏi cổ răng, th&acirc;n răng một c&aacute;ch nhanh ch&oacute;ng, nhẹ nh&agrave;ng, tuyệt đối kh&ocirc;ng x&acirc;m lấn s&acirc;u v&agrave;o răng cũng như v&ugrave;ng nướu n&ecirc;n kh&ocirc;ng g&acirc;y đau, kh&ocirc;ng &ecirc; buốt v&agrave; kh&ocirc;ng hề chảy m&aacute;u.</li>
	<li><strong>Loại bỏ cao răng triệt đ</strong>ể: Chức năng cảm ứng điện từ của m&aacute;y si&ecirc;u &acirc;m gi&uacute;p nhận biết ch&iacute;nh x&aacute;c tất cả c&aacute;c dạng cao răng ở cả thể mềm v&agrave; thể cứng, sau đ&oacute; g&acirc;y ra những t&aacute;c động để l&agrave;m tan r&atilde; ch&uacute;ng một c&aacute;ch ho&agrave;n to&agrave;n, triệt để.</li>
	<li>&nbsp;<strong>Ngăn ngừa cao răng quay trở lại</strong>: Bước s&oacute;ng si&ecirc;u &acirc;m của m&aacute;y c&oacute; t&aacute;c dụng lấp đầy c&aacute;c lỗ li ti được sản sinh ra bởi lớp cao răng b&aacute;m chắc trước đ&oacute;.&nbsp;&nbsp;Việc lấp đầy n&agrave;y l&agrave;m cho mảnh vụn thức ăn dư thừa kh&oacute; c&oacute; thể b&aacute;m lại v&agrave;o răng, việc vệ sinh răng miệng h&agrave;ng ng&agrave;y cũng trở n&ecirc;n dễ d&agrave;ng hơn rất nhiều.</li>
</ul>
', N'b1033580-2637-42f1-8c76-900e4b370588', CAST(250000.00000000 AS Decimal(30, 8)), 1684850247806, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'16a69542-4b97-4e84-88c9-bc39ceca537b', N'Niềng răng mắc cài kim loại', N'Nieng rang mac cai kim loai', N'/files/service/d86c6f4b-1419-490d-a218-a245f64193d2.jpg', 60, N'<h2 id="I++Ni+ng+r+ng+m+c+c+i+kim+lo+i+l++g+++" name="I++Ni+ng+r+ng+m+c+c+i+kim+lo+i+l++g+++"><strong>I. Niềng răng mắc c&agrave;i kim loại l&agrave; g&igrave;?&nbsp;</strong></h2>

<p id="" name="">Niềng răng mắc c&agrave;i kim loại l&agrave; phương ph&aacute;p chỉnh nha sử dụng hệ thống mắc c&agrave;i v&agrave; d&acirc;y cung, d&acirc;y thun nhằm dịch chuyển răng về vị tr&iacute; mong muốn. Phương ph&aacute;p n&agrave;y gi&uacute;p cải thiện hiệu quả t&igrave;nh trạng răng h&ocirc;, m&oacute;m, khấp khểnh, thậm chỉ khớp cắn lệch...</p>

<p name=""><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/k-b%C3%ACa-1.jpg" /></p>

<h2 id="Nh+ng+lo+i+ni+ng+r+ng+kim+lo+i+hi+n+t+i" name="Nh+ng+lo+i+ni+ng+r+ng+kim+lo+i+hi+n+t+i"><strong>II. C&aacute;c loại niềng răng mắc c&agrave;i kim loại phổ biến&nbsp;</strong></h2>

<p>Niềng răng kim loại hiện tại chia th&agrave;nh 3 loại: Niềng răng mắc c&agrave;i kim loại th&ocirc;ng thường v&agrave; niềng răng mắc c&agrave;i kim loại tư đ&oacute;ng/ tự kh&oacute;a/ tự buộc v&agrave; niềng răng mắc c&agrave;i kim loại mặt trong.</p>

<h3 id="Lo+i+1++Ni+ng+n+ng+m+c+c+i+kim+lo+i+th+ng+th++ng++lo+i+truy+n+th+ng+" name="Lo+i+1++Ni+ng+n+ng+m+c+c+i+kim+lo+i+th+ng+th++ng++lo+i+truy+n+th+ng+"><strong>1. Niềng năng mắc c&agrave;i kim loại th&ocirc;ng thường (loại truyền thống)</strong></h3>

<p>Đ&acirc;y được xem l&agrave; phương ph&aacute;p&nbsp;niềng kh&ocirc;ng chỉ phổ biến tại Việt Nam m&agrave; phổ biến tr&ecirc;n to&agrave;n thế giới,. Sử dụng d&acirc;y chun (hay d&acirc;y thun) chỉnh nha để gắn cố định d&acirc;y cung v&agrave;o những chiếc mắc c&agrave;i, những chiếc d&acirc;y chun c&oacute; t&aacute;c dụng hỗ trợ qu&aacute; tr&igrave;nh niềng răng hi&ecirc;u quả.</p>

<p><img alt="Niềng răng mắc cài kim loại thông thường" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/k-b%C3%ACa-1.jpg" /></p>

<p>&nbsp;</p>

<p>Những chiếc d&acirc;y chun n&agrave;y c&oacute; độ bền cao, độ đ&agrave;n hồi tốt, gi&uacute;p hỗ trợ cho qu&aacute; tr&igrave;nh chỉnh răng diễn ra ổn định v&agrave; c&oacute; hiệu quả cao.</p>

<p><strong>Ưu điểm:</strong></p>

<ul>
	<li>Niềng răng kim loại th&ocirc;ng thường đem đến hiệu quả chỉnh nha tuyệt đối, đi k&egrave;m đ&oacute; l&agrave; c&oacute; những kh&iacute; cụ hỗ trợ đi k&egrave;m để gi&uacute;p cố định, k&eacute;o, đẩy, chỉnh,&hellip; d&acirc;y cung trong qu&aacute; tr&igrave;nh niềng răng.</li>
	<li>Chi ph&iacute; của niềng răng kim loại l&agrave; thấp nhất trong tất c&aacute;c c&aacute;c loại niềng răng thẩm mỹ.</li>
	<li>V&igrave; độ bề v&agrave; k&eacute;o d&atilde;n của kim loại n&ecirc;n niềng răng bằng mắc c&agrave;i kim loại rất hiệu quả trong việc niềng răng với những ca răng h&ocirc;, m&oacute;m, lệch lạc,&hellip; thậm ch&iacute; l&agrave; phức tạp hơn.</li>
	<li>Thời gian điều trị kh&ocirc;ng qu&aacute; l&acirc;u nhưng thường sẽ từ 6 th&aacute;ng trở l&ecirc;n&nbsp;l&agrave; răng sẽ đẹp lung linh lu&ocirc;n nha.</li>
	<li>Kh&ocirc;ng lo bị bung, bị vỡ.&nbsp;</li>
</ul>

<p><strong>Hạn chế của mắc c&agrave;i kim loại truyền thống:</strong></p>

<ul>
	<li>Phương ph&aacute;p n&agrave;y sẽ tiết kiệm được rất nhiều chi ph&iacute;, nhưng khi giao tiếp sẽ phải để lộ niềng răng, nhiều kh&aacute;ch h&agrave;ng sẽ cảm thấy ngượng ng&ugrave;ng trước đối t&aacute;c hoặc giao tiếp ở nơi đ&ocirc;ng người.</li>
	<li>Do mới gắn mắc c&agrave;i v&agrave; d&acirc;y cung n&ecirc;n trong những thời gian đầu sẽ c&oacute; cảm gi&aacute;c kh&oacute; chịu, vướng v&iacute;u (khoảng 1 th&aacute;ng đầu).</li>
</ul>

<p>&nbsp;</p>

<h3 id="Lo+i+2++Ni+ng+r+ng+m+c+c+i+kim+lo+i+t++bu+c++t++kh+a++t++++ng" name="Lo+i+2++Ni+ng+r+ng+m+c+c+i+kim+lo+i+t++bu+c++t++kh+a++t++++ng"><strong>2. Niềng răng mắc c&agrave;i kim loại tự buộc/ tự kh&oacute;a/ tự đ&oacute;ng</strong></h3>

<p>Phương ph&aacute;p n&agrave;y&nbsp;c&ograve;n c&oacute; t&ecirc;n gọi kh&aacute;c l&agrave; niềng răng mắc c&agrave;i kim loại tự buộc. Đ&acirc;y l&agrave; phương ph&aacute;p chỉnh nha được ph&aacute;t triển tr&ecirc;n nền tảng phương ph&aacute;p niềng răng kim loại truyền thống. Về phần cơ bản th&igrave; cũng kh&ocirc;ng c&oacute; kh&aacute;c nhau nhiều.</p>

<p><img alt="Niềng răng mắc cài kim loại tự buộc" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/k-b%C3%ACa-2.jpg" /></p>

<p>&nbsp;</p>

<p>Điều kh&aacute;c biệt ở mắc c&agrave;i tự buộc n&agrave;y với loại truyền thống l&agrave; ở sự kh&oacute;a tự đ&oacute;ng được t&iacute;ch hợp tr&ecirc;n mắc c&agrave;i. Nhờ vậy, d&acirc;y cung c&oacute; thể trượt tr&ecirc;n r&atilde;nh mắc c&agrave;i, tạo lực t&aacute;c động chủ động l&ecirc;n răng từ đ&oacute; c&oacute; thể r&uacute;t ngắn được thời gian điều trị.</p>

<p><strong>Ưu điểm:</strong></p>

<ul>
	<li>Hiệu quả tương đương với phương ph&aacute;p niềng răng mắc c&agrave;i kim loại truyền thống</li>
	<li>Kh&ocirc;ng phải lo đến vấn đề bung s&uacute;t hoặc co gi&atilde;n d&acirc;y chun, dễ d&agrave;ng gi&uacute;p b&aacute;c sĩ kiểm so&aacute;t lực t&aacute;c động l&ecirc;n răng.</li>
</ul>

<p><strong>Mặt hạn chế:&nbsp;</strong>&nbsp;</p>

<ul>
	<li>Vấn đề thẩm mỹ chưa được khắc phục</li>
	<li>Do được t&iacute;ch hợp th&ecirc;m cơ chế tự buộc n&ecirc;n mắc c&agrave;i sẽ d&agrave;y hơn, người d&ugrave;ng sẽ cảm thấy kh&oacute; chịu.</li>
	<li>Chi ph&iacute; cao hơn so với niềng răng truyền thống</li>
</ul>

<h3 id="Lo+i+3++Ni+ng+r+ng+m+c+c+i+kim+lo+i+m+t+trong" name="Lo+i+3++Ni+ng+r+ng+m+c+c+i+kim+lo+i+m+t+trong"><strong>3. Niềng răng mắc c&agrave;i kim loại mặt trong</strong></h3>

<p>N&oacute;i về niềng răng mắc c&agrave;i kim loại mặt trong th&igrave; đ&acirc;y l&agrave; phương ph&aacute;p mới về Việt Nam từ đầu năm 2019, đ&acirc;y l&agrave; phương ph&aacute;o niềng răng ti&ecirc;n tiến của Nhật Bản.</p>

<p>Kh&aacute; nhiều b&aacute;c sĩ Nhật đ&atilde; đến Việt Nam để trực tiếp tham gia thực hiện những ca niềng mắc c&agrave;i kim loại mặt trong đầu ti&ecirc;n.</p>

<p><img alt="Niềng răng mắc cài kim loại mặt trong" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/k-b%C3%ACa-3.jpg" /></p>

<p>&nbsp;</p>

<p>Điểm đặc biệt ở đ&acirc;y l&agrave; niềng răng kim loại sẽ được đặt ph&iacute;a trong của răng, ch&iacute;nh v&igrave; thế điều n&agrave;y l&agrave;m cải thiện thẩm mỹ l&ecirc;n rất nhiều.</p>

<p><strong>Ưu điểm:</strong></p>

<ul>
	<li>Độ tinh tế về thẩm mỹ cao</li>
	<li>Bề mặt b&ecirc;n ngo&agrave;i của răng kh&ocirc;ng bị ảnh hưởng</li>
</ul>

<p><strong>Nhược điểm:</strong></p>

<ul>
	<li>Cảm gi&aacute;c vướng v&iacute;u kh&oacute; chịu</li>
	<li>Kh&oacute; vệ sinh răng miệng dẫn đến bị h&ocirc;i miệng&nbsp;</li>
	<li>C&oacute; thể g&acirc;y tổn thương lưỡi (Đ&acirc;y l&agrave; điều kh&aacute; phổ biến) đẫn đến ph&aacute;t &acirc;m kh&ocirc;ng chuấn, ảnh hưởng đến giọng n&oacute;i.&nbsp;</li>
	<li>Chi ph&iacute; cao nhất trong tất&nbsp;cả c&aacute;c loại niềng răng bằng kim loại. ( Khoảng từ 70tr &ndash; hơn 100tr)</li>
</ul>

<p>Niềng răng mắc c&agrave;i mặt lưỡi đ&ograve;i hỏi kỹ thuật tay nghề b&aacute;c sĩ chuy&ecirc;n m&ocirc;n cao, m&aacute;y m&oacute;c c&ocirc;ng nghệ hiện đại xử l&yacute;. Để tiến h&agrave;nh 1 ca niềng răng mặt lưỡi th&igrave; kh&aacute;ch h&agrave;ng n&ecirc;n lựa chọn những nha khoa lớn, c&oacute; tiếng trong ng&agrave;nh.</p>

<p>Tr&aacute;nh v&agrave;o những nha khoa thiếu uy t&iacute;n&nbsp;tiền mất tận mang m&agrave; c&ograve;n để lại hệ lụy cho h&agrave;m răng của bản th&acirc;n.</p>
', N'e5467e03-f260-43fb-ab8c-5b253983aa36', CAST(30000000.00000000 AS Decimal(30, 8)), 1684849411770, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'1b991a62-9e48-4e30-9aaa-6325921744bd', N'Răng sứ Ceramill', N'Rang su Ceramill', N'/files/service/a47ee313-9d3b-44fc-8304-2ef8c1de7ec9.jpg', 30, N'<h2 dir="ltr" id="R+ng+s++Ceramill+l++g++" name="R+ng+s++Ceramill+l++g++"><strong>Răng sứ Ceramill l&agrave; g&igrave;?</strong></h2>

<p dir="ltr">Răng sứ Ceramill l&agrave; d&ograve;ng răng to&agrave;n sứ c&oacute; nguồn gốc từ Đức. Đ&acirc;y được đ&aacute;nh gi&aacute; l&agrave; d&ograve;ng răng to&agrave;n sứ c&oacute; chất lượng cao, đảm bảo tốt nhất cả về chức năng ăn nhai với độ chịu lực l&ecirc;n đến 1100 Mpa.</p>

<p dir="ltr">Cấu tạo răng sứ Ceramill cũng tương tự như c&aacute;c d&ograve;ng răng sứ kh&aacute;c bao gồm 2 lớp:</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Lớp khung sườn được tạo th&agrave;nh từ chất liệu Zirconia c&oacute; độ chịu lực lớn&nbsp;</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Lớp ngo&agrave;i bằng sứ Ceramill c&oacute; độ trong mờ cao v&agrave; m&agrave;u sắc tự nhi&ecirc;n v&agrave; bền chắc</p>
	</li>
</ul>

<p dir="ltr"><em>Đặc biệt sứ Ceramill l&agrave; loại vật liệu qu&yacute; được sử dụng nhiều trong sản xuất c&aacute;c sản phẩm c&ocirc;ng nghệ cao. Do đ&oacute; d&ograve;ng răng sứ n&agrave;y c&oacute; nhiều ưu điểm vượt trội hơn cả.</em></p>

<h3 dir="ltr" id="+u++i+m+r+ng+s++Ceramill" name="+u++i+m+r+ng+s++Ceramill"><strong>Ưu điểm răng sứ Ceramill</strong></h3>

<p dir="ltr"><img alt="Ưu điểm của răng sứ Ceramill" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/2_%20%E1%BA%A2nh%20c%C3%B3%20h%C3%ACnh%20chi%E1%BA%BFc%20r%C4%83ng%20v%C3%A0%20tr%C3%ACnh%20b%C3%A0y%20c%C3%A1c%20text(1).jpg" /></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>M&agrave;u sắc đẹp tự nhi&ecirc;n, tinh tế</strong></p>
	</li>
</ul>

<p dir="ltr">Được cấu tạo từ m&atilde;o sứ Ceramill b&ecirc;n ngo&agrave;i v&agrave; sườn Zirconia gi&uacute;p răng c&oacute; độ mờ trong v&agrave; t&iacute;nh phản quang tốt. Ch&iacute;nh điều n&agrave;y gi&uacute;p m&agrave;u sắc của d&ograve;ng răng sứ n&agrave;y được nhiều người y&ecirc;u th&iacute;ch bởi độ tinh tế v&agrave; thời thượng nhưng cũng rất tự nhi&ecirc;n.</p>

<p dir="ltr">Đồng thời trong m&ocirc;i trường khoang miệng răng sứ Ceramill cũng kh&ocirc;ng bị đổi m&agrave;u do t&aacute;c động của oxy h&oacute;a.&nbsp;</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Độ cứng v&agrave; bền chắc tốt</strong></p>
	</li>
</ul>

<p dir="ltr">Về độ cứng v&agrave; chịu lực th&igrave; răng sứ Ceramill c&ograve;n chắc gấp nhiều lần răng thật. Do đ&oacute; khi bọc răng sứ n&agrave;y, kh&aacute;ch h&agrave;ng c&oacute; thể ăn nhai như thường ngay cả với c&aacute;c thực phẩm cứng hay qu&aacute; dai.&nbsp;</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>An to&agrave;n, kh&ocirc;ng g&acirc;y k&iacute;ch ứng khi sử dụng</strong></p>
	</li>
</ul>

<p dir="ltr">Chất liệu sứ rất an to&agrave;n với m&ocirc;i, lợi, nướu bởi vậy tỉ lệ bị dị ứng, vi&ecirc;m lợi, nhiễm tr&ugrave;ng rất thấp nếu đảm bảo đ&uacute;ng quy tr&igrave;nh trong qu&aacute; tr&igrave;nh thực hiện.</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Tuổi thọ cao</strong></p>
	</li>
</ul>

<p dir="ltr">Sản xuất bởi c&aacute;c thiết bị m&aacute;y m&oacute;c v&agrave; ứng dụng c&ocirc;ng nghệ hiện đại n&ecirc;n d&ograve;ng răng sứ n&agrave;y c&oacute; t&iacute;nh ch&iacute;nh x&aacute;c v&agrave; độ kh&iacute;t với răng thật rất cao, kh&ocirc;ng g&acirc;y kẽ hở khi chụp l&ecirc;n răng thật. Điều n&agrave;y l&agrave;m tăng tuổi thọ v&agrave; độ bền cho răng sứ.</p>

<p>&nbsp;</p>

<h3 dir="ltr" id="Nh++c++i+m+c+a+r+ng+s++Ceramill" name="Nh++c++i+m+c+a+r+ng+s++Ceramill" role="presentation"><strong>Nhược điểm của răng sứ Ceramill</strong></h3>

<p dir="ltr">So với nhiều d&ograve;ng răng sứ th&igrave; gi&aacute; th&agrave;nh của răng sứ Ceramill được đ&aacute;nh gi&aacute; kh&aacute; cao. Do đ&oacute; mặc d&ugrave; c&oacute; chất lượng tốt nhưng nhiều người vẫn c&ograve;n kh&aacute; c&acirc;n nhắc khi lựa chọn loại răng sứ n&agrave;y.</p>

<h2 dir="ltr" id="C+c+tr++ng+h+p+c+n+b+c+r+ng+s++Ceramill" name="C+c+tr++ng+h+p+c+n+b+c+r+ng+s++Ceramill"><strong>C&aacute;c trường hợp cần bọc răng sứ Ceramill</strong></h2>

<p dir="ltr">Ch&iacute;nh bởi độ bền tốt v&agrave; khả năng chịu lực cao n&ecirc;n răng sứ Ceramill thường được sử dụng cho c&aacute;c trường hợp:</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng bị sứt mẻ, vỡ do c&aacute;c nguy&ecirc;n nh&acirc;n như ng&atilde;, va đập&hellip;</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Khoảng c&aacute;ch giữa c&aacute;c răng thưa</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng bị m&oacute;m hoặc h&ocirc; nhẹ</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng bị ngả m&agrave;u, ố v&agrave;ng do kh&aacute;ng sinh, chế độ ăn uống, sinh hoạt: sử dụng caf&eacute;, ch&egrave;, thuốc l&aacute;&hellip;</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Điều chỉnh c&aacute;c trường hợp răng lệch lạc, khấp khểnh về đ&uacute;ng vị tr&iacute;</p>
	</li>
</ul>

<p dir="ltr">Tuy nhi&ecirc;n kh&ocirc;ng phải tất cả c&aacute;c trường hợp tr&ecirc;n đ&acirc;y đều c&oacute; thể bọc răng sứ Ceramill m&agrave; c&ograve;n t&ugrave;y theo c&aacute;c t&igrave;nh trạng về răng miệng: bệnh l&yacute;, &hellip; c&aacute;c b&aacute;c sĩ sẽ đưa ra c&aacute;c điều chỉnh ph&ugrave; hợp với từng kh&aacute;ch h&agrave;ng.</p>

<h2 dir="ltr" id="R+ng+s++Ceramill+c++nh+ng+lo+i+n+o+" name="R+ng+s++Ceramill+c++nh+ng+lo+i+n+o+"><strong>Răng sứ Ceramill c&oacute; những loại n&agrave;o?</strong></h2>

<p dir="ltr">Hiện nay răng sứ Ceramill được chia th&agrave;nh 2 loại: răng sứ Ceramill Zolid v&agrave; Ceramill Zi. B&ecirc;n cạnh những đặc điểm chung th&igrave; mỗi loại n&agrave;y c&oacute; những ưu điểm ri&ecirc;ng vượt trội, ph&ugrave; hợp với từng người.</p>

<p dir="ltr">Để biết đặc điểm của từng răng sứ n&agrave;y như thế n&agrave;o,&nbsp;h&atilde;y xem tiếp phần dưới đ&acirc;y:&nbsp;</p>

<ul>
	<li dir="ltr">
	<h3 dir="ltr" id="R+ng+s++Ceramill+Zolid" name="R+ng+s++Ceramill+Zolid" role="presentation"><strong>Răng sứ Ceramill Zolid</strong></h3>
	</li>
</ul>

<p dir="ltr"><img alt="Răng sứ Ceramill Zolid" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/3_%20r%C4%83ng%20Ceramill%20Zolid.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><strong>Với lớp trong khung sườn l&agrave;m từ vật liệu Zirconia Odixe c&oacute; độ cứng cao, c&oacute; thể chịu lực l&ecirc;n tới 1566 Mpa gấp từ 7 &ndash; 8 lần răng thật.&nbsp;</strong></p>

<p dir="ltr">Điểm kh&aacute; ưu việt của d&ograve;ng n&agrave;y l&agrave; trọng lượng nhẹ v&agrave; độ đều m&agrave;u như răng thật.</p>

<ul>
	<li dir="ltr">
	<h3 dir="ltr" id="R+ng+s++Ceramill+Zi" name="R+ng+s++Ceramill+Zi" role="presentation"><strong>Răng sứ Ceramill Zi</strong></h3>
	</li>
</ul>

<p dir="ltr">Chất liệu Y-TZP ZrO2 của lớp khung sườn gi&uacute;p giữ m&agrave;u răng s&aacute;ng b&oacute;ng, tự nhi&ecirc;n v&agrave; bền đẹp trong suốt qu&aacute; tr&igrave;nh sử dụng.&nbsp;</p>

<p dir="ltr"><img alt="Răng sứ Ceramill Zi" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/4_%20Ceramill%20Zi(1).jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Tuy nhi&ecirc;n so với răng sứ Ceramill Zolid th&igrave; t&iacute;nh ổn định v&agrave; bền đẹp của Ceramill Zi được đ&aacute;nh gi&aacute; l&agrave; thấp hơn. Trong bọc răng th&igrave; d&ograve;ng sứ Ceramill Zolid được nhiều chuy&ecirc;n gia v&agrave; kh&aacute;ch h&agrave;ng tin d&ugrave;ng v&agrave; lựa chọn.</p>
', N'31bf2b3a-79d0-4ef1-80e1-775728ec4156', CAST(7000000.00000000 AS Decimal(30, 8)), 1684849122251, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'20f6b334-3ebd-4cba-8deb-d1d51d1dfb09', N'Nhổ răng khôn', N'Nho rang khon', N'/files/service/7ea6c9b7-b61a-4311-b42d-7d060d85a536.jpg', 30, N'<h2 dir="ltr" id="I++R+ng+kh+n++r+ng+s++8++l++g++" name="I++R+ng+kh+n++r+ng+s++8++l++g++"><b>I. Răng kh&ocirc;n (răng số 8)&nbsp;l&agrave; g&igrave;?</b></h2>

<p>Răng kh&ocirc;n hay c&ograve;n gọi l&agrave; răng số 8, l&agrave; chiếc răng mọc cuối c&ugrave;ng tr&ecirc;n cung h&agrave;m. V&igrave; răng kh&ocirc;n mọc khi xương h&agrave;m đ&atilde; ngừng ph&aacute;t triển n&ecirc;n thường g&acirc;y mọc lệch, mọc ngầm dẫn đến s&acirc;u răng, vi&ecirc;m nhiễm&hellip; g&acirc;y đau đớn v&agrave; phiền to&aacute;i cho mỗi người.&nbsp;</p>

<p>&nbsp;</p>

<p>Với vị tr&iacute; s&aacute;t d&acirc;y thần kinh n&ecirc;n nhổ răng kh&ocirc;n đ&atilde; trở th&agrave;nh nỗi &aacute;m ảnh cho rất nhiều người từ trước đến nay.&nbsp;</p>

<p dir="ltr"><img alt="Nhổ răng khôn" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/07.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<h2 dir="ltr" id="Nh++r+ng+c+++au+v++nguy+hi+m+kh+ng+" name="Nh++r+ng+c+++au+v++nguy+hi+m+kh+ng+"><strong>II. Tại sao n&ecirc;n nhổ răng kh&ocirc;n?&nbsp;</strong></h2>

<p>T&acirc;m l&yacute; chung của mọi người đ&oacute; ch&iacute;nh l&agrave; lo ngại việc nhổ răng kh&ocirc;n sẽ ảnh hưởng đến d&acirc;y thần kinh, sức khỏe thậm ch&iacute; nguy hiểm đến t&iacute;nh mạng.</p>

<p>&nbsp;</p>

<p>Tuy nhi&ecirc;n, c&aacute;c b&aacute;c sĩ khuy&ecirc;n rằng n&ecirc;n nhổ răng kh&ocirc;n c&agrave;ng sớm c&agrave;ng tốt v&igrave; những l&yacute; do sau:&nbsp;</p>

<ul>
	<li>Răng kh&ocirc;n kh&ocirc;ng đ&oacute;ng vai tr&ograve; quan trọng trong qu&aacute; tr&igrave;nh nhai thức ăn.&nbsp;</li>
	<li>Răng kh&ocirc;n nằm s&acirc;u b&ecirc;n trong g&oacute;c h&agrave;m n&ecirc;n rất kh&oacute; chải tới, tạo điều kiện cho vi khuẩn ph&aacute;t triển g&acirc;y s&acirc;u răng.&nbsp;</li>
	<li>Răng kh&ocirc;n mọc lệch, x&ocirc; đẩy c&aacute;c răng b&ecirc;n cạnh khiến tổng thể h&agrave;m răng bị khấp khểnh.&nbsp;</li>
	<li>Răng kh&ocirc;n mọc ngầm ph&aacute; hủy ch&acirc;n răng số 7, g&acirc;y vi&ecirc;m nhiễm v&agrave; mất răng b&ecirc;n cạnh.&nbsp;</li>
	<li>Răng kh&ocirc;n mọc thẳng bị lợi tr&ugrave;m g&acirc;y &aacute;p xe sưng đau v&agrave; khiến người bệnh bị sốt mỗi khi mọc răng.&nbsp;</li>
</ul>

<h2 dir="ltr" id="C+c+tr++ng+h+p+kh+ng+n+n+nh++r+ng" name="C+c+tr++ng+h+p+kh+ng+n+n+nh++r+ng"><strong>III. C&aacute;c trường hợp kh&ocirc;ng n&ecirc;n nhổ răng số 8</strong></h2>

<p>Mặc d&ugrave; răng kh&ocirc;n n&ecirc;n được nhổ bỏ d&ugrave; mọc thẳng, tuy nhi&ecirc;n c&oacute; một số trường hợp kh&ocirc;ng n&ecirc;n nhổ răng 8:</p>

<ul>
	<li>Bệnh nh&acirc;n nhiễm c&aacute;c bệnh vi&ecirc;m cấp t&iacute;nh như: vi&ecirc;m lợi, vi&ecirc;m khớp răng, vi&ecirc;m xoang&hellip;Với c&aacute;c trường hợp n&agrave;y cần điều trị khỏi c&aacute;c bệnh tr&ecirc;n th&igrave; mới n&ecirc;n nhổ răng để đảm bảo an to&agrave;n.</li>
	<li>Bệnh nh&acirc;n gặp c&aacute;c bệnh về tim mạch hay một số bệnh li&ecirc;n quan đến thần kinh</li>
	<li>Phụ nữ mang thai hoặc trong thời kỳ kinh nguyệt.</li>
</ul>

<p><strong><em>Trường hợp tuyệt đối kh&ocirc;ng được nhổ răng:</em></strong><br />
&nbsp;</p>

<ul>
	<li>Bệnh nh&acirc;n gặp c&aacute;c vấn đề về bạch cầu: nếu nhổ răng sẽ dễ g&acirc;y t&igrave;nh trạng chảy m&aacute;u, vi&ecirc;m nhiễm, rất kh&oacute; điều trị thậm ch&iacute; c&oacute; thể g&acirc;y tử vong.</li>
	<li>Bệnh nhận đ&atilde; từng điều trị tia X v&ugrave;ng h&agrave;m mặt bởi khi điều trị tia X th&igrave; việc nhổ răng c&oacute; thể g&acirc;y hoại tử xương h&agrave;m.</li>
</ul>

<p dir="ltr"><img alt="Các trường hợp không nên nhổ răng khôn" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/04.jpg" /></p>

<p dir="ltr" role="presentation">&nbsp;</p>

<h2 dir="ltr" id="Quy+tr+nh+nh++r+ng+c+a+nha+khoa+qu+c+t++Vi+t+Ph+p" name="Quy+tr+nh+nh++r+ng+c+a+nha+khoa+qu+c+t++Vi+t+Ph+p"><strong>IV. Quy tr&igrave;nh nhổ răng kh&ocirc;n&nbsp;tại Nha khoa Quốc tế Việt Ph&aacute;p</strong></h2>

<p dir="ltr">Nhổ răng kh&ocirc;n tuy đơn giản nhưng cần tu&acirc;n theo một quy tr&igrave;nh chuẩn để hạn chế c&aacute;c rủi ro v&agrave; biến chứng.</p>

<p dir="ltr">Tại nha khoa Quốc tế Việt Ph&aacute;p quy tr&igrave;nh n&agrave;y được thực hiện theo 5&nbsp;bước:&nbsp;</p>

<p dir="ltr"><img alt="Quy trình nhổ răng khôn tại nha khoa Quốc tế Việt Pháp" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/02.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<h3 id="B++c+1++Th+m+kh+m+v++ki+m+tra+t+nh+tr+ng+r+ng+mi+ng" name="B++c+1++Th+m+kh+m+v++ki+m+tra+t+nh+tr+ng+r+ng+mi+ng"><strong>Bước 1: Thăm kh&aacute;m v&agrave; kiểm tra t&igrave;nh trạng răng miệng</strong></h3>

<p>Trước ti&ecirc;n, c&aacute;c b&aacute;c sĩ sẽ kiểm tra tổng qu&aacute;t v&agrave; tiến h&agrave;nh chụp X &ndash; quang để ước t&iacute;nh mức độ kh&oacute; của ca nhổ răng, đồng thời ph&aacute;t hiện c&oacute; những đặc điểm hay bất thường g&igrave; kh&ocirc;ng.</p>

<h3 id="B++c+2++V++sinh+r+ng" name="B++c+2++V++sinh+r+ng"><strong>Bước 2: Vệ sinh răng</strong></h3>

<p id="" name="">Đ&acirc;y l&agrave; bước cần thiết để tr&aacute;nh việc vi&ecirc;m nhiễm trong qu&aacute; tr&igrave;nh thực hiện nhổ răng. Đồng thời với c&aacute;c bệnh nh&acirc;n l&acirc;u ng&agrave;y kh&ocirc;ng lấy cao răng th&igrave; c&aacute;c b&aacute;c sĩ sẽ tiến h&agrave;nh lấy cao răng lu&ocirc;n trong bước n&agrave;y.</p>

<h3 id="B++c+3++Ti+m+t+" name="B++c+3++Ti+m+t+"><strong>Bước 3: Ti&ecirc;m t&ecirc;</strong></h3>

<p id="" name="">Ti&ecirc;m thuốc t&ecirc; sẽ gi&uacute;p bệnh nh&acirc;n kh&ocirc;ng cảm thấy đau đớn hay &ecirc; buốt trong khi nhổ.&nbsp;</p>

<p name="L+u++++Nhi+u+b+n+s++lo+s+++au+khi+ti+m+t++nh+ng+hi+n+nay+tr++c+khi+th+c+hi+n+ti+m+c+c+b+c+s++s++thoa+thu+c+t++l+n+v++tr++c+n+ti+m++do++++gi+m+r++r+t+c+m+gi+c++au+bu+t+khi+ti+m++B++c+4+++Nh++r+ng">Lưu &yacute;: Nhiều bạn sẽ lo sợ đau khi ti&ecirc;m t&ecirc; nhưng hiện nay trước khi thực hiện ti&ecirc;m c&aacute;c b&aacute;c sĩ sẽ thoa thuốc t&ecirc; l&ecirc;n vị tr&iacute; cần ti&ecirc;m, do đ&oacute; giảm r&otilde; rệt cảm gi&aacute;c đau buốt khi ti&ecirc;m.</p>

<h3 id="B++c+4+++Nh++r+ng" name="B++c+4+++Nh++r+ng"><strong>Bước 4: &nbsp;Nhổ răng</strong></h3>

<p>Hiện nay, trong qu&aacute; tr&igrave;nh nhổ răng tại Việt Ph&aacute;p, c&aacute;c b&aacute;c sĩ sẽ sử dụng c&ocirc;ng nghệ m&aacute;y si&ecirc;u &acirc;m Piezotome để thực hiện. Điều n&agrave;y kh&ocirc;ng những r&uacute;t ngắn thời gian nhổ m&agrave; c&ograve;n ch&iacute;nh x&aacute;c v&agrave; an to&agrave;n hơn rất nhiều so với phương ph&aacute;p nhổ tay truyền thống.</p>

<p id="Nh++r+ng+kh+n++++c+th+c+hi+n+b+ng+c+ch+r+ch+m+t++++ng+nh+++++l++th+n+r+ng++sau++++s++d+ng+m+y+nh++r+ng+si+u++m+Piezotome++++t+c+++ng+l+m+++t+c+c+d+y+ch+ng+nha+chu++Nh++++++r+ng+kh+n+s++t+ch+d+n+ra+kh+i+n++u+m++kh+ng+g+y+x+m+l+n++h+n+ch++ch+y+m+u+t+i++a+++B++c+5++Kh+u+++ng+k+n+v+t+th++ng+" name="Nh++r+ng+kh+n++++c+th+c+hi+n+b+ng+c+ch+r+ch+m+t++++ng+nh+++++l++th+n+r+ng++sau++++s++d+ng+m+y+nh++r+ng+si+u++m+Piezotome++++t+c+++ng+l+m+++t+c+c+d+y+ch+ng+nha+chu++Nh++++++r+ng+kh+n+s++t+ch+d+n+ra+kh+i+n++u+m++kh+ng+g+y+x+m+l+n++h+n+ch++ch+y+m+u+t+i++a+++B++c+5++Kh+u+++ng+k+n+v+t+th++ng+">Nhổ răng kh&ocirc;n được thực hiện bằng c&aacute;ch rạch một đường nhỏ để lộ th&acirc;n răng, sau đ&oacute; sử dụng m&aacute;y nhổ răng si&ecirc;u &acirc;m Piezotome để t&aacute;c động l&agrave;m đứt c&aacute;c d&acirc;y chằng nha chu. Nhờ đ&oacute;, răng kh&ocirc;n sẽ t&aacute;ch dần ra khỏi nướu m&agrave; kh&ocirc;ng g&acirc;y x&acirc;m lấn, hạn chế chảy m&aacute;u tối đa.&nbsp;</p>

<h3 id="B++c+5++Kh+u+++ng+k+n+v+t+th++ng+" name="B++c+5++Kh+u+++ng+k+n+v+t+th++ng+"><strong>Bước 5: Kh&acirc;u đ&oacute;ng k&iacute;n vết thương&nbsp;</strong></h3>

<p>B&aacute;c sĩ sẽ kh&acirc;u đ&oacute;ng k&iacute;n vết thương bằng chỉ tự ti&ecirc;u v&agrave; ho&agrave;n tất qu&aacute; tr&igrave;nh nhổ răng. B&ecirc;n cạnh đ&oacute;, kh&aacute;ch h&agrave;ng sẽ được hướng dẫn chăm s&oacute;c răng miệng v&agrave; hẹn lịch t&aacute;i kh&aacute;m sau 1 tuần.&nbsp;</p>

<p>&nbsp;</p>
', N'40c74348-2c43-4b42-9b72-b11bf418f758', CAST(3000000.00000000 AS Decimal(30, 8)), 1684849987142, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'26837e3c-4dd3-41f7-9e5a-5862068cd8b8', N'Làm trắng', N'Lam trang', N'/files/service/c1322bc2-48f7-49fd-818d-eb593375b3cc.jpg', 15, N'<p>abcc</p>
', N'b1033580-2637-42f1-8c76-900e4b370588', CAST(200000.00000000 AS Decimal(30, 8)), 1686365069962, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'47396871-9d99-4499-9fab-e612823e7139', N'Niềng răng mắc cài mặt trong', N'Nieng rang mac cai mat trong', N'/files/service/57477045-5d2a-4f0f-92a0-6408c2a4f3b0.jpg', 60, N'<h2 id="I++Ni+ng+r+ng+m+c+c+i+m+t+trong+l++g+++" name="I++Ni+ng+r+ng+m+c+c+i+m+t+trong+l++g+++"><strong>I. Niềng răng mắc c&agrave;i mặt trong l&agrave; g&igrave;?&nbsp;</strong></h2>

<p>Niềng răng mắc c&agrave;i mặt trong (hay c&ograve;n gọi l&agrave; niềng răng mặt lưỡi) -&nbsp;l&agrave; giải ph&aacute;p&nbsp;niềng răng hiện đại, đảm bảo t&iacute;nh thẩm mỹ cao. Với phương ph&aacute;p niềng răng mặt lưỡi,&nbsp;kh&iacute; cụ sẽ&nbsp;được gắn ở mặt trong của răng, nơi tiếp x&uacute;c gần với lưỡi n&ecirc;n kh&ocirc;ng để lộ mắc c&agrave;i ra b&ecirc;n ngo&agrave;i.&nbsp;<br />
&nbsp;</p>

<p><img alt="niềng răng mặt trong" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/products/nieng-rang-mac-cai-mat-luoi-5.jpg" /></p>

<p>&nbsp;</p>

<p>Niềng răng<b>&nbsp;</b>mắc c&agrave;i mặt trong rất ph&ugrave; hợp với những người t&iacute;nh chất c&ocirc;ng việc&nbsp;phải ngoại giao nhiều. Phương ph&aacute;p niềng răng&nbsp;mắc c&agrave;i mặt trong đ&ograve;i hỏi b&aacute;c sĩ thực hiện phải l&agrave; người c&oacute; tay nghề kỹ thuật giỏi, chuy&ecirc;n m&ocirc;n cao. Ch&iacute;nh v&igrave; thế m&agrave; chi ph&iacute; của phương ph&aacute;p niềng răng n&agrave;y&nbsp;cũng thường kh&aacute; cao.</p>

<h2 id="II++Tr++ng+h+p+c++th++ni+ng+r+ng+m+c+c+i+m+t+l++i" name="II++Tr++ng+h+p+c++th++ni+ng+r+ng+m+c+c+i+m+t+l++i"><b>II. Trường hợp c&oacute; thể&nbsp;niềng răng mắc c&agrave;i mặt lưỡi</b></h2>

<p>Niềng răng mắc c&agrave;i thường được sử dụng để khắc phục&nbsp;những sai lệch về răng như&nbsp;sau:</p>

<ul>
	<li>Răng thưa</li>
	<li>Răng khấp khểnh, lệch lạc</li>
	<li>Răng h&ocirc;, m&oacute;m nhẹ</li>
</ul>

<p>Nh&igrave;n&nbsp;chung, niềng răng mắc c&agrave;i chỉ c&oacute; thể&nbsp;&aacute;p dụng được cho những trường hợp lệch lạc răng nhẹ. Đối với những trường hợp nặng như khớp cắn s&acirc;u, h&ocirc; khay khấp khểnh nhiều th&igrave; bắt buộc phải sử dụng phương ph&aacute;p niềng răng mắc c&agrave;i th&ocirc;ng thường.&nbsp;</p>

<p id="" name="">&nbsp;</p>

<h2 id="III++Quy+tr+nh+ni+ng+r+ng+m+c+c+i+m+t+trong+t+i+Vi+t+Ph+p" name="III++Quy+tr+nh+ni+ng+r+ng+m+c+c+i+m+t+trong+t+i+Vi+t+Ph+p"><b>III. Quy tr&igrave;nh niềng răng mắc c&agrave;i mặt trong tại Việt Ph&aacute;p</b></h2>

<p>Quy tr&igrave;nh niềng răng tại Nha khoa quốc tế Việt Ph&aacute;p sẽ trải qua c&aacute;c bước như sau:</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/i7(1).jpg" /></p>

<p>&nbsp;</p>

<h3 dir="ltr" id="B++c+1+++Th+m+kh+m+v++t++v+n" name="B++c+1+++Th+m+kh+m+v++t++v+n"><strong>Bước 1 : Thăm kh&aacute;m v&agrave; tư vấn</strong></h3>

<p dir="ltr">Đầu ti&ecirc;n, kh&aacute;ch h&agrave;ng&nbsp;đến nha khoa sẽ được được b&aacute;c sĩ thăm kh&aacute;m tổng qu&aacute;t về t&igrave;nh trạng răng miệng hiện tại. Tiếp theo, b&aacute;c sĩ sẽ&nbsp;chụp X Quang để x&aacute;c định ch&iacute;nh x&aacute;c t&igrave;nh trạng răng, đồng thời tư vấn lựa chọn phương ph&aacute;p niềng v&agrave; chi ph&iacute; ph&ugrave; hợp.&nbsp;</p>

<h3 dir="ltr" id="B++c+2++K++h+p+++ng+ni+ng+r+ng+v++l+n+k++ho+ch" name="B++c+2++K++h+p+++ng+ni+ng+r+ng+v++l+n+k++ho+ch"><strong>Bước 2: L&ecirc;n kế hoạch, ph&aacute;c đồ điều trị ph&ugrave; hợp</strong></h3>

<p dir="ltr">Nếu kh&aacute;ch h&agrave;ng&nbsp;đồng &yacute; sử dụng dịch vụ niềng răng của nha khoa b&aacute;c sĩ sẽ l&ecirc;n c&aacute;c kế hoạch v&agrave; thời gian niềng răng cho từng giai đoạn cụ thể.&nbsp;</p>

<h3 dir="ltr" id="B++c+3+++L+y+d+u+m+u+h+m" name="B++c+3+++L+y+d+u+m+u+h+m"><strong>Bước 3 :&nbsp;Tiến h&agrave;nh gắn mắc c&agrave;i</strong></h3>

<p dir="ltr">Đầu ti&ecirc;n b&aacute;c sĩ sẽ gắn mắc c&agrave;i l&ecirc;n mặt sau của răng, đeo thun, d&acirc;y cung m&ocirc;i, neo chặn,&hellip; để định h&igrave;nh tạo ra lực k&eacute;o cho răng.&nbsp;</p>

<p dir="ltr">Qu&aacute; tr&igrave;nh gắn mắc c&agrave;i cần c&oacute; sự tỉ mỉ theo đ&uacute;ng kỹ thuật, ph&ograve;ng kh&aacute;m hiện đại đảm bảo những kh&iacute; cụ tạo lực k&eacute;o ổn định nhanh ch&oacute;ng sắp xếp lại những răng bị lệch lạc về đ&uacute;ng chuẩn cung h&agrave;m m&agrave; kh&ocirc;ng ảnh hưởng đến sức khỏe của bạn.</p>

<h3 dir="ltr" id="B++c+4+++Ti+n+h+nh+g+n+m+c+c+i" name="B++c+4+++Ti+n+h+nh+g+n+m+c+c+i"><strong>Bước 4 : T&aacute;i kh&aacute;m trong qu&aacute; tr&igrave;nh&nbsp;niềng răng</strong></h3>

<p dir="ltr">Sau khi đeo mắc c&agrave;i, kh&aacute;ch h&agrave;ng&nbsp;sẽ được tiến h&agrave;nh t&aacute;i kh&aacute;m định k&igrave; 1 th&aacute;ng một lần tại nha khoa để c&aacute;c b&aacute;c sĩ theo d&otilde;i chi tiết nhất t&igrave;nh trạng răng của bạn. Đồng thời b&aacute;c sĩ sẽ điều chỉnh siết răng&nbsp;để&nbsp;mang lại hiệu quả tốt nhất&nbsp;cho qu&aacute; tr&igrave;nh niềng răng.</p>

<h3 dir="ltr" id="B++c+6++Th+o+m+c+ni+ng+r+ng" name="B++c+6++Th+o+m+c+ni+ng+r+ng"><strong>Bước 5: Th&aacute;o niềng răng v&agrave; đeo h&agrave;m duy tr&igrave;</strong></h3>

<p dir="ltr">Kết th&uacute;c qu&aacute; tr&igrave;nh điều trị như kế hoạch ban đầu đ&atilde; l&ecirc;n b&aacute;c sĩ sẽ tiến h&agrave;nh th&aacute;o mắc c&agrave;i.&nbsp;Sau khi th&aacute;o mắc c&agrave;i bạn sẽ phải sử dụng th&ecirc;m h&agrave;m duy tr&igrave; được l&agrave;m bằng nhựa để gi&uacute;p cho răng kh&ocirc;ng bị di chuyển về vị tr&iacute; cũ.</p>
', N'e5467e03-f260-43fb-ab8c-5b253983aa36', CAST(70000000.00000000 AS Decimal(30, 8)), 1684849642869, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'5b7b716e-f73f-4d7d-b280-36617dca0e81', N'Cấy ghép / Trồng răng Implant', N'Cay ghep   Trong rang Implant', N'/files/service/5ed2bcda-2380-4ac4-b0a5-b475d1fe55ff.jpg', 60, N'<h2 dir="ltr" id="Implant+l++g++" name="Implant+l++g++"><strong>Trồng răng Implant l&agrave; g&igrave;? Bản chất thật sự của trồng răng Implant</strong></h2>

<p dir="ltr"><img alt="trong-rang-implant-la-gi" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/%E1%BA%A2nh%20Implant.jpg" /></p>

<p dir="ltr">Hẳn rất nhiều người đ&atilde; nghe đến thuật ngữ &ldquo;Trồng răng Implant&rdquo; hay &ldquo;cấy gh&eacute;p Implant&rdquo;. Tuy nhi&ecirc;n, kh&ocirc;ng phải ai cũng hiểu r&otilde; phương ph&aacute;p n&agrave;y l&agrave; g&igrave; v&agrave; quy tr&igrave;nh thực hiện như thế n&agrave;o.</p>

<p dir="ltr">Đ&acirc;y l&agrave; kĩ thuật nha khoa cấy gh&eacute;p&nbsp;một ch&acirc;n răng giả bằng trụ titanium&nbsp;thay thế cho răng bị mất. Sau khi trụ titanium n&agrave;y được t&iacute;ch hợp v&agrave;o xương, b&aacute;c sĩ sẽ tiến h&agrave;nh chụp m&atilde;o sứ l&ecirc;n răng để tạo th&agrave;nh một răng ho&agrave;n chỉnh, đảm nhiểm chức năng của răng đ&atilde; mất.</p>

<p dir="ltr">Cơ sở cho phương ph&aacute;p cấy gh&eacute;p n&agrave;y l&agrave;&nbsp;qu&aacute; tr&igrave;nh t&iacute;ch hợp osseo. Trong đ&oacute;, vật liệu titan tạo th&agrave;nh một li&ecirc;n kết mật thiết với xương h&agrave;m thay thế cho ch&acirc;n răng cũ.&nbsp;</p>

<p dir="ltr">Cũng ch&iacute;nh sự kh&ocirc;ng đ&agrave;o thải của xương h&agrave;m với Titan m&agrave; việc cấy gh&eacute;p Implant kh&ocirc;ng trượt, kh&ocirc;ng g&acirc;y tổn thương như c&aacute;ch cố định cầu răng hoặc răng giả.</p>

<h2 dir="ltr" id="M+t+b++Implant+bao+g+m+3+ph+n+ch+nh+" name="M+t+b++Implant+bao+g+m+3+ph+n+ch+nh+"><b>Những bộ phận ch&iacute;nh của trụ Implant</b></h2>

<p dir="ltr"><img alt="nhung-bo-phan-chinh-cua-tru-implant" longdesc="https://nhakhoaquoctevietphap.com.vn/nhung-bo-phan-chinh-cua-tru-implant" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/3%20b%E1%BB%99%20ph%E1%BA%ADn%20implant.jpg" /></p>

<p dir="ltr">Một chiếc răng Implant ho&agrave;n chỉnh bao gồm 3 bộ phận ch&iacute;nh: Trụ Implant, khớp nối Abutment, m&atilde; răng sứ.</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Bộ cố định Implant hay&nbsp;trụ Implant</strong>: Trụ Implant c&oacute; h&igrave;nh d&aacute;ng tương tự như ch&acirc;n răng. Bộ phận n&agrave;y&nbsp;được thiết kế theo&nbsp;h&igrave;nh trụ hoặc thu&ocirc;n d&agrave;i dần như đinh ốc, c&oacute; c&aacute;c v&ograve;ng xoắn li&ecirc;n tục xu&ocirc;i chiều để tế b&agrave;o xương t&iacute;ch hợp với bề mặt nhanh nhất v&agrave; chắc chắn nhất.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Khớp nối Abutment</strong>: Bộ phận chốt kim loại đặt giữa trụ Implant v&agrave; m&atilde;o răng sứ. Đầu dưới của Abutment gắn chặt với miệng của trụ Implant. Đầu tr&ecirc;n ở tr&ecirc;n nướu v&agrave; kết nốt chặt chẽ với m&atilde;o răng sứ.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>M&atilde;o răng sứ</strong>: Thực chất, đ&acirc;y l&agrave; một lớp chụp sứ c&oacute; l&otilde;i rỗng, được kết nối vừa kh&iacute;t với đầu tr&ecirc;n của abutment.&nbsp;M&atilde;o răng sứ&nbsp;c&oacute; h&igrave;nh d&aacute;ng, m&agrave;u sắc, chức năng, k&iacute;ch thước tương tự như răng thật. Ngo&agrave;i chất liệu sứ Titan, lớp chụp n&agrave;y c&oacute; thể được l&agrave;m bằng Cercon HT, Ceramill, Nacera,...</p>
	</li>
</ul>

<h2 dir="ltr" id="Nh+ng++u++i+m+khi+tr+ng+r+ng+Implant" name="Nh+ng++u++i+m+khi+tr+ng+r+ng+Implant"><strong>Những ưu điểm khi trồng răng Implant</strong></h2>

<p dir="ltr">Kh&ocirc;ng phải ngẫu nhi&ecirc;n m&agrave; phương ph&aacute;p trồng răng Implant lại được hơn 10.000 kh&aacute;ch h&agrave;ng tại Nha khoa Quốc tế Việt Ph&aacute;p tin tưởng v&agrave; sử dụng nhiều đến thế.</p>

<p dir="ltr">C&oacute; thể kể tới một số ưu điểm vượt trội của phương ph&aacute;p n&agrave;y như:</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">L&agrave; phương ph&aacute;p sinh sau đẻ muộn n&ecirc;n kĩ thuật n&agrave;y c&oacute; ứng dụng nhiều c&ocirc;ng nghệ y học hiện đại bậc nhất hiện nay.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Ngăn chặn một c&aacute;ch tối đa t&igrave;nh trạng ti&ecirc;u xương do mất răng g&acirc;y l&ecirc;n</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Kh&ocirc;ng ảnh hưởng đến c&aacute;c răng b&ecirc;n cạnh khi tiến h&agrave;nh lắp gh&eacute;p</p>
	</li>
</ul>

<ul>
	<li>
	<p>Cấy gh&eacute;p Implant ph&ugrave; hợp với sinh l&yacute; tự nhi&ecirc;n hơn, kh&ocirc;ng ảnh hưởng tới sức khỏe của người cấy gh&eacute;p</p>
	</li>
	<li>
	<p>Tỷ lệ cấy cấy gh&eacute;p th&agrave;nh c&ocirc;ng cao hơn so với tạo cầu răng th&aacute;o lắp th&ocirc;ng thường</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Phục h&igrave;nh như răng thật</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">C&oacute; khả năng phục hồi chức năng nhai, n&oacute;i, nuốt,...</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Mang lại chức năng thẩm mỹ</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Thời gian sử dụng l&acirc;u d&agrave;i, thậm ch&iacute; l&agrave; m&atilde;i m&atilde;i</p>
	</li>
</ul>

<p dir="ltr">Nếu như đ&ocirc;i mắt được v&iacute; như l&agrave; cửa sổ t&acirc;m hồn th&igrave; nụ cười giống như sợi d&acirc;y v&ocirc; h&igrave;nh kết nối ch&uacute;ng ta lại với nhau. Bởi vậy nụ cười đẹp bao giờ cũng chiếm trọn t&igrave;nh cảm của rất nhiều người.&nbsp;</p>

<p dir="ltr">Do đ&oacute; việc kh&ocirc;i phục lại những chiếc răng đ&atilde; mất thật sự rất quan trọng. Bởi n&oacute; kh&ocirc;ng những l&agrave;m cho nụ cười rạng rỡ hơn m&agrave; c&ograve;n đảm bảo sức khỏe của người mất răng.&nbsp;</p>

<p dir="ltr">V&agrave; trồng răng Implant ch&iacute;nh l&agrave; giải ph&aacute;p tối ưu nhất hiện nay gi&uacute;p khắc phục t&igrave;nh trạng mất một hoặc nhiều răng bởi c&oacute; t&iacute;nh thẩm cao, tuổi thọ d&agrave;i v&agrave; độ an to&agrave;n lớn.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><img alt="nhung-uu-diem-khi-trong-rang-implant" longdesc="https://nhakhoaquoctevietphap.com.vn/nhung-uu-diem-khi-trong-rang-implant" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/Gi%E1%BA%A3i%20ph%C3%A1p%20tr%E1%BB%93ng%20implant%20t%E1%BB%91i%20%C6%B0u%20nh%E1%BA%A5t.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">N&oacute;i đến đ&acirc;y c&oacute; thể nhiều người sẽ thắc mắc kh&ocirc;ng biết trước khi kĩ thuật cấy gh&eacute;p Implant ra đời th&igrave; họ thay thế răng đ&atilde; mất như thế n&agrave;o?</p>

<p dir="ltr">C&oacute; thể thấy rằng khi phương ph&aacute;p trồng răng Implant chưa được &aacute;p dụng trong nha khoa th&igrave; 2 kĩ thuật h&agrave;m giả th&aacute;o lắp v&agrave; cầu răng sứ cũng c&oacute; thể phục hồi lại răng đ&atilde; mất.</p>

<h2 dir="ltr" id="Tr+ng+r+ng+Implant+v++++i+t++ng+ph++h+p" name="Tr+ng+r+ng+Implant+v++++i+t++ng+ph++h+p" role="presentation"><strong>Trồng răng Implant ph&ugrave; hợp với&nbsp;đối tượng n&agrave;o?</strong></h2>

<p dir="ltr">Mặc d&ugrave; mang nhiều t&iacute;nh năng hiện đại hơn hẳn những phương ph&aacute;p thay thế răng truyền thống nhưng việc cấy gh&eacute;p Implant n&agrave;y kh&ocirc;ng phải ai cũng c&oacute; thể &aacute;p dụng.</p>

<ul>
	<li>Mất một hoặc nhiều răng&nbsp; tr&ecirc;n cung h&agrave;m</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Xương h&agrave;m đ&atilde; ph&aacute;t triển đầy đủ v&agrave; chưa bị t&igrave;nh trạng ti&ecirc;u xương nghi&ecirc;m trọng do để thời gian mất răng qu&aacute; l&acirc;u</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Sức khỏe ổn định, kh&ocirc;ng mắc c&aacute;c bệnh l&yacute; nền ảnh hưởng đến qu&aacute; tr&igrave;nh cấy gh&eacute;p v&agrave; liền xương</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">C&oacute; m&ocirc; miệng khỏe mạnh</p>
	</li>
</ul>

<p dir="ltr">B&ecirc;n cạnh đ&oacute; với c&aacute;c trường hợp phụ nữ đang mang thai hay với những người c&oacute; sức khỏe yếu th&igrave; cần c&acirc;n nhắc kĩ v&agrave; chỉ thực hiện khi đ&atilde; được sự đồng &yacute; của c&aacute;c b&aacute;c sĩ c&oacute; chuy&ecirc;n m&ocirc;n.</p>
', N'54075702-ed19-4089-b7ac-19618e0ecaba', CAST(36000000.00000000 AS Decimal(30, 8)), 1684850122597, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'8cd8185a-f964-4e9c-948b-af13169aa5f6', N'Niềng răng Invisalign', N'Nieng rang Invisalign', N'/files/service/ba007770-332f-4c3b-9691-3b6ad63a1e17.jpg', 60, N'<h2 id="Ni+ng+r+ng+Invisalign+l++nh++th++n+o++" name="Ni+ng+r+ng+Invisalign+l++nh++th++n+o++"><strong>I. Niềng răng Invisalign l&agrave; g&igrave;?&nbsp;</strong></h2>

<p>Niềng răng Invisalign l&agrave; phương ph&aacute;p niềng răng trong suốt tiến bộ nhất hiện nay. Phương ph&aacute;p n&agrave;y kh&ocirc;ng chỉ giữ được thẩm mỹ cho người d&ugrave;ng c&ograve;n t&aacute;c động lực đủ để chỉnh lại răng.&nbsp;</p>

<p>Invisalign bao gồm một loạt 30 đến 50 khay nhựa trong suốt giống như miếng bảo vệ miệng, được l&agrave;m theo y&ecirc;u cầu. C&aacute;c khay nhựa c&oacute; thể th&aacute;o rời v&agrave; được thay thế sau từ 10 - 15 ng&agrave;y.</p>

<p>&nbsp;</p>

<p><img alt="Niềng răng Invisalign" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/i1.jpg" /></p>

<p>&nbsp;</p>

<p>Khay chỉnh nha&nbsp;Invisalign được đặt từ ph&ograve;ng Labo b&ecirc;n Hoa Kỳ, sau khi qua những ph&ograve;ng xử l&yacute;, th&igrave; m&aacute;ng Invisalign sẽ được gửi về Việt Nam ch&iacute;nh v&igrave; thế phải đặt trước số m&aacute;ng theo chỉ định của b&aacute;c sĩ.&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="Niềng răng tàng hình" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/i2.jpg" /></p>

<p>&nbsp;</p>

<p>Với những cơ chế niềng răng truyền thống, người d&ugrave;ng sẽ đau hơn, ăn uống sinh hoạt thường cảm thấy kh&oacute; chịu c&ograve;n với Invisalign mọi điều n&agrave;y gần như l&agrave; kh&ocirc;ng c&oacute;.&nbsp;</p>

<p>&nbsp;</p>

<h2 id="II+++u++i+m+c+a+ni+ng+r+ng+Invisalign" name="II+++u++i+m+c+a+ni+ng+r+ng+Invisalign"><strong>II. Ưu&nbsp;điểm của niềng răng trong suốt Invisalign</strong></h2>

<p>Niềng răng Invisalign đem lại rất nhiều ưu điểm về t&iacute;nh thẩm mỹ, độ ch&iacute;nh x&aacute;c tuyệt đối v&agrave; khả năng th&aacute;o lắp dễ d&agrave;ng.&nbsp;</p>

<h3 id="+u++i+m+c+a+ni+ng+r+ng+Invisalign" name="+u++i+m+c+a+ni+ng+r+ng+Invisalign"><strong>T&iacute;nh thẩm mỹ cao&nbsp;</strong></h3>

<p>Hầu hết những ai muốn niềng răng đều sợ xấu khi đeo mắc c&agrave;i. Khắc phục được nhược điểm n&agrave;y, niềng răng v&ocirc; h&igrave;nh Invisalign khiến người đối diện kh&oacute; c&oacute; thể ph&aacute;t hiện ra bạn đang sử dụng loại kh&iacute; cụ n&agrave;y. Nhờ vậy, sử dụng khay chỉnh nha Invisalign sẽ đảm bảo t&iacute;nh thẩm mỹ tốt nhất.&nbsp;</p>

<h3 id="Th+o+l+p+d++d+ng+" name="Th+o+l+p+d++d+ng+"><strong>Th&aacute;o lắp dễ d&agrave;ng&nbsp;</strong></h3>

<p>Nếu như niềng răng mắc c&agrave;i khiến bạn kh&oacute; chịu v&igrave; phải cần tới dụng cụ vệ sinh răng&nbsp;chuy&ecirc;n dụng&nbsp;sau mỗi lần ăn uống th&igrave; Invisalign c&oacute; thể khắc phục được nhược điểm n&agrave;y. Với niềng răng Invisalign, bạn c&oacute; thể dễ d&agrave;ng th&aacute;o ra mỗi khi ăn uống v&agrave; vệ sinh răng miệng một c&aacute;ch dễ d&agrave;ng.&nbsp;</p>

<h3 id="+i+u+tr++ch+nh+x+c+" name="+i+u+tr++ch+nh+x+c+"><strong>Điều trị ch&iacute;nh x&aacute;c&nbsp;</strong></h3>

<p>Một bộ khay niềng răng trong suốt Invisalign&nbsp;bao gồm từ 30 - 50 khay nhựa, tương ứng với từng giai đoạn. Thiết kế khay trong Invisalign được&nbsp;t&iacute;nh to&aacute;n bằng phần mềm theo&nbsp;từng trường hợp cụ thể. Nhờ đ&oacute;, răng sẽ dịch chuyển ch&iacute;nh x&aacute;c, đảm bảo kết quả tốt nhất.&nbsp;</p>

<h3 id="+t+ph+i+t+i+g+p+nha+s++" name="+t+ph+i+t+i+g+p+nha+s++"><strong>&Iacute;t phải tới gặp nha sĩ&nbsp;</strong></h3>

<p>Với phương ph&aacute;p niềng răng khay trong Invisalign, bạn sẽ kh&ocirc;ng phải tới gặp b&aacute;c sĩ thường xuy&ecirc;n để siết răng hay thay d&acirc;y cung. Bởi bộ khay niềng đ&atilde; được thiết kế sẵn để điều chỉnh răng theo từng giai đoạn.&nbsp;</p>

<h3 id="Tuy+nhi+n+gi++s++cao+v++hi+u+qu++t++ng+++i" name="Tuy+nhi+n+gi++s++cao+v++hi+u+qu++t++ng+++i"><strong>Tuy nhi&ecirc;n gi&aacute; th&agrave;nh kh&aacute;&nbsp;cao</strong></h3>

<p>Chi ph&iacute; niềng răng Invisalign đắt hơn tất cả c&aacute;c phương ph&aacute;p niềng răng truyền thống kh&aacute;c. Điều n&agrave;y do khay niềng được thiết kế tinh vi, đảm bảo t&iacute;nh thẩm mỹ cũng như đạt&nbsp;hiệu quả tối đa.&nbsp;</p>

<p>&nbsp;</p>

<p>Nh&igrave;n chung, niềng răng Invisalign l&agrave; một lựa chọn tuyệt vời cho những người c&oacute; vấn đề về sự điều chỉnh nhỏ v&agrave; đặt nặng vấn đề thẩm mỹ&nbsp;</p>
', N'e5467e03-f260-43fb-ab8c-5b253983aa36', CAST(130000000.00000000 AS Decimal(30, 8)), 1684834610497, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'95818831-1e48-4d5e-a7cd-4e863a26a707', N'Bọc răng sứ Nacera', N'Boc rang su Nacera', N'/files/service/3e29d981-1439-4998-8169-8e009f099f55.jpg', 30, N'<p>Răng sứ Nacera&nbsp;l&agrave; một trong những loại răng sứ cao cấp l&agrave; d&ograve;ng sứ kh&ocirc;ng kim loại c&ograve;n kh&aacute; mới &iacute;t người biết đến. Răng sứ nacera l&agrave; g&igrave;?&nbsp;<strong>Răng sứ nacera gi&aacute; bao nhi&ecirc;u</strong>? Đ&acirc;y l&agrave; quan t&acirc;m của nhiều kh&aacute;ch h&agrave;ng gửi về cho chuy&ecirc;n mục tư vấn nha khoa Quốc Tế Việt Ph&aacute;p trong tuần vừa qua. Để c&oacute; c&acirc;u trả lời cho những băn khoăn đ&oacute; c&ugrave;ng t&igrave;m hiểu qua b&agrave;i viết sau đ&acirc;y để c&oacute; c&aacute;i nh&igrave;n tổng quan hơn về d&ograve;ng sứ n&agrave;y.</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/products/rang-su-nacera-2.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<h2 dir="ltr"><strong>RĂNG SỨ NACERA GI&Aacute; BAO NHI&Ecirc;U?</strong></h2>

<p dir="ltr"><strong>Răng sứ nacera gi&aacute; bao nhi&ecirc;u?</strong>&nbsp;Đ&oacute; l&agrave; quan t&acirc;m của nhiều kh&aacute;ch h&agrave;ng, qua những th&ocirc;ng tin tr&ecirc;n bạn c&oacute; thể thấy d&ograve;ng sứ n&agrave;y c&oacute; nhiều ưu điểm th&igrave; chắc hẳn sẽ c&oacute; mức chi ph&iacute; kh&ocirc;ng rẻ. Tr&ecirc;n thực tế th&igrave; bọc răng sứ gi&aacute; bao nhi&ecirc;u c&ograve;n phụ thuộc v&agrave;o nhiều yếu tố như, địa chỉ nha khoa, tay nghề b&aacute;c sĩ, cơ sở vật chất, t&igrave;nh trạng răng của bạn ra sao...&nbsp; H&atilde;y theo d&otilde;i những đặc điểm cấu tạo v&agrave; ưu nhược điểm của d&ograve;ng răng to&agrave;n sứ n&agrave;y để thấy được mức gi&aacute; răng sứ c&oacute; ph&ugrave; hợp, xứng đ&aacute;ng với số tiền m&agrave; bạn bỏ ra kh&ocirc;ng nh&eacute;!</p>

<h3 dir="ltr"><strong>RĂNG SỨ NACERA L&Agrave; G&Igrave;?</strong></h3>

<p dir="ltr"><strong>Răng sứ nacera</strong>&nbsp;l&agrave; một d&ograve;ng răng to&agrave;n sứ cao cấp do tập đo&agrave;n Doceram cung cấp độc quyền c&oacute; xuất xứ từ Đức. D&ograve;ng sứ n&agrave;y được thiết kế, cắt tiện ho&agrave;n to&agrave;n bằng hệ thống Cad/cam hiện đại, mang lại độ ch&iacute;nh x&aacute;c cao tinh tế thẩm mỹ như răng thật. D&ograve;ng sứ Nacera với lớp sườn sứ chống xỉn m&agrave;u tốt, phục h&igrave;nh giống răng thật t&iacute;nh thẩm mỹ tối ưu.</p>

<p dir="ltr">Ngo&agrave;i ra t&iacute;nh chịu lực của loại răng sứ n&agrave;y kh&aacute; tốt, c&oacute; 16 t&ocirc;ng m&agrave;u c&oacute; sẵn c&aacute;c m&agrave;u được d&agrave;n trải như c&acirc;u của răng, cổ răng đến c&aacute;c cạnh răng đảm bảo được độc ch&iacute;nh x&aacute;c với từng kh&aacute;ch h&agrave;ng kh&aacute;c nhau. M&agrave;u răng được chế tạo bằng c&ocirc;ng nghệ cao gi&uacute;p cho m&agrave;u sắc bền, kh&ocirc;ng bị biến đổi trong m&ocirc;i trường miệng của bệnh nh&acirc;n.</p>

<p>&nbsp;</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/products/rang-su-nacera-3.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<h3 dir="ltr"><strong>ƯU ĐIỂM CỦA RĂNG SỨ NACERA</strong></h3>

<p dir="ltr">Cũng như c&aacute;c d&ograve;ng&nbsp;<strong>răng sứ thẩm mỹ</strong>&nbsp;kh&aacute;c, răng sứ nacera c&oacute; những ưu điểm ri&ecirc;ng. Đ&acirc;y l&agrave; d&ograve;ng răng sứ hội tụ đầy đủ c&aacute;c yếu t&ocirc; về t&iacute;nh thẩm mỹ cũng như khả năng ăn nhai tốt, b&ecirc;n cạnh quan t&acirc;m đến gi&aacute; răng nacera th&igrave; ưu điểm ra sao cũng l&agrave; th&ocirc;ng tin cần thiết gi&uacute;p bạn hiểu th&ecirc;m về d&ograve;ng răng sứ n&agrave;y.</p>

<p>+Khả năng ăn nhai ho&agrave;n to&agrave;n như răng thật</p>

<p dir="ltr">Răng sứ nacera c&oacute; khả năng chịu lực gấp 8 lần so với răng thật, chịu lực l&ecirc;n đến 1400 Mpa, gi&uacute;p bạn c&oacute; thể ăn nhai được tất cả những loại thức ăn cứng, dai, dẻo một c&aacute;ch b&igrave;nh thường. Bọc răng sứ nacera bạn khỏi lo vấn đề bị sứt mẻ hay lung lay khi ăn phải đồ cứng.</p>

<p>+Phục h&igrave;nh răng tự nhi&ecirc;n nhất</p>

<p dir="ltr">Răng sứ nacera được chế tạo từ Dioxit zircon c&oacute; t&iacute;nh chất rất trong, với 16 m&agrave;u sẵn c&oacute;, m&agrave;u s&aacute;ng b&oacute;ng một c&aacute;ch tự nhi&ecirc;n. Răng sứ nacera kh&ocirc;ng bị b&oacute;ng mờ đen b&ecirc;n trong, nếu quan s&aacute;t bằng mắt thường rất kh&oacute; ph&acirc;n biệt được đ&acirc;u l&agrave; răng thật v&agrave; đ&acirc;u l&agrave; răng sứ, đảm bảo được t&iacute;nh thẩm mỹ cao cho người sử dụng.</p>

<p>+An to&agrave;n với cơ thể</p>

<p dir="ltr">Răng sứ nacera được c&aacute;c chuy&ecirc;n gia đ&aacute;nh gi&aacute; d&ograve;ng răng sứ l&agrave;nh t&iacute;nh nhất trong c&aacute;c loại d&ograve;ng sứ kh&ocirc;ng kim loại v&agrave; kim loại.&nbsp;<strong>Răng sứ nacera</strong>&nbsp;c&oacute; khả năng tồn tại l&acirc;u tr&ecirc;n cung h&agrave;m m&agrave; kh&ocirc;ng g&acirc;y phản ứng h&oacute;a học trong m&ocirc;i trường miệng.</p>

<p>+Độ bền ổn định tr&ecirc;n cung h&agrave;m</p>

<p dir="ltr">Răng sứ nacera được chế tạo với lớp vỏ bọc đặc biệt, chống biến đổi m&agrave;u, chống m&ograve;n, chống mảng b&aacute;m cho răng cao. Những điều đ&oacute; hạn chế tối đa được t&igrave;nh trạng mảng b&aacute;m v&agrave;o răng tạo th&agrave;nh cao răng, gi&uacute;p tr&aacute;nh được những bệnh l&yacute; li&ecirc;n quan đến vấn đề răng miệng, thuận lợi cho việc vệ sinh răng miệng.</p>

<p>+C&aacute;ch nhiệt tốt</p>

<p dir="ltr">Bọc răng sứ nacera gi&uacute;p bảo tồn răng thật cho bạn, tr&aacute;nh t&aacute;c động những đồ ăn n&oacute;ng hoặc lạnh kh&ocirc;ng g&acirc;y biến đổi trong m&ocirc;i trường khoang miệng kh&ocirc;ng g&acirc;y ra t&igrave;nh trạng &ecirc; buốt.</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/products/rang-su-nacera-4.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<h3 dir="ltr"><strong>TRƯỜNG HỢP &Aacute;P DỤNG BỌC RĂNG SỨ NACERA</strong></h3>

<p dir="ltr">Răng sứ nacera ph&ugrave; hợp với tất cả ai c&oacute; mong muốn l&agrave;m thẩm mỹ răng, c&oacute; nhu cầu phục h&igrave;nh lại răng, cho răng trắng s&aacute;ng, đẹp đều tự nhi&ecirc;n hơn.</p>

<ul>
	<li><i>check</i>Trường hợp răng bị trấn thương sứt, mẻ</li>
	<li><i>check</i>Trường hợp bệnh nh&acirc;n &nbsp;sau điều trị r&uacute;t tủy.</li>
	<li><i>check</i>Trường hợp răng xấu, răng bị m&ograve;n men răng</li>
	<li><i>check</i>Những trường hợp răng bị nhiễm kh&aacute;ng sinh năng, đ&atilde; &aacute;p dụng nhiều c&aacute;ch vẫn kh&ocirc;ng phục hồi lại được.</li>
	<li><i>check</i>Những người muốn c&oacute; nụ cười đẹp đều v&agrave; s&aacute;ng b&oacute;ng đều thực hiện được</li>
</ul>

<p dir="ltr">V&igrave; c&oacute; những ưu điểm vượt trội như vậy n&ecirc;n&nbsp;<strong>gi&aacute; l&agrave;m răng sứ nacera</strong>&nbsp;kh&aacute; cao so với nhiều d&ograve;ng sứ kh&aacute;c.</p>
', N'31bf2b3a-79d0-4ef1-80e1-775728ec4156', CAST(9000000.00000000 AS Decimal(30, 8)), 1684834439575, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'a5a886c8-9445-4028-acda-4a4aac53205a', N'Tẩy trắng răng', N'Tay trang rang', N'/files/service/16d17ab9-db4c-426d-afa4-c05aa67acf45.jpg', 30, N'<h2 dir="ltr" id="T+y+tr+ng+r+ng+l++g++" name="T+y+tr+ng+r+ng+l++g++"><strong>Tẩy trắng răng l&agrave; g&igrave;?</strong></h2>

<p dir="ltr"><strong>H&agrave;m răng được v&iacute; như &ldquo;c&aacute;nh cửa giao tiếp&rdquo; tuyệt hảo của mỗi người</strong>. Bởi đ&oacute; một h&agrave;m răng đẹp, trắng s&aacute;ng sẽ dễ chiếm trọn t&igrave;nh cảm của người đối diện. Ch&iacute;nh điều n&agrave;y m&agrave; tẩy trắng răng đ&atilde; v&agrave; đang l&agrave; phương ph&aacute;p được rất nhiều người quan t&acirc;m d&ugrave; họ ở bất k&igrave; độ tuổi n&agrave;o.</p>

<p dir="ltr">N&oacute;i một c&aacute;ch dễ hiểu th&igrave; tẩy trắng răng l&agrave; phương ph&aacute;p gi&uacute;p cải thiện c&aacute;c vết ố v&agrave;ng hay xỉn m&agrave;u tr&ecirc;n răng, gi&uacute;p răng c&oacute; m&agrave;u sắc đẹp hơn v&agrave; trắng đều hơn.&nbsp;</p>

<p dir="ltr"><img alt="Tẩy trắng răng bằng Laser" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/L-bia.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Hiện nay b&ecirc;n cạnh c&aacute;c c&aacute;ch tẩy trắng răng tại nha khoa th&igrave; rất nhiều người cũng đang t&igrave;m đến c&aacute;c nguy&ecirc;n liệu tự nhi&ecirc;n tại nh&agrave;.</p>

<p dir="ltr"><strong>Theo b&aacute;c sĩ Trần Trung &ndash; nha khoa quốc tế Việt Ph&aacute;p chia sẻ th&igrave; bản chất của tẩy trắng răng Laser l&agrave; tạo ra phản ứng giữa c&aacute;c chất oxy h&oacute;a v&agrave; năng lượng &aacute;nh s&aacute;ng để cắt đứt c&aacute;c chuỗi li&ecirc;n kết ph&acirc;n tử m&agrave;u trong ng&agrave; răng</strong>.&nbsp;</p>

<p dir="ltr">Từ đ&oacute; gi&uacute;p phục hồi m&agrave;u sắc răng ban đầu m&agrave; kh&ocirc;ng g&acirc;y ảnh hưởng đến h&agrave;m răng hay c&aacute;c vấn đề về sức khỏe.</p>

<p dir="ltr">Tuy nhi&ecirc;n kh&ocirc;ng phải tất cả c&aacute;c trường hợp răng nhiễm m&agrave;u đều c&oacute; thể tẩy trắng. Với nhiều trường hợp ở mức độ nặng th&igrave; phương ph&aacute;p tẩy trắng thường kh&ocirc;ng đem lại hiệu quả cao.&nbsp;Thay v&agrave;o đ&oacute; c&aacute;c b&aacute;c sĩ sẽ thường khuy&ecirc;n bệnh nh&acirc;n n&ecirc;n thực hiện bọc sứ hay d&aacute;n sứ t&ugrave;y thuộc theo kết quả kiểm tra răng miệng.</p>

<h2 dir="ltr" id="C+c+nguy+n+nh+n+ch+nh+l+m+r+ng+nhi+m+m+u" name="C+c+nguy+n+nh+n+ch+nh+l+m+r+ng+nhi+m+m+u"><strong>C&aacute;c nguy&ecirc;n nh&acirc;n ch&iacute;nh l&agrave;m răng nhiễm m&agrave;u</strong></h2>

<p dir="ltr">Mức độ răng xỉn m&agrave;u như thế n&agrave;o phụ thuộc rất lớn v&agrave;o c&aacute;c nguy&ecirc;n nh&acirc;n t&aacute;c động l&ecirc;n ch&uacute;ng.&nbsp;</p>

<p dir="ltr">Do đ&oacute; để dễ d&agrave;ng x&aacute;c định, c&aacute;c b&aacute;c sĩ thường chia l&agrave;m 2 nh&oacute;m nguy&ecirc;n nh&acirc;n ch&iacute;nh:</p>

<h3 dir="ltr" id="Nh+m+1++Nhi+m+m+u+tr+n+b++m+t+r+ng+do+" name="Nh+m+1++Nhi+m+m+u+tr+n+b++m+t+r+ng+do+" role="presentation"><strong>Nh&oacute;m 1: Nhiễm m&agrave;u tr&ecirc;n bề mặt răng&nbsp;</strong></h3>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><img alt="Tẩy trắng răng" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/1-%20Tay-trang-rang.png" /></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Thực phẩm, đồ uống</strong></p>
	</li>
</ul>

<p dir="ltr">Rất nhiều thực phẩm ch&uacute;ng ta vẫn thường sử dụng hằng ng&agrave;y lại l&agrave; t&aacute;c nh&acirc;n trực tiếp l&agrave;m xỉn m&agrave;u răng. Do đ&oacute; kh&ocirc;ng n&ecirc;n qu&aacute; lạm dụng c&aacute;c loại thực phẩm n&agrave;y: c&agrave; ph&ecirc;, c&aacute;c loại nước ngọt, tr&agrave;, s&ocirc; c&ocirc; la&hellip;</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Vệ sinh răng miệng kh&ocirc;ng đ&uacute;ng c&aacute;ch</strong></p>
	</li>
</ul>

<p dir="ltr">Đ&aacute;nh răng l&agrave; một trong c&aacute;c bước cơ bản v&agrave; quan trọng kh&ocirc;ng chỉ bảo vệ m&agrave;u sắc răng m&agrave; c&ograve;n ngăn ngừa c&aacute;c bệnh l&yacute; c&oacute; thể xảy ra.</p>

<p dir="ltr">Th&ocirc;ng thường ch&uacute;ng ta nghĩ rằng chỉ cần đ&aacute;nh răng tối thiểu 2 lần/ ng&agrave;y sẽ c&oacute; thể l&agrave;m sạch được c&aacute;c thức ăn thừa hay sự tấn c&ocirc;ng của vi khuẩn tr&ecirc;n răng. Tuy nhi&ecirc;n nếu đ&aacute;nh răng sai c&aacute;ch v&agrave; kh&ocirc;ng đ&uacute;ng thời điểm c&oacute; thể c&ograve;n g&acirc;y hại cho răng.</p>

<h3 dir="ltr" id="Nh+m+2++Nhi+m+m+u+c+u+tr+c+r+ng" name="Nh+m+2++Nhi+m+m+u+c+u+tr+c+r+ng" role="presentation"><strong>Nh&oacute;m 2: Nhiễm m&agrave;u cấu tr&uacute;c răng</strong></h3>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><img alt="Tẩy trắng răng " src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/2-tay-trang-rang.png" /></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Do tuổi t&aacute;c</strong></p>
	</li>
</ul>

<p dir="ltr">C&agrave;ng lớn tuổi th&igrave; lớp men răng c&agrave;ng bị m&agrave;i m&ograve;n dần v&agrave; trở n&ecirc;n yếu hơn khiến t&igrave;nh trạng nhiễm m&agrave;u c&agrave;ng trầm trọng.</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Di truyền</strong></p>
	</li>
</ul>

<p dir="ltr">Nếu răng của hầu hết c&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh bạn bị xỉn m&agrave;u do lớp men răng mỏng th&igrave; bạn cũng sẽ c&oacute; nguy cơ cao bị v&agrave;ng răng.</p>

<p dir="ltr"><strong>Lưu &yacute;:</strong>&nbsp;<strong>Với c&aacute;c trường hợp v&agrave;ng răng do di truyền th&igrave; c&oacute; thể sẽ kh&oacute; để điều trị hơn so với c&aacute;c trường hợp bị t&aacute;c động bởi c&aacute;c t&aacute;c nh&acirc;n b&ecirc;n ngo&agrave;i</strong>.&nbsp;</p>

<p dir="ltr">Nhưng c&aacute;c bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m bởi hiện nay c&ocirc;ng nghệ tẩy trắng răng đ&atilde; hiện đại v&agrave; ti&ecirc;n tiến hơn rất nhiều. Do đ&oacute; c&oacute; thể điều trị được t&igrave;nh trạng răng xỉn m&agrave;u do di truyền.</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Nhiễm kh&aacute;ng sinh&nbsp;</strong></p>
	</li>
</ul>

<p dir="ltr">Nhiễm m&agrave;u kh&aacute;ng sinh&nbsp;thường rất kh&oacute; để điều trị bằng phương ph&aacute;p tẩy trắng răng. Bởi mức độ của nhiễm m&agrave;u n&agrave;y kh&aacute; nặng v&agrave; thường c&oacute; c&aacute;c m&agrave;u sắc kh&aacute;c nhau t&ugrave;y theo mức độ: v&agrave;ng, n&acirc;u, x&aacute;m, t&iacute;m.</p>
', N'b1033580-2637-42f1-8c76-900e4b370588', CAST(2000000.00000000 AS Decimal(30, 8)), 1684850345895, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'ccb1e00e-44b9-4559-9035-391ba22a0a63', N'Niềng răng mắc cài sứ', N'Nieng rang mac cai su', N'/files/service/3cbafe91-2c7f-4e55-9921-9806637b5dd7.jpg', 60, N'<h2 id="I++Ni+ng+r+ng+m+c+c+i+s++l++g++" name="I++Ni+ng+r+ng+m+c+c+i+s++l++g++"><strong>I. Niềng răng mắc c&agrave;i sứ l&agrave; g&igrave;?</strong></h2>

<p>Niềng răng mắc c&agrave;i sứ l&agrave; phương ph&aacute;p chỉnh nha sử dụng hệ thống mắc c&agrave;i sứ v&agrave; d&acirc;y cung nhằm k&eacute;o chỉnh răng đều đẹp hơn. Phương ph&aacute;p n&agrave;y được đ&aacute;nh gi&aacute; cao về mặt thẩm mỹ bởi chất liệu mắc c&agrave;i được l&agrave;m bằng sứ c&oacute; m&agrave;u trắng trong giống với m&agrave;u răng của bạn.&nbsp;</p>

<p><img alt="Niềng răng mắc cài sứ" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/S%E1%BB%A9-b%C3%ACa(1).jpg" /></p>

<p>&nbsp;</p>

<p>Niềng răng mắc c&agrave;i sứ l&agrave; một trong những loại niềng răng chỉnh nha được thiết kế để ph&ugrave; hợp với những ai phải giao tiếp nhiều, cần chỉn chu về ngoại h&igrave;nh.<br />
C&oacute; 2 loại niềng răng mắc c&agrave;i sứ:</p>

<ul>
	<li>Mắc c&agrave;i sứ th&ocirc;ng thường</li>
	<li>Mắc c&agrave;i sứ tự buộc</li>
</ul>

<p><img alt="2 loại mắc cài sứ" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/s%E1%BB%A9-1.jpg" /></p>

<p>&nbsp;</p>

<p>Niềng răng mắc c&agrave;i sứ truyền thống sử dụng hệ thống mắc c&agrave;i, d&acirc;y cung với d&acirc;y thun để cố định v&agrave; điều chỉnh răng theo &yacute; muốn. Trong khi niềng răng mắc c&agrave;i sứ tự buộc được cải tiến th&ecirc;m thanh trượt trong r&atilde;nh mắc c&agrave;i. Nhờ đ&oacute; gi&uacute;p di chuyển răng, khớp h&agrave;m về đ&uacute;ng vị tr&iacute; m&agrave; kh&ocirc;ng cần sử dụng d&acirc;y thun.&nbsp;</p>

<p>&nbsp;</p>

<h2 id="+u++i+m+c+a+ni+ng+r+ng+m+c+c+i+s+" name="+u++i+m+c+a+ni+ng+r+ng+m+c+c+i+s+"><strong>II. Đ&aacute;nh gi&aacute; ưu nhược điểm của niềng răng mắc c&agrave;i sứ</strong></h2>

<h3 id="1+++u++i+m+c+a+ni+ng+r+ng+m+c+c+i+s+" name="1+++u++i+m+c+a+ni+ng+r+ng+m+c+c+i+s+"><strong>1. Ưu điểm của niềng răng mắc c&agrave;i sứ</strong></h3>

<p><img alt="Ưu điểm niềng răng mắc cài sứ" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/s%E1%BB%A9-2.jpg" /></p>

<p>&nbsp;</p>

<ul>
	<li>T&iacute;nh thẩm mỹ được đ&aacute;nh gi&aacute; cao khi người d&ugrave;ng sử dụng niềng răng mắc c&agrave;i sứ, v&igrave; m&agrave;u của mắc c&agrave;i sứ v&agrave; răng gần tr&ugrave;ng m&agrave;u của nhau n&ecirc;n kh&ocirc;ng g&acirc;y ch&uacute; &yacute; với mọi người xung quanh.</li>
	<li>Sử dụng chất liệu sứ n&ecirc;n ho&agrave;n to&agrave;n an to&agrave;n với m&ocirc;i, nướu v&agrave; khoang miệng, ph&ugrave; hợp với những người dị ứng với nhựa hay kim loại.</li>
	<li>Kh&ocirc;ng g&acirc;y đau nhức hay g&acirc;y tổn thương cho người niềng trong qu&aacute; tr&igrave;nh niềng răng.</li>
	<li>Vệ sinh răng miệng kh&aacute; dễ d&agrave;ng.</li>
	<li>Ngo&agrave;i ra th&igrave; mắc c&agrave;i sứ tự buộc c&oacute; điểm ph&aacute;t triển tương đương mắc c&agrave;i kim loại tự buộc.</li>
</ul>

<h3 id="Nh++c++i+m+c+a+ni+ng+r+ng+m+c+c+i+s+" name="Nh++c++i+m+c+a+ni+ng+r+ng+m+c+c+i+s+"><strong>2. Nhược điểm của niềng răng mắc c&agrave;i sứ</strong></h3>

<p><strong><img alt="Nhược điểm niềng răng mắc cài sứ" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/s%E1%BB%A9-3.jpg" /></strong></p>

<ul>
	<li>Mặc d&ugrave; sứ chỉnh nha rất chắc chắn nhưng vẫn c&oacute; thể&nbsp;sứ bị vỡ do va đập hoặc chơi thể thao,...Tuy nhi&ecirc;n tỉ lệ n&agrave;y rất thấp n&ecirc;n bạn kh&ocirc;ng n&ecirc;n qu&aacute; lo lắng!</li>
	<li>Giống như với bất kỳ loại mắc c&agrave;i nha khoa n&agrave;o, bạn n&ecirc;n tr&aacute;nh những thức ăn cứng v&agrave; d&iacute;nh để tr&aacute;nh bị mắc v&agrave;o răng.</li>
	<li>Nếu bạn l&agrave; người tiết kiệm, niềng răng mắc c&agrave;i sứ c&oacute; thể kh&ocirc;ng d&agrave;nh cho bạn; ch&uacute;ng đắt hơn mắc c&agrave;i kim loại truyền thống. Điều n&agrave;y cũng ho&agrave;n to&agrave;n hợp l&yacute; bởi những ưu điểm vượt trội hơn của niềng răng mắc c&agrave;i sứ!</li>
</ul>
', N'e5467e03-f260-43fb-ab8c-5b253983aa36', CAST(50000000.00000000 AS Decimal(30, 8)), 1684849538862, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'e2f39ef1-bb22-474c-9f96-60d232f827a1', N'Nhổ răng thường', N'Nho rang thuong', N'/files/service/c71f64ef-c6e9-43ff-8955-6a21fab233dc.jpg', 15, N'<h2><strong>I. Khi n&agrave;o phải nhổ răng?&nbsp;</strong></h2>

<p>Răng bị nhổ v&igrave; c&aacute;c l&yacute; do sau:<br />
&bull; S&acirc;u răng nặng tiến s&acirc;u v&agrave;o trong răng<br />
&bull; Nhiễm tr&ugrave;ng ph&aacute; hủy phần lớn răng hoặc phần xương xung quanh.<br />
&bull; Kh&ocirc;ng đủ chỗ cho tất cả răng mọc tr&ecirc;n cung h&agrave;m.</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/nho-rang-thuong-1.jpg" /></p>

<p><em>Nhổ răng hiện nay kh&ocirc;ng c&ograve;n l&agrave; nỗi sợ h&atilde;i của mọi người</em></p>

<p>Nhiều b&aacute;c sĩ khuy&ecirc;n n&ecirc;n nhổ c&aacute;c răng ngầm, l&agrave; răng m&agrave; chỉ c&oacute; một phần được mọc nh&uacute; l&ecirc;n. Vi khuẩn c&oacute; thể x&acirc;m nhập v&agrave;o v&ugrave;ng xung quanh của răng nh&uacute; l&ecirc;n một phần n&agrave;y v&agrave; g&acirc;y nhiễm tr&ugrave;ng, nhiễm tr&ugrave;ng c&oacute; thể lan xuống v&ugrave;ng xương xung quanh v&agrave; tạo ra t&igrave;nh trạng cực k&igrave; nghi&ecirc;m trọng. C&aacute;c răng ngầm li&ecirc;n tục ph&aacute;t triển đ&acirc;m xuy&ecirc;n qua m&ocirc; nướu để cố lộ l&ecirc;n tr&ecirc;n cung h&agrave;m, mặt d&ugrave; kh&ocirc;ng đủ chỗ cho ch&uacute;ng mọc. Một &aacute;p lực li&ecirc;n tục do việc nỗ lực cố mọc l&ecirc;n n&agrave;y c&oacute; thể g&acirc;y tổn hại ch&acirc;n của c&aacute;c răng kế cận. Việc nhổ c&aacute;c răng ngầm n&agrave;y sẽ gi&uacute;p ngăn ngừa nhiễm tr&ugrave;ng, tổn thương xương v&agrave; răng kế cận, v&agrave; tr&aacute;nh c&aacute;c đau đớn do răng n&agrave;y sẽ g&acirc;y ra.</p>

<p>&nbsp;</p>

<h2><strong>II. Răng được nhổ như thế n&agrave;o?&nbsp;</strong></h2>

<p>Trước khi nhổ răng, nha sĩ sẽ xem hồ sơ bệnh &aacute;n của bạn v&agrave; chụp phim tia X. Phim tia X cho thấy chiều d&agrave;i, h&igrave;nh dạng, vị tr&iacute; c&aacute;c răng v&agrave; xương xung quanh. Từ đ&oacute;, nha sĩ ước t&iacute;nh được mức độ kh&oacute; của tiểu phẫu v&agrave; quyết định c&oacute; n&ecirc;n chuyển bạn cho một chuy&ecirc;n gia phẫu thuật h&agrave;m mặt hay kh&ocirc;ng.</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/nho-rang-thuong-2.jpg" /></p>

<p><i>Qu&aacute; tr&igrave;nh nhổ răng được thực hiện như sau</i><br />
Trước khi nhổ, v&ugrave;ng xung quanh răng được l&agrave;m t&ecirc;. C&aacute;c b&aacute;c sĩ sử dụng một chất l&agrave;m t&ecirc; cục bộ để l&agrave;m t&ecirc; v&ugrave;ng miệng nơi c&oacute; răng cần nhổ. Đối với nhổ răng th&ocirc;ng thường, sau khi khu vực đ&oacute; được g&acirc;y t&ecirc;, răng được l&agrave;m cho lung lay v&agrave; lỏng lẻo bằng một dụng cụ gọi l&agrave; c&acirc;y nạy, sau đ&oacute; được nhổ ra bằng kềm nha khoa. Nha sĩ c&ograve;n c&oacute; thể m&agrave;i v&agrave; tạo h&igrave;nh lại xương ổ ph&iacute;a dưới. Cuối c&ugrave;ng họ c&oacute; thể kh&acirc;u đ&oacute;ng m&eacute;p lại bằng chỉ.</p>

<h2><strong>III. C&aacute;ch chăm s&oacute;c sau khi nhổ răng&nbsp;</strong></h2>

<p>Giữ sạch v&agrave; tr&aacute;nh nhiễm tr&ugrave;ng ngay sau khi nhổ răng l&agrave; cực kỳ quan trọng. Nha sĩ sẽ y&ecirc;u cầu bạn cắn nhẹ v&agrave;o miếng b&ocirc;ng g&ograve;n kh&ocirc;, tiệt tr&ugrave;ng v&agrave; giữ trong khoảng 30 &ndash; 45 ph&uacute;t để giảm chảy m&aacute;u v&agrave; gi&uacute;p đ&ocirc;ng m&aacute;u. Trong 24 giờ sau, bạn kh&ocirc;ng n&ecirc;n h&uacute;t thuốc, s&uacute;c miệng mạnh hoặc chải răng ở v&ugrave;ng mới nhổ.</p>

<p>&nbsp;</p>

<p><img alt="" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/nho-rang-thuong-3.jpg" /></p>

<p>&nbsp;</p>

<p>Bạn sẽ c&oacute; cảm gi&aacute;c đau v&agrave; kh&oacute; chịu sau khi nhổ răng. Trong v&agrave;i trường hợp, nha sĩ khuy&ecirc;n bạn d&ugrave;ng thuốc giảm đau hoặc k&ecirc; toa thuốc cho bạn. Bạn cũng n&ecirc;n chườm t&uacute;i đ&aacute; lạnh l&ecirc;n mặt mỗi 15 ph&uacute;t. Bạn n&ecirc;n uống bằng ống h&uacute;t, tr&aacute;nh &aacute;p lực l&ecirc;n ổ răng mới nhổ, v&agrave; kh&ocirc;ng n&ecirc;n uống đồ n&oacute;ng. Ng&agrave;y tiếp theo sau khi nhổ răng, bạn bắt đầu s&uacute;c miệng bằng nước muối ấm (nhưng kh&ocirc;ng nuốt). Th&ocirc;ng thường, cảm gi&aacute;c kh&oacute; chịu sẽ giảm dần từ 3 ng&agrave;y đến 2 tuần. Nếu bạn vẫn c&ograve;n thấy sưng, đau nhiều, chảy m&aacute;u hay sốt, h&atilde;y b&aacute;o với nha sĩ ngay.</p>
', N'40c74348-2c43-4b42-9b72-b11bf418f758', CAST(1500000.00000000 AS Decimal(30, 8)), 1684849908883, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'e9e4b32f-9194-4b91-b5a1-1c083ff05f2e', N'Răng sứ Cercon', N'Rang su Cercon', N'/files/service/55170b76-5328-43c9-9743-df7935fc130e.jpg', 30, N'<h2 dir="ltr" id="R+ng+s++Cercon+l++g++" name="R+ng+s++Cercon+l++g++"><strong>Răng sứ Cercon l&agrave; g&igrave;?</strong></h2>

<p dir="ltr">Với xuất xứ từ Đức răng sứ Cercon l&agrave; d&ograve;ng sứ c&oacute; chất lượng tốt v&agrave; độ bền cao. Đ&acirc;y l&agrave; loại răng sứ được rất nhiều kh&aacute;ch h&agrave;ng ưa chuộng&nbsp; kh&ocirc;ng những v&igrave; t&iacute;nh thẩm mỹ cao m&agrave; c&ograve;n rất an to&agrave;n đối với cơ thể.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><img alt="Răng sứ Cercon HT" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/2_%20R%C4%83ng%20s%E1%BB%A9%20Cercon%20HT(1).jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Trong đ&oacute; cấu tạo của d&ograve;ng sứ n&agrave;y gồm 2 lớp:&nbsp;</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Lớp khung sườn ph&iacute;a trong</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Lớp mặt b&ecirc;n ngo&agrave;i&nbsp;</p>
	</li>
</ul>

<h3 dir="ltr" id="+u++i+m+r+ng+s++Cercon" name="+u++i+m+r+ng+s++Cercon"><strong>Ưu điểm răng sứ Cercon</strong></h3>

<p dir="ltr">Kh&ocirc;ng phải ngẫu nhi&ecirc;n loại răng sứ n&agrave;y lại được y&ecirc;u th&iacute;ch như vậy m&agrave; ch&iacute;nh những ưu điểm vượt trội của d&ograve;ng sứ n&agrave;y đ&atilde; chiếm trọn l&ograve;ng tin của kh&aacute;ch h&agrave;ng v&agrave; c&aacute;c chuy&ecirc;n gia.</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Gi&uacute;p khắc phục một số t&igrave;nh trạng của răng: sứt mẻ, vỡ, răng bị đổi m&agrave;u, ố v&agrave;ng&hellip;</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Đem lại vẻ đẹp&nbsp;thẩm mỹ cao đối với kh&aacute;ch h&agrave;ng</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Đảm bảo chức năng ăn nhai</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Độ cứng chắc hơn nhiều lần so với răng thật</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Kh&ocirc;ng g&acirc;y h&ocirc;i miệng hay vi&ecirc;m lợi, nướu trong qu&aacute; tr&igrave;nh sử dụng</p>
	</li>
</ul>

<p dir="ltr">Như vậy răng sứ Cercon kh&ocirc;ng những đảm bảo chức năng tối thiểu như ăn nhai m&agrave; c&ograve;n c&oacute; thể gi&uacute;p h&agrave;m răng trở n&ecirc;n đẹp hơn, trắng s&aacute;ng hơn so với răng gốc. Nhiều người vẫn thường lo lắng chiếc răng sứ n&agrave;y c&oacute; thể khiến họ ph&aacute;t sinh th&ecirc;m nhiều bệnh về răng miệng nhưng c&aacute;c bạn y&ecirc;n t&acirc;m rằng Cercon ho&agrave;n to&agrave;n an to&agrave;n với khoang miệng. Ch&uacute;ng chỉ g&acirc;y hại khi c&oacute; chất lượng k&eacute;m v&agrave; bạn kh&ocirc;ng đảm bảo về vệ sinh răng miệng.</p>

<p dir="ltr">&nbsp;</p>

<p>&nbsp;</p>

<h3 dir="ltr" id="Nh++c++i+m+c+a+r+ng+s++Cercon" name="Nh++c++i+m+c+a+r+ng+s++Cercon"><strong>Nhược điểm của răng sứ Cercon</strong></h3>

<p dir="ltr">Tuy nhi&ecirc;n b&ecirc;n cạnh đ&oacute; loại răng n&agrave;y cũng vẫn tồn tại một số nhược điểm cần lưu &yacute; như:</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">M&agrave;u răng sứ loại n&agrave;y chưa đạt được độ thẩm mỹ cao so với c&aacute;c loại &nbsp;Herazi, Emax&hellip;</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Với trụ ch&acirc;n răng bị đổi m&agrave;u th&igrave; răng sứ Cercon chưa che phủ được hết ho&agrave;n to&agrave;n khuyết điểm n&agrave;y.</p>
	</li>
</ul>

<p dir="ltr">Nếu so với c&aacute;c lợi &iacute;ch m&agrave; răng sứ Cercon đem lại th&igrave; một số mặt hạn chế của&nbsp;d&ograve;ng răng n&agrave;y l&agrave; ho&agrave;n to&agrave;n kh&ocirc;ng đ&aacute;ng kể.&nbsp;</p>

<p dir="ltr">Đặc biệt răng sứ Cercon được c&aacute;c chuy&ecirc;n gia đ&aacute;nh gi&aacute; kh&aacute; cao trong qu&aacute; tr&igrave;nh l&agrave;m răng sứ thẩm mỹ. Bởi vậy c&oacute; thể thấy đ&acirc;y l&agrave; loại răng sứ&nbsp;kh&aacute;ch h&agrave;ng c&oacute; thể y&ecirc;n t&acirc;m sử dụng.</p>

<p dir="ltr">&nbsp;</p>

<h2 dir="ltr" id="R+ng+s++Cercon+c++m+y+lo+i+" name="R+ng+s++Cercon+c++m+y+lo+i+"><strong>Răng sứ Cercon c&oacute; mấy loại?</strong></h2>

<p dir="ltr">Hiện nay tr&ecirc;n thị trường răng sứ Cercon được ph&acirc;n th&agrave;nh 2 loại ch&iacute;nh: răng sứ Zirconia v&agrave; răng sứ Cercon HT.&nbsp; Tuy đều thuộc d&ograve;ng răng sứ Cercon nhưng mỗi loại vẫn c&oacute; những n&eacute;t đặc trưng ri&ecirc;ng.</p>

<h3 dir="ltr" role="presentation"><strong>Răng sứ Cercon Zirconia</strong></h3>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><img alt="Răng sứ Cercon Zirconia" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/1%20R%C4%83ng%20s%E1%BB%A9%20Cercon%20Zirconia%20(1).jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Được cấu tạo bởi loại sứ cao cấp với sườn b&ecirc;n trong l&agrave;m bằng Zirconia v&agrave; lớp&nbsp;sứ Cercon Kiss phủ b&ecirc;n ngo&agrave;i. Do đ&oacute; loại răng sứ n&agrave;y c&oacute; độ cứng v&agrave; khả năng chống m&agrave;i m&ograve;n kh&aacute; cao.</p>

<p dir="ltr"><strong>Ưu điểm:&nbsp;</strong></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Được ứng dụng c&ocirc;ng nghệ CAD/ CAM n&ecirc;n loại răng sứ c&oacute; thể đạt độ tương th&iacute;ch cao với khu&ocirc;n răng gi&uacute;p phục h&igrave;nh m&atilde;o răng kh&iacute;t s&aacute;t c&oacute; thể l&ecirc;n đến 50 micron.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Kh&ocirc;ng g&acirc;y đen viền nướu như c&aacute;c loại răng sứ kim loại hoặc bị đổi m&agrave;u do qu&aacute; tr&igrave;nh oxy h&oacute;a.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Độ bền cao từ 10 &ndash; 15 năm. Thậm ch&iacute; c&oacute; thể l&ecirc;n đến 20 năm nếu chăm s&oacute;c theo đ&uacute;ng chỉ dẫn của c&aacute;c b&aacute;c sĩ nha khoa.</p>
	</li>
</ul>

<p dir="ltr"><strong>Nhược điểm:</strong></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Gi&aacute; th&agrave;nh kh&aacute; cao do được cấu tạo từ loại sứ c&oacute; chất lượng tốt.</p>
	</li>
</ul>

<h3 dir="ltr" role="presentation"><strong>Răng sứ Cercon HT</strong></h3>

<p>&nbsp;</p>

<p><img alt="Răng sứ Cercon HT" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/2_%20R%C4%83ng%20s%E1%BB%A9%20Cercon%20HT(1).jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Tương tự như răng sứ Cercon Zirconia th&igrave; chất liệu cấu tạo n&ecirc;n răng sứ n&agrave;y cũng l&agrave; loại sứ cao cấp.</p>

<p dir="ltr">Tuy nhi&ecirc;n 2 d&ograve;ng n&agrave;y vẫn c&oacute; sự kh&aacute;c biệt, đối với răng sứ Cercon HT c&oacute; 2 lớp: lớp sườn l&agrave; Zirconium dioxit v&agrave; vỏ ngo&agrave;i l&agrave; sứ Ceram Kit. Đ&acirc;y l&agrave; loại vật liệu sau khi kết tinh thường cứng v&agrave; c&oacute; độ quang học tốt.</p>

<p dir="ltr"><strong>Ưu điểm:</strong></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Được sản xuất dưới sự hỗ trợ của m&aacute;y m&oacute;c hiện đại n&ecirc;n c&oacute; t&iacute;nh ch&iacute;nh x&aacute;c cao, th&iacute;ch hợp với khu&ocirc;n răng của từng người.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Giảm thiểu được tối đa việc m&agrave;i m&ograve;n răng thật do khung sườn l&agrave;m từ lớp sứ Zirconium dioxit mỏng 0.5mm</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">M&agrave;u sắc răng đẹp, gần như răng thật</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Đảm bảo kh&ocirc;ng g&acirc;y k&iacute;ch ứng với m&ocirc;i, lợi</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Độ cứng, chắc cao hơn nhiều lần so với răng thật n&ecirc;n đảm bảo chức năng ăn nhai</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Tuổi thọ cao hơn so với răng sứ Cercon Zirconia</p>
	</li>
</ul>

<p dir="ltr"><strong>Nhược điểm:</strong></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Cũng ch&iacute;nh v&igrave; lớp sườn mỏng m&agrave; chưa che phủ được hết ho&agrave;n to&agrave;n m&agrave;u của trụ ch&acirc;n răng</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Gi&aacute; th&agrave;nh cao</p>
	</li>
</ul>

<p dir="ltr">Tr&ecirc;n thực tế th&igrave; t&ugrave;y thuộc v&agrave;o t&igrave;nh trạng răng cũng như mong muốn của kh&aacute;ch h&agrave;ng m&agrave; c&aacute;c b&aacute;c sĩ sẽ tư vấn v&agrave; lựa chọn loại răng sứ ph&ugrave; hợp.</p>

<p dir="ltr">Mặc d&ugrave; loại răng n&agrave;y c&ograve;n tồn tại một số nhược điểm tuy nhi&ecirc;n những điểm n&agrave;y kh&ocirc;ng ảnh hưởng qu&aacute; nhiều đến kết quả l&agrave;m răng. Do đ&oacute; c&aacute;c bạn cũng kh&ocirc;ng n&ecirc;n lo lắng hay băn khoăn khi lựa chọn v&agrave; sử dụng ch&uacute;ng.</p>
', N'31bf2b3a-79d0-4ef1-80e1-775728ec4156', CAST(6000000.00000000 AS Decimal(30, 8)), 1684834303859, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'f41dfea5-3715-47ab-84c8-44137e94ee79', N'Bọc răng sứ thẩm mỹ', N'Boc rang su tham my', N'/files/service/b0a655e4-f6a8-43e2-9987-18a6adb71c01.jpg', 60, N'<h2 dir="ltr" id="B+c+r+ng+s++l++nh++th++n+o++" name="B+c+r+ng+s++l++nh++th++n+o++"><strong>Bọc răng sứ l&agrave; như thế n&agrave;o?&nbsp;</strong></h2>

<p dir="ltr">Bọc răng sứ l&agrave; một giải ph&aacute;p hữu hiệu gi&uacute;p khắc phục một số t&igrave;nh trạng hư hỏng của răng v&agrave; cải thiện m&agrave;u sắc răng. Hiện nay phương ph&aacute;p n&agrave;y được rất nhiều kh&aacute;ch h&agrave;ng lựa chọn v&agrave; sử dụng.</p>

<p dir="ltr">Bọc răng sứ l&agrave; kĩ thuật nha khoa gi&uacute;p khắc phục một số t&igrave;nh trạng của răng. Trong đ&oacute; sẽ m&agrave;i đi một phần bề mặt răng thật tạo khoảng trống ph&ugrave; hợp để chụp m&atilde;o răng sứ l&ecirc;n tất cả mặt ngo&agrave;i của răng. Thực chất m&atilde;o răng sứ giống như một lớp &aacute;o bảo vệ cho răng thật.</p>

<h2 dir="ltr" id="Nh+ng+tr++ng+h+p+n+o+th++n+n+b+c+r+ng+s++" name="Nh+ng+tr++ng+h+p+n+o+th++n+n+b+c+r+ng+s++"><strong>Những trường hợp n&agrave;o th&igrave; n&ecirc;n bọc răng sứ?</strong></h2>

<p dir="ltr">Phương ph&aacute;p n&agrave;y c&oacute; thể được &aacute;p dụng để giải quyết TRIỆT ĐỂ&nbsp;c&aacute;c vấn đề hư tổn của răng như: vỡ, sứt mẻ, s&acirc;u, răng bị m&ograve;n...</p>

<p dir="ltr">Ngo&agrave;i ra, bọc răng sứ cũng l&agrave; sự lựa chọn ph&ugrave; hợp để khắc phục t&igrave;nh&nbsp;trạng răng:&nbsp;xỉn m&agrave;u, ngả v&agrave;ng, ố đậm do sử dụng c&aacute;c chất k&iacute;ch th&iacute;ch như rượu, bia, thuốc l&aacute;, caf&eacute; hay do một số loại thuốc kh&aacute;ng sinh&hellip;.</p>

<p dir="ltr"><img alt="nhung-truong-hop-nen-boc-rang-su" longdesc="https://nhakhoaquoctevietphap.com.vn/nhung-truong-hop-nen-boc-rang-su" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/TH%20n%C3%AAn%20b%E1%BB%8Dc%20r%C4%83ng%20s%E1%BB%A9.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Lưu &yacute;,&nbsp;theo c&aacute;c&nbsp;b&aacute;c sĩ chuy&ecirc;n khoa của Nha khoa Quốc tế Việt Ph&aacute;p&nbsp;chia sẻ, kh&ocirc;ng phải trường hợp hư hại n&agrave;o của răng cũng đều c&oacute; thể bọc răng sứ m&agrave; c&ograve;n phụ thuộc v&agrave;o nhiều yếu tố như t&igrave;nh trạng sức khỏe răng miệng, c&aacute;c vấn đề về bệnh l&yacute; kh&aacute;c&hellip;</p>

<p dir="ltr">Tốt nhất, bạn n&ecirc;n&nbsp;thăm kh&aacute;m, kiểm tra v&agrave; hỏi &yacute; kiến b&aacute;c sĩ&nbsp;trước khi quyết định bọc sứ.</p>

<h3 dir="ltr" id="Ph++ng+ph+p+b+c+r+ng+s++th++ng++++c++p+d+ng+v+i+c+c+tr++ng+h+p+nh++" name="Ph++ng+ph+p+b+c+r+ng+s++th++ng++++c++p+d+ng+v+i+c+c+tr++ng+h+p+nh++"><strong>Răng bị chuyển m&agrave;u​</strong></h3>

<p><strong><img alt="rang-bi-chuyen-mau" longdesc="https://nhakhoaquoctevietphap.com.vn/rang-bi-chuyen-mau" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/R%C4%83ng%20x%E1%BB%89n%20m%C3%A0u.jpg" /></strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Răng thường bị ng&agrave; v&agrave;ng hay ố m&agrave;u do nhiều chất trong thức ăn hay đồ uống. Nhiều trường hợp răng kh&ocirc;ng thể tẩy trắng th&igrave; bọc răng sứ l&agrave; giải ph&aacute;p tối ưu để lấy lại m&agrave;u răng.</p>

<h3 dir="ltr" id="R+ng+m+c+x++l+ch++chen+ch+c" name="R+ng+m+c+x++l+ch++chen+ch+c" role="presentation"><strong>Răng mọc x&ocirc; lệch, chen ch&uacute;c</strong></h3>

<p><img alt="rang-bi-xo-lech-chen-chuc-nhau" longdesc="https://nhakhoaquoctevietphap.com.vn/rang-bi-xo-lech-chen-chuc-nhau" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/R%C4%83ng%20m%E1%BB%8Dc%20x%C3%B4%20l%E1%BB%87ch%2C%20chen%20ch%C3%BAc.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Với t&igrave;nh trạng răng mọc kh&ocirc;ng đều, lộn xộn, mọc ch&egrave;n l&ecirc;n vị tr&iacute; của nhau th&igrave; bọc răng sứ l&agrave; giải ph&aacute;p ho&agrave;n hảo để lấy lại h&agrave;m răng đều đặn, ngay ngắn.</p>

<h3 dir="ltr" id="R+ng+b++v+++s+t+m++" name="R+ng+b++v+++s+t+m++" role="presentation"><strong>Răng bị vỡ, sứt mẻ​</strong></h3>

<p><strong><img alt="rang-bi-vo-sut-me" longdesc="https://nhakhoaquoctevietphap.com.vn/rang-bi-vo-sut-me" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/R%C4%83ng%20b%E1%BB%8B%20v%E1%BB%A1%2C%20s%E1%BB%A9t%20m%E1%BA%BB.jpg" /></strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">C&aacute;c vấn đề răng bị vỡ hay sứt do tai nạn, va đập hay bị t&aacute;c dụng lực mạnh đều c&oacute; thể khắc phục bằng kĩ thuật n&agrave;y.</p>

<h3 dir="ltr" id="B++m+t+r+ng" name="B++m+t+r+ng" role="presentation"><strong>Bị mất răng​</strong></h3>

<p><strong><img alt="bi-mat-rang" longdesc="https://nhakhoaquoctevietphap.com.vn/bi-mat-rang" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/B%E1%BB%8B%20m%E1%BA%A5t%20r%C4%83ng.jpg" /></strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Th&ocirc;ng thường trường hợp n&agrave;y sẽ được b&aacute;c sĩ &aacute;p dụng để l&agrave;m cầu răng sứ thay thế cho chiếc răng đ&atilde; mất.</p>

<h3 dir="ltr" id="R+ng+s+u++vi+m+t+y" name="R+ng+s+u++vi+m+t+y" role="presentation"><strong>Răng s&acirc;u, vi&ecirc;m tủy​</strong></h3>

<p><strong><img alt="rang-sau-viem-tuy" longdesc="https://nhakhoaquoctevietphap.com.vn/rang-sau-viem-tuy" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/R%C4%83ng%20s%C3%A2u%2C%20vi%C3%AAm%20t%E1%BB%A7y.jpg" /></strong></p>

<p dir="ltr">Răng s&acirc;u hay c&oacute; vấn đề về tủy sẽ l&agrave;m suy giảm chức năng ăn nhai thậm ch&iacute; l&agrave; nguy&ecirc;n nh&acirc;n g&acirc;y c&aacute;c bệnh l&yacute; kh&aacute;c về răng miệng. Bởi vậy bọc răng sứ kh&ocirc;ng những gi&uacute;p kh&ocirc;i phục chức năng ăn nhai m&agrave; c&ograve;n ngăn chặn, bảo vệ răng trước vi khuẩn.</p>

<p>&nbsp;</p>

<h2 dir="ltr" id="B+c+r+ng+s++mang+l+i+l+i++ch+g++" name="B+c+r+ng+s++mang+l+i+l+i++ch+g++"><b>Những lợi &iacute;ch &quot;thần kỳ&quot; của việc bọc răng sứ thẩm mỹ</b></h2>

<p dir="ltr">Mặc d&ugrave; bọc răng sứ đ&atilde; kh&aacute; phổ biến nhưng&nbsp;kh&ocirc;ng phải ai cũng hiểu r&otilde; những t&aacute;c dụng m&agrave; phương ph&aacute;p n&agrave;y đem lại.&nbsp;</p>

<p dir="ltr"><img alt="loi-ich-cua-boc-rang-su" longdesc="https://nhakhoaquoctevietphap.com.vn/loi-ich-cua-boc-rang-su" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/l%E1%BB%A3i%20%C3%ADch%20c%E1%BB%A7a%20vi%E1%BB%87c%20b%E1%BB%8Dc%20r%C4%83ng%20s%E1%BB%A9.jpg" /></p>

<p dir="ltr">Mặc d&ugrave; bọc răng sứ đ&atilde; kh&aacute; phổ biến tại c&aacute;c nha khoa nổi tiếng tại Việt Nam nhưng&nbsp;kh&ocirc;ng phải ai cũng hiểu r&otilde; những lợi &iacute;ch của phương ph&aacute;p l&agrave;m răng sứ.&nbsp;</p>

<p dir="ltr">Đ&acirc;y l&agrave; phương ph&aacute;p đem lại rất nhiều lợi &iacute;ch cho những người c&oacute; khiếm khuyết về răng, c&oacute; thể kể đến như:</p>

<h3 dir="ltr" id="T+nh+th+m+m++cao" name="T+nh+th+m+m++cao" role="presentation"><strong>T&iacute;nh thẩm mỹ cao</strong></h3>

<p dir="ltr">Răng sứ được thiết kế gần giống như răng thật từ h&igrave;nh d&aacute;ng đến k&iacute;ch thước. Kh&ocirc;ng chỉ vậy, m&agrave;u sắc của răng sứ c&ograve;n đẹp hơn rất nhiều so với răng thật, đảm bảo t&iacute;nh thẩm mỹ cho người sử dụng.</p>

<p dir="ltr">Khi bọc răng sứ thẩm mỹ, h&agrave;m răng&nbsp;trở n&ecirc;n s&aacute;ng b&oacute;ng, đều đặn như những diễn vi&ecirc;n, ca sỹ nổi tiếng. Bạn ho&agrave;n to&agrave;n c&oacute; thể tự tin nở nụ cười &quot;kh&ocirc;ng hề c&oacute; khuyết điểm&quot; trước đ&aacute;m đ&ocirc;ng m&agrave; kh&ocirc;ng cần phải lo nghĩ g&igrave;.</p>

<h3 dir="ltr" id="Kh+i+ph+c+ch+c+n+ng++n+nhai" name="Kh+i+ph+c+ch+c+n+ng++n+nhai"><strong>Kh&ocirc;i phục chức năng ăn nhai</strong></h3>

<p dir="ltr">Răng sứ c&oacute; độ cứng hơn cả răng thật, chịu lực ăn nhai tốt.&nbsp;C&aacute;c răng thật được bảo vệ bởi c&aacute;c lớp sứ bền chắc, kh&ocirc;ng g&acirc;y k&iacute;ch ứng, kh&oacute; chịu.</p>

<p dir="ltr">Do đ&oacute;, chức năng ăn nhai sau khi bọc răng sứ kh&ocirc;ng những kh&ocirc;ng bị ảnh hưởng m&agrave; c&ograve;n được cải thiện rất nhiều so với trước.</p>

<h3 dir="ltr" id="+++b+n+cao" name="+++b+n+cao"><strong>Độ bền cao</strong></h3>

<p dir="ltr"><a href="https://nhakhoaquoctevietphap.com.vn/rang-su-co-de-ben-cao"><img alt="rang-su-co-de-ben-cao" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/Screenshot%202022-09-29%20122915%20copy.jpg" /></a></p>

<p dir="ltr">Răng sứ c&oacute; thể giữ nguy&ecirc;n được vẻ đẹp trong một thời gian d&agrave;i. Tuổi thọ của răng sứ c&oacute; thể l&ecirc;n tới tr&ecirc;n 15 năm&nbsp;nếu đảm bảo c&aacute;c yếu tố về chất lượng v&agrave; duy tr&igrave; theo chỉ dẫn của b&aacute;c sĩ. H&atilde;y tưởng tượng rằng sau 15 - 20&nbsp;năm sau, h&agrave;m răng của m&igrave;nh&nbsp;vẫn chắc khỏe v&agrave; trắng s&aacute;ng như ng&agrave;y đầu ti&ecirc;n bọc răng sứ.</p>

<p dir="ltr">Tuy nhi&ecirc;n, bạn&nbsp;cần lưu &yacute; v&agrave; ghi nhớ những hướng dẫn của b&aacute;c sĩ trong việc vệ sinh, chăm s&oacute;c sau khi l&agrave;m răng.&nbsp;</p>

<h3 dir="ltr" id="Kh+c+ph+c++c+i+thi+n+t+nh+tr+ng+r+ng" name="Kh+c+ph+c++c+i+thi+n+t+nh+tr+ng+r+ng"><strong>Khắc phục, cải thiện t&igrave;nh trạng răng</strong></h3>

<p dir="ltr">Đ&acirc;y cũng ch&iacute;nh l&agrave; mục đ&iacute;ch quan trọng nhất của bọc răng sứ.&nbsp;Kĩ thuật n&agrave;y khắc phục ho&agrave;n to&agrave;n những khuyết điểm của răng như: răng xỉn m&agrave;u, sứt mẻ&hellip;</p>
', N'31bf2b3a-79d0-4ef1-80e1-775728ec4156', CAST(8000000.00000000 AS Decimal(30, 8)), 1684833855165, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'f9692ead-4953-4f2b-a074-a706cf8fec64', N'Răng sứ Titan', N'Rang su Titan', N'/files/service/86ac9fe0-fd66-410d-8d3e-3756e4b19659.jpg', 30, N'<h2 dir="ltr" id="R+ng+s++Titan+l++g++" name="R+ng+s++Titan+l++g++"><strong>Răng sứ Titan l&agrave; g&igrave;?</strong></h2>

<p dir="ltr">Răng sứ Titan l&agrave; một trong những d&ograve;ng răng sứ kim loại&nbsp;c&oacute; cấu tạo với khung sườn l&agrave;m từ hợp kim Niken-Crom-Titan v&agrave; lớp sứ Ceramco3 b&ecirc;n ngo&agrave;i. Trong đ&oacute; hợp kim Titan chiếm từ 4 &ndash; 6% trong th&agrave;nh phần của răng.</p>

<p dir="ltr"><img alt="Răng sứ Titan" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/1_%20%E1%BA%A2nh%20b%C3%ACa%20r%C4%83ng%20s%E1%BB%A9%20Titan.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Hiện nay răng sứ Titan được chia th&agrave;nh 3 loại ch&iacute;nh như:</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng sứ Titan Berlin</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng sứ Titan Margin</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng sứ Titan Vita</p>
	</li>
</ul>

<p dir="ltr">Mỗi loại răng sứ tr&ecirc;n đều c&oacute; những đặc điểm ri&ecirc;ng kh&aacute;c nhau. Tuy nhi&ecirc;n do c&ugrave;ng thuộc d&ograve;ng sứ Titan n&ecirc;n ch&uacute;ng đều c&oacute; những ưu điểm chung như:&nbsp;</p>

<h3 dir="ltr" id="+u+nh++c++i+m+c+n+ch++++c+a+r+ng+s++Titan" name="+u+nh++c++i+m+c+n+ch++++c+a+r+ng+s++Titan"><strong>Ưu nhược điểm cần ch&uacute; &yacute; của răng sứ Titan</strong></h3>

<p dir="ltr"><img alt="Ưu điểm của răng sứ Titan" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/%C6%AFu%20%C4%91i%E1%BB%83m%20c%E1%BB%A7a%20r%C4%83ng%20s%E1%BB%A9%20Titan.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Mỗi loại răng sứ đều c&oacute; những điểm tốt v&agrave; mặt hạn chế ri&ecirc;ng. Do đ&oacute; cần lựa chọn loại răng sứ ph&ugrave; hợp để đảm bảo hiệu quả cao nhất.&nbsp;</p>

<p dir="ltr">Trong đ&oacute; răng sứ Titan cũng kh&ocirc;ng ngoại lệ, dưới đ&acirc;y l&agrave; một v&agrave;i ưu nhược điểm nổi bật của loại răng sứ n&agrave;y:</p>

<p dir="ltr"><strong>Độ bền chắc cao</strong></p>

<p dir="ltr">Với cấu tạo từ hợp kim v&agrave; lớp sứ b&ecirc;n ngo&agrave;i gi&uacute;p răng sứ Titan c&oacute; độ bền chắc kh&aacute; cao, khả năng chịu lực lớn hơn nhiều so với răng thật. Nhờ đ&oacute; gi&uacute;p đảm bảo được khả năng ăn nhai của kh&aacute;ch h&agrave;ng ngay cả với những thực phẩm cứng.</p>

<p dir="ltr"><strong>M&agrave;u sắc v&agrave; khu&ocirc;n răng đẹp</strong></p>

<p dir="ltr">M&agrave;u sắc của răng sứ Titan c&oacute; tỉ lệ giống răng thật ở mức kh&aacute; n&ecirc;n cũng kh&ocirc;ng dễ g&acirc;y ch&uacute; &yacute; khi bọc răng sứ loại n&agrave;y. Đồng thời m&atilde;o sứ Titan cũng ph&ugrave; hợp với khu&ocirc;n răng đảm bảo t&iacute;nh thẩm mỹ.</p>

<p dir="ltr"><strong>Đảm bảo an to&agrave;n khi sử dụng&nbsp;</strong></p>

<p dir="ltr">Khả năng tương th&iacute;ch sinh học của răng sứ Titan với răng thật v&agrave; m&ocirc;i, lợi, nướu kh&aacute; cao n&ecirc;n t&igrave;nh trạng h&ocirc;i miệng, vi&ecirc;m nhiễm tại răng bọc sứ Titan...rất &iacute;t khi xảy ra.</p>

<p dir="ltr">Cũng ch&iacute;nh điều n&agrave;y gi&uacute;p răng sứ Titan vẫn đang l&agrave; một trong những d&ograve;ng răng sứ, được nhiều người lựa chọn.</p>

<p dir="ltr"><strong>Gi&aacute; th&agrave;nh ph&ugrave; hợp</strong></p>

<p dir="ltr">So với c&aacute;c loại răng sứ kh&aacute;c th&igrave; răng sứ Titan c&oacute; gi&aacute; kh&aacute; mềm, ph&ugrave; hợp với nhiều đối tượng kh&aacute;ch h&agrave;ng. hơn m&agrave; chất lượng vẫn đảm bảo.</p>
', N'31bf2b3a-79d0-4ef1-80e1-775728ec4156', CAST(3000000.00000000 AS Decimal(30, 8)), 1684849189919, 1)
INSERT [dbo].[service] ([ServiceId], [Name], [SearchName], [Thumbnail], [ExpectTime], [Description], [ServiceCategoryId], [Price], [CreateTime], [Enable]) VALUES (N'fd33e967-5d32-4102-9e00-13f72ca0a94c', N'Mặt dán sứ Veneer', N'Mat dan su Veneer', N'/files/service/bc0c2d2c-b8ce-40ef-9aa2-276131ce0c7b.jpg', 30, N'<h2 dir="ltr" id="I++D+n+s++Veneer+l++g+++" name="I++D+n+s++Veneer+l++g+++"><b>I. D&aacute;n sứ Veneer l&agrave; g&igrave;?</b></h2>

<p dir="ltr">D&aacute;n sứ Veneer l&agrave; phương ph&aacute;p sử dụng một lớp sứ si&ecirc;u mỏng từ 0.2mm - 0.5mm để d&aacute;n đ&egrave; l&ecirc;n bề mặt ngo&agrave;i cửa răng thật. Miếng d&aacute;n được cố định bằng keo chuy&ecirc;n d&ugrave;ng sao cho &ocirc;m kh&iacute;t v&agrave;o răng một c&aacute;ch ho&agrave;n hảo nhất.</p>

<p dir="ltr"><img alt="dan-su-veneer-la-gi" longdesc="https://nhakhoaquoctevietphap.com.vn/dan-su-veneer-la-gi" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/ve-b%C3%ACa.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Giống như bọc răng sứ,&nbsp;d&aacute;n sứ Veneer cũng c&oacute; t&aacute;c dụng khắc phục một số khuyết điểm của răng như: vỡ, mẻ, ngả v&agrave;ng, xỉn m&agrave;u hay s&acirc;u răng&hellip;&nbsp;</p>

<p dir="ltr">Tuy nhi&ecirc;n, nếu bọc răng sứ l&agrave; phương ph&aacute;p thẩm mỹ d&ugrave;ng m&atilde;o sứ để chụp l&ecirc;n to&agrave;n bộ răng thật th&igrave;&nbsp;d&aacute;n sứ Veneer chỉ sử dụng mặt sứ mỏng để d&aacute;n l&ecirc;n bề mặt của răng. Từ đ&oacute; d&aacute;n sứ Veneer gi&uacute;p hạn chế được việc m&agrave;i răng, bảo tồn răng thật một c&aacute;ch tốt nhất m&agrave; vẫn đem lại hiệu quả&nbsp;cao.</p>

<p dir="ltr">Đ&acirc;y được coi l&agrave; &quot;bước đột ph&aacute;t lớn&quot; trong lĩnh vực nha khoa thẩm mỹ d&agrave;nh cho ai muốn sở hữu một h&agrave;m răng trắng s&aacute;ng.</p>

<h2 dir="ltr" id="C+c+tr++ng+h+p+c++th++d+n+s++Veneer" name="C+c+tr++ng+h+p+c++th++d+n+s++Veneer"><strong>II. Trường hợp&nbsp;n&ecirc;n v&agrave; kh&ocirc;ng n&ecirc;n d&aacute;n sứ Veneer</strong></h2>

<p dir="ltr">Kỹ thuật d&aacute;n sứ Veneer đ&atilde; rất phổ biến tại Mỹ v&agrave; nhiều quốc gia ph&aacute;t triển kh&aacute;c từ kh&aacute; l&acirc;u. C&ograve;n tại Việt Nam phương ph&aacute;p thẩm mỹ răng n&agrave;y mới bắt đầu trở n&ecirc;n th&ocirc;ng dụng trong một v&agrave;i năm gần đ&acirc;y.</p>

<h3 dir="ltr" id="1++Nh+ng+tr++ng+h+p+c++th++d+n+s++Veneer" name="1++Nh+ng+tr++ng+h+p+c++th++d+n+s++Veneer"><strong>1. C&aacute;c&nbsp;trường hợp c&oacute; thể d&aacute;n sứ Veneer</strong></h3>

<p dir="ltr">Đ&acirc;y l&agrave; một giải ph&aacute;p c&oacute; thể d&ugrave;ng thay thế kỹ thuật bọc răng sứ cho c&aacute;c trường hợp:</p>

<p dir="ltr"><img alt="nhung-truong-hop-co-the-dan-su-veneer" longdesc="https://nhakhoaquoctevietphap.com.vn/nhung-truong-hop-co-the-dan-su-veneer" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/ve-2.jpg" /></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng bị vỡ, mẻ nhỏ</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng thưa</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng bị nhiễm m&agrave;u do thực phẩm hay kh&aacute;ng sinh</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng bị lệch lạc</p>
	</li>
</ul>

<p dir="ltr">Nhiều chuy&ecirc;n gia nha khoa nhận định d&aacute;n sứ Veneer l&agrave; phương ph&aacute;p mang lại hiệu quả cao, c&oacute; nhiều t&iacute;nh năng ưu việt gi&uacute;p đem lại h&agrave;m răng chắc khỏe, bền đẹp nhưng cũng kh&aacute; k&eacute;n chọn răng.&nbsp;</p>

<p dir="ltr">Tr&ecirc;n thực tế,&nbsp;kh&ocirc;ng phải tất cả c&aacute;c trường hợp m&agrave; bọc răng sứ điều trị được cũng c&oacute; thể &aacute;p dụng kĩ thuật d&aacute;n sứ Veneer.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Phương ph&aacute;p n&agrave;y y&ecirc;u cầu h&agrave;m răng kh&ocirc;ng được qu&aacute; x&ocirc; lệch, chen ch&uacute;c, khấp khểnh&nbsp;hay gặp c&aacute;c vấn đề về khớp cắn s&acirc;u v&agrave; nha chu&hellip;&nbsp;</p>

<h3 dir="ltr" id="C+c+tr++ng+h+p+kh+ng+n+n+d+n+s++Veneer" name="C+c+tr++ng+h+p+kh+ng+n+n+d+n+s++Veneer"><strong>2. C&aacute;c trường hợp kh&ocirc;ng n&ecirc;n d&aacute;n sứ Veneer</strong></h3>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng bị s&acirc;u hay gặp c&aacute;c vấn đề bệnh l&yacute;</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng qu&aacute; thưa</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng lộn xộn, chen ch&uacute;c</p>
	</li>
	<li dir="ltr">
	<p dir="ltr" role="presentation">Răng bị nha chu</p>
	</li>
</ul>

<p dir="ltr"><img alt="cac-truong-hop-khong-nen-dan-su-veneer" longdesc="https://nhakhoaquoctevietphap.com.vn/cac-truong-hop-khong-nen-dan-su-veneer" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/ve-3.jpg" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Đối với c&aacute;c trường hợp tr&ecirc;n, kh&aacute;ch h&agrave;ng&nbsp;cần điều trị dứt điểm c&aacute;c bệnh l&yacute; sẵn c&oacute; tr&ecirc;n răng sau đ&oacute; sử dụng kĩ thuật bọc răng sứ thẩm mỹ để đem lại hiệu quả cao nhất.</p>

<p dir="ltr">Đặc biệt, với những bệnh nh&acirc;n gặp vấn đề răng s&acirc;u hay hỏng nặng th&igrave; thậm ch&iacute; phải nhổ bỏ rồi thực hiện trồng Implant để đảm bảo chức năng ăn nhai. Tuy nhi&ecirc;n,&nbsp;c&aacute;c b&aacute;c sĩ lu&ocirc;n ưu ti&ecirc;n giữ lại răng thật cho mỗi&nbsp;bệnh nh&acirc;n.</p>

<h2 dir="ltr" id="Nh+ng++u++i+m++nh++c++i+m+c+a+d+n+s++Veneer" name="Nh+ng++u++i+m++nh++c++i+m+c+a+d+n+s++Veneer"><strong>III. Những ưu điểm, nhược điểm của d&aacute;n sứ Veneer</strong></h2>

<h3 dir="ltr" id="+u++i+m+d+n+s++Veneer" name="+u++i+m+d+n+s++Veneer"><strong>1. Ưu điểm d&aacute;n sứ Veneer</strong></h3>

<p dir="ltr">L&agrave; phương ph&aacute;p ph&aacute;t triển&nbsp;sau n&agrave;y n&ecirc;n d&aacute;n sứ Veneer sở hữu&nbsp;nhiều t&iacute;nh năng vượt trội hơn, khắc phục được một số nhược điểm của c&aacute;c phương ph&aacute;p trước đ&oacute;.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><img alt="uu-diem-dan-su-veneer" longdesc="https://nhakhoaquoctevietphap.com.vn/uu-diem-dan-su-veneer" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/ve-4.jpg" /></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>C&oacute; t&iacute;nh thẩm mỹ cao</strong></p>
	</li>
</ul>

<p dir="ltr">Với miếng d&aacute;n Veneer si&ecirc;u mỏng chỉ từ 0.2 &ndash; 0.5mm c&ugrave;ng m&agrave;u sứ gần như răng thật n&ecirc;n rất kh&oacute; c&oacute; thể nhận ra. Đồng thời m&agrave;u sắc của miếng d&aacute;n sứ c&oacute; thể được lựa chọn theo tone m&agrave;u m&agrave; bạn y&ecirc;u th&iacute;ch.</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Kh&ocirc;ng g&acirc;y k&iacute;ch ứng&nbsp;</strong></p>
	</li>
</ul>

<p dir="ltr">D&aacute;n sứ Veneer gần như kh&ocirc;ng cần m&agrave;i răng m&agrave; vẫn s&aacute;t kh&iacute;t với khu&ocirc;n răng thật, kh&ocirc;ng những bảo tồn răng thật một c&aacute;ch tối đa m&agrave; kh&ocirc;ng g&acirc;y c&aacute;c phản ứng với lợi, nướu.</p>

<p dir="ltr">Đặc biệt c&aacute;c loại sứ Veneer tốt, ch&iacute;nh h&atilde;ng kh&ocirc;ng bị nhiễm m&agrave;u theo thời gian.</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Độ cứng cao</strong></p>
	</li>
</ul>

<p dir="ltr">Th&ocirc;ng thường miếng d&aacute;n sứ Veneer c&oacute; khả năng chịu lực lớn gấp 3 -4 lần so với răng thật n&ecirc;n việc ăn uống vẫn ho&agrave;n to&agrave;n kh&ocirc;ng bị ảnh hưởng.</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Tuổi thọ l&acirc;u d&agrave;i</strong></p>
	</li>
</ul>

<p dir="ltr">Mặt d&aacute;n Veneer c&oacute; thể duy tr&igrave; tốt nhất l&ecirc;n tới 15 năm nếu thực hiện đ&uacute;ng theo chỉ định của c&aacute;c b&aacute;c sĩ.</p>

<h3 dir="ltr" id="++i+m+h+n+ch++c+a+d+n+s++Veneer" name="++i+m+h+n+ch++c+a+d+n+s++Veneer"><strong>2. Nhược điểm&nbsp;của d&aacute;n sứ Veneer</strong></h3>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><img alt="nhuoc-diem-cua-dan-su-veneer" longdesc="https://nhakhoaquoctevietphap.com.vn/nhuoc-diem-cua-dan-su-veneer" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/ve-5.jpg" /></p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>C&oacute; &iacute;t d&ograve;ng sứ để lựa chọn</strong></p>
	</li>
</ul>

<p dir="ltr">Nếu bọc sứ c&oacute; hơn 10 thương hiệu kh&aacute;c nhau để bạn c&oacute; thể lựa chọn sao cho ph&ugrave; hợp với m&igrave;nh nhất th&igrave; hiện nay d&aacute;n sứ Veneer chỉ c&oacute; 3 loại.&nbsp;</p>

<ul>
	<li dir="ltr">
	<p dir="ltr" role="presentation"><strong>Chỉ &aacute;p dụng cho c&aacute;c trường hợp răng gặp vấn đề nhẹ</strong></p>
	</li>
</ul>

<p dir="ltr">Một nhược điểm kh&ocirc;ng thể kh&ocirc;ng kể đến đ&oacute; l&agrave; d&aacute;n sứ Veneer k&eacute;n răng v&agrave; chỉ &aacute;p dụng với c&aacute;c trường hợp c&aacute;c răng tr&ecirc;n h&agrave;m đ&atilde; kh&aacute; đều nhau.</p>
', N'31bf2b3a-79d0-4ef1-80e1-775728ec4156', CAST(12000000.00000000 AS Decimal(30, 8)), 1684834137338, 1)
GO
INSERT [dbo].[service_category] ([ServiceCategoryId], [Name], [Enable], [ShowInHomePage]) VALUES (N'31bf2b3a-79d0-4ef1-80e1-775728ec4156', N'Răng sứ', 1, 1)
INSERT [dbo].[service_category] ([ServiceCategoryId], [Name], [Enable], [ShowInHomePage]) VALUES (N'40c74348-2c43-4b42-9b72-b11bf418f758', N'Nhổ răng', 1, 1)
INSERT [dbo].[service_category] ([ServiceCategoryId], [Name], [Enable], [ShowInHomePage]) VALUES (N'54075702-ed19-4089-b7ac-19618e0ecaba', N'Trồng răng', 1, 1)
INSERT [dbo].[service_category] ([ServiceCategoryId], [Name], [Enable], [ShowInHomePage]) VALUES (N'b1033580-2637-42f1-8c76-900e4b370588', N'Làm sạch', 1, 1)
INSERT [dbo].[service_category] ([ServiceCategoryId], [Name], [Enable], [ShowInHomePage]) VALUES (N'e5467e03-f260-43fb-ab8c-5b253983aa36', N'Niềng răng', 1, 1)
GO
INSERT [dbo].[slide] ([SlideId], [Image], [LinkWeb], [Area]) VALUES (N'051de014-887b-43d2-ac54-aa32006ef82c', N'/files/slides/b809d816-ea01-4ec3-b520-8bf336717fd6.jpg', N'https://xml.com.vn', N'home-slide')
INSERT [dbo].[slide] ([SlideId], [Image], [LinkWeb], [Area]) VALUES (N'9a8bb0db-76cc-4c10-8942-74126c686d54', N'/files/slides/fb23929a-853a-41cf-b207-f91da6d07462.jpg', N'https://flowers.com.vn', N'banner-1')
GO
INSERT [dbo].[system_about] ([SystemAboutId], [HtmlContents]) VALUES (N'about', N'<p>Nha khoa Phương Thảo&nbsp;l&agrave; một trong những nha khoa lớn v&agrave; uy t&iacute;n nhất tr&ecirc;n cả nước hiện nay.&nbsp; B&ecirc;n cạnh đội ngũ chuy&ecirc;n gia nha khoa h&agrave;ng đầu, gi&agrave;u kinh nghiệm th&igrave; trang thiết bị y tế, c&ocirc;ng nghệ lu&ocirc;n được ch&uacute; trọng đầu tư, ứng dụng c&aacute;c c&ocirc;ng nghệ ti&ecirc;n tiến v&agrave; hiện đại bậc nhất tr&ecirc;n thế giới</p>

<p>&nbsp;</p>

<p>Từ đ&oacute; n&acirc;ng cao trải nghiệm của kh&aacute;ch h&agrave;ng khi sử dụng dịch vụ, đem đến nụ cười rạng rỡ v&agrave; h&agrave;m răng chắc khỏe cho mọi kh&aacute;ch h&agrave;ng.</p>

<h2><strong>Lịch sử h&igrave;nh th&agrave;nh</strong></h2>

<p>Nha khoa Phương Thảo&nbsp;được th&agrave;nh lập từ năm 2010 sau chuyến đi nghi&ecirc;n cứu v&agrave; trải nghiệm nước ngo&agrave;i, b&aacute;c sĩ Trịnh Việt Trang nhận thấy c&aacute;c nước Ch&acirc;u &Acirc;u đang ng&agrave;y c&agrave;ng ph&aacute;t triển những c&ocirc;ng nghệ nha khoa hiện đại, an to&agrave;n, ch&iacute;nh x&aacute;c. Ch&iacute;nh v&igrave; điều đ&oacute; &nbsp;đ&atilde; th&uacute;c giục b&aacute;c sĩ để đem những c&ocirc;ng nghệ ti&ecirc;n tiến của thế giới về phục vụ nh&acirc;n d&acirc;n trong nước.</p>

<p>&nbsp;</p>

<p><img alt="nha-khoa-quoc-te-viet-phap" src="https://nhakhoaquoctevietphap.com.vn/uploads/data/5182/files/files/IMG_7818.jpg" /></p>

<p>Trải qua hơn 10 năm th&agrave;nh lập v&agrave; ph&aacute;t triển, bằng nỗ lực kh&ocirc;ng ngừng nghỉ v&agrave; sự tin tưởng của kh&aacute;ch h&agrave;ng đến nay nha khoa đ&atilde; mở rộng th&agrave;nh chuỗi nha khoa c&oacute; mặt tại h&agrave; Nội, Bắc Ninh, Quảng Ninh&hellip;</p>

<p><strong>Tại H&agrave; Nội (4 cơ sở)</strong></p>

<ul>
	<li>Số 24 Trần Duy Hưng, Trung Ho&agrave;, Cầu Giấy, H&agrave; Nội - Hotline:&nbsp;<strong><a href="https://tel:0363858587/">0363.85.85.87</a></strong></li>
	<li>Số 29 Nguyễn Du, B&ugrave;i Thị Xu&acirc;n, Hai B&agrave; Trưng, H&agrave; Nội, Việt Nam - Hotline:&nbsp;<strong><a href="https://tel:0363858587/">0363.85.85.87</a></strong></li>
	<li>Số 69 Trần Đăng Ninh, Dịch Vọng, Cầu Giấy, H&agrave; Nội, Việt Nam - Hotline:&nbsp;<strong><a href="https://tel:0363858587/">0363.85.85.87</a></strong></li>
	<li>Số 6 Th&aacute;i H&agrave;, Trung Liệt, Đống Đa, H&agrave; Nội - Hotline:&nbsp;<strong><a href="https://tel:0363858587/">0363.85.85.87</a></strong></li>
</ul>

<p><strong>Tại Bắc Ninh</strong></p>

<p>Số 119 Huyền Quang &ndash; P.Ninh X&aacute; &ndash; Bắc Ninh - Hotline: Hotline:&nbsp;<strong><a href="https://tel:0363858587/">0363.85.85.87</a></strong></p>

<p><img alt="" height="346" src="/UploadFiles/images/boc-rang-su.png" style="max-width:100%; height:auto; float:left" width="500" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>Tại Quảng Ninh</strong></p>

<ul>
	<li>&nbsp;Số 7- Nguyễn Văn Cừ (ng&atilde; 3 K&ecirc;nh Li&ecirc;m)- TP. Hạ Long - Hotline:&nbsp;<strong><a href="https://tel:0363858587/">0363.85.85.87</a></strong></li>
	<li>Số 360- Trần Hưng Đạo (ng&atilde; 4 Loong T&ograve;ong)- TP Hạ Long - Hotline:&nbsp;<strong><a href="https://tel:0363858587/">0363.85.85.87</a></strong></li>
</ul>

<h2><strong>Mục ti&ecirc;u</strong></h2>

<p>Với định hướng ph&aacute;t triển &ldquo; C&ocirc;ng nghệ đi đầu &ndash; Cam kết bền l&acirc;u&rdquo;&nbsp; nha khoa Phương Thảo&nbsp;đang đem đến những dịch vụ chăm s&oacute;c răng miệng kh&ocirc;ng những đảm bảo&nbsp;T&Iacute;NH THẨM MỸ -m&agrave; c&ograve;n đặc biệt ch&uacute; trọng AN TO&Agrave;N cho mọi kh&aacute;ch h&agrave;ng.</p>

<p>Thời gian tới sẽ tiếp tục giữ vững v&agrave; ph&aacute;t huy những thế mạnh của m&igrave;nh trong c&ocirc;ng nghệ v&agrave; chuy&ecirc;n m&ocirc;n đội ngũ y, b&aacute;c sĩ để cống hiến v&agrave; phục vụ cho cộng đồng.</p>

<h2><strong>C&aacute;c dịch vụ</strong></h2>

<p>Để phục vụ nhu cầu của mọi đối tượng kh&aacute;ch h&agrave;ng, Nha khoa Phương Thảo&nbsp;hiện c&oacute; tất cả dịch vụ về nha khoa, cụ thể:</p>

<p>1. Chỉnh nha - Niềng răng</p>

<p>2. Bọc răng sứ thẩm mỹ</p>

<p>3. D&aacute;n sứ Verneer</p>

<p>3. Phục h&igrave;nh răng - Cấy gh&eacute;p Implant</p>

<p>4. Điều trị c&aacute;c bệnh răng miệng: Điều trị tủy, s&acirc;u răng, vi&ecirc;m nha chu, vi&ecirc;m lợi, vi&ecirc;m nướu...</p>

<p>5. Nhổ răng</p>

<p>6. Tẩy trắng răng</p>
')
GO
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'020b44da-c0cb-4a0d-b853-772be7680b5c', CAST(44000000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Bùi Mai Linh đã khám xong.', 1684999855852)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'050bc693-da6b-44a8-a4fd-b9d8e84481be', CAST(0.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Vũ Thị Phương Thảo đã khám xong.', 1684126114281)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'2623feab-fd87-4ffd-9126-648b938134a9', CAST(5000000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Mai Thanh Hà đã khám xong.', 1685112943370)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'3f23c8ba-e5ba-4ff8-a8c3-e3ebaa455255', CAST(9250000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Vũ Minh Phương đã khám xong.', 1686333304747)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'4c1d0f01-dcaf-482e-affe-386dd86f75f9', CAST(1500000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Mai Thanh Hà đã khám xong.', 1686306284606)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'573cdf15-6e4e-4eb0-95d5-aaef0e56f563', CAST(8865000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Vũ Thị Phương Thảo đã khám xong.', 1683985480553)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'5b6c8be8-4c9c-4832-bcc8-c7854c979aac', CAST(100000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Vũ Thị Phương Thảo đã khám xong.', 1683986378136)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'635ddf88-65d4-4ca1-9245-2f81bc3d8c17', CAST(70000000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Vũ Thị Phương Thảo đã khám xong.', 1684854002933)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'63ae9b2e-20ba-427b-8b22-360e4f4503ba', CAST(47800.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Thảo Update đã khám xong.', 1684290598894)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'71ccedb8-5d6d-4e62-9aec-12ba17907b58', CAST(8765000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Hải đã khám xong.', 1683987169248)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'79ee1fa9-0929-418b-856d-152a72e58127', CAST(5000000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Vũ Thị Phương Thảo đã khám xong.', 1683985048401)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'95234e4d-c7af-43f4-8184-9a84c8475d62', CAST(6250000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Nguyễn Việt Hưng đã khám xong.', 1686582934781)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'9643b91d-20fa-4cf0-a5f6-9ca657735246', CAST(0.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Vũ Thị Phương Thảo đã khám xong.', 1683985133778)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'bf5a208a-569b-46e5-a6f1-1a5fa0a907dc', CAST(200000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Nguyễn Việt Hưng đã khám xong.', 1686365186399)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'cdcb05ee-33bb-4924-9a14-874b0bb056d5', CAST(136000000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Vũ Thị Phương Thảo đã khám xong.', 1686365274016)
INSERT [dbo].[system_transaction] ([SystemTransactionId], [Amount], [Message], [CreateTime]) VALUES (N'dfa53e5c-476c-4139-bef3-547b12a41186', CAST(1500000.00000000 AS Decimal(30, 8)), N'Tiền thu từ hóa đơn của khách hàng Vũ Thị Phương Thảo đã khám xong.', 1686322195934)
GO
INSERT [dbo].[system_wallet] ([SystemWalletId], [Balance]) VALUES (N'revenue', CAST(291477800.00000000 AS Decimal(30, 8)))
GO
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'04eac990-0f44-4c2b-b64a-0e6501f623da', N'Khuất Quang Hoàng', N'Khuat Quang Hoang', NULL, N'hoang123', N'0938837727', N'f7ccb7fae795507a58168414f5b49630', N'quanghoang8532@gmail.com', NULL, NULL, 1, NULL, N'Thạch Thất')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'052bcf96-251d-4beb-8dfd-9afc80effc1c', N'Nguyễn Văn Nam', N'Nguyen Van Nam', NULL, NULL, N'092827622', NULL, N'namnguyen@gmail.com', NULL, 1685590873183, 1, NULL, N'Hải Dương')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'Nguyễn Việt Hưng', N'Nguyen Viet Hung', N'/files/avatar/3d0a6d54-fc6a-4a44-a3c0-adcbd15c8caf.jpg', N'hung123', N'0938387828', N'8f65879baeb28e039bb23639249d83ad', N'Viethung92gtvt@gmail.com', NULL, NULL, 1, NULL, N'Hà Nội')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'1', N'Vũ Thị Phương Thảo', N'Vu Thi Phuong Thao', N'/files/avatar/1a39c4ce-4c23-434f-a5d8-0647062f6539.jpg', N'phuongthao', N'0365186564', NULL, N'thaovu13092001@gmail.com', N'Ðang kích hoạt', NULL, 1, 0, N'Kiến Xương - Thái Bình')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', N'Mai Thanh Hà', N'Mai Thanh Ha', NULL, N'haha', N'0987626781', N'3771edbae037fc5d49fd5aff49bec769', N'maithanhha@gmail.com', NULL, NULL, 1, NULL, N'Hà Nội')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'32c53d41-bb6a-42a7-ae15-3e44084f45fe', N'Nguyễn Triệu Phú', N'Nguyen Trieu Phu', NULL, NULL, N'099383721', NULL, N'phu18@gmail.com', NULL, 1685696995762, 1, 0, N'Sơn La')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'Vũ Thị Phương Thảo', N'Vu Thi Phuong Thao', N'/files/avatar/9a2f5c9b-56f8-4f5a-b64e-ded9939944e0.jpg', N'thaoday', N'0987456342', N'2bb506fb1eceac8fdee5a1af76e706c5', N'thaovu1309@gmail.com', NULL, NULL, 1, 0, N'Hà Nội')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'418872d8-f3dc-4098-82a1-77339f8ddeca', N'Hoàng Minh Thái', N'Hoang Minh Thai', NULL, NULL, N'0993838871', NULL, N'thaiminhhoang@gmail.oc', NULL, 1686306790393, 1, NULL, N'Hà Nội')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'557ee6e8-5f56-4b85-b874-335ecf69c76b', N'Đỗ Văn Hải', N'Do Van Hai', NULL, N'haidv', N'0388039267', N'e24dd00f9f820982d5522abeb8782ceb', N'haidv2801@gmail.com', NULL, NULL, 1, NULL, N'Nam Định')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'acaef832-49a4-49d7-82ac-12aa751ec4d6', N'Test', N'Test', N'/files/avatar/1aee0920-efb6-42e8-b989-b288d7d0d4b1.jpg', N'test', N'0983621832', N'3c3ebeb0b044d2a3eaacfbebdfec6db7', N'anh@gmail.com', NULL, NULL, 0, 0, N'Hà Nội')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', N'Vũ Phương Thảo', N'Vu Phuong Thao', N'/files/avatar/7be82ae0-4d7e-4cfb-8d36-3140878098ac.jpg', N'test2', N'0987654321', N'6415d7b1f4d05b15856253c72d09667d', N'test@gmail.com', NULL, NULL, 1, NULL, N'99 Nguyễn Chí Thanh')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'e1c99783-67a5-4710-aa2a-7b6ed733dc19', N'Đỗ Thị Loan', N'Do Thi Loan', NULL, NULL, N'093837712', NULL, N'loandothi@gmail.com', NULL, 1685591216703, 1, NULL, N'Thái Bình')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'Vũ Minh Phương', N'Vu Minh Phuong', N'/files/avatar/9b6571db-15f3-4435-a5ee-54f37171db88.jpg', N'minhphuong98', N'0938477221', N'14b42459aa2c8a0bd36cc3bde41c5932', N'vuminhphuongabc@gmail.com', NULL, NULL, 1, 0, N'HN')
INSERT [dbo].[user] ([UserId], [Name], [SearchName], [Avatar], [Account], [Phone], [Password], [Email], [Status], [CreateTime], [Enable], [Gender], [Address]) VALUES (N'e8eea716-7532-4b82-a89c-07e02998b2f2', N'Bùi Mai Linh', N'Bui Mai Linh', N'/files/avatar/2e335aa1-cc65-4f37-b7d7-3b1d5f9d7f37.jpg', N'mailinh2001', N'0846076166', N'1846c47a42564bc27ab367ec00dcf098', N'buimailinh04112001@gmail.com', NULL, NULL, 1, NULL, N'Trực Ninh, Nam Định')
GO
INSERT [dbo].[user_admin] ([UserAdminId], [Name], [Account], [Password], [Token], [CreateTime], [Role]) VALUES (N'0a59cf36-cd77-402e-bc61-7b987899ea7e', N'ThaoVTP', N'admin1', N'e92c23e64dd3962ca41f921f1fe15b63', N'', 1681719640621, N'ADMIN')
INSERT [dbo].[user_admin] ([UserAdminId], [Name], [Account], [Password], [Token], [CreateTime], [Role]) VALUES (N'3f98282a-c090-4f27-9582-b247172231d4', N'admin5', N'admin5', N'4af5b29dc1ffe32c8ab1ea70389f6739', NULL, 1683731377454, N'ADMIN')
INSERT [dbo].[user_admin] ([UserAdminId], [Name], [Account], [Password], [Token], [CreateTime], [Role]) VALUES (N'9317820c-efcd-4266-a167-8fe51a50c7f3', N'admin', N'admin', N'91c4a987873b1535812674042e1fdd9c', N'DentalClinic Vm0xMFlWbFdWWGhYV0d4VFltdHdUMVp0TURGU01rWlZWVmhHVG1Fd2JEUmFSRUozWld4c1dGVnVVbWhXZWxZeFZXMHhjazFGZEhGVGEwNU9WMGRTVEZsNlJtRldNVnB5Vld4T2FtSlZOWGhXUmxKSFdWWktWMk5FVmxSaVYzaDZXbGR6ZUZaWFJYcGhSbkJzWWtWd2RsWkVSbE5pYXpCM1QxVldXazB6UW1GWlYzUldaVVpTV1dOR1drOVNWRVpXVlRGU1MxUXlWbk5TYWs1VllURktURmxyVlhoWFJtUjBaRWRHVTFJemFIaFdSM1JyVFVkV1ZrMVVXbGRpV0ZKVVdXMTBjMlJHVFhoaFJUVnNVbXRhZVZSc1drOVViVXBHWTBSU1dHRXhjRlJXUkVwVFpFWktkVk5zV21sU01taDRWMnhqZUU1R1JuTlZia3BXWW10d2MxbFljRWRXYkdSWlkwWk9WV0pWV25sVk1qVkhWbFpLZEZWc2FGcGlSbkI1V2xaYVYxZFdWbkpQVms1VFZqTlJNVlpyWTNoamJWWklVbXRhVGxac1dsbFdhMVV4Vkd4YWNscEhPV3RTYlZKNlZsZDRZV0pHU25SbFJscFhZa2RvY2xZeU1WZGtSbFoxVld4V1YxSllRbFZYVkVaclZURmFWMVZ1VmxoaVYyaHZWRlpXZDFkc1pGVlVibVJxVFZWYVYxUnNWbUZXTWtaeVUyeHNXbUpHU2toWFZscDNWakZhVlZKc1RsTldSVnBIVmxaa2VrMVdVblJUYTFwcVUwZDRXRlZzV25kV1JteHhVMnQwVjJGNlJscFZiWGh2VjBaS2NtTkdRbGhXYlZFd1ZYcEtTbVZHVm5OV2JGSnBVMFZLVVZadE1ERlJNREZIVjJ4a1ZtRjZiRlpVVjNSaFpXeFplVTVWTlZGVlZEQTVUV3BuTVUxNlRYcE9WMGwwVDFkWk1WbHBNREJhVkd0M1RGUm5NRTVIV1hSTlIxRXlUbnBvYTFwcVRUTk9lbGw0T1RjNE9EZGxOVGd0TW1Rd1lpMDBPR00wTFdFMU5ERXRZamxtTVRJd05XSmpZakpoYjNjYjJiMmUtZWM4Ny00ZDUxLTg3ODMtNzEyMTIxMzU1MjA0', 0, N'ADMIN')
GO
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'07f27dc2-e3ec-4ef8-ac69-1159fea91d21', N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'01H2FRIIQB', N'Vũ Minh Phương', N'0938477221', N'vuminhphuongabc@gmail.com', N'HN', N'27ceffae-8c1b-4e1a-ba0a-f3e4ed894385', 18, 23, 9, 6, 2023, N'OUT_DATE', 1686308218585, 30, CAST(3000000.00000000 AS Decimal(30, 8)), N'00:02:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'092b2f97-1f55-43a8-a658-da56a778d7ff', N'418872d8-f3dc-4098-82a1-77339f8ddeca', N'01H2GM8DS7', N'Hoàng Minh Thái', N'0993838871', N'thaiminhhoang@gmail.oc', N'Hà Nội', N'154d7e36-ae63-4f96-a08e-c59deafa8d64', 15, 0, 11, 6, 2023, N'PENDING', 1686334879623, 30, CAST(9000000.00000000 AS Decimal(30, 8)), N'01:00:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'203d7f85-157e-4cad-b2c7-a8073894deec', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'01H2FKM1EU', N'Vũ Thị Phương Thảo', N'0987456342', N'thaovu1309@gmail.com', N'Hà Nội', N'154d7e36-ae63-4f96-a08e-c59deafa8d64', 23, 55, 9, 6, 2023, N'USER_CANCEL', 1686299674078, 2, CAST(15000000.00000000 AS Decimal(30, 8)), N'02:00:00.000', N'hi')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'289d704e-c388-4f04-8b46-36e160286e9b', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'01H2GM99MN', N'Vũ Thị Phương Thảo', N'0987456342', N'thaovu1309@gmail.com', N'Hà Nội', N'27ceffae-8c1b-4e1a-ba0a-f3e4ed894385', 14, 0, 12, 6, 2023, N'DONE', 1686334908119, 90, CAST(136000000.00000000 AS Decimal(30, 8)), N'04:00:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'40c934dc-3bb4-4279-8fe5-682145e8b7ab', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'01H2GA4FB9', N'Vũ Thị Phương Thảo', N'0987456342', N'thaovu1309@gmail.com', N'Hà Nội', N'3eddd1ee-cfa7-4926-9914-d67146104699', 0, 45, 10, 6, 2023, N'OUT_DATE', 1686322167146, 1, CAST(1500000.00000000 AS Decimal(30, 8)), N'01:00:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'4477659a-91bd-43a2-9923-f94e4dcd4ad0', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'01H2GD5NJC', N'Vũ Thị Phương Thảo', N'0987456342', N'thaovu1309@gmail.com', N'Hà Nội', N'27ceffae-8c1b-4e1a-ba0a-f3e4ed894385', 9, 30, 10, 6, 2023, N'CONFIRM_ARRIVE', 1686325354093, 30, CAST(7000000.00000000 AS Decimal(30, 8)), N'00:05:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'6e172aff-cb36-4f7e-9bf1-614896511720', N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', N'01H2FQUODN', N'Mai Thanh Hà', N'0987626781', N'maithanhha@gmail.com', N'Hà Nội', N'813ec3ce-9ea7-4ab8-b311-65be0e18a244', 23, 57, 9, 6, 2023, N'OUT_DATE', 1686306251191, 15, CAST(1500000.00000000 AS Decimal(30, 8)), N'01:00:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'7f9b3d41-2689-4dd6-980e-3f97562bf822', N'32c53d41-bb6a-42a7-ae15-3e44084f45fe', N'01H2FR27N2', N'Nguyễn Triệu Phú', N'099383721', N'phu18@gmail.com', N'Sơn La', N'b1f5f895-0fdc-4e59-a12c-d3d70a70f558', 15, 0, 16, 6, 2023, N'CONFIRM_ARRIVE', 1686306365154, 60, CAST(70000000.00000000 AS Decimal(30, 8)), N'04:00:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'80d9d395-68fb-4437-ab59-cb087b330fba', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'01H2G9V1HD', N'Vũ Thị Phương Thảo', N'0987456342', N'thaovu1309@gmail.com', N'Hà Nội', N'154d7e36-ae63-4f96-a08e-c59deafa8d64', 18, 23, 8, 6, 2023, N'OUT_DATE', 1686321989165, 30, CAST(9000000.00000000 AS Decimal(30, 8)), N'00:02:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'a2e20fc4-92df-4059-8421-c53c2fb8071a', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'01H2B7UG4L', N'Vũ Thị Phương Thảo', N'0987456342', N'thaovu1309@gmail.com', N'Hà Nội', N'1d3bc730-c434-4b3e-af0e-4e40fd6f8c6f', 22, 40, 7, 6, 2023, N'OUT_DATE', 1686152102037, 15, CAST(1500000.00000000 AS Decimal(30, 8)), N'00:02:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'b07779a7-880e-44af-9cdb-b15de5e0f225', N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'01H2FU15RN', N'Vũ Minh Phương', N'0938477221', N'vuminhphuongabc@gmail.com', N'HN', N'3eddd1ee-cfa7-4926-9914-d67146104699', 23, 36, 9, 6, 2023, N'OUT_DATE', 1686309476216, 30, CAST(2000000.00000000 AS Decimal(30, 8)), N'01:00:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'cb2d948d-6d65-487f-9e25-a890a7c0a077', N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'01H2HJ9CHB', N'Nguyễn Việt Hưng', N'0938387828', N'Viethung92gtvt@gmail.com', N'Hà Nội', N'3eddd1ee-cfa7-4926-9914-d67146104699', 15, 0, 15, 6, 2023, N'PENDING', 1686365319723, 30, CAST(9000000.00000000 AS Decimal(30, 8)), N'01:05:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'cc596f21-1cdf-4ba0-9085-ee993267623e', N'e848d550-acfb-4c12-8f39-201d8b7ae786', N'01H2FQRE2U', N'Vũ Minh Phương', N'0938477221', N'vuminhphuongabc@gmail.com', N'HN', N'3eddd1ee-cfa7-4926-9914-d67146104699', 14, 30, 16, 6, 2024, N'DONE', 1686306142302, 30, CAST(9250000.00000000 AS Decimal(30, 8)), N'00:15:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'd05ac192-b93d-475e-a55f-2ce068899408', N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'01H2HIILII', N'Nguyễn Việt Hưng', N'0938387828', N'Viethung92gtvt@gmail.com', N'Hà Nội', N'154d7e36-ae63-4f96-a08e-c59deafa8d64', 10, 0, 10, 6, 2023, N'RECEIVE', 1686364575315, 30, CAST(7000000.00000000 AS Decimal(30, 8)), N'00:15:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'd92840bd-6d11-411e-bb20-f104774fc7b6', N'04eac990-0f44-4c2b-b64a-0e6501f623da', N'01H2HEB8O8', N'Khuất Quang Hoàng', N'0938837727', N'quanghoang8532@gmail.com', N'Thạch Thất', N'154d7e36-ae63-4f96-a08e-c59deafa8d64', 8, 28, 10, 6, 2023, N'OUT_DATE', 1686360138504, 1, CAST(9000000.00000000 AS Decimal(30, 8)), N'00:05:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'fd3cc83e-5349-430c-9004-11232da82104', N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'01H2HJ3379', N'Nguyễn Việt Hưng', N'0938387828', N'Viethung92gtvt@gmail.com', N'Hà Nội', N'3eddd1ee-cfa7-4926-9914-d67146104699', 16, 30, 14, 6, 2023, N'DONE', 1686365113577, 15, CAST(200000.00000000 AS Decimal(30, 8)), N'00:15:00.000', N'')
INSERT [dbo].[user_appointment] ([UserAppointmentId], [UserId], [AppointmentCode], [Name], [Phone], [Email], [Address], [DoctorId], [Hour], [Minute], [Day], [Month], [Year], [Status], [CreateTime], [TotalExpectTime], [TotalAmount], [Remind], [UserNote]) VALUES (N'ffc54707-655f-4b8f-912e-d13fd4e8cf80', N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'01H2HIL8L2', N'Nguyễn Việt Hưng', N'0938387828', N'Viethung92gtvt@gmail.com', N'Hà Nội', N'27ceffae-8c1b-4e1a-ba0a-f3e4ed894385', 10, 30, 12, 6, 2023, N'DONE', 1686364660386, 30, CAST(6250000.00000000 AS Decimal(30, 8)), N'00:20:00.000', N'')
GO
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'087493a1-2595-4d05-a931-df2117a23cfe', N'07f27dc2-e3ec-4ef8-ac69-1159fea91d21', N'f9692ead-4953-4f2b-a074-a706cf8fec64', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'0f7c7865-557e-45a7-91b5-24fd7e42cba5', N'cc596f21-1cdf-4ba0-9085-ee993267623e', N'95818831-1e48-4d5e-a7cd-4e863a26a707', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'2564cfd9-2ae4-4f99-becb-6ffa813801c5', N'203d7f85-157e-4cad-b2c7-a8073894deec', N'95818831-1e48-4d5e-a7cd-4e863a26a707', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'27357f41-366c-4091-812b-6839b82b4e4e', N'6e172aff-cb36-4f7e-9bf1-614896511720', N'e2f39ef1-bb22-474c-9f96-60d232f827a1', 15)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'3c5364a2-df89-4ef4-8ff2-2b1ef66edb42', N'40c934dc-3bb4-4279-8fe5-682145e8b7ab', N'e2f39ef1-bb22-474c-9f96-60d232f827a1', 15)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'5ac33617-91a6-40d0-8e8c-344d47e1ec9c', N'a2e20fc4-92df-4059-8421-c53c2fb8071a', N'e2f39ef1-bb22-474c-9f96-60d232f827a1', 15)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'607a1fdc-294e-4dd5-b050-2ef7ae64460e', N'7f9b3d41-2689-4dd6-980e-3f97562bf822', N'47396871-9d99-4499-9fab-e612823e7139', 60)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'61cd8433-9481-4a2d-ab5e-531cc4d87e32', N'289d704e-c388-4f04-8b46-36e160286e9b', N'8cd8185a-f964-4e9c-948b-af13169aa5f6', 60)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'74d56503-6578-4ac7-badf-1bc20a7ac4d7', N'd05ac192-b93d-475e-a55f-2ce068899408', N'1b991a62-9e48-4e30-9aaa-6325921744bd', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'7b3604bb-17fb-4f44-a3c6-c405f37f17e9', N'cb2d948d-6d65-487f-9e25-a890a7c0a077', N'95818831-1e48-4d5e-a7cd-4e863a26a707', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'b38fe7ef-59a5-4f52-bbdf-985d4c64677f', N'80d9d395-68fb-4437-ab59-cb087b330fba', N'95818831-1e48-4d5e-a7cd-4e863a26a707', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'be67c358-28ea-443e-bd51-0c3eeaf7bc82', N'092b2f97-1f55-43a8-a658-da56a778d7ff', N'95818831-1e48-4d5e-a7cd-4e863a26a707', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'cb4c40d4-7259-43c9-86b3-d2e3de0e2644', N'4477659a-91bd-43a2-9923-f94e4dcd4ad0', N'1b991a62-9e48-4e30-9aaa-6325921744bd', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'cb50eb17-a4d6-44f6-aa19-a2994adf193f', N'fd3cc83e-5349-430c-9004-11232da82104', N'26837e3c-4dd3-41f7-9e5a-5862068cd8b8', 15)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'd95b5629-2721-4626-9d58-f05f75e6e173', N'203d7f85-157e-4cad-b2c7-a8073894deec', N'e9e4b32f-9194-4b91-b5a1-1c083ff05f2e', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'd971a18f-5434-4507-9261-853522743893', N'd92840bd-6d11-411e-bb20-f104774fc7b6', N'95818831-1e48-4d5e-a7cd-4e863a26a707', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'dc490f22-f193-4b8f-ac36-6356cc6d2d67', N'b07779a7-880e-44af-9cdb-b15de5e0f225', N'a5a886c8-9445-4028-acda-4a4aac53205a', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'e1abdcab-949e-4b47-bd8b-214169bc410c', N'ffc54707-655f-4b8f-912e-d13fd4e8cf80', N'e9e4b32f-9194-4b91-b5a1-1c083ff05f2e', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'e72701a0-9891-4606-9371-33271d582e8c', N'289d704e-c388-4f04-8b46-36e160286e9b', N'e9e4b32f-9194-4b91-b5a1-1c083ff05f2e', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'e8d575f9-d520-4f8a-b425-e013d272fe11', N'cc596f21-1cdf-4ba0-9085-ee993267623e', N'0b1047c4-25e4-491f-904f-912911df7a31', 30)
INSERT [dbo].[user_appointment_service] ([UserAppointmentServiceId], [UserAppointmentId], [ServiceId], [ExpectTime]) VALUES (N'eb270e65-4544-4f3a-af01-122601e227a6', N'ffc54707-655f-4b8f-912e-d13fd4e8cf80', N'0b1047c4-25e4-491f-904f-912911df7a31', 30)
GO
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'028e526d-128f-4d15-b37e-2ffabded332a', N'04eac990-0f44-4c2b-b64a-0e6501f623da', NULL, 1686362590121)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'433cdf05-8838-4733-a25e-d5fa4b5e9c2e', N'e848d550-acfb-4c12-8f39-201d8b7ae786', NULL, 1686306118206)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'6c8e8541-c3ef-4328-ba00-e21e4c0c5b75', N'17f6000f-0bbd-44cc-b45a-c7e1d8e83ef7', NULL, 1684854105629)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'71baa353-ab07-445f-8896-49e0c0da9140', N'557ee6e8-5f56-4b85-b874-335ecf69c76b', NULL, 1685292282622)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'a406dd3d-4601-4f15-98c0-432d2d38cf4a', N'399bf3f0-248a-455e-a466-fbbe00cff2a3', N'DentalClinic Vm0xMGFtUXlWa2RVV0d4VFltdHdVRlp0TURGU01rWlZWVmhHVG1Fd2JEUmFSRUozWldzMVdGWnRiRnBXUm1zd1YxWlNTbVJGTlRaVldHUmFWWHBCZDFkVVNsTmhhM2hWWVhwT1VGSkdWakJYVm1SaFlVVXhSVnA2UW1GaGJWSnhWMWN4Vm1WSFNuSlhia0pQVVRJNU5WVlhjRWROTVU1MVZHMDVWazFyY0ZaV1Z6VkxZVzFHY2sxSWFGaGhNVnBvV2xaV2QyTkhTa2xqUlRWWFVsaENkMVl4WkhkV2JWRjNUbGhTV0dKWGVFOVdha1poWTFaa2MxcEZaR2hoZW14SlZqSXhNRmxXV1hoV1dHaFlWbXhLU0ZsVlduZGpWbXcyVTIxR1YxSXdOSHBXUnpCNFZHc3hWazVWYUd0VFIzaFBXbGQ0WVdOc1ZuUk9WWEJwVmxoU1dsWkdhRzloYkVwMVVXeG9WVll6YUV4YVZWcDNVakZXY2s5WGRHbFdWbkExVm14a05HSXlSblJXYmxKc1VsVndWbGxVUmt0VU1WSnpWbFJXV0ZKck5UQlVWbFV4VkcxS1NHUXpjRmRTVm5CVVZUSnplRkpyT1ZaaFJrNVlVbXR3VVZaWGRHRldiVlpIV2toT1ZWZEhhRzlWYkZKWFVteFplRlZyZEZWV2JHdzBXVEJvUTFkR1dqWlNiR1JoVWtWR05GVXdXbE5rUlRGWVVtMW9hRTB3U2pKV2ExcFRVekZWZVZSc2FGWmlSbHBXV1cxNGQySXhiRlZTYTNSWVZtMTBObGt3YUU5VmJGcFZWbXRrVjJKWVFrUldiR1JMWkZaR2NsVnNjRmRTVlZrd1YxUkNWbVZHU2xkU2JrcFBWak5vYjFSV1duSmxSbHB5Vm0xR2FFMVZiRFZWYkdoclZHeGtSbGRzYUZkTlJuQk1XVlZhVjJOc1pIUlNiV3hPVmpGS1lWZFVRbUZUTVZKMFVtcGFWMkp0YUZoWmExcExVa1prVjFkdFJsTmlWVFZLVld4UmQxQlVTVFJOYW1NMVRXMVNha3hVV1RKUFZFMTBUa1JTYVU5VE1EUk9iVXBxVEZSQk1VMHlWWGhPZW1zd1dXMUZlRTFuUFQxaE5tSTBOVGM0TUMweFltUmpMVFJsWldZdFlqRTFOaTB4TkdabE5HVTFZVFF4TVRnPTJiYTNhMDNmLTY1NmUtNDU3Zi04YTU4LTU3ZWY4NjcxZDg4Mw==', 1686579792457)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'd03f9dab-e307-40ad-9e1d-92165bde0404', N'd532ebfb-d90d-4c65-83a7-26d4c2731e15', NULL, 1684766510117)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'e2a8ceb2-3e31-4fbc-a7f0-4b9e97551795', N'acaef832-49a4-49d7-82ac-12aa751ec4d6', N'DentalClinic Vm0xd1NtVkhVWGhXYmtwUFZtMVNjRlZyWXpGU01rWlZWVmhHVG1Fd2JEUmFSRUozWldzMU5sVnRkRTVoYkZZMFYydGtTbVJGTVVWVmJYUlBWWHBCZDFSWGNGZGhhM2hWWWtkNFVGSXdiREJYV0hCT1RXc3hObFJ0ZEU1U1Jtd3pWREZTYjJKWFNuSlhia0pQVVRJNU5WVlhjRWROTVU1MVZHMUdWbUpWY0ZaV1Z6VkxZVzFHY2sxSWFGaGhNVnBvV2xaV2QyTkhTa2xqUlRWWFVsUldlRlpHVWt0V01rWlhZMFpvVkZkSFVtRlpWM1JHWkRGU2NscEdTbXhXYlhoV1ZrY3hORmRzV1hkWGJrWllZbFJHVEZsclduTmtSbFowVFZkR1YwMUVRalZXTW5SclUyc3dkMDVWYUd0VFIzaFBXbGQ0WVdOc1ZuUk9WWEJwVmxoU1dsWkdhRzloYkVwVlZteG9WVll6YUV4YVZWcDNVakZXY2s5WGRHbFdWbkExVm14a05HSXlSblJXYmxKc1VsVndWbGxVU2xOVFJteFlaVWhPV0ZKc2NEQlVWbHBEVlRGS1ZWSlVSbGRTVm5CVVZsZHpNVll5U2tkV2JGcFlVbXR3VVZaWGRHdE9SMDV6Vlc1V2FFMHlVbEJWYkZKSFRVWldkRTFZWkZWV2JIQkhWbTF3VjFkR1duUlZhMlJWVmtWRmVGWnNXa3RrUjFaSFkwZDRhVkpZUWpWV2EyTjNaVVpWZVZSc2FGWmlSbHBXV1cxNGQySXhiRlZTYTNSWVZtMTBObGt3YUU5VmJGcFZWbXRrVlZac1NrUldiR1JMVWpGT2NrOVhSbGROTURFMFZtMTBWbVZHU2xkU2JrNVNZa2RTVDFadGVISmtNVnB5Vm0xR2FFMVZNVFZWTW5ocllWWktSMk5IUmxWV1JWcE1WbFZhVjJOV1NuVlVhemxYWWxaS05sWnNaREJrTVZGNFUyNVdVbUp0YUZsWlYzTXhUVEZrVjFkcmRGUlNNRnBLVlRGUmQxQlhTVFJPVkZKc1RucGplRXhYVVhoT1JFbDBUa2RGTkZsVE1EVk9WMWsxVEZkRmQxbFVWWGhaVkVsNVRucFNiRTlCUFQwd056TTFOVE13TUMxaU0yVTBMVFEzWWprdE9XRXpOaTFoT1dWaE16bGtOVGhoWlRRPTYxYTYyYWRhLTU3NzItNDU0My04YmY3LTU4NmJjNWFjODkwYw==', 1683088579216)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'f790db3b-8986-4a8e-b7a7-4ddc3009e1d5', N'0c4a8289-5489-43be-a4cb-ed2b2c6f2bff', N'DentalClinic Vm0xMFlWbFdWWGhWYmxKV1YwZFNUMVpzWXpGU01rWlZWVmhHVG1Fd2JEUmFSRUozWldzMVJWUnRjRTVoYXpCNFZHeGtUbVJGTVZoU1ZFSmhZVlJCZDFkdE1VcE5WWGhWV25wV1RsSXdNVEJVVjNCdllrVTVWVlp0YUdGV1JXdzFWRlJLWVdGWFNuSlhia0pQVVRJNU5WVlhjRWROTVU1MVZHeGtXRkpzY0VaV1Z6VkxZVzFHY2sxSWFGaGhNVnBvV2xaV2QyTkhTa2xqUlRWWFVqSm9NRlpITVhkV2F6VkdUbFJhYVZJeWVHRldha1poWTBaU1dHTkhPV2xTVkVaR1ZrWlNWMWR0U2xaaVJGWlZWMGhDWVZwWGN6VldWazVWVVd4Q1YwMVZWWGRXUmxKTFVqSkZkMDVWYUd0VFIzaFBXbGQ0WVdOc1ZuUk9WWEJwVmxoU1dsWkdhRzlWYlVZMlZteFNWVll6YUV4YVZWcDNVakZXY2s5WGRHbFdWbkExVm14a05HSXlSblJXYmxKc1VsVndWbGxVUmt0U1JteFlZM3BHVkZKcmNGWldWM014WVVkS1dGUllhRmRTVm5CVVZtMXplRkpyT1ZaV2JXaE9UVlZ3VVZaWGRGWk5WMDVIV2toT1ZWZEhhRzlWYkZKWFUxWmFTRTFZVGxWV2JHdzBWakkxUzFaV1dqWlNhM1JoVm14d2VsUnRlR3RrUlRGV1RsZHNWMWRGU1hkV2FrbDNaVVpWZVZSc2FGWmlSbHBXV1cxNGQySXhiRlZTYTNSWVZtMTBObGt3YUU5VmJGcFZWbXRrVjJKWVFrUldiRlY0VjBaV2NrOVhSbGRXYkZWNFZsZDBWbVZHU2xkU2JrcFBWak5vY0ZWcVRtdE9iRnB5Vm0xR1ZrMXJOWGxVYkZaaFZVWmFWMWR0UmxWV1JWcE1WMVphVTFkSFZrWlhhelZYWWxaS1lWZFVRbGRUTWtwSVVtcGFWMkV4Y0dGV01HaERWMFphUlZOclpHcE5WWEJhV1c1dmQxQlVVVEJOYW14dFdXcENha3hVVm10TlZHdDBUa1JqTkU1NU1XaFpha0UxVEZkUk1FOUhSVEpPVjAxM1RrZFpORnBuUFQwMllXRmxZVGRqT1MweVltUXdMVFJoT1dNdE9HVTRaUzAyTlRZellUZG1NV1ZtTVRBPWVkMDRiMzQ2LWY3ZDItNDYwZi05MDlhLTNjOGY2N2RjOWY1ZA==', 1686364387098)
INSERT [dbo].[user_token] ([UserTokenId], [UserId], [Token], [CreateTime]) VALUES (N'ff089578-6684-493b-b027-d9f2016ee12c', N'e8eea716-7532-4b82-a89c-07e02998b2f2', NULL, 1685501523972)
GO
ALTER TABLE [dbo].[service]  WITH CHECK ADD  CONSTRAINT [FK_service_service_category] FOREIGN KEY([ServiceCategoryId])
REFERENCES [dbo].[service_category] ([ServiceCategoryId])
GO
ALTER TABLE [dbo].[service] CHECK CONSTRAINT [FK_service_service_category]
GO
USE [master]
GO
ALTER DATABASE [DentalClinicTest] SET  READ_WRITE 
GO
