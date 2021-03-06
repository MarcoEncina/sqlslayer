USE [DBACentral]
GO

IF EXISTS (
	SELECT * 
	FROM fn_listextendedproperty(default, default, default, default, default, default, default)
	WHERE LEFT(CAST([value] AS VARCHAR(50)),5) = '1.4.0'
	AND [name] = 'Version'
)
BEGIN
	PRINT 'Current Version is 1.4.0  Lets begin.'
END
ELSE
BEGIN
	RAISERROR('Current Version of DBACentral is not 1.4.0, this script will not update successfully',16,2) WITH LOG
END

IF OBJECT_ID('[hist].[Metrics_QueryStats_vw]','V') IS NOT NULL
	DROP VIEW [hist].[Metrics_QueryStats_vw]

GO
/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_SQL_GetObjectID]
**  Desc:			Procedure to get/insert object IDs
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-12-11
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20091215	Matt Stanford	Typo - fixed
********************************************************************************************************/
ALTER PROCEDURE [hist].[ServerInventory_SQL_GetObjectID] (
	@ObjectName			NVARCHAR(128)
	,@SchemaName		NVARCHAR(128)
	,@SQLType			NVARCHAR(128) = NULL
	,@ObjectID			INT OUTPUT
)
AS

SELECT 
	@ObjectID = ObjectID
FROM 
	[hist].[ServerInventory_SQL_ObjectIDs] id
WHERE id.[ObjectName] = @ObjectName
AND id.[SchemaName] = @SchemaName
AND (id.[SQLType] = @SQLType OR @SQLType IS NULL)


IF @ObjectID IS NULL
BEGIN
	INSERT INTO [hist].[ServerInventory_SQL_ObjectIDs] ([ObjectName], [SchemaName],[SQLType])
	VALUES (@ObjectName,@SchemaName,@SQLType)
	
	SET @ObjectID = SCOPE_IDENTITY()
END

GO

/*******************************************************************************************************
**  Name:			[hist].[Metrics_QueryStats_vw]
**  Desc:			View to pull query usage metrics from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009.12.15
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	
********************************************************************************************************/
CREATE VIEW [hist].[Metrics_QueryStats_vw]
AS
SELECT 
	s.[ServerName]
	,d.[DBName]
	,o.[SchemaName]
	,o.[ObjectName]
	,qs.[Count]
	,qs.[Total_CPU_Time]
	,qs.[AVG_CPU_Time]
	,qs.[Last_CPU]
	,qs.[Min_CPU]
	,qs.[Max_CPU]
	,qs.[Total_Run_Time]
	,qs.[AVG_Run_Time]
	,qs.[Last_Run_Time]
	,qs.[Min_Run_Time]
	,qs.[Max_Run_Time]
	,qs.[Total_Logical_Writes]
	,qs.[Last_Logical_Writes]
	,qs.[Min_Logical_Writes]
	,qs.[Max_Logical_Writes]
	,qs.[Total_Physical_Reads]
	,qs.[Last_Physical_Reads]
	,qs.[Min_Physical_Reads]
	,qs.[Max_Physical_Reads]
	,qs.[Total_Logical_Reads]
	,qs.[Last_Logical_Reads]
	,qs.[Min_Logical_Reads]
	,qs.[Max_Logical_Reads]
	,qs.[SampleDate]
FROM [hist].[Metrics_QueryStats] qs
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON qs.[HistServerID] = s.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON qs.[HistDatabaseID] = d.[DatabaseID]
INNER JOIN [hist].[ServerInventory_SQL_ObjectIDs] o
	ON qs.[HistObjectID] = o.[ObjectID]

GO

PRINT N'Stamping database version 1.4.1'
EXEC sys.sp_updateextendedproperty @name=N'Version', @value=N'1.4.1'
