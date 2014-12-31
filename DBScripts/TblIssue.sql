USE [BLS]

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return]    Script Date: 12/20/2014 13:57:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_Return]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_Return]

GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return_Other]    Script Date: 12/20/2014 13:57:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_Return_Other]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_Return_Other]
GO


GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return_Rental]    Script Date: 12/20/2014 13:58:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_Return_Rental]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_Return_Rental]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue]    Script Date: 12/20/2014 13:58:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Undo_Issue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Undo_Issue]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_NonRental]    Script Date: 12/20/2014 13:59:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Undo_Issue_NonRental]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Undo_Issue_NonRental]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_Rental]    Script Date: 12/20/2014 13:59:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Undo_Issue_Rental]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Undo_Issue_Rental]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_Issue]    Script Date: 12/20/2014 14:00:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Delete_Issue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Delete_Issue]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_Issue_OnCustID]    Script Date: 12/20/2014 14:00:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Delete_Issue_OnCustID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Delete_Issue_OnCustID]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Get_Issue_Count]    Script Date: 12/20/2014 14:00:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Get_Issue_Count]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Get_Issue_Count]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_EarlyIssue]    Script Date: 12/20/2014 14:01:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_EarlyIssue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_EarlyIssue]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Regular_Issue]    Script Date: 12/20/2014 14:01:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_Regular_Issue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_Regular_Issue]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_insert_Issue]    Script Date: 12/20/2014 14:02:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_insert_Issue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_insert_Issue]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_select_UserEarlyIssues]    Script Date: 12/20/2014 14:02:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_select_UserEarlyIssues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_select_UserEarlyIssues]
GO


GO

/****** Object:  StoredProcedure [dbo].[up_usr_select_UserIssues]    Script Date: 12/20/2014 14:03:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_select_UserIssues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_select_UserIssues]
GO

GO

/****** Object:  UserDefinedTableType [dbo].[UDTIssue]    Script Date: 12/20/2014 14:04:04 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UDTIssue' AND ss.name = N'dbo')
DROP TYPE [dbo].[UDTIssue]
GO



GO

/****** Object:  Table [dbo].[TblIssue]    Script Date: 12/20/2014 14:04:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblIssue]') AND type in (N'U'))
DROP TABLE [dbo].[TblIssue]
GO

USE [BLS]
GO

/****** Object:  Table [dbo].[TblIssue]    Script Date: 12/20/2014 14:04:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TblIssue](
	[CustomerID] [varchar](20) NOT NULL,
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


GO

/****** Object:  UserDefinedTableType [dbo].[UDTIssue]    Script Date: 12/20/2014 14:04:04 ******/
CREATE TYPE [dbo].[UDTIssue] AS TABLE(
	[CustomerID] [varchar](20) NOT NULL,
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_Issue]    Script Date: 12/20/2014 14:00:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Delete_Issue]
(
	@CustomerID Varchar(20),
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return]    Script Date: 12/20/2014 13:57:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Execute_Return]
(           
            @CustomerID VARCHAR(20),
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return_Other]    Script Date: 12/20/2014 13:57:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Execute_Return_Other]
(           
            @CustomerID VARCHAR(20),
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return_Rental]    Script Date: 12/20/2014 13:58:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Execute_Return_Rental]
(           
            @CustomerID VARCHAR(20),
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue]    Script Date: 12/20/2014 13:58:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Undo_Issue]
(           
            @CustomerID VARCHAR(20),
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_NonRental]    Script Date: 12/20/2014 13:59:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Undo_Issue_NonRental]
(           
            @CustomerID VARCHAR(20),
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_Rental]    Script Date: 12/20/2014 13:59:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Undo_Issue_Rental]
(           
            @CustomerID VARCHAR(20),
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


GO

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_Issue_OnCustID]    Script Date: 12/20/2014 14:00:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Delete_Issue_OnCustID]
(
	@CustomerID Varchar(20),	
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


GO

/****** Object:  StoredProcedure [dbo].[up_usr_Get_Issue_Count]    Script Date: 12/20/2014 14:00:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Get_Issue_Count]
(
	@CustomerID Varchar(20),
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


GO

/****** Object:  StoredProcedure [dbo].[up_usr_insert_Issue]    Script Date: 12/20/2014 14:02:13 ******/
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
	
	DECLARE @CustomerID Varchar(20)
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_EarlyIssue]    Script Date: 12/20/2014 14:01:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Execute_EarlyIssue]
(	
	        @CustomerID VARCHAR(20),            
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


GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Regular_Issue]    Script Date: 12/20/2014 14:01:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Execute_Regular_Issue]
(           
            @CustomerID VARCHAR(20),
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



GO

/****** Object:  StoredProcedure [dbo].[up_usr_select_UserEarlyIssues]    Script Date: 12/20/2014 14:02:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_select_UserEarlyIssues]
(
	@CustID Varchar(20)
	
          
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
    FROM TblIssue 
    WHERE [CustomerID] = @CustID AND [EarlyIssue] = 1
END

GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_select_UserIssues]    Script Date: 12/20/2014 14:03:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_select_UserIssues]
(
	@CustID Varchar(20)
	
          
)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT *
    FROM TblIssue 
    WHERE [CustomerID] = @CustID
END

GO












