USE [ECommerceMonitorDB]
GO

/*
Description: Updates an item's price threshold in the WatchList table
Test String: 

DECLARE @UpdatedItem WatchListItem
INSERT INTO @UpdatedItem (ProductGTIN, ProductModelNumber, ProductName, DesiredPrice)
VALUES(123, 456, 'testProduct', 0.99)
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

    UPDATE [dbo].[WatchList]
    SET DesiredPrice = (SELECT TOP(1) DesiredPrice FROM @UpdatedItem)
    WHERE EXISTS (SELECT *
    FROM [dbo].[WatchList] WL
    INNER JOIN @UpdatedItem UI
        ON UI.ProductGTIN = WL.ProductGTIN
        AND UI.ProductModelNumber = WL.ProductModelNumber
        AND UI.ProductName = WL.ProductName)
END
