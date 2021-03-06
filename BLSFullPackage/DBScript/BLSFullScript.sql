USE [master]
GO
/****** Object:  Database [BLS]    Script Date: 12/07/2014 23:16:15 ******/
CREATE DATABASE [BLS] ON  PRIMARY 
( NAME = N'BLS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BLS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BLS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BLS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BLS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BLS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BLS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BLS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BLS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BLS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BLS] SET ARITHABORT OFF
GO
ALTER DATABASE [BLS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BLS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BLS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BLS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BLS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BLS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BLS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BLS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BLS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BLS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BLS] SET  DISABLE_BROKER
GO
ALTER DATABASE [BLS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BLS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BLS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BLS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BLS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BLS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BLS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BLS] SET  READ_WRITE
GO
ALTER DATABASE [BLS] SET RECOVERY SIMPLE
GO
ALTER DATABASE [BLS] SET  MULTI_USER
GO
ALTER DATABASE [BLS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BLS] SET DB_CHAINING OFF
GO
USE [BLS]
GO
/****** Object:  UserDefinedTableType [dbo].[UDTTransactionHistory]    Script Date: 12/07/2014 23:16:16 ******/
CREATE TYPE [dbo].[UDTTransactionHistory] AS TABLE(
	[HistoryUID] [uniqueidentifier] NOT NULL,
	[HistoryDate] [date] NULL,
	[IssueDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[Type] [varchar](3) NULL,
	[CustomerID] [varchar](15) NULL,
	[Title] [varchar](500) NULL,
	[Author] [varchar](200) NULL,
	[Edition] [varchar](20) NULL,
	[PurchasePrice] [float] NULL,
	[AmountIN] [float] NULL,
	[AmountOut] [float] NULL,
	[ActualAmountIN] [float] NULL,
	[ActualAmountOut] [float] NULL,
	[RecieptNumber] [varchar](20) NULL,
	[CheckNumber] [varchar](30) NULL,
	[CheckIssueDate] [date] NULL,
	[CheckStatus] [varchar](30) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDTStock]    Script Date: 12/07/2014 23:16:16 ******/
CREATE TYPE [dbo].[UDTStock] AS TABLE(
	[ISBN] [varchar](25) NOT NULL,
	[Title] [varchar](500) NULL,
	[Author] [varchar](200) NULL,
	[Year] [varchar](4) NULL,
	[Edition] [varchar](20) NULL,
	[Publisher] [varchar](200) NULL,
	[Count] [int] NULL,
	[PriceChangable] [bit] NULL,
	[OriginalPrice] [float] NULL,
	[Discount] [float] NULL,
	[PurchasePrice] [float] NULL,
	[LastUpdated] [date] NULL,
	[OutCount] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDTOrder]    Script Date: 12/07/2014 23:16:16 ******/
CREATE TYPE [dbo].[UDTOrder] AS TABLE(
	[CustomerID] [varchar](15) NOT NULL,
	[Date] [date] NULL,
	[ISBN] [varchar](25) NULL,
	[Count] [int] NOT NULL,
	[DepositAmount] [float] NOT NULL,
	[OrderClearanceDate] [date] NULL,
	[Mobile] [varchar](12) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDTIssue]    Script Date: 12/07/2014 23:16:16 ******/
CREATE TYPE [dbo].[UDTIssue] AS TABLE(
	[CustomerID] [int] NOT NULL,
	[Title] [varchar](300) NULL,
	[Author] [varchar](150) NULL,
	[Edition] [varchar](20) NULL,
	[Publisher] [varchar](150) NOT NULL,
	[IssueDate] [date] NOT NULL,
	[BookCount] [int] NOT NULL,
	[BookPrice] [float] NOT NULL,
	[RecieptNumber] [varchar](20) NOT NULL,
	[HistoryUID] [uniqueidentifier] NOT NULL,
	[IssueType] [varchar](25) NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[EarlyIssue] [bit] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDTCustomerBooks]    Script Date: 12/07/2014 23:16:16 ******/
CREATE TYPE [dbo].[UDTCustomerBooks] AS TABLE(
	[CustBookID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Title] [varchar](500) NULL,
	[Author] [varchar](200) NULL,
	[Edition] [varchar](20) NULL,
	[OriginalPrice] [float] NULL,
	[Count] [int] NOT NULL,
	[Date] [date] NULL,
	[HistoryUID] [uniqueidentifier] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDTCustomer]    Script Date: 12/07/2014 23:16:16 ******/
CREATE TYPE [dbo].[UDTCustomer] AS TABLE(
	[CustomerID] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Father Name] [varchar](100) NOT NULL,
	[DOB] [date] NOT NULL,
	[Parent Phone] [varchar](20) NOT NULL,
	[Parent Mobile] [varchar](20) NOT NULL,
	[Student Mobile] [varchar](20) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[CollegeName] [varchar](300) NOT NULL,
	[Course] [varchar](200) NOT NULL,
	[CourseDuration] [int] NOT NULL,
	[EmailID] [varchar](150) NOT NULL,
	[MembershipDate] [date] NOT NULL,
	[MembershipType] [varchar](50) NOT NULL,
	[MembershipPeriod] [int] NOT NULL,
	[Activation] [bit] NULL,
	[BookCount] [int] NOT NULL,
	[DepositAmount] [float] NOT NULL,
	[AdvanceAmount] [float] NULL,
	[BalanceAmount] [float] NULL,
	[RefundAmount] [float] NULL,
	[RecieptNumber] [varchar](20) NULL,
	[MaxLimit] [float] NOT NULL,
	[UsedLimit] [float] NOT NULL,
	[EarlyActivation] [bit] NULL,
	[CreatedDatetime] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[TblTransactionHistory]    Script Date: 12/07/2014 23:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblTransactionHistory](
	[HistoryUID] [uniqueidentifier] NOT NULL,
	[HistoryDate] [date] NULL,
	[IssueDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[Type] [varchar](3) NULL,
	[CustomerID] [varchar](15) NULL,
	[Title] [varchar](500) NULL,
	[Author] [varchar](200) NULL,
	[Edition] [varchar](20) NULL,
	[PurchasePrice] [float] NULL,
	[AmountIN] [float] NULL,
	[AmountOut] [float] NULL,
	[ActualAmountIN] [float] NULL,
	[ActualAmountOut] [float] NULL,
	[RecieptNumber] [varchar](20) NULL,
	[CheckNumber] [varchar](30) NULL,
	[CheckIssueDate] [date] NULL,
	[CheckStatus] [varchar](30) NULL,
 CONSTRAINT [PK_TblTransactionHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblSupplier]    Script Date: 12/07/2014 23:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblSupplier](
	[SupplierID] [int] NOT NULL,
	[ShortName] [varchar](50) NOT NULL,
	[FullName] [varchar](250) NULL,
	[City] [varchar](50) NOT NULL,
	[Phone] [varchar](12) NULL,
	[Address] [varchar](500) NULL,
 CONSTRAINT [PK_TblSupplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblStock]    Script Date: 12/07/2014 23:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblStock](
	[ISBN] [varchar](25) NOT NULL,
	[Title] [varchar](300) NOT NULL,
	[Author] [varchar](200) NOT NULL,
	[Year] [varchar](4) NULL,
	[Edition] [varchar](20) NOT NULL,
	[Publisher] [varchar](200) NOT NULL,
	[Count] [int] NULL,
	[PriceChangable] [bit] NULL,
	[OriginalPrice] [float] NULL,
	[Discount] [float] NULL,
	[PurchasePrice] [float] NOT NULL,
	[LastUpdated] [date] NULL,
	[OutCount] [int] NULL,
 CONSTRAINT [PK_TblStock] PRIMARY KEY CLUSTERED 
(
	[Title] ASC,
	[Author] ASC,
	[Edition] ASC,
	[Publisher] ASC,
	[PurchasePrice] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblReceipt]    Script Date: 12/07/2014 23:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblReceipt](
	[ReceiptNumber] [varchar](10) NOT NULL,
	[ReceiptDate] [datetime] NOT NULL,
	[HistoryUID] [varchar](100) NOT NULL,
	[PrintedFlag] [bit] NOT NULL,
 CONSTRAINT [PK_TblReceipt] PRIMARY KEY CLUSTERED 
(
	[ReceiptNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblOrders]    Script Date: 12/07/2014 23:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblOrders](
	[CustomerID] [varchar](15) NOT NULL,
	[Date] [date] NULL,
	[ISBN] [varchar](25) NULL,
	[Count] [int] NOT NULL,
	[DepositAmount] [float] NOT NULL,
	[OrderClearanceDate] [date] NULL,
	[Mobile] [varchar](12) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblIssue]    Script Date: 12/07/2014 23:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblIssue](
	[CustomerID] [int] NOT NULL,
	[Title] [varchar](300) NOT NULL,
	[Author] [varchar](150) NOT NULL,
	[Edition] [varchar](20) NOT NULL,
	[Publisher] [varchar](150) NOT NULL,
	[IssueDate] [date] NOT NULL,
	[BookCount] [int] NOT NULL,
	[BookPrice] [float] NOT NULL,
	[RecieptNumber] [varchar](20) NOT NULL,
	[HistoryUID] [uniqueidentifier] NOT NULL,
	[IssueType] [varchar](25) NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[EarlyIssue] [bit] NOT NULL,
 CONSTRAINT [PK_TblIssue] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[Title] ASC,
	[Author] ASC,
	[Edition] ASC,
	[Publisher] ASC,
	[BookPrice] ASC,
	[IssueDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblID]    Script Date: 12/07/2014 23:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblID](
	[IDDate] [date] NOT NULL,
	[ID] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblCustomerBooks]    Script Date: 12/07/2014 23:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblCustomerBooks](
	[CustBookID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Title] [varchar](500) NULL,
	[Author] [varchar](200) NULL,
	[Edition] [varchar](20) NULL,
	[OriginalPrice] [float] NULL,
	[Count] [int] NOT NULL,
	[Date] [date] NULL,
	[HistoryUID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblCustomer]    Script Date: 12/07/2014 23:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblCustomer](
	[CustomerID] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Father Name] [varchar](100) NOT NULL,
	[DOB] [date] NOT NULL,
	[Parent Phone] [varchar](20) NOT NULL,
	[Parent Mobile] [varchar](20) NOT NULL,
	[Student Mobile] [varchar](20) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[CollegeName] [varchar](300) NOT NULL,
	[Course] [varchar](200) NOT NULL,
	[CourseDuration] [int] NOT NULL,
	[EmailID] [varchar](150) NOT NULL,
	[MembershipDate] [date] NOT NULL,
	[MembershipType] [varchar](50) NOT NULL,
	[MembershipPeriod] [int] NOT NULL,
	[Activation] [bit] NULL,
	[BookCount] [int] NOT NULL,
	[DepositAmount] [float] NOT NULL,
	[AdvanceAmount] [float] NULL,
	[BalanceAmount] [float] NULL,
	[RefundAmount] [float] NULL,
	[RecieptNumber] [varchar](20) NULL,
	[MaxLimit] [float] NOT NULL,
	[UsedLimit] [float] NOT NULL,
	[EarlyActivation] [bit] NULL,
	[CreatedDatetime] [datetime] NULL,
 CONSTRAINT [PK_TblCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Delete_stock]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Delete_stock]
