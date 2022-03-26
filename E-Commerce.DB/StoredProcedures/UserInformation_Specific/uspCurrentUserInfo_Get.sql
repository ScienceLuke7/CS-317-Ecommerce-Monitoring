USE [ECommerceMonitorDB]
GO

/*
Description: Obtains the current state of the UserInformation table
Test String: EXECUTE [dbo].[uspCurrentUserInfo_Get]

Author      Date        Description
--------------------------------------------------------------
CE          03/24/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspCurrentUserInfo_Get]
AS
BEGIN
    SELECT * FROM [dbo].[UserInformation]
END
