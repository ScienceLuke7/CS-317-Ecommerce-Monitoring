DROP PROCEDURE IF EXISTS [dbo].[uspWatchList_Delete]
DROP PROCEDURE IF EXISTS [dbo].[uspCurrentWatchList_Insert]
DROP PROCEDURE IF EXISTS [dbo].[uspCurrentWatchList_Update]
DROP TYPE IF EXISTS [dbo].[WatchListItem]

CREATE TYPE [dbo].[WatchListItem] AS TABLE (
    ProductGTIN INT,
    ProductModelNumber INT,
    ProductName varchar(200),
    DesiredPrice DECIMAL(18,2)
)

GO