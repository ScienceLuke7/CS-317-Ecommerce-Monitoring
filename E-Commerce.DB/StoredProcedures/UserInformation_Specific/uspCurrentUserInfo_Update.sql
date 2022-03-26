USE [ECommerceMonitorDB]
GO

/*
Description: Updates the user's email address in the UserInfo table
Test String: 

DECLARE @UpdatedEmail varchar(100) = 'testUpdateEmail@gmail.com'
EXECUTE [dbo].[uspCurrentUserInfo_Update] @UpdatedEmail

Author      Date        Description
--------------------------------------------------------------
CE          03/25/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspCurrentUserInfo_Update]
@UpdatedEmail varchar(100)
AS

BEGIN

    UPDATE [dbo].[UserInformation]
    SET CurrentEmail = @UpdatedEmail
END
