USE [ECommerceMonitorDB]
GO

/*
Description: Obtains the E-Commerce ID using the name
Test String: 

DECLARE @InputName varchar(50) = 'overstock'
EXECUTE [dbo].[uspECommerceEnum_Get] @InputName

Author      Date        Description
--------------------------------------------------------------
CE          03/26/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspECommerceEnum_Get]
@InputName varchar(50)
AS

BEGIN
    SELECT ECommerceID
    FROM ECommerceEnum
    WHERE ECommerceName = UPPER(@InputName)

END
GO