(	
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(100),
	@Price float,	
	@Status int OUTPUT
     
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @Status = 0
	
	SELECT @Status =COUNT(*) FROM TblStock  WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @Price
	
IF(@Status > 0)
BEGIN
	DELETE FROM [BLS].[dbo].[TblStock]
	WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @Price
END



END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Delete_Issue_OnCustID]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Delete_Issue_OnCustID]
(
	@CustomerID INT,	
	@Status int OUTPUT
     
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @Status = 0
	
	SELECT @Status =COUNT(*) FROM TblIssue  WHERE CustomerID = @CustomerID 
	
IF(@Status > 0)
BEGIN
	DELETE FROM [BLS].[dbo].[TblIssue]
	WHERE [CustomerID] = @CustomerID 
END



END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Delete_Issue]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Delete_Issue]
(
	@CustomerID INT,
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(100),
	@Publisher Varchar(100),
	@price float,
	@HistoryUID VarChar(100),
	@Status int OUTPUT
     
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @Status = 0
	
	SELECT @Status =COUNT(*) FROM TblIssue  WHERE [Title] = @Title and [Author] = @Author and [Edition] = @Edition 
	and [Publisher] = @Publisher and [BookPrice] = @price and CustomerID = @CustomerID and [HistoryUID] = @HistoryUID
	
IF(@Status > 0)
BEGIN
	DELETE FROM [BLS].[dbo].[TblIssue]
	WHERE [Title] = @Title and [Author] = @Author and [Edition] = @Edition and [BookPrice] = @price and CustomerID = @CustomerID and [HistoryUID] = @HistoryUID 
END



END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Delete_History_OnCustomerID]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Delete_History_OnCustomerID]
(
	@CustomerID INT,
	@Status Bit OUTPUT
     
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @Count AS Int;
	SET @Count = 0	
	SELECT @Count =COUNT(*) FROM [TblTransactionHistory]  WHERE [CustomerID]  = @CustomerID
	
    IF(@Count > 0)
		BEGIN
		    DELETE FROM [BLS].[dbo].[TblTransactionHistory]
			WHERE [CustomerID]  = @CustomerID
			SET @Status = 1;
		END
	ELSE
		BEGIN
			SET @Status = 0;
		END


END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Delete_History]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Delete_History]
(
	@HistoryUID VarChar(100),
	@Status Bit OUTPUT
     
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @Count AS Int;
	SET @Count = 0
	
	SELECT @Count =COUNT(*) FROM [TblTransactionHistory]  WHERE [HistoryUID] = @HistoryUID
	print @Count
    IF(@Count > 0)
		BEGIN		    
			DELETE FROM [BLS].[dbo].[TblTransactionHistory]
			WHERE [HistoryUID] = @HistoryUID
			SET @Status = 1;
		END
	ELSE
		BEGIN
			SET @Status = 0;
		END


END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Stock_Exist]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Stock_Exist]
(
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(100),
	@Publisher Varchar(100),
	@price float,	
	@RowCount int OUT,
	@Book_Number Varchar(4) OUT          
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @RowCount = 0
	SELECT @RowCount=COUNT(*) FROM TblStock  WHERE [Title] = @Title and [Author] = @Author and [Edition] = @Edition 
						and [Publisher]  = @Publisher and  [PurchasePrice] = @price  
						
	IF(@RowCount > 0)
	BEGIN
	SELECT @Book_Number = [ISBN] FROM TblStock  WHERE [Title] = @Title and [Author] = @Author and [Edition] = @Edition 
						and [Publisher]  = @Publisher and  [PurchasePrice] = @price
	END
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_select_UserIssues]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_select_UserIssues]
(
	@CustID int
	
          
)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT *
    FROM TblIssue 
    WHERE [CustomerID] = @CustID
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_select_UserEarlyIssues]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_select_UserEarlyIssues]
(
	@CustID int
	
          
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
    FROM TblIssue 
    WHERE [CustomerID] = @CustID AND [EarlyIssue] = 1
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_select_Suppliers]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------
-- Author       : Gratian Ruzario
-- Created Date : 02 June 2013
-- Description  : Selects supplier list
-------------------------------------------------

