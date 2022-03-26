USE [ECommerceMonitorDB]
GO

/*
Description: Updates an item's current price and URL in the Products table
Test String: 

DECLARE @UpdatedItem ProductsItem
INSERT INTO @UpdatedItem (ECommerceID, ProductGTIN, ProductModelNumber, CurrentPrice, ProductURL)
VALUES(1, 123, 456, NULL, 'sample.com/fake_item_updated')
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

    UPDATE [dbo].[Products]
    SET CurrentPrice = 
            CASE WHEN ((SELECT TOP(1) CurrentPrice FROM @UpdatedItem) IS NOT NULL)
            THEN (SELECT TOP(1) CurrentPrice FROM @UpdatedItem) 
            ELSE CurrentPrice END,
        ProductURL = 
            CASE WHEN ((SELECT TOP(1) ProductURL FROM @UpdatedItem) IS NOT NULL)
            THEN (SELECT TOP(1) ProductURL FROM @UpdatedItem)
            ELSE ProductURL END
    WHERE EXISTS (SELECT *
    FROM [dbo].[Products] P
    INNER JOIN @UpdatedItem UI
        ON UI.ECommerceID = P.EcommerceID
        AND UI.ProductGTIN = P.ProductGTIN
        AND UI.ProductModelNumber = P.ProductModelNumber
        )
END
