
WITH ChangedAttributes 
AS (
	SELECT 
		HistServerID
		,HistDatabaseID
		,DatabaseAttributeID
	FROM [hist].[ServerInventory_SQL_DatabaseAttributeValues]
	WHERE file_id IS NULL
	GROUP BY histserverid, HistDatabaseID, DatabaseAttributeID
	HAVING COUNT(*) > 1
)
SELECT
	s.[ServerName]
	,d.[DBName]
	,m.[AttributeName]
	,v.[AttributeValue]
	,v.[DateCreated]
	,v.[DateLastSeenOn]
FROM ChangedAttributes ca
INNER JOIN [hist].[ServerInventory_SQL_DatabaseAttributeValues] v
	ON ca.[HistServerID] = v.[HistServerID]
	AND ca.[HistDatabaseID] = v.[HistDatabaseID]
	AND ca.[DatabaseAttributeID] = v.[DatabaseAttributeID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseAttributeMaster] m
	ON v.[DatabaseAttributeID] = m.[DatabaseAttributeID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON v.[HistServerID] = s.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON v.[HistDatabaseID] = d.[DatabaseID]
WHERE m.[AttributeName] NOT IN ('log_reuse_wait_desc','service_broker_guid','create_date')
ORDER BY s.[ServerName],d.[DBName],m.[AttributeName],v.[DateLastSeenOn]


CREATE VIEW [rpt].[SpaceUsed_Table_Servers_vw]
AS
SELECT
	s.[ServerName]
	,sz.[SampleDate]
FROM [hist].[SpaceUsed_TableSizes] sz
INNER JOIN [hist].[ServerInventory_SQL_ServerDBTableIDs] sdt
	ON sz.[ServerDBTableID] = sdt.[ServerDBTableID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON sdt.[HistServerID] = s.[HistServerID]
	
CREATE VIEW [rpt].[SpaceUsed_Table_Servers_DBs_vw]
AS
SELECT
	s.[ServerName]
	,d.[DBName]
	,sz.[SampleDate]
FROM [hist].[SpaceUsed_TableSizes] sz
INNER JOIN [hist].[ServerInventory_SQL_ServerDBTableIDs] sdt
	ON sz.[ServerDBTableID] = sdt.[ServerDBTableID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON sdt.[HistServerID] = s.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON sdt.[DatabaseID] = d.[DatabaseID]