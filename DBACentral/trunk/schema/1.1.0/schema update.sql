USE [DBACentral]
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
USE [DBACentral]
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
IF NOT EXISTS (
	SELECT * 
	FROM fn_listextendedproperty(default, default, default, default, default, default, default)
	WHERE LEFT(CAST([value] AS VARCHAR(50)),3) = '1.0'
	AND [name] = 'Version'
)
BEGIN
	PRINT 'Current Version 1.0'
	ROLLBACK TRANSACTION
END

PRINT N'Creating schemata'
GO
CREATE SCHEMA [migrate]
AUTHORIZATION [dbo]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [report]
AUTHORIZATION [dbo]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping foreign keys from [hist].[Backups_History]'
GO
ALTER TABLE [hist].[Backups_History] DROP
CONSTRAINT [FK_BUHist_DatabaseID]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping foreign keys from [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'
GO
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] DROP
CONSTRAINT [FK_ServerInventory_SQL_DatabaseIDs_DatabaseID]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping foreign keys from [hist].[SpaceUsed_DatabaseSizes]'
GO
ALTER TABLE [hist].[SpaceUsed_DatabaseSizes] DROP
CONSTRAINT [FK_SI_DatabaseIDs_DatabaseID_2]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [hist].[ServerInventory_SQL_DatabaseIDs]'
GO
ALTER TABLE [hist].[ServerInventory_SQL_DatabaseIDs] DROP CONSTRAINT [PK__ServerIn__2C9BE40E3A81B327]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping index [UIX_DatabaseIDs_DatabaseName] from [hist].[ServerInventory_SQL_DatabaseIDs]'
GO
DROP INDEX [UIX_DatabaseIDs_DatabaseName] ON [hist].[ServerInventory_SQL_DatabaseIDs]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating types'
GO
CREATE TYPE [dbo].[DatabaseListType] AS TABLE
(
	[DBName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[DatabaseMaintenance_CheckDB_OK]'
GO
CREATE TABLE [hist].[DatabaseMaintenance_CheckDB_OK]
(
[HistServerID] [int] NOT NULL,
[DatabaseID] [int] NOT NULL,
[CheckDBID] [bigint] NOT NULL,
[DateCreated] [datetime] NOT NULL
) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [CIX_CheckDB_OK__DateCreated] on [hist].[DatabaseMaintenance_CheckDB_OK]'
GO
CREATE CLUSTERED INDEX [CIX_CheckDB_OK__DateCreated] ON [hist].[DatabaseMaintenance_CheckDB_OK] ([DateCreated]) WITH (FILLFACTOR=100) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Database__E9DF81BB7B71F792] on [hist].[DatabaseMaintenance_CheckDB_OK]'
GO
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_OK] ADD CONSTRAINT [PK__Database__E9DF81BB7B71F792] PRIMARY KEY NONCLUSTERED  ([HistServerID], [DatabaseID], [CheckDBID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[DatabaseMaintenance_CheckDB_Errors]'
GO
CREATE TABLE [hist].[DatabaseMaintenance_CheckDB_Errors]
(
[HistServerID] [int] NOT NULL,
[DatabaseID] [int] NOT NULL,
[CheckDBID] [bigint] NOT NULL,
[RunID] [uniqueidentifier] NOT NULL,
[DateCreated] [datetime] NOT NULL,
[Error] [int] NULL,
[Level] [int] NULL,
[State] [int] NULL,
[MessageText] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RepairLevel] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [int] NULL,
[ObjectID] [int] NULL,
[IndexId] [int] NULL,
[PartitionID] [bigint] NULL,
[AllocUnitID] [bigint] NULL,
[File] [int] NULL,
[Page] [int] NULL,
[Slot] [int] NULL,
[RefFile] [int] NULL,
[RefPage] [int] NULL,
[RefSlot] [int] NULL,
[Allocation] [int] NULL
) ON [History] TEXTIMAGE_ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [CIX_CheckDB_Errors__DateCreated] on [hist].[DatabaseMaintenance_CheckDB_Errors]'
GO
CREATE CLUSTERED INDEX [CIX_CheckDB_Errors__DateCreated] ON [hist].[DatabaseMaintenance_CheckDB_Errors] ([DateCreated]) WITH (FILLFACTOR=100) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Database__E9DF81BB75B91E3C] on [hist].[DatabaseMaintenance_CheckDB_Errors]'
GO
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_Errors] ADD CONSTRAINT [PK__Database__E9DF81BB75B91E3C] PRIMARY KEY NONCLUSTERED  ([HistServerID], [DatabaseID], [CheckDBID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IX_CheckDB_Errors__RunID] on [hist].[DatabaseMaintenance_CheckDB_Errors]'
GO
CREATE NONCLUSTERED INDEX [IX_CheckDB_Errors__RunID] ON [hist].[DatabaseMaintenance_CheckDB_Errors] ([RunID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [hist].[ServerInventory_SQL_DatabaseIDs]'
GO
ALTER TABLE [hist].[ServerInventory_SQL_DatabaseIDs] ALTER COLUMN [DBName] [sys].[sysname] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [UIX_DatabaseIDs_DatabaseName] on [hist].[ServerInventory_SQL_DatabaseIDs]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_DatabaseIDs_DatabaseName] ON [hist].[ServerInventory_SQL_DatabaseIDs] ([DBName]) INCLUDE ([DatabaseID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__ServerIn__2C9BE40E1705036E] on [hist].[ServerInventory_SQL_DatabaseIDs]'
GO
ALTER TABLE [hist].[ServerInventory_SQL_DatabaseIDs] ADD CONSTRAINT [PK__ServerIn__2C9BE40E1705036E] PRIMARY KEY NONCLUSTERED  ([DatabaseID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [hist].[SpaceUsed_TableSizes_vw]'
GO
ALTER VIEW [hist].[SpaceUsed_TableSizes_vw]
AS

SELECT 
	s.[ServerName]
	,d.[DBName]
	,t.[SchemaName]
	,t.[TableName]
	,det.[RowCount]
	,det.[ReservedSpaceKB]
	,det.[DataSpaceKB]
	,det.[IndexSizeKB]
	,det.[UnusedKB]
	,CASE WHEN det.[RowCount] = 0 THEN 0
	ELSE CAST(CAST(det.[ReservedSpaceKB] AS DECIMAL) / det.[RowCount] AS DECIMAL(10,3))
	END as [KB/Row]
	,det.[SampleDate]
FROM [hist].[SpaceUsed_TableSizes] det
INNER JOIN [hist].[ServerInventory_SQL_ServerDBTableIDs] m
	ON m.[ServerDBTableID] = det.[ServerDBTableID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON s.[ServerID] = m.[ServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON d.[DatabaseID] = m.[DatabaseID]
INNER JOIN [hist].[ServerInventory_SQL_TableIDs] t
	ON t.[TableID] = m.[TableID]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[DatabaseMaintenance_CheckDB_vw]'
GO

CREATE VIEW [hist].[DatabaseMaintenance_CheckDB_vw]
AS

SELECT
	s.[ServerName]		AS [ServerName]
	,d.[DBName]			AS [DatabaseName]
	,CAST(1 AS BIT)		AS [EncounteredError]
	,e.[RunID]
	,e.[DateCreated]
	,e.[Error]
	,e.[Level]
	,e.[State]
	,e.[MessageText]
	,e.[RepairLevel]
	,e.[Status]
	,e.[ObjectID]
	,e.[IndexId]
	,e.[PartitionID]
	,e.[AllocUnitID]
	,e.[File]
	,e.[Page]
	,e.[Slot]
	,e.[RefFile]
	,e.[RefPage]
	,e.[RefSlot]
	,e.[Allocation]
FROM [hist].[DatabaseMaintenance_CheckDB_Errors] e
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON s.[ServerID] = e.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON d.[DatabaseID] = e.[DatabaseID]

UNION ALL

SELECT
	s.[ServerName]		AS [ServerName]
	,d.[DBName]			AS [DatabaseName]
	,0
	,NULL	
	,o.[DateCreated]
	,NULL
	,NULL
	,NULL
	,'No errors encountered'
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
FROM [hist].[DatabaseMaintenance_CheckDB_OK] o
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON s.[ServerID] = o.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON d.[DatabaseID] = o.[DatabaseID]

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [hist].[ServerInventory_SQL_GetDatabaseID]'
GO
ALTER PROCEDURE [hist].[ServerInventory_SQL_GetDatabaseID] (
	@DBName				SYSNAME
	,@DatabaseID		INT OUTPUT
)
AS

SELECT 
	@DatabaseID = [DatabaseID]
FROM 
	[hist].[ServerInventory_SQL_DatabaseIDs] id
WHERE (id.[DBName] = @DBName AND @DBName IS NOT NULL)
OR (id.[DBName] IS NULL AND @DBName IS NULL)

IF @DatabaseID IS NULL
BEGIN
	INSERT INTO [hist].[ServerInventory_SQL_DatabaseIDs] (DBName) 
	VALUES (@DBName)
	
	SET @DatabaseID = SCOPE_IDENTITY()
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [hist].[ServerInventory_GetServerID]'
GO
ALTER PROCEDURE [hist].[ServerInventory_GetServerID] (
	@ServerName			VARCHAR(1000)
	,@ServerID			INT OUTPUT
)
AS

-- Find the ServerID
SELECT 
	@ServerID = [ServerID]
FROM 
	[hist].[ServerInventory_ServerIDs] id
WHERE (id.[ServerName] = @ServerName AND @ServerName IS NOT NULL)
OR (id.[ServerName] IS NULL AND @ServerName IS NULL)

IF @ServerID IS NULL
BEGIN
	INSERT INTO [hist].[ServerInventory_ServerIDs] (ServerName) 
	VALUES (@ServerName)
	
	SET @ServerID = SCOPE_IDENTITY()
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_Jobs]'
GO
CREATE TABLE [hist].[Jobs_SQL_Jobs]
(
[HistJobID] [int] NOT NULL IDENTITY(1, 1),
[HistServerID] [int] NULL,
[job_id] [uniqueidentifier] NOT NULL,
[name] [sys].[sysname] NOT NULL,
[enabled] [tinyint] NOT NULL,
[description] [nvarchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[start_step_id] [int] NOT NULL,
[category_id] [int] NOT NULL,
[owner_sid] [varbinary] (85) NOT NULL,
[delete_level] [int] NOT NULL,
[date_created] [datetime] NOT NULL,
[date_modified] [datetime] NOT NULL,
[version_number] [int] NOT NULL,
[DateCreated] [smalldatetime] NULL DEFAULT (getdate()),
[LastSeenOn] [smalldatetime] NULL DEFAULT (getdate())
) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Jobs_SQL__38632B71208E6DA8] on [hist].[Jobs_SQL_Jobs]'
GO
ALTER TABLE [hist].[Jobs_SQL_Jobs] ADD CONSTRAINT [PK__Jobs_SQL__38632B71208E6DA8] PRIMARY KEY CLUSTERED  ([HistJobID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [UIX_sysjobs_ServerID_job_id] on [hist].[Jobs_SQL_Jobs]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_sysjobs_ServerID_job_id] ON [hist].[Jobs_SQL_Jobs] ([HistServerID], [job_id], [date_modified]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_GetJobIDByName]'
GO

CREATE PROCEDURE [hist].[Jobs_SQL_GetJobIDByName]
(
	@ServerName						VARCHAR(200)
	,@JobName						SYSNAME
	,@HistJobID						INT OUTPUT
)
AS

SET NOCOUNT ON

DECLARE 
	@HistServerID					INT

EXEC [hist].[ServerInventory_GetServerID] @ServerName, @HistServerID OUTPUT

SELECT
	@HistJobID = MAX(j.[HistJobID])
FROM [hist].Jobs_SQL_Jobs j
WHERE j.[HistServerID] = @HistServerID
AND j.[name] = @JobName

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_JobSteps]'
GO
CREATE TABLE [hist].[Jobs_SQL_JobSteps]
(
[HistJobID] [int] NOT NULL,
[step_id] [int] NOT NULL,
[step_name] [sys].[sysname] NOT NULL,
[subsystem] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[command] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[flags] [int] NOT NULL,
[additional_parameters] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cmdexec_success_code] [int] NOT NULL,
[on_success_action] [tinyint] NOT NULL,
[on_success_step_id] [int] NOT NULL,
[on_fail_action] [tinyint] NOT NULL,
[on_fail_step_id] [int] NOT NULL,
[HistServerIDForServerCol] [int] NULL,
[HistDatabaseID] [int] NULL,
[database_user_name] [sys].[sysname] NULL,
[retry_attempts] [int] NOT NULL,
[retry_interval] [int] NOT NULL,
[os_run_priority] [int] NOT NULL,
[output_file_name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [smalldatetime] NULL DEFAULT (getdate())
) ON [History] TEXTIMAGE_ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Jobs_SQL__334D3699264746FE] on [hist].[Jobs_SQL_JobSteps]'
GO
ALTER TABLE [hist].[Jobs_SQL_JobSteps] ADD CONSTRAINT [PK__Jobs_SQL__334D3699264746FE] PRIMARY KEY CLUSTERED  ([HistJobID], [step_id]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_JobHistory]'
GO
CREATE TABLE [hist].[Jobs_SQL_JobHistory]
(
[HistJobID] [int] NOT NULL,
[instance_id] [int] NOT NULL,
[step_id] [int] NOT NULL,
[step_name] [sys].[sysname] NOT NULL,
[sql_message_id] [int] NOT NULL,
[sql_severity] [int] NOT NULL,
[message] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[run_status] [int] NOT NULL,
[run_datetime] [datetime] NOT NULL,
[run_duration] [int] NOT NULL,
[operator_id_emailed] [int] NOT NULL,
[operator_id_netsent] [int] NOT NULL,
[operator_id_paged] [int] NOT NULL,
[retries_attempted] [int] NOT NULL,
[HistServerID] [int] NULL,
[DateCreated] [smalldatetime] NULL DEFAULT (getdate())
) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Jobs_SQL__5FB8F35F2DE868C6] on [hist].[Jobs_SQL_JobHistory]'
GO
ALTER TABLE [hist].[Jobs_SQL_JobHistory] ADD CONSTRAINT [PK__Jobs_SQL__5FB8F35F2DE868C6] PRIMARY KEY CLUSTERED  ([HistJobID], [instance_id]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_JobHistory_vw]'
GO

CREATE VIEW [hist].[Jobs_SQL_JobHistory_vw]
AS

SELECT
	s.[ServerName]
	,j.[name]					AS [JobName]
	,jh.[instance_id]
	,jh.[step_id]
	,jh.[step_name]
	,jh.[sql_message_id]
	,jh.[sql_severity]
	,jh.[message]
	,jh.[run_status]
	,jh.[run_datetime]
	,jh.[run_duration]
	,jh.[operator_id_emailed]
	,jh.[operator_id_netsent]
	,jh.[operator_id_paged]
	,jh.[retries_attempted]
	,s2.[ServerName]			AS [server]
FROM [hist].[Jobs_SQL_JobHistory] jh
INNER JOIN [hist].[Jobs_SQL_Jobs] j
	ON j.[HistJobID] = jh.[HistJobID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON j.[HistServerID] = s.[ServerID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s2
	ON jh.[HistServerID] = s2.[ServerID]
	
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_Jobs_vw]'
GO



CREATE VIEW [hist].[Jobs_SQL_Jobs_vw]
AS

WITH CurrentJobs (HistJobID)
AS
(
	SELECT
		MAX([HistJobID])
	FROM [hist].[Jobs_SQL_Jobs]
	GROUP BY [HistServerID], [job_id]
)
SELECT
	s.[ServerName]
	,j.[name]
	,j.[job_id]
	,j.[HistJobID]
	,j.[enabled]
	,j.[description]
	,j.[start_step_id]
	,j.[category_id]
	,j.[owner_sid]
	,j.[delete_level]
	,j.[date_created]
	,j.[date_modified]
	,j.[version_number]
	,j.[DateCreated]
	,j.[LastSeenOn]
FROM [hist].[Jobs_SQL_Jobs] j
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON j.[HistServerID] = s.[ServerID]
INNER JOIN [CurrentJobs] cj
	ON j.[HistJobID] = cj.[HistJobID]
	


GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_JobSteps_vw]'
GO



CREATE VIEW [hist].[Jobs_SQL_JobSteps_vw]
AS

WITH [CurrentJobs] (HistJobID)
AS
(
	SELECT
		MAX([HistJobID])
	FROM [hist].[Jobs_SQL_Jobs]
	GROUP BY [HistServerID], [job_id]
)
SELECT
	job_s.[ServerName]
	,j.[name]				AS [JobName]
	,j.[job_id]
	,js.[HistJobID]
	,js.[step_id]
	,js.[step_name]
	,js.[subsystem]
	,js.[command]
	,js.[flags]
	,js.[additional_parameters]
	,js.[cmdexec_success_code]
	,js.[on_success_action]
	,js.[on_success_step_id]
	,js.[on_fail_action]
	,js.[on_fail_step_id]
	,s.[ServerName]			AS [server]
	,d.[DBName]				AS [database_name]
	,js.[database_user_name]
	,js.[retry_attempts]
	,js.[retry_interval]
	,js.[os_run_priority]
	,js.[output_file_name]
	,js.[DateCreated]
FROM [hist].[Jobs_SQL_JobSteps] js
INNER JOIN [hist].[Jobs_SQL_Jobs] j
	ON js.[HistJobID] = j.[HistJobID]
INNER JOIN [hist].[ServerInventory_ServerIDs] job_s
	ON job_s.[ServerID] = j.[HistServerID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON s.[ServerID] = js.[HistServerIDForServerCol]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON js.[HistDatabaseID] = d.[DatabaseID]
INNER JOIN [CurrentJobs] cj
	ON js.[HistJobID] = cj.[HistJobID]




GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [report].[SpaceUsed_AvgDBGrowthPerDay]'
GO
/*******************************************************************************************************
**	Name:			[report].[SpaceUsed_AvgDBGrowthPerDay]
**	Desc:			Reporting procedure to get average database growth per day
**	Auth:			Matt Stanford
**	Debug:			
DECLARE
	@Exclusions	[DatabaseListType]
	
INSERT INTO @Exclusions
VALUES('OECArchive'),('OECImports'),('admin'),('master'),('model'),('OECFaxManager'),('tempdb'),('OECConquest')

EXEC [report].[SpaceUsed_AvgDBGrowthPerDay] '2009-01-17', '2009-04-01', 'S227938HZ1SQL1\Legacy', @Exclusions

**	Date:			2009-04-28
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:		Description:
**	--------	--------	---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [report].[SpaceUsed_AvgDBGrowthPerDay] (
	@StartDate		DATETIME
	,@EndDate		DATETIME
	,@ServerName	VARCHAR(200)
	,@Exclusions	[DatabaseListType] READONLY
)
AS 
SET NOCOUNT ON 
/*
-- DEBUG!!!
DECLARE
	@StartDate		DATETIME
	,@EndDate		DATETIME
	,@ServerName	VARCHAR(200)
	,@Exclusions	[DatabaseListType]
	
INSERT INTO @Exclusions
VALUES('OECArchive'),('OECImports'),('admin'),('master'),('model'),('OECFaxManager'),('tempdb'),('OECConquest')
	
SET @StartDate = '2009-01-17'
SET @EndDate = '2009-04-01'
SET @ServerName = 's227938hz1sql1\legacy'
*/
----
DECLARE 
	@InitValue		BIGINT
	,@FinalValue	BIGINT
	,@Diff			BIGINT
	,@Days			INT
	
SET @Days = DATEDIFF(day,@StartDate,@EndDate)
	
SELECT
	@InitValue = SUM(ds.[DataSizeMB]) + SUM(ds.[LogSizeMB])
FROM [hist].[SpaceUsed_DatabaseSizes_vw] ds
LEFT OUTER JOIN @Exclusions ex
	ON ds.[DBName] = ex.[DBName]
WHERE ex.[DBName] IS NULL
AND ds.[SampleDate] BETWEEN @StartDate AND DATEADD(day,1,@StartDate)
AND ds.[ServerName] = @ServerName

SELECT
	@FinalValue = SUM(ds.[DataSizeMB]) + SUM(ds.[LogSizeMB])
FROM [hist].[SpaceUsed_DatabaseSizes_vw] ds
LEFT OUTER JOIN @Exclusions ex
	ON ds.[DBName] = ex.[DBName]
WHERE ex.[DBName] IS NULL
AND ds.[SampleDate] BETWEEN DATEADD(day,-1,@EndDate) AND @EndDate
AND ds.[ServerName] = @ServerName

SET @Diff = @FinalValue - @InitValue

SELECT 
	@InitValue AS [Initial Size (MB)]
	,@FinalValue AS [Final Size (MB)]
	,CAST(@Diff AS DECIMAL(12,2))/@Days AS [Size (MB) Per Day Growth]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[General_Paths]'
GO
CREATE TABLE [hist].[General_Paths]
(
[HistPathID] [int] NOT NULL IDENTITY(1, 1),
[Path] [varchar] (900) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [date] NULL DEFAULT (getdate())
) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_HistPathID] on [hist].[General_Paths]'
GO
ALTER TABLE [hist].[General_Paths] ADD CONSTRAINT [PK_HistPathID] PRIMARY KEY CLUSTERED  ([HistPathID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [UIX_Paths] on [hist].[General_Paths]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Paths] ON [hist].[General_Paths] ([Path]) WITH (FILLFACTOR=90) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[General_GetPathID]'
GO

CREATE PROCEDURE [hist].[General_GetPathID] (
	@Path					VARCHAR(900)
	,@HistPathID			INT OUTPUT
)
AS

SET NOCOUNT ON

SELECT
	@HistPathID = [HistPathID]
FROM [hist].[General_Paths] p
WHERE p.[Path] = @Path

IF @HistPathID IS NULL AND @Path IS NOT NULL
BEGIN
	INSERT INTO [hist].[General_Paths] ([Path])
	VALUES (@Path)
	
	SET @HistPathID = SCOPE_IDENTITY()
END
	
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[General_FileNames]'
GO
CREATE TABLE [hist].[General_FileNames]
(
[HistFileNameID] [int] NOT NULL IDENTITY(1, 1),
[FileName] [varchar] (900) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [date] NULL DEFAULT (getdate())
) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_HistFileNameID] on [hist].[General_FileNames]'
GO
ALTER TABLE [hist].[General_FileNames] ADD CONSTRAINT [PK_HistFileNameID] PRIMARY KEY CLUSTERED  ([HistFileNameID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [UIX_FileNames] on [hist].[General_FileNames]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_FileNames] ON [hist].[General_FileNames] ([FileName]) WITH (FILLFACTOR=90) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[General_GetFileNameID]'
GO

CREATE PROCEDURE [hist].[General_GetFileNameID] (
	@FileName				VARCHAR(900)
	,@HistFileNameID		INT OUTPUT
)
AS

SET NOCOUNT ON

SELECT
	@HistFileNameID = [HistFileNameID]
FROM [hist].[General_FileNames] f
WHERE f.[FileName] = @FileName

IF @HistFileNameID IS NULL AND @FileName IS NOT NULL
BEGIN
	INSERT INTO [hist].[General_FileNames] ([FileName])
	VALUES (@FileName)
	
	SET @HistFileNameID = SCOPE_IDENTITY()
END
	
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[General_FullFileName]'
GO
CREATE TABLE [hist].[General_FullFileName]
(
[HistPathFileNameID] [int] NOT NULL IDENTITY(1, 1),
[HistPathID] [int] NULL,
[HistFileNameID] [int] NULL,
[DateCreated] [date] NULL DEFAULT (getdate())
) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_HistPathFileNameID] on [hist].[General_FullFileName]'
GO
ALTER TABLE [hist].[General_FullFileName] ADD CONSTRAINT [PK_HistPathFileNameID] PRIMARY KEY CLUSTERED  ([HistPathFileNameID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [UIX_FullFileName] on [hist].[General_FullFileName]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_FullFileName] ON [hist].[General_FullFileName] ([HistPathID], [HistFileNameID]) WITH (FILLFACTOR=90) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[SpaceUsed_FileSizes]'
GO
CREATE TABLE [hist].[SpaceUsed_FileSizes]
(
[HistServerID] [int] NOT NULL,
[HistPathFileNameID] [int] NOT NULL,
[FileAttribute] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileSizeKB] [bigint] NULL,
[SampleDate] [smalldatetime] NOT NULL DEFAULT (getdate())
) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_SpaceUsed_FileSizes] on [hist].[SpaceUsed_FileSizes]'
GO
ALTER TABLE [hist].[SpaceUsed_FileSizes] ADD CONSTRAINT [PK_SpaceUsed_FileSizes] PRIMARY KEY CLUSTERED  ([HistServerID], [SampleDate], [HistPathFileNameID]) ON [History]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[SpaceUsed_FileSizes_vw]'
GO

CREATE VIEW [hist].[SpaceUsed_FileSizes_vw]
AS

SELECT
	s.[ServerName]
	,p.[Path]
	,fn.[FileName]
	,CASE WHEN SUBSTRING(fs.[FileAttribute],1,1) = 'd'
		THEN 1
		ELSE 0
	END AS [IsDirectory]
	,CASE WHEN SUBSTRING(fs.[FileAttribute],2,1) = 'a'
		THEN 1
		ELSE 0
	END AS [IsArchiveSet]
	,CASE WHEN SUBSTRING(fs.[FileAttribute],3,1) = '?'
		THEN 1
		ELSE 0
	END AS [IsSomething]
	,CASE WHEN SUBSTRING(fs.[FileAttribute],4,1) = 'h'
		THEN 1
		ELSE 0
	END AS [IsHidden]
	,fs.[FileAttribute]
	,fs.[FileSizeKB]
	,fs.[SampleDate]
FROM [hist].[SpaceUsed_FileSizes] fs
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON fs.[HistServerID] = s.[ServerID]
INNER JOIN [hist].[General_FullFileName] ffn
	ON ffn.[HistPathFileNameID] = fs.[HistPathFileNameID]
INNER JOIN [hist].[General_Paths] p
	ON ffn.[HistPathID] = p.[HistPathID]
INNER JOIN [hist].[General_FileNames] fn
	ON ffn.[HistFileNameID] = fn.[HistFileNameID]

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[DatabaseMaintenance_InsertCheckDBResults]'
GO

CREATE PROCEDURE [hist].[DatabaseMaintenance_InsertCheckDBResults]
(
	@ServerName			SYSNAME
	,@DatabaseName		SYSNAME
	,@CheckDBID			BIGINT
	,@RunID				UNIQUEIDENTIFIER
	,@DateCreated		DATETIME
	,@Error				INT
	,@Level				INT
	,@State				INT
	,@MessageText		VARCHAR(MAX)
	,@RepairLevel		VARCHAR(128)
	,@Status			INT
	,@ObjectID			INT
	,@IndexID			INT
	,@PartitionID		BIGINT
	,@AllocUnitID		BIGINT
	,@File				INT
	,@Page				INT
	,@Slot				INT
	,@RefFile			INT
	,@RefPage			INT
	,@RefSlot			INT
	,@Allocation		INT
)
AS

SET NOCOUNT ON

DECLARE
	@IsOK			BIT
	,@HistServerID	INT
	,@DatabaseID	INT
	
-- Get the IDs for the insert
EXEC [hist].[ServerInventory_GetServerID] @ServerName, @HistServerID OUTPUT
EXEC [hist].[ServerInventory_SQL_GetDatabaseID] @DatabaseName, @DatabaseID OUTPUT

-- Logic to determine if the run was successful or not
IF COALESCE(@Error,@Level,@State) IS NOT NULL
	SET @IsOK = 0
ELSE
	SET @IsOK = 1
	
IF @IsOK = 1
BEGIN
	MERGE INTO [hist].[DatabaseMaintenance_CheckDB_OK] AS t
	USING (SELECT @HistServerID, @DatabaseID, @CheckDBID) AS s (HistServerID, DatabaseID, CheckDBID)
	ON s.[HistServerID] = t.[HistServerID]
	AND s.[DatabaseID] = t.[DatabaseID]
	AND s.[CheckDBID] = t.[CheckDBID]
	WHEN NOT MATCHED THEN
	INSERT ([HistServerID],[DatabaseID],[CheckDBID], [DateCreated])
	VALUES (@HistServerID,@DatabaseID,@CheckDBID,@DateCreated);
END
ELSE
BEGIN
	MERGE INTO [hist].[DatabaseMaintenance_CheckDB_Errors] AS t
	USING (SELECT @HistServerID, @DatabaseID, @CheckDBID) AS s (HistServerID, DatabaseID, CheckDBID)
	ON s.[HistServerID] = t.[HistServerID]
	AND s.[DatabaseID] = t.[DatabaseID]
	AND s.[CheckDBID] = t.[CheckDBID]
	WHEN NOT MATCHED THEN
	INSERT ([HistServerID],[DatabaseID],[RunID],[CheckDBID],[DateCreated],[Error],[Level],[State],[MessageText],[RepairLevel],[Status],[ObjectID],[IndexID]
	,[PartitionID],[AllocUnitID],[File],[Page],[Slot],[RefFile],[RefPage],[RefSlot],[Allocation])
	VALUES (@HistServerID,@DatabaseID,@RunID,@CheckDBID,@DateCreated,@Error,@Level,@State,@MessageText,@RepairLevel,@Status,@ObjectID,@IndexID
	,@PartitionID,@AllocUnitID,@File,@Page,@Slot,@RefFile,@RefPage,@RefSlot,@Allocation);
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[ServerInventory_SQL_AllServers_vw]'
GO

ALTER VIEW [dbo].[ServerInventory_SQL_AllServers_vw]
AS
SELECT 
	m.[ServerID]
	,m.[ServerName]
	,m.[InstanceName]
	,m.[PortNumber]
	,CASE 
		WHEN m.[InstanceName] IS NOT NULL AND m.[PortNumber] IS NOT NULL
			THEN m.[ServerName] + '\' + m.[InstanceName] + ',' + CAST(m.[PortNumber] AS VARCHAR(10))
		WHEN m.[InstanceName] IS NOT NULL
			THEN m.[ServerName] + '\' + m.[InstanceName]
		WHEN m.[PortNumber] IS NOT NULL
			THEN m.[ServerName] + ',' + CAST(m.[PortNumber] AS VARCHAR(10))
		ELSE m.[ServerName]
	END as [FullName]
	,m.[SQLVersion]
	,env.[EnvironmentName]	as Environment
	,ed.[EditionName]		as Edition
	,m.[Description]
	,m.[UseCredential]
	,cred.[UserName]
	,cred.[Password]
	,'Data Source=' + CASE 
		WHEN m.[InstanceName] IS NOT NULL AND m.[PortNumber] IS NOT NULL
			THEN m.[ServerName] + '\' + m.[InstanceName] + ',' + CAST(m.[PortNumber] AS VARCHAR(10))
		WHEN m.[InstanceName] IS NOT NULL
			THEN m.[ServerName] + '\' + m.InstanceName
		WHEN m.[PortNumber] IS NOT NULL
			THEN m.[ServerName] + ',' + CAST(m.[PortNumber] AS VARCHAR(10))
		ELSE m.[ServerName]
	END + ';Initial Catalog=master;' + CASE
		WHEN m.[UseCredential] = 0 
			THEN 'Integrated Security=SSPI;'
		ELSE 'User Id=' + cred.[UserName] + ';Password=' + cred.[Password] + ';'
	END AS [DotNetConnectionString]
FROM [dbo].[ServerInventory_SQL_Master] m
INNER JOIN [dbo].[ServerInventory_Environments] env
	ON env.[EnvironmentID] = m.[EnvironmentID]
INNER JOIN [dbo].[ServerInventory_SQL_Editions] ed
	ON ed.[EditionID] = m.[EditionID]
LEFT OUTER JOIN [dbo].[ServerInventory_SQL_ServerCredentials] cred
	ON cred.[CredentialID] = m.[CredentialID]
WHERE m.[Enabled] = 1

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_InsertJob]'
GO

CREATE PROCEDURE [hist].[Jobs_SQL_InsertJob]
(
	@ServerName						VARCHAR(200)
	,@job_id						UNIQUEIDENTIFIER
	,@name							SYSNAME
	,@enabled						TINYINT
	,@description					NVARCHAR(512)
	,@start_step_id					INT
	,@category_id					INT
	,@owner_sid						VARBINARY(85)
	,@delete_level					INT
	,@date_created					DATETIME
	,@date_modified					DATETIME
	,@version_number				INT
)
AS

SET NOCOUNT ON

DECLARE @HistServerID INT

EXEC [hist].[ServerInventory_GetServerID] @ServerName, @HistServerID OUTPUT

-- See if we've already got a record
IF NOT EXISTS(
	SELECT
		*
	FROM [hist].[Jobs_SQL_Jobs] j
	WHERE j.[HistServerID] = @HistServerID
	AND j.[job_id] = @job_id
	AND j.[date_modified] = @date_modified
)
-- No record found, do an insert
BEGIN

	INSERT INTO [hist].[Jobs_SQL_Jobs] ([HistServerID], [job_id], [name], [enabled], [description], [start_step_id], [category_id], [owner_sid], [delete_level], [date_created], [date_modified], [version_number])
	VALUES (@HistServerID, @job_id, @name, @enabled, @description, @start_step_id, @category_id, @owner_sid, @delete_level, @date_created, @date_modified, @version_number)

	SELECT 1
END
ELSE
BEGIN
	UPDATE j
		SET j.[LastSeenOn] = GETDATE()
	FROM [hist].[Jobs_SQL_Jobs] j
	WHERE j.[HistServerID] = @HistServerID
	AND j.[job_id] = @job_id
	AND j.[date_modified] = @date_modified

	SELECT 0
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_InsertJobStep]'
GO

CREATE PROCEDURE [hist].[Jobs_SQL_InsertJobStep]
(
	@ServerName						VARCHAR(200)
	,@JobName						SYSNAME
	,@step_id						INT
	,@step_name						SYSNAME
	,@subsystem						NVARCHAR(40)
	,@command						NVARCHAR(max)
	,@flags							INT
	,@additional_parameters			NTEXT
	,@cmdexec_success_code			INT
	,@on_success_action				TINYINT
	,@on_success_step_id			INT
	,@on_fail_action				TINYINT
	,@on_fail_step_id				INT
	,@server						SYSNAME
	,@database_name					SYSNAME
	,@database_user_name			SYSNAME
	,@retry_attempts				INT
	,@retry_interval				INT
	,@os_run_priority				INT
	,@output_file_name				NVARCHAR(200)
)
AS

SET NOCOUNT ON

DECLARE
	@HistDatabaseID		INT
	,@HistServerID		INT
	,@HistJobID			INT
	
-- Lookup some IDs
EXEC [hist].[ServerInventory_GetServerID] @server, @HistServerID OUTPUT
EXEC [hist].[ServerInventory_SQL_GetDatabaseID] @database_name, @HistDatabaseID OUTPUT
EXEC [hist].[Jobs_SQL_GetJobIDByName] @ServerName, @JobName, @HistJobID OUTPUT

-- If the step does not already exist then add it
IF NOT EXISTS(SELECT * FROM [hist].[Jobs_SQL_JobSteps] WHERE [HistJobID] = @HistJobID AND [step_id] = @step_id)
BEGIN
	INSERT INTO [hist].[Jobs_SQL_JobSteps] ([HistJobID], [step_id], [step_name], [subsystem], [command], [flags], [additional_parameters], [cmdexec_success_code], [on_success_action], [on_success_step_id], [on_fail_action], [on_fail_step_id], [HistServerIDForServerCol], [HistDatabaseID], [database_user_name], [retry_attempts], [retry_interval], [os_run_priority], [output_file_name])
	VALUES (@HistJobID, @step_id, @step_name, @subsystem, @command, @flags, @additional_parameters, @cmdexec_success_code, @on_success_action, @on_success_step_id, @on_fail_action, @on_fail_step_id, @HistServerID, @HistDatabaseID, @database_user_name, @retry_attempts, @retry_interval, @os_run_priority, @output_file_name)
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[Jobs_SQL_InsertJobHistory]'
GO

CREATE PROCEDURE [hist].[Jobs_SQL_InsertJobHistory]
(
	@ServerName						VARCHAR(200)
	,@JobName						SYSNAME
	,@instance_id					INT
	,@step_id						INT
	,@step_name						SYSNAME
	,@sql_message_id				INT
	,@sql_severity					INT
	,@message						NVARCHAR(1024)
	,@run_status					INT
	,@run_date						INT
	,@run_time						INT
	,@run_duration					INT
	,@operator_id_emailed			INT
	,@operator_id_netsent			INT
	,@operator_id_paged				INT
	,@retries_attempted				INT
	,@server						SYSNAME
)

AS

SET NOCOUNT ON

DECLARE 
	@HistJobID						INT
	,@run_datetime					DATETIME
	,@HistServerID					INT
	,@dt							CHAR(8)
	,@tm							CHAR(6)
	
EXEC [hist].[Jobs_SQL_GetJobIDByName] @ServerName, @JobName, @HistJobID OUTPUT
EXEC [hist].[ServerInventory_GetServerID] @server, @HistServerID OUTPUT

SET @dt = RIGHT('00000000' + CAST(@run_date AS VARCHAR(8)),8)
SET @tm = RIGHT('000000' + CAST(@run_time AS VARCHAR(6)),6)

SET @run_datetime = CAST(LEFT(@dt,4) + '-' + SUBSTRING(@dt,5,2) + '-' + RIGHT(@dt,2) + ' ' + LEFT(@tm,2) + ':' + SUBSTRING(@tm,3,2) + ':' + RIGHT(@tm,2) AS DATETIME)

IF @HistJobID IS NOT NULL
BEGIN

	IF NOT EXISTS (SELECT * FROM [hist].[Jobs_SQL_JobHistory] WHERE [HistJobID] = @HistJobID AND [instance_id] = @instance_id)
	BEGIN
		-- INSERT The record
		INSERT INTO [hist].[Jobs_SQL_JobHistory] ([HistJobID], [instance_id], [step_id], [step_name], [sql_message_id], [sql_severity], [message], [run_status], [run_datetime], [run_duration], [operator_id_emailed], [operator_id_netsent], [operator_id_paged], [retries_attempted], [HistServerID])
		VALUES(@HistJobID,@instance_id,@step_id,@step_name,@sql_message_id,@sql_severity,@message,@run_status,@run_datetime,@run_duration,@operator_id_emailed,@operator_id_netsent,@operator_id_paged,@retries_attempted,@HistServerID)
	
	END

END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[General_GetFullFileNameID]'
GO

CREATE PROCEDURE [hist].[General_GetFullFileNameID] (
	@Path					VARCHAR(900)
	,@FileName				VARCHAR(900)
	,@FullFileNameID		INT OUTPUT
)
AS

SET NOCOUNT ON

DECLARE
	@HistPathID				INT
	,@HistFileNameID		INT
	
EXEC [hist].[General_GetPathID] @Path, @HistPathID OUTPUT
EXEC [hist].[General_GetFileNameID] @FileName, @HistFileNameID OUTPUT

SELECT
	@FullFileNameID = ffn.[HistPathFileNameID]
FROM [hist].[General_FullFileName] ffn
WHERE ffn.[HistPathID] = @HistPathID
AND ffn.[HistFileNameID] = @HistFileNameID

IF @FullFileNameID IS NULL
BEGIN
	INSERT INTO [hist].[General_FullFileName] ([HistPathID],[HistFileNameID])
	VALUES (@HistPathID,@HistFileNameID)
	
	SET @FullFileNameID = SCOPE_IDENTITY()
END
	
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [hist].[SpaceUsed_FileSizes_InsertValue]'
GO

CREATE PROCEDURE [hist].[SpaceUsed_FileSizes_InsertValue] (
	@ServerName				VARCHAR(200)
	,@Path					VARCHAR(900)
	,@FileName				VARCHAR(900)
	,@FileAttributes		VARCHAR(5)
	,@FileSizeKB			BIGINT
)
AS

SET NOCOUNT ON

DECLARE
	@HistServerID			INT
	,@HistFullNameID		INT

EXEC [hist].[ServerInventory_GetServerID] @ServerName, @HistServerID OUTPUT
EXEC [hist].[General_GetFullFileNameID] @Path, @FileName, @HistFullNameID OUTPUT

IF @HistServerID IS NOT NULL AND @HistFullNameID IS NOT NULL
BEGIN
	INSERT INTO [hist].[SpaceUsed_FileSizes] ([HistServerID], [HistPathFileNameID], [FileSizeKB], [FileAttribute])
	VALUES (@HistServerID, @HistFullNameID, @FileSizeKB, @FileAttributes)

END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[DatabaseMaintenance_CheckDB_Errors]'
GO
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_Errors] ADD
CONSTRAINT [FK_CheckDB_Errors__HistServerID] FOREIGN KEY ([HistServerID]) REFERENCES [hist].[ServerInventory_ServerIDs] ([ServerID]),
CONSTRAINT [FK_CheckDB_Errors__DatabaseID] FOREIGN KEY ([DatabaseID]) REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[DatabaseMaintenance_CheckDB_OK]'
GO
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_OK] ADD
CONSTRAINT [FK_CheckDB_OK__HistServerID] FOREIGN KEY ([HistServerID]) REFERENCES [hist].[ServerInventory_ServerIDs] ([ServerID]),
CONSTRAINT [FK_CheckDB_OK__DatabaseID] FOREIGN KEY ([DatabaseID]) REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[General_FullFileName]'
GO
ALTER TABLE [hist].[General_FullFileName] ADD
CONSTRAINT [FK_FullFileName__HistFileNameID] FOREIGN KEY ([HistFileNameID]) REFERENCES [hist].[General_FileNames] ([HistFileNameID]) ON DELETE CASCADE,
CONSTRAINT [FK_FullFileName__HistPathID] FOREIGN KEY ([HistPathID]) REFERENCES [hist].[General_Paths] ([HistPathID]) ON DELETE CASCADE
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[SpaceUsed_FileSizes]'
GO
ALTER TABLE [hist].[SpaceUsed_FileSizes] ADD
CONSTRAINT [FK_FileSizes__HistPathFileNameID] FOREIGN KEY ([HistPathFileNameID]) REFERENCES [hist].[General_FullFileName] ([HistPathFileNameID]) ON DELETE CASCADE,
CONSTRAINT [FK_FileSizes__HistServerID] FOREIGN KEY ([HistServerID]) REFERENCES [hist].[ServerInventory_ServerIDs] ([ServerID])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[Jobs_SQL_JobHistory]'
GO
ALTER TABLE [hist].[Jobs_SQL_JobHistory] ADD
CONSTRAINT [FK_JobHistory_JobID] FOREIGN KEY ([HistJobID]) REFERENCES [hist].[Jobs_SQL_Jobs] ([HistJobID]),
CONSTRAINT [FK_JobHistory_HistServerID] FOREIGN KEY ([HistServerID]) REFERENCES [hist].[ServerInventory_ServerIDs] ([ServerID])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[Jobs_SQL_JobSteps]'
GO
ALTER TABLE [hist].[Jobs_SQL_JobSteps] ADD
CONSTRAINT [FK_sysjobsteps_JobID] FOREIGN KEY ([HistJobID]) REFERENCES [hist].[Jobs_SQL_Jobs] ([HistJobID]),
CONSTRAINT [FK_sysjobsteps_HistServerID] FOREIGN KEY ([HistServerIDForServerCol]) REFERENCES [hist].[ServerInventory_ServerIDs] ([ServerID]),
CONSTRAINT [FK_sysjobsteps_HistDatabaseID] FOREIGN KEY ([HistDatabaseID]) REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[Jobs_SQL_Jobs]'
GO
ALTER TABLE [hist].[Jobs_SQL_Jobs] ADD
CONSTRAINT [FK_SQL_sysjobs_ServerID] FOREIGN KEY ([HistServerID]) REFERENCES [hist].[ServerInventory_ServerIDs] ([ServerID])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[Backups_History]'
GO
ALTER TABLE [hist].[Backups_History] ADD
CONSTRAINT [FK_BUHist_DatabaseID] FOREIGN KEY ([DatabaseID]) REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'
GO
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] ADD
CONSTRAINT [FK_ServerInventory_SQL_DatabaseIDs_DatabaseID] FOREIGN KEY ([DatabaseID]) REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [hist].[SpaceUsed_DatabaseSizes]'
GO
ALTER TABLE [hist].[SpaceUsed_DatabaseSizes] ADD
CONSTRAINT [FK_SI_DatabaseIDs_DatabaseID_2] FOREIGN KEY ([DatabaseID]) REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Stamping database version 1.1.0'
EXEC sys.sp_updateextendedproperty @name=N'Version', @value=N'1.1.0'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
