USE DBACentral
GO

PRINT('Dropping indexes')
PRINT N'Dropping index [IX__SpaceUsed_DBSizes__DatabaseID__SampleDate] from [hist].[SpaceUsed_DatabaseSizes]'
IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX__SpaceUsed_DBSizes__DatabaseID__SampleDate' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_DatabaseSizes]'))
DROP INDEX [IX__SpaceUsed_DBSizes__DatabaseID__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes]
GO
PRINT N'Dropping index [IX__SpaceUsed_DBSizes__HistServerID__SampleDate] from [hist].[SpaceUsed_DatabaseSizes]'
IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX__SpaceUsed_DBSizes__HistServerID__SampleDate' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_DatabaseSizes]'))
DROP INDEX [IX__SpaceUsed_DBSizes__HistServerID__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes]
GO
PRINT N'Dropping index [IX__SpaceUsed_DBSizes__SampleDate] from [hist].[SpaceUsed_DatabaseSizes]'
IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX__SpaceUsed_DBSizes__SampleDate' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_DatabaseSizes]'))
DROP INDEX [IX__SpaceUsed_DBSizes__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes]

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'CIX__SpaceUsed_DBSizes__SampleDate' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_DatabaseSizes]'))
DROP INDEX [CIX__SpaceUsed_DBSizes__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes]

PRINT('Cleaning up indexes')
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'UIX_sysjobs_ServerID_job_id' AND [object_id] = OBJECT_ID('[dbo].[ServerInventory_SQL_sysjobs]'))
	DROP INDEX [dbo].[ServerInventory_SQL_sysjobs].UIX_sysjobs_ServerID_job_id
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX__Jobs_SQL_JobHistory__run_datetime_HistJobID_HistServerID' AND [object_id] = OBJECT_ID('[hist].[Jobs_SQL_JobHistory]'))
	DROP INDEX [hist].[Jobs_SQL_JobHistory].[IX__Jobs_SQL_JobHistory__run_datetime_HistJobID_HistServerID]
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX__Jobs_SQL_JobHistory__step_id_run_status_run_datetime_histJobID_HistServerID' AND [object_id] = OBJECT_ID('[hist].[Jobs_SQL_JobHistory]'))
	DROP INDEX [hist].[Jobs_SQL_JobHistory].[IX__Jobs_SQL_JobHistory__step_id_run_status_run_datetime_histJobID_HistServerID]
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX__SpaceUsed_DBSizes__DatabaseID__SampleDate' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_DatabaseSizes]'))
	DROP INDEX [hist].[SpaceUsed_DatabaseSizes].[IX__SpaceUsed_DBSizes__DatabaseID__SampleDate]
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX__SpaceUsed_DBSizes__HistServerID__SampleDate' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_DatabaseSizes]'))
	DROP INDEX [hist].[SpaceUsed_DatabaseSizes].[IX__SpaceUsed_DBSizes__HistServerID__SampleDate]
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX__SpaceUsed_DBSizes__SampleDate' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_DatabaseSizes]'))
	DROP INDEX [hist].[SpaceUsed_DatabaseSizes].[IX__SpaceUsed_DBSizes__SampleDate]
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX__SpaceUsed_DatabaseSizes__HistServerID_DatabaseID' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_DatabaseSizes]'))
	DROP INDEX [hist].[SpaceUsed_DatabaseSizes].[IX__SpaceUsed_DatabaseSizes__HistServerID_DatabaseID]
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX__ServerInventory_SQL_ServerDBTableIDs__HistServerID_DatabaseID_TableID' AND [object_id] = OBJECT_ID('[hist].[ServerInventory_SQL_ServerDBTableIDs]'))
	DROP INDEX [hist].[ServerInventory_SQL_ServerDBTableIDs].[IX__ServerInventory_SQL_ServerDBTableIDs__HistServerID_DatabaseID_TableID]
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX__ServerInventory_SQL_TableIDs__SchemaName_TableName' AND [object_id] = OBJECT_ID('[hist].[ServerInventory_SQL_TableIDs]'))
	DROP INDEX [hist].[ServerInventory_SQL_TableIDs].[IX__ServerInventory_SQL_TableIDs__SchemaName_TableName]
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX__SpaceUsed_TableSizes__ServerDBTableID_SampleDate_RowCount_ReservedSpaceKB_DataSpaceKBIndexSizeKB_UnusedKB' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_TableSizes]'))
	DROP INDEX [hist].[SpaceUsed_TableSizes].[IX__SpaceUsed_TableSizes__ServerDBTableID_SampleDate_RowCount_ReservedSpaceKB_DataSpaceKBIndexSizeKB_UnusedKB]
IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX__ServerInventory_SQL_ServerDBTableIDs__DatabaseID' AND [object_id] = OBJECT_ID('[hist].[ServerInventory_SQL_ServerDBTableIDs]'))
	DROP INDEX [hist].[ServerInventory_SQL_ServerDBTableIDs].[IX__ServerInventory_SQL_ServerDBTableIDs__DatabaseID]
IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX__ServerInventory_SQL_ServerDBTableIDs__TableID' AND [object_id] = OBJECT_ID('[hist].[ServerInventory_SQL_ServerDBTableIDs]'))
	DROP INDEX [hist].[ServerInventory_SQL_ServerDBTableIDs].[IX__ServerInventory_SQL_ServerDBTableIDs__TableID]
GO
-------------------------------------------------------------------------------------------------------------
PRINT('Dropping Table Constraints')
PRINT N'Dropping foreign keys from [hist].[SpaceUsed_FileSizes]'
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__SpaceUsed_FileSizes__HistServerID__ServerInventory_ServerIDs__HistServerID' AND parent_object_id = OBJECT_ID('[hist].[SpaceUsed_FileSizes]'))
	ALTER TABLE [hist].[SpaceUsed_FileSizes] DROP CONSTRAINT [FK__SpaceUsed_FileSizes__HistServerID__ServerInventory_ServerIDs__HistServerID]
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__SpaceUsed_FileSizes__HistPathFileNameID__General_FullFileName__HistPathFileNameID' AND parent_object_id = OBJECT_ID('[hist].[SpaceUsed_FileSizes]'))
	ALTER TABLE [hist].[SpaceUsed_FileSizes] DROP CONSTRAINT [FK__SpaceUsed_FileSizes__HistPathFileNameID__General_FullFileName__HistPathFileNameID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'DF_Jobs_SQL_Jobs_LastSeenOn' AND parent_object_id = OBJECT_ID('[hist].[Jobs_SQL_Jobs]'))
	ALTER TABLE [hist].[Jobs_SQL_Jobs] DROP CONSTRAINT [DF_Jobs_SQL_Jobs_LastSeenOn]
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__ServerInventory_SQL_sysjobs__ServerID__ServerInventory_SQL_Master__ServerID' AND parent_object_id = OBJECT_ID('[dbo].[ServerInventory_SQL_sysjobs]'))
	ALTER TABLE [dbo].[ServerInventory_SQL_sysjobs] DROP CONSTRAINT [FK__ServerInventory_SQL_sysjobs__ServerID__ServerInventory_SQL_Master__ServerID]
