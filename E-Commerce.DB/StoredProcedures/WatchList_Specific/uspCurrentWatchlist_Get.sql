USE [ECommerceMonitorDB]
GO

/*
Description: Obtains the current state of the WatchList table
Test String: EXECUTE [dbo].[uspCurrentWatchList_Get]

Author      Date        Description
--------------------------------------------------------------
CE          03/24/2022  Created
--------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE [dbo].[uspCurrentWatchList_Get]
AS
BEGIN
    SELECT * FROM [dbo].[WatchList]
END
