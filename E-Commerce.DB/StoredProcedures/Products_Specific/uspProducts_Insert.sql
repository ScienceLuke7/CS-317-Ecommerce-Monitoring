USE [ECommerceMonitorDB]
GO

/*
Description: Inserts a new item into the Products tables
Test String: 

DECLARE @NewItem ProductsItem
INSERT INTO @NewItem (ECommerceID, ProductGTIN, ProductModelNumber, CurrentPrice, ProductURL)
VALUES(1, 123, 456, 2.14, 'sample.com/fake_item')
EXECUTE [dbo].[uspProducts_Insert] @NewItem

Author      Date        Description
--------------------------------------------------------------
CE          03/26/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspProducts_Insert]
@NewItem ProductsItem READONLY
AS

BEGIN
    INSERT INTO [dbo].[Products]
    SELECT * FROM @NewItem
END
