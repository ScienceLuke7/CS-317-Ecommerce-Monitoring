USE [ECommerceMonitorDB]
GO

/*
Description: Updates an item's price threshold in the WatchList table
Test String: 

DECLARE @UpdatedItem WatchListItem
INSERT INTO @UpdatedItem (ProductGTIN, ProductModelNumber, ProductName, DesiredPrice)
VALUES(124, 457, NULL, 0.01)
EXECUTE [dbo].[uspCurrentWatchList_Update] @UpdatedItem

Author      Date        Description
--------------------------------------------------------------
CE          03/25/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspCurrentWatchList_Update]
@UpdatedItem WatchListItem READONLY
AS

BEGIN

    SELECT TOP (1) *
    INTO #item
    FROM @UpdatedItem

    UPDATE W
    SET DesiredPrice = #item.DesiredPrice
    FROM [dbo].[WatchList] W
    INNER JOIN #item 
        ON #item.ProductGTIN = W.ProductGTIN
        AND #item.ProductModelNumber = W.ProductModelNumber
END
