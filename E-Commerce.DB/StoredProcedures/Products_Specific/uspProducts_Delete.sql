USE [ECommerceMonitorDB]
GO

/*
Description: Removes the specified row from the Products table
Test String: 

DECLARE @RemovedItem ProductsItem
INSERT INTO @RemovedItem (ECommerceID, ProductGTIN, ProductModelNumber, CurrentPrice, ProductURL)
VALUES(1, 123, 456, 2.14, 'sample.com/fake_item')
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
    DELETE FROM [dbo].[Products] 
    WHERE EXISTS (
        SELECT * 
        FROM [dbo].[Products] P
        INNER JOIN @RemovedItem RI 
            ON  RI.ECommerceID = P.ECommerceID
            AND RI.ProductGTIN = P.ProductGTIN
            AND RI.ProductModelNumber = P.ProductModelNumber 
    )
END
