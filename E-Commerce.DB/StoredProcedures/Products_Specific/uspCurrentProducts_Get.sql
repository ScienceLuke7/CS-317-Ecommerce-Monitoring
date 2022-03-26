USE [ECommerceMonitorDB]
GO

/*
Description: Obtains the current state of the Products table
Test String: EXECUTE [dbo].[uspCurrentProducts_Get]

Author      Date        Description
--------------------------------------------------------------
CE          03/24/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspCurrentProducts_Get]
AS
BEGIN
    SELECT * FROM [dbo].[Products]
END