GO
PRINT N'Dropping constraints from [hist].[SpaceUsed_FileSizes]'
GO
IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'PK__SpaceUsed_FileSizes__HistServerID__SampleDate__HistPathFileNameID' AND [object_id] = OBJECT_ID('[hist].[SpaceUsed_FileSizes]'))
ALTER TABLE [hist].[SpaceUsed_FileSizes] DROP CONSTRAINT [PK__SpaceUsed_FileSizes__HistServerID__SampleDate__HistPathFileNameID]
-------------------------------------------------------------------------------------------------------------
PRINT('Cleaning up procedures')
IF OBJECT_ID('[hist].[DTSStore_GetPackageNameID]','P') IS NOT NULL
	DROP PROCEDURE [hist].[DTSStore_GetPackageNameID]
IF OBJECT_ID('[hist].[DTSStore_GetOwnerID]','P') IS NOT NULL
	DROP PROCEDURE [hist].[DTSStore_GetOwnerID]
IF OBJECT_ID('[hist].[ChangeTracking_SQL_GETActionID]','P') IS NOT NULL
	DROP PROCEDURE [hist].[ChangeTracking_SQL_GETActionID]
IF OBJECT_ID('[hist].[Backups_GetDeviceID]','P') IS NOT NULL
	DROP PROCEDURE [hist].[Backups_GetDeviceID]
IF OBJECT_ID('[hist].[ChangeTracking_SQL_GETObjectTypeIDs]','P') IS NOT NULL
	DROP PROCEDURE [hist].[ChangeTracking_SQL_GETObjectTypeIDs]
IF OBJECT_ID('[hist].[ChangeTracking_SQL_GetObjectIDs]','P') IS NOT NULL
	DROP PROCEDURE [hist].[ChangeTracking_SQL_GetObjectIDs]
IF OBJECT_ID('[hist].[DTSStore_GetCategoryID]','P') IS NOT NULL
	DROP PROCEDURE [hist].[DTSStore_GetCategoryID]
IF OBJECT_ID('[hist].[DTSStore_GetDescriptionID]','P') IS NOT NULL
	DROP PROCEDURE [hist].[DTSStore_GetDescriptionID]
IF OBJECT_ID('[hist].[Backups_GetTypeID]','P') IS NOT NULL
	DROP PROCEDURE [hist].[Backups_GetTypeID]
IF OBJECT_ID('[hist].[Users_GetUserID]','P') IS NOT NULL
	DROP PROCEDURE [hist].[Users_GetUserID]
IF OBJECT_ID('[rpt].[DBSizes_Summary]','P') IS NOT NULL
	DROP PROCEDURE [rpt].[DBSizes_Summary]
IF OBJECT_ID('[dbo].[ServerInventory_SQL_SQLBackup_Audit_InsertValue]','P') IS NOT NULL
	DROP PROCEDURE [dbo].[ServerInventory_SQL_SQLBackup_Audit_InsertValue]
-------------------------------------------------------------------------------------------------------------

PRINT('Cleaning up views')
IF OBJECT_ID('[dbo].[ServerInventory_SQL_ServerInstances_vw]','V') IS NOT NULL
	DROP VIEW [dbo].[ServerInventory_SQL_ServerInstances_vw]
IF OBJECT_ID('[dbo].[NTPermissions_SQLStatements_vw]','V') IS NOT NULL
	DROP VIEW [dbo].[NTPermissions_SQLStatements_vw]
IF OBJECT_ID('[rpt].[DBSizes_Summary_vw]','V') IS NOT NULL
	DROP VIEW [rpt].[DBSizes_Summary_vw]
IF OBJECT_ID('[rpt].[DBSizes_FileGrowth_vw]','V') IS NOT NULL
	DROP VIEW [rpt].[DBSizes_FileGrowth_vw]
IF OBJECT_ID('[rpt].[DBSizes_DBCounts_vw]','V') IS NOT NULL
	DROP VIEW [rpt].[DBSizes_DBCounts_vw]
IF OBJECT_ID('[rpt].[Reporting_Environments_vw]','V') IS NOT NULL
	DROP VIEW [rpt].[Reporting_Environments_vw]
-------------------------------------------------------------------------------------------------------------

PRINT('Cleaning up tables')
IF OBJECT_ID('[rpt].[Reporting_Environments]','U') IS NOT NULL
	DROP TABLE [rpt].[Reporting_Environments]
IF OBJECT_ID('[dbo].[ServerInventory_SQL_sysjobs]','U') IS NOT NULL
	DROP TABLE [dbo].[ServerInventory_SQL_sysjobs]

-------------------------------------------------------------------------------------------------------------
	
