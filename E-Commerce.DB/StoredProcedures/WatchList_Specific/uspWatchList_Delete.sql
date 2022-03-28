USE [ECommerceMonitorDB]
GO

/*
Description: Removes an item from the WatchList table
Test String: 

DECLARE @RemovedItem WatchListItem
INSERT INTO @RemovedItem (ProductGTIN, ProductModelNumber, ProductName, DesiredPrice)
VALUES(126, 459, NULL, NULL)
EXECUTE [dbo].[uspWatchList_Delete] @RemovedItem

Author      Date        Description
--------------------------------------------------------------
CE          03/24/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspWatchList_Delete]
@RemovedItem WatchListItem READONLY
AS

BEGIN
    SELECT TOP (1) *
    INTO #item
    FROM @RemovedItem

    DELETE W FROM [dbo].[WatchList] W
    INNER JOIN #item 
        ON #item.ProductGTIN = W.ProductGTIN
        AND #item.ProductModelNumber = W.ProductModelNumber
END
