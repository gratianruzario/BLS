USE [BLS]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_stock]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Delete_stock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Delete_stock]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_EarlyIssue]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_EarlyIssue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_EarlyIssue]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Regular_Issue]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_Regular_Issue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_Regular_Issue]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_Return]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_Return]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return_Rental]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Execute_Return_Rental]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Execute_Return_Rental]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_insert_OutStock]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_insert_OutStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_insert_OutStock]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_insert_Stock]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_insert_Stock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_insert_Stock]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_insert_StockOnEarlyIssue]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_insert_StockOnEarlyIssue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_insert_StockOnEarlyIssue]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Stock_Exist]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Stock_Exist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Stock_Exist]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Undo_Issue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Undo_Issue]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_NonRental]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Undo_Issue_NonRental]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Undo_Issue_NonRental]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_Rental]    Script Date: 01/11/2015 19:15:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Undo_Issue_Rental]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Undo_Issue_Rental]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Update_Stock]    Script Date: 01/11/2015 19:15:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Update_Stock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Update_Stock]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Update_StockDtail]    Script Date: 01/11/2015 19:15:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Update_StockDtail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Update_StockDtail]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Update_StockForIssueDelete]    Script Date: 01/11/2015 19:15:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Update_StockForIssueDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Update_StockForIssueDelete]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Update_StockonIssue]    Script Date: 01/11/2015 19:15:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_usr_Update_StockonIssue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_usr_Update_StockonIssue]
GO

/****** Object:  UserDefinedTableType [dbo].[UDTStock]    Script Date: 01/11/2015 19:31:08 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UDTStock' AND ss.name = N'dbo')
DROP TYPE [dbo].[UDTStock]
GO

USE [BLS]
GO

/****** Object:  UserDefinedTableType [dbo].[UDTStock]    Script Date: 01/11/2015 19:31:09 ******/
CREATE TYPE [dbo].[UDTStock] AS TABLE(
	[ShelfNumber] [int] NULL,
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

USE [BLS]
GO

/****** Object:  StoredProcedure [dbo].[up_usr_Delete_stock]    Script Date: 01/11/2015 19:15:05 ******/
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

/****** Object:  StoredProcedure [dbo].[up_usr_insert_Stock]    Script Date: 01/11/2015 19:15:06 ******/
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
           ([ShelfNumber]
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
   
    SELECT  [ShelfNumber]
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

/****** Object:  StoredProcedure [dbo].[up_usr_Update_Stock]    Script Date: 01/11/2015 19:15:07 ******/
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

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Update_StockForIssueDelete]    Script Date: 01/11/2015 19:15:07 ******/
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

/****** Object:  StoredProcedure [dbo].[up_usr_insert_OutStock]    Script Date: 01/11/2015 19:15:06 ******/
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
           ([ShelfNumber]
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
   
    SELECT  [ShelfNumber]
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

/****** Object:  StoredProcedure [dbo].[up_usr_Update_StockonIssue]    Script Date: 01/11/2015 19:15:07 ******/
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



/****** Object:  StoredProcedure [dbo].[up_usr_Execute_EarlyIssue]    Script Date: 01/11/2015 19:15:06 ******/
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

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Regular_Issue]    Script Date: 01/11/2015 19:15:06 ******/
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

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return]    Script Date: 01/11/2015 19:15:06 ******/
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
            @AmountOut float,            
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
	
	EXEC up_usr_Update_History_On_Return @HistoryUID,0,@AmountOut;
	
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

/****** Object:  StoredProcedure [dbo].[up_usr_Execute_Return_Rental]    Script Date: 01/11/2015 19:15:06 ******/
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
            @RefundAmount float, 
            @CheckNumber VarChar(20),         
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
	
	EXEC up_usr_Update_History_On_Return @HistoryUID,@CheckNumber,@RefundAmount;
	
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





/****** Object:  StoredProcedure [dbo].[up_usr_insert_StockOnEarlyIssue]    Script Date: 01/11/2015 19:15:06 ******/
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
           ([ShelfNumber]
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
   
    SELECT  [ShelfNumber]
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

/****** Object:  StoredProcedure [dbo].[up_usr_Stock_Exist]    Script Date: 01/11/2015 19:15:06 ******/
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
	SELECT @Book_Number = [ShelfNumber] FROM TblStock  WHERE [Title] = @Title and [Author] = @Author and [Edition] = @Edition 
						and [Publisher]  = @Publisher and  [PurchasePrice] = @price
	END
END

GO

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue]    Script Date: 01/11/2015 19:15:06 ******/
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

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_NonRental]    Script Date: 01/11/2015 19:15:07 ******/
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

/****** Object:  StoredProcedure [dbo].[up_usr_Undo_Issue_Rental]    Script Date: 01/11/2015 19:15:07 ******/
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



/****** Object:  StoredProcedure [dbo].[up_usr_Update_StockDtail]    Script Date: 01/11/2015 19:15:07 ******/
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
	SELECT @i=COUNT(ShelfNumber) FROM TblStock
	WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @price
	
	IF(@i = 0)
	  BEGIN
	    DELETE from TblStock WHERE [Title] = @Title AND [Author] = @Author AND [Edition] = @Edition And [PurchasePrice] = @oldPurchasePrice
	    INSERT INTO [BLS].[dbo].[TblStock]
           ([ShelfNumber]
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
   
    SELECT  [ShelfNumber]
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




