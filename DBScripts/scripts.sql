USE [master]
GO
/****** Object:  Database [AlphaCreditApp]    Script Date: 1/06/2019 6:59:34 p. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'AlphaCreditApp')
BEGIN
CREATE DATABASE [AlphaCreditApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlphaCreditApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\AlphaCreditApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlphaCreditApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\AlphaCreditApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [AlphaCreditApp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlphaCreditApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlphaCreditApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlphaCreditApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlphaCreditApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlphaCreditApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlphaCreditApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET RECOVERY FULL 
GO
ALTER DATABASE [AlphaCreditApp] SET  MULTI_USER 
GO
ALTER DATABASE [AlphaCreditApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlphaCreditApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlphaCreditApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlphaCreditApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlphaCreditApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlphaCreditApp', N'ON'
GO
ALTER DATABASE [AlphaCreditApp] SET QUERY_STORE = OFF
GO
USE [AlphaCreditApp]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AlphaCreditApp]
GO
/****** Object:  Table [dbo].[CivilStatus]    Script Date: 1/06/2019 6:59:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CivilStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CivilStatus](
	[CivilStatudId] [int] IDENTITY(1,1) NOT NULL,
	[CivilStatusName] [nvarchar](50) NULL,
	[CivilStatusCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_CivilStatus] PRIMARY KEY CLUSTERED 
(
	[CivilStatudId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CreditType]    Script Date: 1/06/2019 6:59:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CreditType](
	[IdCreditType] [int] IDENTITY(1,1) NOT NULL,
	[CreditTypeName] [nvarchar](50) NULL,
	[CreditTypeCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_CreditType] PRIMARY KEY CLUSTERED 
(
	[IdCreditType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/06/2019 6:59:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[IdCustomer] [int] IDENTITY(1,1) NOT NULL,
	[IdentificationTypeId] [int] NULL,
	[Identification] [nvarchar](50) NULL,
	[Names] [nvarchar](50) NULL,
	[LastNames] [nvarchar](50) NULL,
	[Birthdate] [datetime] NULL,
	[GenderId] [int] NULL,
	[CivilStatusId] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNumbers] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[CompanyPhones] [nvarchar](50) NULL,
	[CompanyWorkTime] [int] NULL,
	[MonthlyIncomes] [money] NULL,
	[RegisterDate] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[IdCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 1/06/2019 6:59:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Gender](
	[GenderId] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](50) NULL,
	[GenderCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IdentificationType]    Script Date: 1/06/2019 6:59:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentificationType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IdentificationType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NULL,
	[TypeCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_IdentificationType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Requisition]    Script Date: 1/06/2019 6:59:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Requisition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Requisition](
	[IdRequisition] [int] IDENTITY(1,1) NOT NULL,
	[CreditTypeId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RequisitionAmount] [money] NOT NULL,
	[RequisitionTerm] [int] NOT NULL,
	[RequisitionQuota] [money] NOT NULL,
	[RequisitionDate] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRequisition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_CivilStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CivilStatus] FOREIGN KEY([CivilStatusId])
REFERENCES [dbo].[CivilStatus] ([CivilStatudId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_CivilStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CivilStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_Gender]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([GenderId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_Gender]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Gender]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_IdentificationType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_IdentificationType] FOREIGN KEY([IdentificationTypeId])
REFERENCES [dbo].[IdentificationType] ([TypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_IdentificationType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_IdentificationType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Requisition_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Requisition]'))
ALTER TABLE [dbo].[Requisition]  WITH CHECK ADD  CONSTRAINT [FK_Requisition_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([IdCustomer])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Requisition_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Requisition]'))
ALTER TABLE [dbo].[Requisition] CHECK CONSTRAINT [FK_Requisition_Customer]
GO
/****** Object:  StoredProcedure [dbo].[SP_CREATE_REQUISITION]    Script Date: 1/06/2019 6:59:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_CREATE_REQUISITION]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_CREATE_REQUISITION] AS' 
END
GO
-- =============================================
-- Author:		Erwin Pardo
-- Create date: 01/06/2019
-- Description:	Create Requisition
-- =============================================
ALTER PROCEDURE [dbo].[SP_CREATE_REQUISITION] 
	@CreditTypeId INT
	,@CustomerId INT
	,@Amount MONEY
	,@Term INT
	,@Quota MONEY
AS
BEGIN
	INSERT INTO [dbo].[Requisition]
           ([CreditTypeId]
           ,[CustomerId]
           ,[RequisitionAmount]
           ,[RequisitionTerm]
           ,[RequisitionQuota]
		   ,[RequisitionDate])
     VALUES
           (@CreditTypeId
			,@CustomerId
			,@Amount
			,@Term
			,@Quota
			,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CUSTOMER_INCOMES]    Script Date: 1/06/2019 6:59:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GET_CUSTOMER_INCOMES]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_GET_CUSTOMER_INCOMES] AS' 
END
GO
-- =============================================
-- Author:		Erwin Pardo
-- Create date: 01/06/2019
-- Description:	Get Customer Incomes
-- =============================================
ALTER PROCEDURE [dbo].[SP_GET_CUSTOMER_INCOMES]
	@CustomerId INT
AS
BEGIN
	SELECT [MonthlyIncomes] 
	FROM CUSTOMER
	WHERE [IdCustomer] = @CustomerId;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_CUSTOMER]    Script Date: 1/06/2019 6:59:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_INSERT_CUSTOMER]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_INSERT_CUSTOMER] AS' 
END
GO
-- =============================================
-- Author:		Erwin Pardo
-- Create date: 01/06/2019
-- Description:	Insert Customer
-- =============================================
ALTER PROCEDURE [dbo].[SP_INSERT_CUSTOMER]
	@IdentificationTypeId int,
	@Identification nvarchar(50),
	@Names nvarchar(50),
	@LastNames nvarchar(50),
	@Birthdate datetime,
	@GenderId int,
	@CivilStatusId int,
	@Address nvarchar(50),
	@PhoneNumbers nvarchar(50),
	@CompanyName nvarchar(50),
	@CompanyPhones nvarchar(50),
	@CompanyWorkTime int,
	@MonthlyIncomes money
AS
BEGIN
	INSERT INTO [dbo].[Customer]
           ([IdentificationTypeId]
           ,[Identification]
           ,[Names]
           ,[LastNames]
           ,[Birthdate]
           ,[GenderId]
           ,[CivilStatusId]
           ,[Address]
           ,[PhoneNumbers]
           ,[CompanyName]
           ,[CompanyPhones]
           ,[CompanyWorkTime]
           ,[MonthlyIncomes]
		   ,[RegisterDate])
     VALUES
           (@IdentificationTypeId,
			@Identification,
			@NameS,
			@LastNames,
			@Birthdate,
			@GenderId,
			@CivilStatusId,
			@Address,
			@PhoneNumbers,
			@CompanyName,
			@CompanyPhones,
			@CompanyWorkTime,
			@MonthlyIncomes,
			GETDATE())
END
GO
USE [master]
GO
ALTER DATABASE [AlphaCreditApp] SET  READ_WRITE 
GO
