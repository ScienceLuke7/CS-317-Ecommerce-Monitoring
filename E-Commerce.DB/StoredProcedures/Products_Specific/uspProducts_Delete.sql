USE [ECommerceMonitorDB]
GO

/*
Description: Removes the specified row from the Products table
Test String: 

DECLARE @RemovedItem ProductsItem
INSERT INTO @RemovedItem (ECommerceID, ProductGTIN, ProductModelNumber, CurrentPrice, ProductURL)
VALUES (5, 123, 456, 0.0, 'doesnt matter')
EXECUTE [dbo].[uspProducts_Delete] @RemovedItem

Author      Date        Description
--------------------------------------------------------------
CE          03/26/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspProducts_Delete]
@RemovedItem ProductsItem READONLY
AS

BEGIN
    SELECT TOP (1) *
    INTO #item
    FROM @RemovedItem

    DELETE P FROM [dbo].[Products] P
    INNER JOIN #item 
        ON #item.EcommerceID = P.ECommerceID
        AND #item.ProductGTIN = P.ProductGTIN
        AND #item.ProductModelNumber = P.ProductModelNumber
END