CREATE PROCEDURE [dbo].[up_usr_select_Suppliers]
AS
BEGIN
	SELECT 
		[ShortName],
		[FullName],
		[City],
		[Phone],
		[Address]		
	FROM TblSupplier WITH(NOLOCK)
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_select_ReceiptNumber]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------
-- Author       : Gratian Ruzario
-- Created Date : 13 July 2013
-- Description  : Selects Customer based on FirstName and Mobile Number
-------------------------------------------------

CREATE PROCEDURE [dbo].[up_usr_select_ReceiptNumber]
    @ReceiptNumber varchar(10) OUT
	

AS
BEGIN
    
    SELECT TOP(1) @ReceiptNumber = [ReceiptNumber]	
	FROM TblReceipt WITH(NOLOCK) Order by [ReceiptDate] desc
		
	
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Select_GetCustomerLimits]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------
-- Author       : Gratian Ruzario
-- Created Date : 13 July 2013
-- Description  : Selects Customer based on FirstName and Mobile Number
-------------------------------------------------

CREATE PROCEDURE [dbo].[up_usr_Select_GetCustomerLimits]
    @ID int ,
    @MaxLimit float OUT,
    @LimitUsed float OUT
	

AS
BEGIN
    
    SELECT @MaxLimit = 	[MaxLimit] , @LimitUsed = [UsedLimit]
	FROM TblCustomer WITH(NOLOCK)
	WHERE [CustomerID]	= @ID
	
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_select_customerID]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------
-- Author       : Gratian Ruzario
-- Created Date : 13 July 2013
-- Description  : Selects Customer based on FirstName and Mobile Number
-------------------------------------------------

CREATE PROCEDURE [dbo].[up_usr_select_customerID]
    @StartValue int,
    @ID int OUT
	

AS
BEGIN
    
    
    
 --   SELECT @ID = MAX(CustomerID)	
	--FROM TblCustomer WITH(NOLOCK)
	--WHERE CustomerID >= @StartValue
	
	SELECT TOP(1)@ID = [CustomerID]
	FROM TblCustomer WITH(NOLOCK)
	WHERE [EarlyActivation] = 0
	order by [MembershipDate] desc
	
	
	IF(@ID IS NULL)
		BEGIN		   
		   RETURN @StartValue;
		END
	ELSE
		BEGIN		    
			RETURN @ID;
		END
	
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Select_CustomerCount]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------
-- Author       : Gratian Ruzario
-- Created Date : 13 July 2013
-- Description  : Selects Customer based on FirstName and Mobile Number
-------------------------------------------------

CREATE PROCEDURE [dbo].[up_usr_Select_CustomerCount]
    @Name VARCHAR(100) ,
	@Mobile VARCHAR(10),
	@Count int OUT
	

AS
BEGIN
    
    SET @Count = 0
    SELECT @Count = COUNT(CustomerID)	
	FROM TblCustomer WITH(NOLOCK)
	WHERE Name = @Name and [Student Mobile] = @Mobile		
	
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_select_CustomerBookID]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------
-- Author       : Gratian Ruzario
-- Created Date : 13 July 2013
-- Description  : Selects Customer based on FirstName and Mobile Number
-------------------------------------------------

CREATE PROCEDURE [dbo].[up_usr_select_CustomerBookID]
    @ID int OUT
	

AS
BEGIN
    
    SELECT @ID = MAX(CustBookID)	
	FROM TblCustomerBooks WITH(NOLOCK)	
	
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_insert_StockOnEarlyIssue]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_insert_StockOnEarlyIssue]
(
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(100),
	@Price float,
	@BookCount int,
	@StockTable AS UDTStock READONLY
          
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @RowCount INT
	
	SELECT @RowCount=COUNT(*) FROM TblStock WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @Price
	
IF(@RowCount = 0)
BEGIN
	
INSERT INTO [BLS].[dbo].[TblStock]
           ([ISBN]
           ,[Title]
           ,[Author]
           ,[Year]
           ,[Edition]
           ,[Publisher]
           ,[Count]
           ,[PriceChangable]
           ,[OriginalPrice]
           ,[Discount]
           ,[PurchasePrice]
           ,[LastUpdated]
           ,[OutCount])
   
    SELECT  [ISBN]
           ,[Title]
           ,[Author]
           ,[Year]
           ,[Edition]
           ,[Publisher]
           ,[Count]
           ,[PriceChangable]
           ,[OriginalPrice]
           ,[Discount]
           ,[PurchasePrice]
           ,[LastUpdated]
           ,[OutCount]
           FROM @StockTable
END
ELSE IF(@RowCount > 0)
BEGIN

     DECLARE @Count INT    
       
           
     UPDATE TblStock          
     SET [Count]  = [Count] - @BookCount,[OutCount] = [OutCount] + @BookCount
     WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @Price
     
END      
    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_insert_Stock]    Script Date: 12/07/2014 23:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_insert_Stock]
(
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(100),
	@Price float,
	@BookCount int,
	@StockTable AS UDTStock READONLY
          
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @RowCount INT
	DECLARE @Publisher VARCHAR(100)
	
	-- Get the values from user defined table.
	SELECT @Title = Title, @Author = Author, @Edition = Edition, @Price = PurchasePrice, @Publisher = Publisher  FROM @StockTable
	
	SELECT @RowCount=COUNT(*) FROM TblStock WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [Publisher] = @Publisher  And [PurchasePrice] = @Price
	AND [Publisher] = @Publisher
	
IF(@RowCount = 0)
BEGIN
	
INSERT INTO [BLS].[dbo].[TblStock]
           ([ISBN]
           ,[Title]
           ,[Author]
           ,[Year]
           ,[Edition]
           ,[Publisher]
           ,[Count]
           ,[PriceChangable]
           ,[OriginalPrice]
           ,[Discount]
           ,[PurchasePrice]
           ,[LastUpdated]
           ,[OutCount])
   
    SELECT  [ISBN]
           ,[Title]
           ,[Author]
           ,[Year]
           ,[Edition]
           ,[Publisher]
           ,[Count]
           ,[PriceChangable]
           ,[OriginalPrice]
           ,[Discount]
           ,[PurchasePrice]
           ,[LastUpdated]
           ,[OutCount]
           FROM @StockTable
END
ELSE IF(@RowCount > 0)
BEGIN

     DECLARE @Count INT
     
     SELECT @Count = [Count] FROM TblStock WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [Publisher] = @Publisher 
     And [PurchasePrice] = @Price
     
     SET @BookCount = @BookCount + @Count 
     
     UPDATE TblStock
     SET [Count]  = @BookCount
     WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [Publisher] = @Publisher And [PurchasePrice] = @Price
     
END      
    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_insert_Receipt]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------
