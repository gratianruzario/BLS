USE [BLS]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_History]    Script Date: 12/22/2014 21:01:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Delete_History]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Delete_History]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue]    Script Date: 12/22/2014 21:02:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Undo_Issue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Undo_Issue]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_NonRental]    Script Date: 12/22/2014 21:03:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Undo_Issue_NonRental]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Undo_Issue_NonRental]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_Rental]    Script Date: 12/22/2014 21:03:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Undo_Issue_Rental]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Undo_Issue_Rental]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_History_OnCustomerID]    Script Date: 12/22/2014 21:03:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Delete_History_OnCustomerID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Delete_History_OnCustomerID]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_insert_History]    Script Date: 12/22/2014 21:04:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_insert_History]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_insert_History]
GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Regular_Issue]    Script Date: 12/22/2014 21:05:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_Regular_Issue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_Regular_Issue]
GO

GO

/****** Object:  UserDefinedTableType [dbo].[UDTTransactionHistory]    Script Date: 12/22/2014 21:05:33 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UDTTransactionHistory' AND ss.name = N'dbo')
DROP TYPE [dbo].[UDTTransactionHistory]
GO

GO

/****** Object:  Table [dbo].[TblTransactionHistory]    Script Date: 12/22/2014 21:05:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblTransactionHistory]') AND type in (N'U'))
DROP TABLE [dbo].[TblTransactionHistory]
GO

USE [BLS]
GO

/****** Object:  Table [dbo].[TblTransactionHistory]    Script Date: 12/22/2014 21:05:40 ******/
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
	[CustomerID] [varchar](20) NULL,
	[Title] [varchar](500) NULL,
	[Author] [varchar](200) NULL,
	[Edition] [varchar](20) NULL,
	[Publisher] [varchar](200) NULL,
	[PurchasePrice] [float] NULL,
	[AmountIN] [float] NULL,
	[AmountOut] [float] NULL,	
	[RecieptNumber] [varchar](20) NULL,
	[CheckNumber] [varchar](30) NULL,	
 CONSTRAINT [PK_TblTransactionHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  UserDefinedTableType [dbo].[UDTTransactionHistory]    Script Date: 12/22/2014 21:05:33 ******/
CREATE TYPE [dbo].[UDTTransactionHistory] AS TABLE(
	[HistoryUID] [uniqueidentifier] NOT NULL,
	[HistoryDate] [date] NULL,
	[IssueDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[Type] [varchar](3) NULL,
	[CustomerID] [varchar](20) NULL,
	[Title] [varchar](500) NULL,
	[Author] [varchar](200) NULL,
	[Edition] [varchar](20) NULL,
	[Publisher] [varchar](200) NULL,
	[PurchasePrice] [float] NULL,
	[AmountIN] [float] NULL,
	[AmountOut] [float] NULL,	
	[RecieptNumber] [varchar](20) NULL,
	[CheckNumber] [varchar](30) NULL
)
GO


GO

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_History]    Script Date: 12/22/2014 21:01:39 ******/
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


GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue]    Script Date: 12/22/2014 21:02:37 ******/
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

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_NonRental]    Script Date: 12/22/2014 21:03:05 ******/
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

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_Rental]    Script Date: 12/22/2014 21:03:36 ******/
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

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_History_OnCustomerID]    Script Date: 12/22/2014 21:03:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_usr_Delete_History_OnCustomerID]
(
	@CustomerID VARCHAR(20),
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_insert_History]    Script Date: 12/22/2014 21:04:23 ******/
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
           ,[Publisher] 
           ,[PurchasePrice]
           ,[AmountIN]
           ,[AmountOut]          
           ,[RecieptNumber]
           ,[CheckNumber])
   
    SELECT  [HistoryUID]
           ,[HistoryDate]
           ,[IssueDate]
           ,[ReturnDate]
           ,[Type]
           ,[CustomerID]
           ,[Title]
           ,[Author]
           ,[Edition]
           ,[Publisher] 
           ,[PurchasePrice]
           ,[AmountIN]
           ,[AmountOut]           
           ,[RecieptNumber]
           ,[CheckNumber]           
           FROM @TransactionTable
END    	

END

GO

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Regular_Issue]    Script Date: 12/22/2014 21:05:01 ******/
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