PRINT('Creating new tables')
PRINT N'Creating [rpt].[Reporting_Environments]'
GO
CREATE TABLE [rpt].[Reporting_Environments]
(
[Environment] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnvironmentCategory] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
PRINT N'Creating [dbo].[ServerInventory_SQL_sysjobs]'
GO
CREATE TABLE [dbo].[ServerInventory_SQL_sysjobs]
(
[JobID] [int] NOT NULL IDENTITY(1, 1),
[ServerID] [int] NULL,
[job_id] [uniqueidentifier] NOT NULL,
[originating_server_id] [int] NOT NULL,
[name] [sys].[sysname] NOT NULL,
[enabled] [tinyint] NOT NULL,
[description] [nvarchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[start_step_id] [int] NOT NULL,
[category_id] [int] NOT NULL,
[owner_sid] [varbinary] (85) NOT NULL,
[notify_level_eventlog] [int] NOT NULL,
[notify_level_email] [int] NOT NULL,
[notify_level_netsend] [int] NOT NULL,
[notify_level_page] [int] NOT NULL,
[notify_email_operator_id] [int] NOT NULL,
[notify_netsend_operator_id] [int] NOT NULL,
[notify_page_operator_id] [int] NOT NULL,
[delete_level] [int] NOT NULL,
[date_created] [datetime] NOT NULL,
[date_modified] [datetime] NOT NULL,
[version_number] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK__ServerInventory_SQL_sysjobs__JobID] on [dbo].[ServerInventory_SQL_sysjobs]'
GO
ALTER TABLE [dbo].[ServerInventory_SQL_sysjobs] ADD CONSTRAINT [PK__ServerInventory_SQL_sysjobs__JobID] PRIMARY KEY CLUSTERED  ([JobID])

-------------------------------------------------------------------------------------------------------------

PRINT('Updating existing tables')
PRINT N'Altering [dbo].[Backups_BackupAgents]'
GO
ALTER TABLE [dbo].[Backups_BackupAgents] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [dbo].[Backups_BackupTypes]'
GO
ALTER TABLE [dbo].[Backups_BackupTypes] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [dbo].[Backups_BackupCommands]'
GO
ALTER TABLE [dbo].[Backups_BackupCommands] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [dbo].[Backups_JobSchedules]'
GO
ALTER TABLE [dbo].[Backups_JobSchedules] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[Backups_BackupJobHistory]'
GO
ALTER TABLE [hist].[Backups_BackupJobHistory] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[DTSStore_PackageNames]'
GO
ALTER TABLE [hist].[DTSStore_PackageNames] ALTER COLUMN [datecreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[DTSStore_Categories]'
GO
ALTER TABLE [hist].[DTSStore_Categories] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[DTSStore_Descriptions]'
GO
ALTER TABLE [hist].[DTSStore_Descriptions] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[DTSStore_Owners]'
GO
ALTER TABLE [hist].[DTSStore_Owners] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[DTSStore_PackageStore]'
GO
ALTER TABLE [hist].[DTSStore_PackageStore] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [dbo].[ServerInventory_SQL_Master]'
GO
ALTER TABLE [dbo].[ServerInventory_SQL_Master] ALTER COLUMN [Enabled] [bit] NOT NULL
ALTER TABLE [dbo].[ServerInventory_SQL_Master] ALTER COLUMN [UseCredential] [bit] NULL
GO
PRINT N'Altering [dbo].[ServerInventory_SQL_AttributeList]'
GO
ALTER TABLE [dbo].[ServerInventory_SQL_AttributeList] ALTER COLUMN [DateCreated] [smalldatetime] NULL
ALTER TABLE [dbo].[ServerInventory_SQL_AttributeList] ALTER COLUMN [LastModified] [smalldatetime] NULL
GO
PRINT N'Altering [dbo].[NTPermissions_ServerExceptions]'
GO
ALTER TABLE [dbo].[NTPermissions_ServerExceptions] ALTER COLUMN [RunInAdditionToDefault] [bit] NULL
GO
PRINT N'Altering [dbo].[NTPermissions_EnvironmentExceptions]'
GO
ALTER TABLE [dbo].[NTPermissions_EnvironmentExceptions] ALTER COLUMN [RunInAdditionToDefault] [bit] NULL
GO
PRINT N'Altering [hist].[Jobs_SQL_Jobs]'
GO
ALTER TABLE [hist].[Jobs_SQL_Jobs] ALTER COLUMN [DateCreated] [smalldatetime] NULL
ALTER TABLE [hist].[Jobs_SQL_Jobs] ALTER COLUMN [LastSeenOn] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'
GO
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[Jobs_SQL_JobSteps]'
GO
ALTER TABLE [hist].[Jobs_SQL_JobSteps] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[Jobs_SQL_JobHistory]'
GO
ALTER TABLE [hist].[Jobs_SQL_JobHistory] ALTER COLUMN [DateCreated] [smalldatetime] NULL
PRINT N'Altering [hist].[SpaceUsed_DatabaseSizes]'
GO
ALTER TABLE [hist].[SpaceUsed_DatabaseSizes] ALTER COLUMN [SampleDate] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[Users_UserNames]'
GO
ALTER TABLE [hist].[Users_UserNames] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[Backups_Types]'
GO
ALTER TABLE [hist].[Backups_Types] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[Backups_Devices]'
GO
ALTER TABLE [hist].[Backups_Devices] ALTER COLUMN [DateCreated] [smalldatetime] NULL
GO
PRINT N'Altering [hist].[SpaceUsed_FileSizes]'
GO
ALTER TABLE [hist].[SpaceUsed_FileSizes] ALTER COLUMN [SampleDate] [smalldatetime] NOT NULL
GO
PRINT N'Altering [hist].[General_Paths]'
GO
ALTER TABLE [hist].[General_Paths] ALTER COLUMN [DateCreated] [date] NULL
GO
PRINT N'Altering [hist].[General_FullFileName]'
GO
ALTER TABLE [hist].[General_FullFileName] ALTER COLUMN [DateCreated] [date] NULL
GO
PRINT N'Altering [hist].[General_FileNames]'
GO
ALTER TABLE [hist].[General_FileNames] ALTER COLUMN [DateCreated] [date] NULL
GO
PRINT N'Altering [dbo].[Backups_Jobs]'
GO
ALTER TABLE [dbo].[Backups_Jobs] ALTER COLUMN [RecordHistory] [bit] NULL
ALTER TABLE [dbo].[Backups_Jobs] ALTER COLUMN [Enabled] [bit] NULL
ALTER TABLE [dbo].[Backups_Jobs] ALTER COLUMN [DateCreated] [smalldatetime] NULL

-------------------------------------------------------------------------------------------------------------
PRINT('Adding Indexes')
PRINT N'Creating index [UIX_sysjobs_ServerID_job_id] on [dbo].[ServerInventory_SQL_sysjobs]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_sysjobs_ServerID_job_id] ON [dbo].[ServerInventory_SQL_sysjobs] ([ServerID], [job_id])
GO
PRINT N'Creating index [IX__Jobs_SQL_JobHistory__run_datetime_HistJobID_HistServerID] on [hist].[Jobs_SQL_JobHistory]'
GO
CREATE NONCLUSTERED INDEX [IX__Jobs_SQL_JobHistory__run_datetime_HistJobID_HistServerID] ON [hist].[Jobs_SQL_JobHistory] ([run_datetime]) INCLUDE ([HistJobID], [HistServerID]) WITH (FILLFACTOR=85)
GO
PRINT N'Creating index [IX__Jobs_SQL_JobHistory__step_id_run_status_run_datetime_histJobID_HistServerID] on [hist].[Jobs_SQL_JobHistory]'
GO
CREATE NONCLUSTERED INDEX [IX__Jobs_SQL_JobHistory__step_id_run_status_run_datetime_histJobID_HistServerID] ON [hist].[Jobs_SQL_JobHistory] ([step_id], [run_status], [run_datetime]) INCLUDE ([HistJobID], [HistServerID]) WITH (FILLFACTOR=85)
GO
PRINT N'Creating index [IX__SpaceUsed_DBSizes__DatabaseID__SampleDate] on [hist].[SpaceUsed_DatabaseSizes]'
GO
CREATE NONCLUSTERED INDEX [IX__SpaceUsed_DBSizes__DatabaseID__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes] ([DatabaseID], [SampleDate]) WITH (FILLFACTOR=85)
GO
PRINT N'Creating index [IX__SpaceUsed_DBSizes__HistServerID__SampleDate] on [hist].[SpaceUsed_DatabaseSizes]'
GO
CREATE NONCLUSTERED INDEX [IX__SpaceUsed_DBSizes__HistServerID__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes] ([HistServerID], [SampleDate]) WITH (FILLFACTOR=85)
GO
PRINT N'Creating index [IX__SpaceUsed_DBSizes__SampleDate] on [hist].[SpaceUsed_DatabaseSizes]'
GO
CREATE CLUSTERED INDEX [IX__SpaceUsed_DBSizes__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes] ([SampleDate]) WITH (FILLFACTOR=100)
GO
PRINT N'Creating index [IX__SpaceUsed_DatabaseSizes__HistServerID_DatabaseID] on [hist].[SpaceUsed_DatabaseSizes]'
GO
CREATE NONCLUSTERED INDEX [IX__SpaceUsed_DatabaseSizes__HistServerID_DatabaseID] ON [hist].[SpaceUsed_DatabaseSizes] ([HistServerID]) INCLUDE ([DatabaseID]) WITH (FILLFACTOR=85)
GO
PRINT N'Creating index [IX__ServerInventory_SQL_ServerDBTableIDs__HistServerID_DatabaseID_TableID] on [hist].[ServerInventory_SQL_ServerDBTableIDs]'
GO
CREATE NONCLUSTERED INDEX [IX__ServerInventory_SQL_ServerDBTableIDs__HistServerID_DatabaseID_TableID] ON [hist].[ServerInventory_SQL_ServerDBTableIDs] ([HistServerID], [DatabaseID], [TableID]) WITH (FILLFACTOR=85)
GO
PRINT N'Creating index [IX__ServerInventory_SQL_TableIDs__SchemaName_TableName] on [hist].[ServerInventory_SQL_TableIDs]'
GO
CREATE NONCLUSTERED INDEX [IX__ServerInventory_SQL_TableIDs__SchemaName_TableName] ON [hist].[ServerInventory_SQL_TableIDs] ([SchemaName], [TableName]) WITH (FILLFACTOR=85)
GO
PRINT N'Creating index [IX__SpaceUsed_TableSizes__ServerDBTableID_SampleDate_RowCount_ReservedSpaceKB_DataSpaceKBIndexSizeKB_UnusedKB] on [hist].[SpaceUsed_TableSizes]'
GO
CREATE NONCLUSTERED INDEX [IX__SpaceUsed_TableSizes__ServerDBTableID_SampleDate_RowCount_ReservedSpaceKB_DataSpaceKBIndexSizeKB_UnusedKB] ON [hist].[SpaceUsed_TableSizes] ([ServerDBTableID], [SampleDate]) INCLUDE ([DataSpaceKB], [IndexSizeKB], [ReservedSpaceKB], [RowCount], [UnusedKB]) WITH (FILLFACTOR=85)
GO
PRINT N'Creating primary key [PK__SpaceUsed_FileSizes__HistServerID__SampleDate__HistPathFileNameID] on [hist].[SpaceUsed_FileSizes]'
GO
ALTER TABLE [hist].[SpaceUsed_FileSizes] ADD CONSTRAINT [PK__SpaceUsed_FileSizes__HistServerID__SampleDate__HistPathFileNameID] PRIMARY KEY CLUSTERED  ([HistServerID], [SampleDate], [HistPathFileNameID])
GO
CREATE NONCLUSTERED INDEX [IX__ServerInventory_SQL_ServerDBTableIDs__DatabaseID] ON [hist].[ServerInventory_SQL_ServerDBTableIDs] ([DatabaseID]) INCLUDE ([HistServerID], [ServerDBTableID], [TableID])
CREATE NONCLUSTERED INDEX [IX__ServerInventory_SQL_ServerDBTableIDs__TableID] ON [hist].[ServerInventory_SQL_ServerDBTableIDs] ([TableID]) INCLUDE ([DatabaseID], [HistServerID], [ServerDBTableID])

-------------------------------------------------------------------------------------------------------------
PRINT('Adding Table Constraints')
GO
PRINT N'Adding foreign keys to [dbo].[ServerInventory_SQL_sysjobs]'
GO
ALTER TABLE [dbo].[ServerInventory_SQL_sysjobs] ADD
CONSTRAINT [FK__ServerInventory_SQL_sysjobs__ServerID__ServerInventory_SQL_Master__ServerID] FOREIGN KEY ([ServerID]) REFERENCES [dbo].[ServerInventory_SQL_Master] ([ServerID]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [hist].[SpaceUsed_FileSizes]'
GO
ALTER TABLE [hist].[SpaceUsed_FileSizes] ADD
CONSTRAINT [FK__SpaceUsed_FileSizes__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY ([HistServerID]) REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID]),
CONSTRAINT [FK__SpaceUsed_FileSizes__HistPathFileNameID__General_FullFileName__HistPathFileNameID] FOREIGN KEY ([HistPathFileNameID]) REFERENCES [hist].[General_FullFileName] ([HistPathFileNameID]) ON DELETE CASCADE
GO

-------------------------------------------------------------------------------------------------------------
PRINT('Updating views')
PRINT N'Altering [dbo].[ServerInventory_SQL_ServerInstances_vw]'
GO

CREATE VIEW [dbo].[ServerInventory_SQL_ServerInstances_vw]
AS

WITH SN ([ServerName], [Environment], [InstanceName])
AS
(
	SELECT 
		[ServerName]
		,[EnvironmentName]
		,[AttribValue]
	FROM [dbo].[ServerInventory_SQL_ServerAttributes_vw] 
	WHERE [AttribName] = 'InstanceName'
)
SELECT 
	i.[InstanceName]
	,d.[ServerName] as DEV
	,q.[ServerName] as QA
	,p.[ServerName] as Prod
FROM (SELECT DISTINCT [InstanceName] FROM SN) i
LEFT OUTER JOIN (SELECT [ServerName],[InstanceName] FROM SN WHERE [Environment] = 'DEV') d
	ON d.[InstanceName] = i.[InstanceName]
LEFT OUTER JOIN (SELECT [ServerName],[InstanceName] FROM SN WHERE [Environment] = 'QA') q
	ON q.[InstanceName] = i.[InstanceName]
LEFT OUTER JOIN (SELECT [ServerName],[InstanceName] FROM SN WHERE [Environment] IN ('SAVVIS','BI','OECPROD','OEC Production')) p
	ON p.[InstanceName] = i.[InstanceName]

GO
PRINT N'Altering [dbo].[NTPermissions_SQLStatements_vw]'
GO

CREATE VIEW [dbo].[NTPermissions_SQLStatements_vw]
AS
-- Select all servers that don't have a "instead of" flag set
-- Select all environment specific things
-- Select all server specific things

-- Default action for all servers that don't have the "instead of" flag set
SELECT
	srv.[ServerID]
	,srv.[FullName]
	,srv.[DotNetConnectionString]
	,N'EXEC [admin].[dbo].[NTPermissions_AllDBs]' AS [SQLToExecute]
	,'Default' AS [Description]
	,1 AS [Sequence]
FROM
	[dbo].[ServerInventory_SQL_AllServers_vw] srv
WHERE srv.ServerID NOT IN (
	SELECT
		ISNULL(s.[ServerID],-1)
	FROM [dbo].[ServerInventory_SQL_Master] s
	FULL OUTER JOIN [dbo].[NTPermissions_EnvironmentExceptions] e_ex
		ON s.[EnvironmentID] = e_ex.[EnvironmentID]
	FULL OUTER JOIN [dbo].[NTPermissions_ServerExceptions] s_ex
		ON s.[ServerID] = s_ex.[ServerID]
	WHERE e_ex.[RunInAdditionToDefault] = 0
	OR s_ex.[RunInAdditionToDefault] = 0
)
	
UNION ALL
	
-- Run the environment specific statements
SELECT 
	s.[ServerID]
	,srv.[FullName]
	,srv.[DotNetConnectionString]
	,sql_sta.[SQLToExecute] AS [SQLToExecute]
	,sql_sta.[Description]
	,2 AS [Sequence]
FROM [dbo].[ServerInventory_SQL_Master] s
INNER JOIN [dbo].[ServerInventory_SQL_AllServers_vw] srv
	ON s.[ServerID] = srv.[ServerID]
INNER JOIN [dbo].[NTPermissions_EnvironmentExceptions] e_ex
	ON s.[EnvironmentID] = e_ex.[EnvironmentID]
INNER JOIN [dbo].[NTPermissions_PermissionSQLStatements] sql_sta
	ON e_ex.[StatementID] = sql_sta.[StatementID]
	AND ISNULL(sql_sta.[CompatVersionStart],2000) <= srv.[SQLVersion]
	AND ISNULL(sql_sta.[CompatVersionEnd],5000) >= srv.[SQLVersion]

UNION ALL
	
-- Lastly, run the server specific statements
SELECT 
	srv.[ServerID]
	,srv.[FullName]
	,srv.[DotNetConnectionString]
	,sql_sta.[SQLToExecute] AS [SQLToExecute]
	,sql_sta.[Description]
	,3 AS [Sequence]
FROM [dbo].[ServerInventory_SQL_AllServers_vw] srv
INNER JOIN [dbo].[NTPermissions_ServerExceptions] s_ex
	ON srv.[ServerID] = s_ex.[ServerID]
INNER JOIN [dbo].[NTPermissions_PermissionSQLStatements] sql_sta
	ON s_ex.[StatementID] = sql_sta.[StatementID]
	AND ISNULL(sql_sta.[CompatVersionStart],2000) <= srv.[SQLVersion]
	AND ISNULL(sql_sta.[CompatVersionEnd],5000) >= srv.[SQLVersion]

GO
/******************************************************************************
**	Name:			[rpt].[DBSizes_Summary_vw]
**	Desc:			Reporting procedure for database sizes report
**	Auth:			Adam Bean (SQLSlayer.com)
**  Dependancies:	dbo.Split_fn
**	Date:			2010.08.11
*******************************************************************************
**  License
*******************************************************************************
**  Copyright © SQLSlayer.com. All rights reserved.
**  
**  All objects published by SQLSlayer.com are licensed and goverened by 
**  Creative Commons Attribution-Share Alike 3.0
**  http://creativecommons.org/licenses/by-sa/3.0/
**  
**  For more scripts and sample code, go to http://www.SQLSlayer.com
**  
**  You may alter this code for your own *non-commercial* purposes. You may
**  republish altered code as long as you give due credit.
**  
**  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF 
**  ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED 
**  TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
**  PARTICULAR PURPOSE.
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  YYYYDDMM	Full Name	
********************************************************************************************************/

CREATE VIEW [rpt].[DBSizes_Summary_vw]

AS

SELECT 
      s.[Environment]
      ,d.[ServerName]
      ,d.[DBName]             
      ,d.[DataSizeMB]
      ,d.[DataSizeMBIncrease]
      ,d.[DataPercentChange]
      ,d.[LogSizeMB]
      ,d.[LogSizeMBIncrease]
      ,d.[LogPercentChange]
      ,d.[DataSizeUnusedMB]
      ,d.[DataSizeUnusedMBIncrease]
      ,d.[LogSizeUnusedMB]
      ,d.[LogSizeUnusedMBIncrease]
      ,d.[SampleDate]
FROM [hist].[SpaceUsed_DatabaseSizes_Delta_vw] d
JOIN [dbo].[ServerInventory_SQL_AllServers_vw] s
	ON d.[ServerName] = ISNULL(s.[ServerName] + '\' + s.[InstanceName], s.[ServerName])
GO
PRINT N'Creating [rpt].[DBSizes_FileGrowth_vw]'
GO

/******************************************************************************
**	Name:			[rpt].[DBSizes_FileGrowth_vw]
**	Desc:			Reporting view to display growth per database
**	Auth:			Adam Bean (SQLSlayer.com)
**	Notes:			Date range is to ensure only recent databases are counted
**	Date:			2010.08.11
*******************************************************************************
**  License
*******************************************************************************
**  Copyright © SQLSlayer.com. All rights reserved.
**  
**  All objects published by SQLSlayer.com are licensed and goverened by 
**  Creative Commons Attribution-Share Alike 3.0
**  http://creativecommons.org/licenses/by-sa/3.0/
**  
**  For more scripts and sample code, go to http://www.SQLSlayer.com
**  
**  You may alter this code for your own *non-commercial* purposes. You may
**  republish altered code as long as you give due credit.
**  
**  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF 
**  ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED 
**  TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
**  PARTICULAR PURPOSE.
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  YYYYDDMM	Full Name	
********************************************************************************************************/

CREATE VIEW [rpt].[DBSizes_FileGrowth_vw]

AS

SELECT
	t1.[Environment]
	,t1.[ServerName]
	,t.[DBName]
	,t.[FirstSampleDate]
	,t1.[DataSizeMB]													AS [FirstDataSizeMB]
	,t1.[LogSizeMB]														AS [FirstLogSizeMB]
	,ISNULL(t1.[DataSizeUnusedMB],0)									AS [FirstDataSizeUnusedMB]
	,ISNULL(t1.[LogSizeUnusedMB],0)										AS [FirstLogSizeUnusedMB]
	,t.[LastSampleDate]
	,t2.[DataSizeMB]													AS [LastDataSizeMB]
	,t2.[LogSizeMB]														AS [LastLogSizeMB]
	,ISNULL(t2.[DataSizeUnusedMB],0)									AS [LastDataSizeUnusedMB]
	,ISNULL(t2.[LogSizeUnusedMB],0)										AS [LastLogSizeUnusedMB]
	,ISNULL(t2.[DataSizeMB],0) - ISNULL(t1.[DataSizeMB],0)				AS [DataSizeChangeMB]
	,ISNULL(t2.[LogSizeMB],0) - ISNULL(t1.[LogSizeMB],0)				AS [LogSizeChangeMB]
	,ISNULL(t2.[DataSizeUnusedMB],0) - ISNULL(t1.[DataSizeUnusedMB],0)	AS [DataSizeUnusedChangeMB]
	,ISNULL(t2.[LogSizeUnusedMB],0) - ISNULL(t1.[LogSizeUnusedMB],0)	AS [LogSizeUnusedChangeMB]
FROM 
(		
	SELECT
		[ServerName]
		,[DBName]
		,MIN([SampleDate]) AS [FirstSampleDate]
		,MAX([SampleDate]) AS [LastSampleDate]
	FROM [rpt].[DBSizes_Summary_vw]
	GROUP BY 
		[ServerName]
		,[DBName]
) t
JOIN [rpt].[DBSizes_Summary_vw] t1
	ON t.[ServerName] = t1.[ServerName]
	AND t.[DBName] = t1.[DBName]
	AND t.[FirstSampleDate] = t1.[SampleDate]
JOIN [rpt].[DBSizes_Summary_vw] t2
	ON t.[ServerName] = t2.[ServerName]
	AND t.[DBName] = t2.[DBName]
	AND t.[LastSampleDate] = t2.[SampleDate]
GO
PRINT N'Creating [rpt].[DBSizes_DBCounts_vw]'
GO

/******************************************************************************
**	Name:			[rpt].[DBSizes_DBCounts_vw]
**	Desc:			Reporting view to display database counts
**	Auth:			Adam Bean (SQLSlayer.com)
**	Notes:			Date range is to ensure only recent databases are counted
**	Date:			2010.08.11
*******************************************************************************
**  License
*******************************************************************************
**  Copyright © SQLSlayer.com. All rights reserved.
**  
**  All objects published by SQLSlayer.com are licensed and goverened by 
**  Creative Commons Attribution-Share Alike 3.0
**  http://creativecommons.org/licenses/by-sa/3.0/
**  
**  For more scripts and sample code, go to http://www.SQLSlayer.com
**  
**  You may alter this code for your own *non-commercial* purposes. You may
**  republish altered code as long as you give due credit.
**  
**  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF 
**  ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED 
**  TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
**  PARTICULAR PURPOSE.
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  YYYYDDMM	Full Name	
********************************************************************************************************/

CREATE VIEW [rpt].[DBSizes_DBCounts_vw]

AS

SELECT
	[ServerName] 
	,SUM(t.[IsSystem])				AS [System]
	,SUM(t.[IsUser])				AS [User]
	,SUM(t.[IsUser] + t.[IsSystem])	AS [Total]
FROM
(
	SELECT DISTINCT
		[ServerName]
		,[DBName]
		,CASE
			WHEN [DBName] IN ('admin','master','model','msdb','tempdb') OR [DBName] LIKE '%adventureworks%' THEN 0
			ELSE 1
		END AS [IsUser]
		,CASE
			WHEN [DBName] IN ('admin','master','model','msdb','tempdb') OR [DBName] LIKE '%adventureworks%' THEN 1
			ELSE 0
		END AS [IsSystem]
	FROM [rpt].[DBSizes_Summary_vw]
	WHERE [SampleDate] > DATEADD(dd,-2,GETDATE())
) t
GROUP BY [ServerName]
GO
PRINT N'Creating [rpt].[Reporting_Environments_vw]'
GO
CREATE VIEW [rpt].[Reporting_Environments_vw]
AS

SELECT     Environment
           ,EnvironmentCategory
FROM         rpt.Reporting_Environments
GO
--------------------------------------------------------------
PRINT('Updating procedures')

PRINT N'Altering [hist].[DTSStore_GetPackageNameID]'
GO

CREATE PROCEDURE [hist].[DTSStore_GetPackageNameID] (
	@PackageName			SYSNAME
	,@PackageID				UNIQUEIDENTIFIER
	,@PackageNameID			INT OUTPUT
)
AS

-- Find the PackageNameID
SELECT 
	@PackageNameID = id.[PackageNameID]
FROM 
	[hist].[DTSStore_PackageNames] id
WHERE id.[PackageName] = @PackageName
AND id.[PackageID] = @PackageID

IF @PackageNameID IS NULL
BEGIN
	INSERT INTO [hist].[DTSStore_PackageNames] ([PackageName],[PackageID])
	VALUES (@PackageName,@PackageID)
	
	SET @PackageNameID = SCOPE_IDENTITY()
END

GO
PRINT N'Altering [hist].[DTSStore_GetOwnerID]'
GO

CREATE PROCEDURE [hist].[DTSStore_GetOwnerID] (
	@Owner					SYSNAME
	,@Owner_SID				VARBINARY(85)
	,@OwnerID				INT OUTPUT
)
AS

-- Find the OwnerID
SELECT
	@OwnerID = id.[OwnerID]
FROM [hist].[DTSStore_Owners] id
WHERE id.[Owner] = @Owner
AND id.[Owner_sid] = @Owner_SID

IF @OwnerID IS NULL
BEGIN
	INSERT INTO [hist].[DTSStore_Owners] ([Owner],[Owner_sid])
	VALUES (@Owner,@Owner_SID)
	
	SET @OwnerID = SCOPE_IDENTITY()
END

GO
PRINT N'Altering [hist].[ChangeTracking_SQL_GETActionID]'
GO

/****** Object:  StoredProcedure [hist].[ChangeTracking_SQL_GETActionID]    Script Date: 02/20/2009 16:41:20 ******/

CREATE PROCEDURE [hist].[ChangeTracking_SQL_GETActionID] (
	@ActionType		VARCHAR (255)
	,@ActionID			INT OUTPUT
)
AS

DECLARE @msg NVARCHAR (4000)

-- Find the ActionID
SELECT 
	@ActionID = ad.[ActionID]
FROM [hist].[ChangeTracking_SQL_ActionIDs]
	 ad
WHERE ad.[ActionType] = @Actiontype

IF @ActionID IS NULL
BEGIN
	SET @msg = 'This Action type "' + ISNULL (@ActionType,'NULL') + '" does not exist'
	Raiserror (@msg,15,255)
END

GO
PRINT N'Altering [hist].[Backups_GetDeviceID]'
GO

CREATE PROCEDURE [hist].[Backups_GetDeviceID] (
	@DeviceName				NVARCHAR(260)
	,@DeviceID				INT OUTPUT
)
AS

DECLARE 
	@Msg					NVARCHAR(4000)
	,@DeviceNameToInsert	NVARCHAR(260)

IF (@DeviceName IS NULL)
	SET @DeviceNameToInsert = 'NULL'
ELSE IF (@DeviceName LIKE 'Red Gate SQL Backup (%')
	SET @DeviceNameToInsert = 'Red Gate SQL Backup'
ELSE IF (@DeviceName LIKE 'SQLBACKUP_%')
	SET @DeviceNameToInsert = 'Red Gate SQL Backup'
ELSE
	SET @DeviceNameToInsert = @DeviceName

SELECT
	@DeviceID = id.[DeviceID]
FROM [hist].[Backups_Devices] id
WHERE id.[DeviceName] = @DeviceNameToInsert

IF (@DeviceID IS NULL)
BEGIN
	BEGIN TRY
		INSERT INTO [hist].[Backups_Devices] ([DeviceName])
		VALUES (@DeviceNameToInsert)
		
		SET @DeviceID = SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
		SET @Msg = 'Just tried to insert ' + @DeviceNameToInsert
		RAISERROR(@Msg,16,2)
	END CATCH
END

GO
PRINT N'Altering [hist].[ChangeTracking_SQL_GETObjectTypeIDs]'
GO


CREATE PROCEDURE [hist].[ChangeTracking_SQL_GETObjectTypeIDs] (
	@RefType		NVARCHAR (128)
	,@ObjectTypeID		INT OUTPUT
)
AS

DECLARE @MSG NVARCHAR (4000)

-- Find the ObjectID
SELECT 
	@ObjectTypeID = od.[ObjectTypeID]
FROM [hist].[ChangeTracking_SQL_ObjectTypeIDs]
	 od
WHERE od.[RefType] = @RefType

IF @ObjectTypeID IS NULL
BEGIN
	SET @MSG = 'This reference type "' + @RefType + '" do not exist in the ChangeTracking_SQL_ObjectTypeIDs table.'
	Raiserror (@MSG,15,255)
END

GO

CREATE PROCEDURE [hist].[ChangeTracking_SQL_GetObjectIDs] (
	@SchemaName		SYSNAME
	,@ObjectName	SYSNAME
	,@RefType		NVARCHAR (128)
	,@ObjectId		INT OUTPUT
)

AS

DECLARE @ObjectTypeID INT

--get the object type id
EXEC [hist].[ChangeTracking_SQL_GETObjectTypeIDs] @RefType, @ObjectTypeID OUTPUT

-- Find the ObjectTypeID
SELECT 
	@ObjectID = ot.[ObjectID]
FROM [hist].[ChangeTracking_SQL_ObjectIDs] 
	 ot
WHERE ot.[SchemaName] = @SchemaName
	AND ot.[ObjectName] = @ObjectName
	AND ot.[ObjectTypeID]	= @ObjectTypeID

-- Add the  combo if necessary
IF @ObjectId IS NULL
BEGIN
	INSERT INTO [hist].[ChangeTracking_SQL_ObjectIDs]  ([SchemaName], [ObjectName], [ObjectTypeID]) 
	VALUES (@SchemaName, @ObjectName, @ObjectTypeID)
	SET @ObjectId = SCOPE_IDENTITY()
END

GO
PRINT N'Altering [hist].[DTSStore_GetCategoryID]'
GO

CREATE PROCEDURE [hist].[DTSStore_GetCategoryID] (
	@CategoryID_GUID		UNIQUEIDENTIFIER
	,@CategoryID			INT OUTPUT
)
AS

-- Find the CategoryID
SELECT 
	@CategoryID = id.[CategoryID]
FROM 
	[hist].[DTSStore_Categories] id
WHERE id.[CategoryID_GUID] = @CategoryID_GUID

IF @CategoryID IS NULL
BEGIN
	INSERT INTO [hist].[DTSStore_Categories] ([CategoryID_GUID])
	VALUES (@CategoryID_GUID)
	
	SET @CategoryID = SCOPE_IDENTITY()
END

GO
PRINT N'Altering [hist].[DTSStore_GetDescriptionID]'
GO

CREATE PROCEDURE [hist].[DTSStore_GetDescriptionID] (
	@Description			NVARCHAR(1024)
	,@DescriptionID			INT OUTPUT
)
AS

-- Find the DescriptionID
SELECT
	@DescriptionID = id.[DescriptionID]
FROM [hist].[DTSStore_Descriptions] id
WHERE id.[Description] = @Description

IF @DescriptionID IS NULL
BEGIN
	INSERT INTO [hist].[DTSStore_Descriptions] ([Description])
	VALUES (@Description)
	
	SET @DescriptionID = SCOPE_IDENTITY()
END

GO
PRINT N'Altering [hist].[Backups_GetTypeID]'
GO

CREATE PROCEDURE [hist].[Backups_GetTypeID] (
	@BackupType				CHAR(1)
	,@BackupTypeID			INT OUTPUT
)
AS

SELECT
	@BackupTypeID = id.[BackupTypeID]
FROM [hist].[Backups_Types] id
WHERE id.[BackupType] = @BackupType

IF (@BackupTypeID IS NULL)
BEGIN
	INSERT INTO [hist].[Backups_Types] ([BackupType])
	VALUES (@BackupType)
	
	SET @BackupTypeID = SCOPE_IDENTITY()
END

GO

CREATE PROCEDURE [hist].[Users_GetUserID] (
	@UserName				SYSNAME
	,@UserID				INT OUTPUT
)
AS

SET NOCOUNT ON

SELECT
	@UserID = id.[UserID]
FROM [hist].[Users_UserNames] id
WHERE id.[UserName] = @UserName

IF (@UserID IS NULL)
BEGIN
	INSERT INTO [hist].[Users_UserNames] ([UserName])
	VALUES (@UserName)
	
	SET @UserID = SCOPE_IDENTITY()
END

GO

/******************************************************************************
**	Name:			[rpt].[DBSizes_Summary]
**	Desc:			Reporting procedure for database sizes report
**	Auth:			Adam Bean (SQLSlayer.com)
**  Dependancies:	dbo.Split_fn
**	Date:			2010.08.11
*******************************************************************************
**  License
*******************************************************************************
**  Copyright © SQLSlayer.com. All rights reserved.
**  
**  All objects published by SQLSlayer.com are licensed and goverened by 
**  Creative Commons Attribution-Share Alike 3.0
**  http://creativecommons.org/licenses/by-sa/3.0/
**  
**  For more scripts and sample code, go to http://www.SQLSlayer.com
**  
**  You may alter this code for your own *non-commercial* purposes. You may
**  republish altered code as long as you give due credit.
**  
**  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF 
**  ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED 
**  TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
**  PARTICULAR PURPOSE.
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  YYYYDDMM	Full Name	
********************************************************************************************************/

CREATE PROCEDURE [rpt].[DBSizes_Summary]
(
	@Environment	VARCHAR(128)	= NULL
	,@ServerName	VARCHAR(MAX)	= NULL
	,@DBName		VARCHAR(MAX)	= NULL
	,@DateStart		DATETIME		= NULL
	,@DateEnd		DATETIME		= NULL
)

AS

SET NOCOUNT ON

SELECT 
	[Environment]
	,[ServerName]
	,[DBName]             
	,[DataSizeMB]
	,[DataSizeMBIncrease]
	,[DataPercentChange]
	,[LogSizeMB]
	,[LogSizeMBIncrease]
	,[LogPercentChange]
	,[DataSizeUnusedMB]
	,[DataSizeUnusedMBIncrease]
	,[LogSizeUnusedMB]
	,[LogSizeUnusedMBIncrease]
	,[SampleDate]
FROM [rpt].[DBSizes_Summary_vw] s
LEFT JOIN [dbo].[Split_fn](@Environment,',') e
	ON s.[Environment] = e.[item]
LEFT JOIN [dbo].[Split_fn](@ServerName,',') sn
	ON s.[ServerName] = sn.[item]
LEFT JOIN [dbo].[Split_fn](@DBName,',') db
	ON s.[DBName] = db.[item]
WHERE (@DateStart IS NULL AND @DateEnd IS NULL OR [SampleDate] BETWEEN @DateStart AND @DateEnd)
AND ((e.[item] IS NOT NULL AND @Environment IS NOT NULL) OR @Environment IS NULL) -- Specified environment(s), or all
AND ((sn.[item] IS NOT NULL AND @ServerName IS NOT NULL) OR @ServerName IS NULL) -- Specified server name(s), or all
AND ((db.[item] IS NOT NULL AND @DBName IS NOT NULL) OR @DBName IS NULL) -- Specified database name(s), or all

SET NOCOUNT OFF
GO
PRINT N'Creating [dbo].[ServerInventory_SQL_SQLBackup_Audit_InsertValue]'
GO

/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_SQL_SQLBackup_Audit_InsertValue]
**  Desc:			Saves RedGate SQLBackup specific information to the attributes
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2010-08-02
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [dbo].[ServerInventory_SQL_SQLBackup_Audit_InsertValue] (
	@ServerID					INT
	,@Version					NVARCHAR(1000)
	,@License					NVARCHAR(1000)
	,@SerialNumber				NVARCHAR(1000)
)
AS

DECLARE @ALT dbo.AttributeListType

INSERT INTO @ALT (AttributeName,AttributeValue)
VALUES 
	('SQLBackup_Version',@Version)
	,('SQLBackup_License',@License)
	,('SQLBackup_SerialNumber',@SerialNumber)
	,('SQLBackup_AuditDate',CAST(GETDATE() AS NVARCHAR(1000)))

EXEC [dbo].[ServerInventory_SQL_SaveAttributes] @ServerID, @ALT

GO
--------------------------------------------------------------