-- Author       : Gratian Ruzario
-- Created Date : 13 July 2013
-- Description  : Selects Customer based on FirstName and Mobile Number
-------------------------------------------------

CREATE PROCEDURE [dbo].[up_usr_insert_Receipt]
    @ReceiptNumber varchar(10),
    @ReceiptDate datetime,
    @HistoryID varchar(100),
    @printedFlag bit
	

AS
BEGIN
    
    INSERT INTO [BLS].[dbo].[TblReceipt]
           ([ReceiptNumber]
           ,[ReceiptDate]
           ,[HistoryUID]
           ,[PrintedFlag])
     VALUES
           (@ReceiptNumber
           ,@ReceiptDate
           ,@HistoryID
           ,@printedFlag)
	
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_insert_OutStock]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_insert_OutStock]
(
	@StockTable AS UDTStock READONLY
          
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @RowCount INT
	DECLARE @Title VARCHAR(100)
    DECLARE @Author VARCHAR(100)
    DECLARE @Edition VARCHAR(100)
    DECLARE @Publisher VARCHAR(100)
    DECLARE @PurchasePrice float
    DECLARE @BookCount INT
    
    -- Get the values from user defined table.
	SELECT @Title = Title, @BookCount = OutCount, @Author = Author, @Edition = Edition, @PurchasePrice = PurchasePrice, @Publisher = Publisher  FROM @StockTable
	
	
	
	SELECT @RowCount=COUNT(*) FROM TblStock WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition 
	And [Publisher]=@Publisher And [PurchasePrice] = @PurchasePrice
	
IF(@RowCount = 0)
BEGIN
	
INSERT INTO [BLS].[dbo].[TblStock]
           ([ISBN]
           ,[Title]
           ,[Author]
           ,[Year]
           ,[Edition]
           ,[Publisher]
           ,[Count]
           ,[PriceChangable]
           ,[OriginalPrice]
           ,[Discount]
           ,[PurchasePrice]
           ,[LastUpdated]
           ,[OutCount])
   
    SELECT  [ISBN]
           ,[Title]
           ,[Author]
           ,[Year]
           ,[Edition]
           ,[Publisher]
           ,[Count]
           ,[PriceChangable]
           ,[OriginalPrice]
           ,[Discount]
           ,[PurchasePrice]
           ,[LastUpdated]
           ,[OutCount]
           FROM @StockTable
END
ELSE IF(@RowCount > 0)
BEGIN

     DECLARE @Count INT
     DECLARE @OutCount INT
     
     SELECT @Count = [Count], @OutCount = [OutCount] FROM TblStock WHERE [Title] = @Title AND [Author] = @Author 
     AND [Edition] = @Edition And [Publisher]=@Publisher And [PurchasePrice] = @PurchasePrice     
     
     SET @OutCount =  @OutCount + @BookCount
          
     UPDATE TblStock
     SET [OutCount] = @OutCount
     WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [Publisher]=@Publisher 
     And [PurchasePrice] = @PurchasePrice 
     
END      
    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_insert_Order]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_insert_Order]
(
	@ISBN Varchar(25),
	@CustomerID Varchar(25),
	@Count int,	
    @OrderTable AS UDTOrder READONLY      
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE  @RowCount AS int
	SET @RowCount = 0
	
	SELECT @RowCount=COUNT(*) FROM TblOrders  WHERE ISBN = @ISBN and CustomerID = @CustomerID
	
IF(@RowCount = 0)
BEGIN
	
INSERT INTO [BLS].[dbo].[TblOrders]   
           ([CustomerID]
           ,[Date]
           ,[ISBN]
           ,[Count]
           ,[DepositAmount]
           ,[OrderClearanceDate]
           ,[Mobile])
   
    SELECT  [CustomerID]
           ,[Date]
           ,[ISBN]
           ,[Count]
           ,[DepositAmount]
           ,[OrderClearanceDate]
           ,[Mobile]
           FROM @OrderTable
END

ELSE

BEGIN
	UPDATE TblOrders 
	SET [Count] = [Count] + @Count
	WHERE ISBN = @ISBN and CustomerID = @CustomerID
END    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_insert_Issue]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_insert_Issue]
(	
	@RowCount int OUT,
    @IssueTable AS UDTIssue READONLY      
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @CustomerID INT
	DECLARE @Title Varchar(100)
	DECLARE @Author Varchar(100)
	DECLARE @Edition Varchar(100)
	DECLARE @Publisher Varchar(100)
	DECLARE @Count INT
	DECLARE @Price float
	DECLARE @issueDate DateTime
	
	SET @RowCount = 0
	
	-- Get the values from user defined table.
	SELECT @CustomerID = [CustomerID],@Count = [BookCount],  @Title = Title, @Author = Author, @Edition = Edition, 
	@Publisher =[Publisher] ,@Price = BookPrice , @issueDate = [IssueDate] FROM @IssueTable
	
	SELECT @RowCount=COUNT(*) FROM TblIssue  WHERE [Title] = @Title and [Author] = @Author and [Edition] = @Edition 
	and [Publisher] = @Publisher and [BookPrice] = @price and CustomerID = @CustomerID and [IssueDate] = @issueDate
	
IF(@RowCount = 0)
BEGIN
	
INSERT INTO [BLS].[dbo].[TblIssue]    
           ([CustomerID]
           ,[Title] 
	       ,[Author]
	       ,[Edition]
	       ,[Publisher] 
           ,[IssueDate]
           ,[BookCount]
           ,[BookPrice]
           ,[RecieptNumber]
           ,[HistoryUID]
           ,[IssueType]
           ,[ReturnDate]
           ,[EarlyIssue])
   
    SELECT [CustomerID]
           ,[Title] 
	       ,[Author]
	       ,[Edition]
	       ,[Publisher] 
           ,[IssueDate]
           ,[BookCount]
           ,[BookPrice]
           ,[RecieptNumber]
           ,[HistoryUID]
           ,[IssueType]
           ,[ReturnDate]
           ,[EarlyIssue]
           FROM @IssueTable
END

ELSE
BEGIN
   DECLARE @CurrentCount INT
   SELECT @CurrentCount = BookCount FROM TblIssue WHERE [Title] = @Title and [Author] = @Author and [Edition] = @Edition 
   and @Publisher =[Publisher] and [BookPrice] = @price and CustomerID = @CustomerID and [IssueDate] = @issueDate
    
   UPDATE TblIssue SET BookCount = @CurrentCount + @Count 
   WHERE [Title] = @Title and [Author] = @Author and [Edition] = @Edition and [BookPrice] = @price  
   and [Publisher]= @Publisher and CustomerID = @CustomerID and [IssueDate] = @issueDate
END

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_insert_History]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_insert_History]
(
	@id Varchar(50),
	@RowCount int OUT,
    @TransactionTable AS UDTTransactionHistory READONLY      
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @RowCount = 0
	
	SELECT @RowCount=COUNT(*) FROM TblTransactionHistory WHERE HistoryUID  = @id 
	
IF(@RowCount = 0)
BEGIN
	
INSERT INTO [BLS].[dbo].[TblTransactionHistory]  
           ([HistoryUID]
           ,[HistoryDate]
           ,[IssueDate]
           ,[ReturnDate]
           ,[Type]
           ,[CustomerID]
           ,[Title]
           ,[Author]
           ,[Edition]
           ,[PurchasePrice]
           ,[AmountIN]
           ,[AmountOut]
           ,[ActualAmountIN]
           ,[ActualAmountOut]
           ,[RecieptNumber]
           ,[CheckNumber]
           ,[CheckIssueDate]
           ,[CheckStatus])
   
    SELECT  [HistoryUID]
           ,[HistoryDate]
           ,[IssueDate]
           ,[ReturnDate]
           ,[Type]
           ,[CustomerID]
           ,[Title]
           ,[Author]
           ,[Edition]
           ,[PurchasePrice]
           ,[AmountIN]
           ,[AmountOut]
           ,[ActualAmountIN]
           ,[ActualAmountOut]
           ,[RecieptNumber]
           ,[CheckNumber]
           ,[CheckIssueDate]
           ,[CheckStatus]
           FROM @TransactionTable
END    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_insert_CustomerBooks]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_insert_CustomerBooks]
(
	@CustBooksTable AS UDTCustomerBooks READONLY,
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(100),
	@Price float,
	@Count int
          
)
AS

