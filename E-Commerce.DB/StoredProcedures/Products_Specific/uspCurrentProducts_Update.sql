USE [ECommerceMonitorDB]
GO

/*
Description: Updates an item's current price and URL in the Products table
Test String: 

DECLARE @UpdatedItem ProductsItem
INSERT INTO @UpdatedItem (ECommerceID, ProductGTIN, ProductModelNumber, CurrentPrice, ProductURL)
VALUES(5, 123, 456, 20.20, NULL)
EXECUTE [dbo].[uspCurrentProducts_Update] @UpdatedItem

Author      Date        Description
--------------------------------------------------------------
CE          03/26/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspCurrentProducts_Update]
@UpdatedItem ProductsItem READONLY
AS

BEGIN
    SELECT TOP (1) *
    INTO #item
    FROM @UpdatedItem
    
    UPDATE P 
    SET P.CurrentPrice = 
            CASE WHEN (#item.CurrentPrice IS NOT NULL)
            THEN #item.CurrentPrice 
            ELSE P.CurrentPrice END,
        P.ProductURL = 
            CASE WHEN (#item.ProductURL IS NOT NULL)
            THEN #item.ProductURL
            ELSE P.ProductURL END
    FROM [dbo].[Products] P
    INNER JOIN #item
        ON #item.ECommerceID = P.EcommerceID
        AND #item.ProductGTIN = P.ProductGTIN
        AND #item.ProductModelNumber = P.ProductModelNumber
END
