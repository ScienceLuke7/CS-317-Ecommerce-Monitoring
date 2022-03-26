DROP PROCEDURE IF EXISTS [dbo].[uspProducts_Delete]
DROP PROCEDURE IF EXISTS [dbo].[uspProducts_Insert]
DROP PROCEDURE IF EXISTS [dbo].[uspproducts_Update]
DROP TYPE IF EXISTS [dbo].[ProductsItem]

CREATE TYPE [dbo].[ProductsItem] AS TABLE (
    EcommerceID INT,
    ProductGTIN INT,
    ProductModelNumber INT,
    CurrentPrice DECIMAL(18,2),
    ProductURL varchar(8000)
)
GO