BEGIN
	SET NOCOUNT ON
	
	DECLARE @RowCount INT
	
	SELECT @RowCount=COUNT(*) FROM TblCustomerBooks WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [OriginalPrice] = @Price
	
	IF(@RowCount = 0)
		BEGIN
			INSERT INTO [BLS].[dbo].[TblCustomerBooks]
				   ([CustBookID]
				   ,[CustomerID]
				   ,[Title]
				   ,[Author]
				   ,[Edition]
				   ,[OriginalPrice]
				   ,[Count]
				   ,[Date]
				   ,[HistoryUID])
		   
			SELECT  [CustBookID]
				   ,[CustomerID]
				   ,[Title]
				   ,[Author]
				   ,[Edition]
				   ,[OriginalPrice]
				   ,[Count]
				   ,[Date]
				   ,[HistoryUID]
				   FROM @CustBooksTable
		END
	 ELSE IF(@RowCount > 0)
		BEGIN
			 UPDATE TblCustomerBooks
			 SET [Count] = [Count] + @Count
			 WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [OriginalPrice] = @Price
     
		END   
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_insert_Customer]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_insert_Customer]
(
	
	@Name VARCHAR(100) ,
	@Mobile VARCHAR(10),
	@CustTable AS UDTCustomer READONLY,
	@Status bit OUT
          
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @Count int
	SET @Count = 0;	
	
	SELECT @Count = COUNT(CustomerID)	
	FROM TblCustomer WITH(NOLOCK)
	WHERE Name = @Name and [Student Mobile] = @Mobile	
    
    IF(@Count = 0)
		BEGIN
			SET @Status = 1;
			
			INSERT INTO [BLS].[dbo].[TblCustomer] 
				   ([CustomerID]
				  ,[Name]		  
				  ,[Father Name]
				  ,[DOB]
				  ,[Parent Phone] 
				  ,[Parent Mobile]
				  ,[Student Mobile] 
				  ,[Address]
				  ,[CollegeName]
				  ,[Course]
				  ,[CourseDuration]
				  ,[EmailID]
				  ,[MembershipDate]
				  ,[MembershipType]
				  ,[MembershipPeriod]
				  ,[Activation]
				  ,[BookCount]
				  ,[DepositAmount]
				  ,[AdvanceAmount]
				  ,[BalanceAmount]
				  ,[RefundAmount]
				  ,[RecieptNumber]
				  ,[MaxLimit]
				  ,[UsedLimit]
				  ,[EarlyActivation]
				  ,CreatedDatetime)
		   
			SELECT [CustomerID]
				  ,[Name]
				  ,[Father Name]
				  ,[DOB]
				  ,[Parent Phone] 
				  ,[Parent Mobile]
				  ,[Student Mobile] 
				  ,[Address]
				  ,[CollegeName]
				  ,[Course]
				  ,[CourseDuration]
				  ,[EmailID]
				  ,[MembershipDate]
				  ,[MembershipType]
				  ,[MembershipPeriod]
				  ,[Activation]
				  ,[BookCount]
				  ,[DepositAmount]
				  ,[AdvanceAmount]
				  ,[BalanceAmount]
				  ,[RefundAmount]
				  ,[RecieptNumber]
				  ,[MaxLimit]
				  ,[UsedLimit]
				  ,[EarlyActivation]
				  ,GETDATE()
				   FROM @CustTable 
				   
		DECLARE @EActivation As BIT
		DECLARE @MembDate AS DATE
		DECLARE @CustID AS VARCHAR(20)
		SELECT @CustID = [CustomerID] ,@EActivation = [EarlyActivation],@MembDate = [MembershipDate]
		FROM @CustTable
		
		IF(@EActivation = 0)
		BEGIN
		 DECLARE @RowCount As INT 
		   SELECT  @RowCount = COUNT(ID) FROM TblID
		   IF(@RowCount = 0)
			 BEGIN
			    INSERT INTO [BLS].[dbo].[TblID]
                ([IDDate]
                 ,[ID])
                VALUES
					(@MembDate
					,@CustID)
			 END
		   ELSE
		     BEGIN
		        UPDATE [TblID]
                SET [IDDate] = @MembDate, ID =@CustID    
		     END	 
				   
		END		   
				   
		END
    ELSE
		BEGIN
				SET @Status = 0;
		END
	
       
    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Get_Issue_Count]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Get_Issue_Count]
(
	@CustomerID INT,
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(100),
	@Publisher Varchar(100),
	@price float,	
	@RowCount int OUT          
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @RowCount = 0
	
	SELECT @RowCount=COUNT(*) FROM TblIssue  WHERE [Title] = @Title and [Author] = @Author and [Edition] = @Edition
	and [Publisher] =@Publisher and [BookPrice]  = @price and CustomerID = @CustomerID
	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Delete_Customer]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Delete_Customer]
(
	@CustomerID int,	
	@Status int OUTPUT
     
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @Status = 0
	
	SELECT @Status =COUNT(*) FROM TblCustomer  WHERE [CustomerID] = @CustomerID 
	
IF(@Status > 0)
BEGIN
	DELETE FROM [BLS].[dbo].[TblCustomer]
	WHERE [CustomerID] = @CustomerID 
END



END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Check_Customer_Exist]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Check_Customer_Exist]
(
	@CustomerID INT,		
	@RowCount int OUT          
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @RowCount = 0
	
	SELECT @RowCount=COUNT(*) FROM TblCustomer WHERE  [CustomerID] = @CustomerID
	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Update_StockonIssue]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Update_StockonIssue]
