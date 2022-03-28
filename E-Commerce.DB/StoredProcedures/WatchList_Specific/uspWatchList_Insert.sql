USE [ECommerceMonitorDB]
GO

/*
Description: Inserts a new desired item into the WatchList table
Test String: 

DECLARE @NewItem WatchListItem
INSERT INTO @NewItem (ProductGTIN, ProductModelNumber, ProductName, DesiredPrice)
VALUES 
    (123, 456, 'testProduct', 1.01),
    (124, 457, 'testProduct2', 20.21),
    (125, 458, NULL, 231234.12),
    (126, 459, 'really long dog toy with edible parts', 0.11)
EXECUTE [dbo].[uspCurrentWatchList_Insert] @NewItem

Author      Date        Description
--------------------------------------------------------------
CE          03/24/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspCurrentWatchList_Insert]
@NewItem WatchListItem READONLY
AS

BEGIN
    INSERT INTO [dbo].[WatchList]
    SELECT * FROM @NewItem
END
