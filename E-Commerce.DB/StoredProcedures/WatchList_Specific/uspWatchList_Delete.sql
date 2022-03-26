USE [ECommerceMonitorDB]
GO

/*
Description: Removes an item from the WatchList table
Test String: 

DECLARE @RemovedItem WatchListItem
INSERT INTO @RemovedItem (ProductGTIN, ProductModelNumber, ProductName, DesiredPrice)
VALUES(123, 456, 'testProduct', 1.01)
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
    DELETE FROM [dbo].[WatchList] 
    WHERE EXISTS (
        SELECT * 
        FROM [dbo].[WatchList] WL
        INNER JOIN @RemovedItem RI ON RI.ProductGTIN = WL.ProductGTIN
            AND RI.ProductModelNumber = WL.ProductModelNumber 
            AND RI.ProductName = WL.ProductName
    )
END