(
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(25),
	@price float,
	@BookCount int
          
)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE TblStock 
	SET [Count] = [Count] -  @BookCount,[OutCount] = [OutCount] + @BookCount
	WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @price
   
    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Update_StockForIssueDelete]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Update_StockForIssueDelete]
(
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(25),
	@price float,
	@BookCount int,
	@EarlyIssue bit
          
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @i AS int
	SELECT @i=[OutCount] FROM TblStock
	WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @price
	
	IF(@BookCount > @i)
	  BEGIN
	    SET @i = 0;
	  END
	ELSE
	  BEGIN
	    SET @i = @i - @BookCount;
	  END 
	
	
	IF(@EarlyIssue = 1)
		BEGIN
			UPDATE TblStock 
			SET [OutCount] = @i
			WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @price	
		END
	ELSE
		BEGIN
			UPDATE TblStock 
			SET [Count] = [Count] +  @BookCount,[OutCount] = @i
			WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @price		
		END	
	
	
	
	
	
   
    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Update_StockDtail]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Update_StockDtail]
(
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(25),
	@oldPurchasePrice float,
	@price float,
	@StockTable AS UDTStock READONLY
	          
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET NOCOUNT ON
	
	DECLARE @i AS int
	SELECT @i=COUNT(ISBN) FROM TblStock
	WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @price
	
	IF(@i = 0)
	  BEGIN
	    DELETE from TblStock WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @oldPurchasePrice
	    INSERT INTO [BLS].[dbo].[TblStock]
           ([ISBN]
           ,[Title]
           ,[Author]
           ,[Year]
           ,[Edition]
           ,[Publisher]
           ,[Count]
           ,[PriceChangable]
           ,[OriginalPrice]
           ,[Discount]
           ,[PurchasePrice]
           ,[LastUpdated]
           ,[OutCount])
   
    SELECT  [ISBN]
           ,[Title]
           ,[Author]
           ,[Year]
           ,[Edition]
           ,[Publisher]
           ,[Count]
           ,[PriceChangable]
           ,[OriginalPrice]
           ,[Discount]
           ,[PurchasePrice]
           ,[LastUpdated]
           ,[OutCount]
           FROM @StockTable
	  
    END
	ELSE
	  BEGIN
	    
	    UPDATE TblStock 
		SET [Count] = dc.[Count],OriginalPrice = dc.OriginalPrice,OutCount = dc.OutCount,PurchasePrice = dc.PurchasePrice,PriceChangable = dc.PriceChangable
		FROM TblStock s INNER JOIN @StockTable dc 
		ON  s.[Title] = @Title AND s.[Author] = @Author AND s.[Edition] = @Edition And s.[PurchasePrice] = @price
	  END     
	
	
	
   
    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Update_Stock]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Update_Stock]
(
	@Title Varchar(100),
	@Author Varchar(100),
	@Edition Varchar(25),
	@Publisher Varchar(100),
	@price float,
	@BookCount int
          
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @i AS int
	SELECT @i=[OutCount] FROM TblStock
	WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [Publisher] = @Publisher 
	And [PurchasePrice]  = @price
	
	IF(@BookCount > @i)
	  BEGIN
	    SET @i = 0;
	  END
	ELSE
	  BEGIN
	    SET @i = @i - @BookCount;
	  END     
	
	
	UPDATE TblStock 
	SET [Count] = [Count] +  @BookCount,[OutCount] = @i
	WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [Publisher] = @Publisher 
	 And [PurchasePrice] = @price
   
    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Update_Limit]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Update_Limit]
(
	@CustomerID Varchar(25),
	@BookCount int,
	@price float
          
)
AS
BEGIN
	SET NOCOUNT ON
	
		BEGIN
			UPDATE TblCustomer  
			SET [BookCount] = [BookCount] -  @BookCount,
			[UsedLimit]  = [UsedLimit] - (@price * @BookCount)
			WHERE [CustomerID] = @CustomerID
		END
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Update_CustomerDetailsOnReturn]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Update_CustomerDetailsOnReturn]
(
	@CustomerID Varchar(25),
	@BookCount int,
	@price float,
	@Advance float,
	@Balance float
          
)
AS
BEGIN
	SET NOCOUNT ON
	
		BEGIN
			UPDATE TblCustomer  
			SET [BookCount] = [BookCount] -  @BookCount,
			[AdvanceAmount] = @Advance,
			[BalanceAmount] = @Balance
			WHERE [CustomerID] = @CustomerID
		END
END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Update_CustomerDetails]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Update_CustomerDetails]
(
	@CustomerID int,	
    @CustomerTable AS UDTCustomer READONLY,
    @RowCount int OUT
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @RowCount = 0
	
	SELECT @RowCount= COUNT(*) FROM TblCustomer  WHERE [CustomerID] = @CustomerID 
	
IF(@RowCount > 0)
BEGIN
    UPDATE [BLS].[dbo].[TblCustomer]
    SET [CustomerID] = dc.[CustomerID]
      ,[Name] = dc.[Name]      
      ,[Father Name] = dc.[Father Name]
      ,[DOB] = dc.[DOB]
      ,[Parent Phone] = dc.[Parent Phone]
      ,[Parent Mobile] = dc.[Parent Mobile]
      ,[Student Mobile] = dc.[Student Mobile]
      ,[Address] = dc.[Address]
      ,[CollegeName] = dc.[CollegeName]
      ,[Course] = dc.[Course]
      ,[CourseDuration] = dc.[CourseDuration]
      ,[EmailID] = dc.[EmailID]
      ,[MembershipDate] = dc.[MembershipDate]
      ,[MembershipType] = dc.[MembershipType]
      ,[MembershipPeriod] = dc.[MembershipPeriod]
      ,[Activation] = dc.[Activation]
      ,[BookCount] = dc.[BookCount]
      ,[DepositAmount] = dc.[DepositAmount]
      ,[AdvanceAmount] = dc.[AdvanceAmount]
      ,[BalanceAmount] = dc.[BalanceAmount]
      ,[RefundAmount] = dc.[RefundAmount]
      ,[RecieptNumber] = dc.[RecieptNumber]
      ,[MaxLimit] = dc.[MaxLimit]
      ,[UsedLimit] = dc.[UsedLimit]
      ,[EarlyActivation] = dc.[EarlyActivation]
      FROM TblCustomer c
      INNER JOIN @CustomerTable dc
      ON  c.CustomerID = dc.CustomerID

END



END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Update_Customer]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Update_Customer]
(
	@CustomerID Varchar(25),
	@BookCount int,
	@AdvanceAmount float,
	@BalanceAmount float,
	@LimitUsed float
          
)
AS
BEGIN
	SET NOCOUNT ON
	IF(@LimitUsed = -1)
		BEGIN
			UPDATE TblCustomer  
			SET [BookCount] = [BookCount] +  @BookCount,[AdvanceAmount] = @AdvanceAmount,[BalanceAmount]  = @BalanceAmount
			WHERE [CustomerID] = @CustomerID
		END
	ELSE
		BEGIN
			UPDATE TblCustomer  
			SET [BookCount] = [BookCount] +  @BookCount,[AdvanceAmount] = @AdvanceAmount,[BalanceAmount]  = @BalanceAmount,
			[UsedLimit] = [UsedLimit] + @LimitUsed
			WHERE [CustomerID] = @CustomerID
		END
    	

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_Rental]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Undo_Issue_Rental]
(           
            @CustomerID INT,
            @Title VARCHAR(100),
            @Author VARCHAR(100),
            @Edition VARCHAR(100),
            @Publisher VARCHAR(100),
            @price float,
            @HistoryUID VarChar(100),
            @BookCount int,
            @EarlyIssue bit,            
            @Status bit OUT
          
)
AS
BEGIN
	
	BEGIN TRY	
	
	DECLARE @RowCount AS int
	
	IF(@EarlyIssue = 1)--Early ISSUE
		BEGIN
		    BEGIN TRANSACTION
		    
		    EXEC up_usr_Delete_Issue @customerID,@Title,@Author,@Edition,@Publisher,@price,@HistoryUID,@Status;
					
			EXEC up_usr_Update_StockForIssueDelete @Title,@Author,@Edition,@Price,@BookCount,@EarlyIssue;
					
			UPDATE TblCustomer SET [BookCount] = [BookCount] -  @BookCount WHERE [CustomerID] = @CustomerID
					
			SET @Status = 1;	
				
			COMMIT					
		    
		END
	ELSE --Normal ISSUE	
	    BEGIN
			BEGIN TRANSACTION
			
			
	
				   DECLARE @Count AS INT
                   
                   SELECT @Count =COUNT(*) FROM [TblTransactionHistory]  WHERE [HistoryUID] = @HistoryUID                  				   
				  		
					IF(@Count > 0)
					BEGIN
						EXEC up_usr_Delete_History @HistoryUID ,@Status;
						
						EXEC up_usr_Delete_Issue @customerID,@Title,@Author,@Edition,@Publisher,@price,@HistoryUID,@Status;
					
						EXEC up_usr_Update_StockForIssueDelete @Title,@Author,@Edition,@Price,@BookCount,@EarlyIssue;
					
						UPDATE TblCustomer SET [BookCount] = [BookCount] -  @BookCount WHERE [CustomerID] = @CustomerID
					
						SET @Status = 1;	
				
						
					END
				ELSE
					BEGIN
						SET @Status = 0;
					END
			COMMIT		
	    END
	END TRY
	
	BEGIN CATCH	
	
	SET @Status = 0;
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION 
		
	-- Raise an error with the details of the exception   
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int  
	SELECT @ErrMsg = ERROR_MESSAGE(),   
	@ErrSeverity = ERROR_SEVERITY()   
		  
	RAISERROR(@ErrMsg, @ErrSeverity, 1)
	
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_NonRental]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Undo_Issue_NonRental]
(           
            @CustomerID INT,
            @Title VARCHAR(100),
            @Author VARCHAR(100),
            @Edition VARCHAR(100),
            @Publisher VARCHAR(100),
            @price float,
            @HistoryUID VarChar(100),
            @BookCount int,
            @EarlyIssue bit,            
            @Status bit OUT
          
)
AS
BEGIN
	
	BEGIN TRY	
	
	DECLARE @RowCount AS int
	
	IF(@EarlyIssue = 1)--Early ISSUE
		BEGIN
		    BEGIN TRANSACTION
		    
		    EXEC up_usr_Delete_Issue @customerID,@Title,@Author,@Edition,@Publisher,@price,@HistoryUID,@Status;
					
			EXEC up_usr_Update_StockForIssueDelete @Title,@Author,@Edition,@Price,@BookCount,@EarlyIssue;
					
			EXEC up_usr_Update_Limit @CustomerID,@BookCount,@price;
					
			SET @Status = 1;	
				
			COMMIT					
		    
		END
	ELSE --Normal ISSUE	
	    BEGIN
			BEGIN TRANSACTION		
			
                   DECLARE @Count AS INT
                   
                   SELECT @Count =COUNT(*) FROM [TblTransactionHistory]  WHERE [HistoryUID] = @HistoryUID                  				   
				  		
					IF(@Count > 0)
						BEGIN
							EXEC up_usr_Delete_History @HistoryUID ,@Status;
							
							EXEC up_usr_Delete_Issue @customerID,@Title,@Author,@Edition,@Publisher,@price,@HistoryUID,@Status;
						
							EXEC up_usr_Update_StockForIssueDelete @Title,@Author,@Edition,@Price,@BookCount,@EarlyIssue;
						
							EXEC up_usr_Update_Limit @CustomerID,@BookCount,@price;
						
							SET @Status = 1;	
					
							
						END
					ELSE
						BEGIN
							SET @Status = 0;
						END
			COMMIT
	    END
	END TRY
	
	BEGIN CATCH	
	
	SET @Status = 0;
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION 
		
	-- Raise an error with the details of the exception   
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int  
	SELECT @ErrMsg = ERROR_MESSAGE(),   
	@ErrSeverity = ERROR_SEVERITY()   
		  
	RAISERROR(@ErrMsg, @ErrSeverity, 1)
	
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Undo_Issue]
(           
            @CustomerID INT,
            @Title VARCHAR(100),
            @Author VARCHAR(100),
            @Edition VARCHAR(100),
            @Publisher VARCHAR(100),
            @price float,
            @HistoryUID VarChar(100),
            @BookCount int,            
            @Status bit OUT
          
)
AS
BEGIN
	
	BEGIN TRY
	
	BEGIN TRANSACTION
	
	DECLARE @RowCount AS int
	
	
	EXEC up_usr_Delete_History @HistoryUID ,@Status;
	
	IF(@Status = 1)
		BEGIN
			EXEC up_usr_Delete_Issue @customerID,@Title,@Author,@Edition,@Publisher,@price,@HistoryUID,@Status;
		
			EXEC up_usr_Update_Stock @Title,@Author,@Edition,@Publisher,@Price,@BookCount;
		
			EXEC up_usr_Update_Limit @CustomerID,@BookCount,@price;
		
			SET @Status = 1;	
	
			COMMIT
		END
	ELSE
		BEGIN
		    SET @Status = 0;
		END
	
	END TRY
	
	BEGIN CATCH	
	
	SET @Status = 0;
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION 
		
	-- Raise an error with the details of the exception   
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int  
	SELECT @ErrMsg = ERROR_MESSAGE(),   
	@ErrSeverity = ERROR_SEVERITY()   
		  
	RAISERROR(@ErrMsg, @ErrSeverity, 1)
	
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return_Rental]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Execute_Return_Rental]
(           
            @CustomerID INT,
            @Title VARCHAR(100),
            @Author VARCHAR(100),
            @Edition VARCHAR(100),
            @Publisher VARCHAR(100),
            @price float,
            @HistoryUID VarChar(100),
            @BookCount int,
            @AdvanceAmount float,
            @BalanceAmount float,            
            @Status bit OUT
          
)
AS
BEGIN
	
	BEGIN TRY
	
	BEGIN TRANSACTION
	
	DECLARE @RowCount AS int
	
	EXEC up_usr_Delete_Issue @customerID,@Title,@Author,@Edition,@Publisher,@price,@HistoryUID,@Status;
	
	EXEC up_usr_Update_CustomerDetailsOnReturn @CustomerID,@BookCount,@price,@AdvanceAmount,@BalanceAmount;
	
	EXEC up_usr_Update_Stock @Title,@Author,@Edition,@Publisher,@Price,@BookCount;
	
	SET @Status = 1;	
	
	COMMIT
	
	END TRY
	
	BEGIN CATCH	
	
	SET @Status = 0;
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION 
		
	-- Raise an error with the details of the exception   
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int  
	SELECT @ErrMsg = ERROR_MESSAGE(),   
	@ErrSeverity = ERROR_SEVERITY()   
		  
	RAISERROR(@ErrMsg, @ErrSeverity, 1)
	
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return_Other]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Execute_Return_Other]
(           
            @CustomerID INT,
            @Title VARCHAR(100),
            @Author VARCHAR(100),
            @Edition VARCHAR(100),
            @Publisher VARCHAR(100),
            @price float,
            @HistoryUID VarChar(100),
            @BookCount int,
            @AdvanceAmount float,
            @BalanceAmount float,            
            @Status bit OUT
          
)
AS
BEGIN
	
	BEGIN TRY
	
	BEGIN TRANSACTION
	
	DECLARE @RowCount AS int
	
	EXEC up_usr_Delete_Issue @customerID,@Title,@Author,@Edition,@Publisher,@price,@HistoryUID,@Status;
	
	EXEC up_usr_Update_CustomerDetailsOnReturn @CustomerID,@BookCount,@price,@AdvanceAmount,@BalanceAmount;
	
	EXEC up_usr_Update_Limit @CustomerID,@BookCount,@price;
	
	SET @Status = 1;	
	
	COMMIT
	
	END TRY
	
	BEGIN CATCH	
	
	SET @Status = 0;
	
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION 
		
	-- Raise an error with the details of the exception   
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int  
	SELECT @ErrMsg = ERROR_MESSAGE(),   
	@ErrSeverity = ERROR_SEVERITY()   
		  
	RAISERROR(@ErrMsg, @ErrSeverity, 1)
	
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Execute_Return]
(           
            @CustomerID INT,
            @Title VARCHAR(100),
            @Author VARCHAR(100),
            @Edition VARCHAR(100),
            @Publisher VARCHAR(100),
            @price float,
            @HistoryUID VarChar(100),
            @BookCount int,            
            @Status bit OUT
          
)
AS
BEGIN
	
	BEGIN TRY
	
	BEGIN TRANSACTION
	
	DECLARE @RowCount AS int
	
	EXEC up_usr_Delete_Issue @customerID,@Title,@Author,@Edition,@Publisher,@price,@HistoryUID,@Status;
	
	EXEC up_usr_Update_Stock @Title,@Author,@Edition,@Publisher,@Price,@BookCount;
	
	EXEC up_usr_Update_Limit @CustomerID,@BookCount,@price;
	
	SET @Status = 1;	
	
	COMMIT
	
	END TRY
	
	BEGIN CATCH
	
	SET @Status = 0;
	
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION 
		
	-- Raise an error with the details of the exception   
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int  
	SELECT @ErrMsg = ERROR_MESSAGE(),   
	@ErrSeverity = ERROR_SEVERITY()   
		  
	RAISERROR(@ErrMsg, @ErrSeverity, 1)
	
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Regular_Issue]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Execute_Regular_Issue]
(           
            @CustomerID INT,
            @Title VARCHAR(100),
            @Author VARCHAR(100),
            @Edition VARCHAR(100),
            @price float,
            @BookCount int,
            @issueDate DateTime,
            @AdvanceAmount float,
            @BalanceAmount float,
            @LimitUsed float,
            @HistoryUID varchar(200),
            @TransactionTable AS UDTTransactionHistory READONLY,
            @IssueTable AS UDTIssue READONLY,            
            @Status bit OUT
          
)
AS
BEGIN
	
	BEGIN TRY
	
	BEGIN TRANSACTION
	
	DECLARE @RowCount AS int
	
	EXEC up_usr_insert_History @HistoryUID,@RowCount,@TransactionTable;
	
	EXEC up_usr_insert_Issue @RowCount,@IssueTable;
	
	EXEC up_usr_Update_StockonIssue @Title,@Author,@Edition,@price,@BookCount;
	
	EXEC up_usr_Update_Customer @CustomerID,@BookCount,@AdvanceAmount,@BalanceAmount,@LimitUsed;
	
	SET @Status = 1;	
	
	COMMIT
	
	END TRY
	
	BEGIN CATCH
	
	SET @Status = 0;
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION 
		
	-- Raise an error with the details of the exception   
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int  
	SELECT @ErrMsg = ERROR_MESSAGE(),   
	@ErrSeverity = ERROR_SEVERITY()   
		  
	RAISERROR(@ErrMsg, @ErrSeverity, 1)
	
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Execute_EarlyIssue]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Execute_EarlyIssue]
(	
	        @CustomerID INT,            
            @BookCount int,            
            @AdvanceAmount float,
            @BalanceAmount float,
            @LimitUsed float,
            @StockTable AS UDTStock READONLY,
            @IssueTable AS UDTIssue READONLY,
            @Status bit OUT
          
)
AS
BEGIN
	
	BEGIN TRY
	
	BEGIN TRANSACTION
	
	DECLARE @RowCount AS int
	
	EXEC up_usr_insert_OutStock @StockTable;
	
	EXEC up_usr_insert_Issue @RowCount,@IssueTable;
	
	EXEC up_usr_Update_Customer @CustomerID,@BookCount,@AdvanceAmount,@BalanceAmount,@LimitUsed;
	
	SET @Status = 1;	
	
	COMMIT
	
	END TRY
	
	BEGIN CATCH
	
	SET @Status = 0;
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION 
		
	-- Raise an error with the details of the exception   
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int  
	SELECT @ErrMsg = ERROR_MESSAGE(),   
	@ErrSeverity = ERROR_SEVERITY()   
		  
	RAISERROR(@ErrMsg, @ErrSeverity, 1)
	
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[up_usr_Delete_Customer_details]    Script Date: 12/07/2014 23:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_usr_Delete_Customer_details]
(
	
	
	
	        @CustomerID INT,            
            @Status bit OUT
          
)
AS
BEGIN
	
	BEGIN TRY
	
	BEGIN TRANSACTION
	
	EXEC up_usr_Delete_Customer	 @CustomerID, @Status;
	
	EXEC up_usr_Delete_Issue_OnCustID @CustomerID, @Status;
	
	EXEC up_usr_Delete_History_OnCustomerID @CustomerID, @Status;
	
	SET @Status = 1;	
	
	COMMIT
	
	END TRY
	
	BEGIN CATCH
	SET @Status = 0;
	
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION 
		
	-- Raise an error with the details of the exception   
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int  
	SELECT @ErrMsg = ERROR_MESSAGE(),   
	@ErrSeverity = ERROR_SEVERITY()   
		  
	RAISERROR(@ErrMsg, @ErrSeverity, 1) 	
	
	END CATCH

END
GO
