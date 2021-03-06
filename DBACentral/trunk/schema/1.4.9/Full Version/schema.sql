USE [DBACentral]
GO
/****** Object:  Schema [audit]    Script Date: 01/05/2011 14:39:49 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'audit')
EXEC sys.sp_executesql N'CREATE SCHEMA [audit] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [hist]    Script Date: 01/05/2011 14:39:49 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'hist')
EXEC sys.sp_executesql N'CREATE SCHEMA [hist] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [migrate]    Script Date: 01/05/2011 14:39:49 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'migrate')
EXEC sys.sp_executesql N'CREATE SCHEMA [migrate] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [mon]    Script Date: 01/05/2011 14:39:49 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'mon')
EXEC sys.sp_executesql N'CREATE SCHEMA [mon] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [ref]    Script Date: 01/05/2011 14:39:49 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ref')
EXEC sys.sp_executesql N'CREATE SCHEMA [ref] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [rpt]    Script Date: 01/05/2011 14:39:49 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'rpt')
EXEC sys.sp_executesql N'CREATE SCHEMA [rpt] AUTHORIZATION [dbo]'
GO
/****** Object:  Table [hist].[ServerInventory_ServerIDs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_ServerIDs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_ServerIDs](
	[HistServerID] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ServerInventory_ServerIDs__HistServerID] PRIMARY KEY NONCLUSTERED 
(
	[HistServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_ServerIDs]') AND name = N'UIX_ServerIDs_ServerName')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_ServerIDs_ServerName] ON [hist].[ServerInventory_ServerIDs] 
(
	[ServerName] ASC
)
INCLUDE ( [HistServerID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  Table [dbo].[ServerInventory_Environments]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_Environments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_Environments](
	[EnvironmentID] [tinyint] IDENTITY(1,1) NOT NULL,
	[EnvironmentName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ServerInventory_Environments__EnvironmentID] PRIMARY KEY NONCLUSTERED 
(
	[EnvironmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServerInventory_Applications]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_Applications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ServerInventory_Applications__ApplicationID] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServerInventory_Owners]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_Owners]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_Owners](
	[OwnerID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerName] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ServerInventory_Owners__OwnerID] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[General_Paths]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[General_Paths]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[General_Paths](
	[HistPathID] [int] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](900) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK__General_Paths__HistPathID] PRIMARY KEY CLUSTERED 
(
	[HistPathID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[General_Paths]') AND name = N'UIX_Paths')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Paths] ON [hist].[General_Paths] 
(
	[Path] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [History]
GO
/****** Object:  Table [hist].[DTSStore_Descriptions]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_Descriptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[DTSStore_Descriptions](
	[DescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__DTSStore_Descriptions__DescriptionID] PRIMARY KEY CLUSTERED 
(
	[DescriptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_Descriptions]') AND name = N'UIX_Descriptions_1')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Descriptions_1] ON [hist].[DTSStore_Descriptions] 
(
	[Description] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  Table [hist].[DTSStore_Categories]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[DTSStore_Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID_GUID] [uniqueidentifier] NOT NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__DTSStore_Categories__CategoryID] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_Categories]') AND name = N'UIX_Categories_1')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Categories_1] ON [hist].[DTSStore_Categories] 
(
	[CategoryID_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  Table [hist].[General_FileNames]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[General_FileNames]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[General_FileNames](
	[HistFileNameID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](900) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK__General_FileNames__HistFileNameID] PRIMARY KEY CLUSTERED 
(
	[HistFileNameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[General_FileNames]') AND name = N'UIX_FileNames')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_FileNames] ON [hist].[General_FileNames] 
(
	[FileName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [History]
GO
/****** Object:  Table [dbo].[NTPermissions_PermissionSQLStatements]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NTPermissions_PermissionSQLStatements]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NTPermissions_PermissionSQLStatements](
	[StatementID] [int] IDENTITY(1,1) NOT NULL,
	[SQLToExecute] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompatVersionStart] [int] NULL,
	[CompatVersionEnd] [int] NULL,
 CONSTRAINT [PK__NTPermissions_PermissionSQLStatements__StatementID] PRIMARY KEY CLUSTERED 
(
	[StatementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rpt].[Reporting_Environments]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rpt].[Reporting_Environments]') AND type in (N'U'))
BEGIN
CREATE TABLE [rpt].[Reporting_Environments](
	[Environment] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EnvironmentCategory] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[DTSStore_PackageNames]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_PackageNames]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[DTSStore_PackageNames](
	[PackageNameID] [int] IDENTITY(1,1) NOT NULL,
	[PackageName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PackageID] [uniqueidentifier] NOT NULL,
	[datecreated] [smalldatetime] NULL,
 CONSTRAINT [PK__DTSStore_PackageNames__PackageNameID] PRIMARY KEY CLUSTERED 
(
	[PackageNameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_PackageNames]') AND name = N'UIX_PackageNames_1')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_PackageNames_1] ON [hist].[DTSStore_PackageNames] 
(
	[PackageName] ASC,
	[PackageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  Table [hist].[DTSStore_Owners]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_Owners]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[DTSStore_Owners](
	[OwnerID] [int] IDENTITY(1,1) NOT NULL,
	[Owner] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Owner_sid] [varbinary](85) NOT NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__DTSStore_Owners__OwnerID] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_Owners]') AND name = N'UIX_Owners_1')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Owners_1] ON [hist].[DTSStore_Owners] 
(
	[Owner] ASC,
	[Owner_sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  UserDefinedTableType [dbo].[DatabaseListType]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'DatabaseListType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[DatabaseListType] AS TABLE(
	[DBName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
/****** Object:  Table [dbo].[Collectors_Scripts]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Collectors_Scripts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Collectors_Scripts](
	[ScriptID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Definition] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Enabled] [bit] NULL,
	[Language] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Collectors_Scripts__ScriptID] PRIMARY KEY CLUSTERED 
(
	[ScriptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Collectors_RecipeMaster]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Collectors_RecipeMaster](
	[RecipeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Enabled] [bit] NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Collectors_RecipeMaster__RecipeID] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[Backups_Types]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Backups_Types]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Backups_Types](
	[BackupTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BackupType] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BackupTypeDesc] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Backups_Types__BackupTypeID] PRIMARY KEY CLUSTERED 
(
	[BackupTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Backups_Types]') AND name = N'UIX_Backups_Types')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Backups_Types] ON [hist].[Backups_Types] 
(
	[BackupType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  Table [dbo].[Backups_SrvSettings]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Backups_SrvSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Backups_SrvSettings](
	[id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[jobName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[srvName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[targetSrv] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[targetShare] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dbRecord] [bit] NULL,
	[buExceptions] [bit] NULL,
	[buAgent] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[alertLevel] [int] NULL,
	[jobEnabled] [bit] NULL,
	[buType] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[loggingLevel] [int] NULL,
	[compressLevel] [int] NULL,
	[buTHreads] [int] NULL,
	[buStart] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[buTime] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[buDuration] [int] NULL,
	[nagHost] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[nagSvc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[checkFile1] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[checkFile2] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[runJob1] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[runJob2] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[runEXE] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lsPath] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sqlVersion] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lsVersion] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Backups_SrvSettings]') AND name = N'IX_SrvSettings')
CREATE CLUSTERED INDEX [IX_SrvSettings] ON [dbo].[Backups_SrvSettings] 
(
	[srvName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[AttributeListType]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'AttributeListType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[AttributeListType] AS TABLE(
	[AttributeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AttributeValue] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
/****** Object:  Table [dbo].[Backups_BackupAgents]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Backups_BackupAgents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Backups_BackupAgents](
	[BackupAgentID] [int] IDENTITY(1,1) NOT NULL,
	[BackupAgentKey] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Backups_BackupAgents__BackupAgentID] PRIMARY KEY CLUSTERED 
(
	[BackupAgentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Backups_BackupTypes]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Backups_BackupTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Backups_BackupTypes](
	[BackupTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BackupTypeKey] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Backups_BackupTypes__BackupTypeID] PRIMARY KEY CLUSTERED 
(
	[BackupTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[Backups_BackupJobHistory]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Backups_BackupJobHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Backups_BackupJobHistory](
	[JobName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ServerName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartTime] [smalldatetime] NOT NULL,
	[FinishTime] [smalldatetime] NOT NULL,
	[nbrDBs] [int] NOT NULL,
	[sizeDBs] [bigint] NULL,
	[jobOutcome] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[buLocation] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sqlbuSize] [int] NULL,
	[Schedule] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[Backups_Devices]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Backups_Devices]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Backups_Devices](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Backups_Devices__DeviceID] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Backups_Devices]') AND name = N'UIX_Backups_Devices')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Backups_Devices] ON [hist].[Backups_Devices] 
(
	[DeviceName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  Table [dbo].[ChangeControl_PackageMaster]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeControl_PackageMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChangeControl_PackageMaster](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[PackageLabel] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Year] [smallint] NULL,
	[Type] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number] [smallint] NULL,
	[Revision] [tinyint] NULL,
	[Description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__ChangeControl_PackageMaster__PackageID] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChangeControl_DeployMaster]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChangeControl_DeployMaster](
	[DeployID] [int] IDENTITY(1,1) NOT NULL,
	[DeployName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [FK__ChangeControl_DeployMaster__DeployID] PRIMARY KEY CLUSTERED 
(
	[DeployID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[ChangeTracking_SQL_ActionIDs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ActionIDs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ChangeTracking_SQL_ActionIDs](
	[ActionID] [int] IDENTITY(1,1) NOT NULL,
	[ActionType] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ChangeTracking_SQL_ActionIDs__ActionID] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[ChangeControl_ScriptMaster]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeControl_ScriptMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ChangeControl_ScriptMaster](
	[ScriptID] [int] IDENTITY(1,1) NOT NULL,
	[Definition] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FileName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ChangeControl_ScriptMaster__ScriptID] PRIMARY KEY CLUSTERED 
(
	[ScriptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[ChangeTracking_SQL_ObjectTypeIDs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ObjectTypeIDs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ChangeTracking_SQL_ObjectTypeIDs](
	[ObjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SQLType] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RefType] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SqlDesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ChangeTracking_SQL_ObjectTypeIDs__ObjectTypeId] PRIMARY KEY CLUSTERED 
(
	[ObjectTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[Users_UserNames]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Users_UserNames]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Users_UserNames](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Users_UserNames__UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Users_UserNames]') AND name = N'UIX_UserNames_UserName')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_UserNames_UserName] ON [hist].[Users_UserNames] 
(
	[UserName] ASC
)
INCLUDE ( [UserID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  Table [ref].[SQLServer_RunStatus]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ref].[SQLServer_RunStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [ref].[SQLServer_RunStatus](
	[RefRunStatusID] [int] IDENTITY(1,1) NOT NULL,
	[RunStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK__SQLServer_RunStatus__RefRunStatusID] PRIMARY KEY CLUSTERED 
(
	[RefRunStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ref].[SQLServer_LockModes]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ref].[SQLServer_LockModes]') AND type in (N'U'))
BEGIN
CREATE TABLE [ref].[SQLServer_LockModes](
	[RefLockModeID] [int] IDENTITY(1,1) NOT NULL,
	[LockMode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LockName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK__SQLServer_LockModes__RefLockModeID] PRIMARY KEY CLUSTERED 
(
	[RefLockModeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ref].[SQLServer_IsolationLevels]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ref].[SQLServer_IsolationLevels]') AND type in (N'U'))
BEGIN
CREATE TABLE [ref].[SQLServer_IsolationLevels](
	[RefIsolationLevelID] [int] IDENTITY(1,1) NOT NULL,
	[IsolationLevel] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK__SQLServer_IsolationLevels__RefIsolationLevelID] PRIMARY KEY CLUSTERED 
(
	[RefIsolationLevelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ref].[ServerInventory_SQL_ServerVersions]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ref].[ServerInventory_SQL_ServerVersions]') AND type in (N'U'))
BEGIN
CREATE TABLE [ref].[ServerInventory_SQL_ServerVersions](
	[RefSQLVersionID] [int] IDENTITY(1,1) NOT NULL,
	[SQLVersionText] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SQLVersion] [decimal](5, 2) NULL,
	[StartingBuild] [decimal](7, 2) NULL,
	[EndingBuild] [decimal](7, 2) NULL,
 CONSTRAINT [PK__ServerInventory_SQL_ServerVersions__RefSQLVersionID] PRIMARY KEY CLUSTERED 
(
	[RefSQLVersionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServerInventory_SQL_ServerCredentials]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ServerCredentials]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_SQL_ServerCredentials](
	[CredentialID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Password] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ServerInventory_SQL_ServerCredentials__CredentialID] PRIMARY KEY CLUSTERED 
(
	[CredentialID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [hist].[ServerInventory_SQL_TableIDs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_TableIDs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_SQL_TableIDs](
	[TableID] [int] IDENTITY(1,1) NOT NULL,
	[SchemaName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TableName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK__ServerInventory_SQL_TableIDs__TableID] PRIMARY KEY NONCLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_TableIDs]') AND name = N'IX__ServerInventory_SQL_TableIDs__SchemaName_TableName')
CREATE NONCLUSTERED INDEX [IX__ServerInventory_SQL_TableIDs__SchemaName_TableName] ON [hist].[ServerInventory_SQL_TableIDs] 
(
	[SchemaName] ASC,
	[TableName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 85) ON [History]
GO
/****** Object:  Table [dbo].[ServerInventory_SQL_Editions]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Editions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_SQL_Editions](
	[EditionID] [smallint] IDENTITY(1,1) NOT NULL,
	[EditionName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ServerInventory_SQL_Editions__EditionID] PRIMARY KEY NONCLUSTERED 
(
	[EditionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[ServerInventory_SQL_ObjectIDs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ObjectIDs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_SQL_ObjectIDs](
	[ObjectID] [int] IDENTITY(1,1) NOT NULL,
	[SchemaName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ObjectName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SQLType] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ServerInventory_SQL_ObjectIDs__ObjectID] PRIMARY KEY NONCLUSTERED 
(
	[ObjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
/****** Object:  Table [ref].[ServerInventory_SQL_ConfigurationOptions]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ref].[ServerInventory_SQL_ConfigurationOptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [ref].[ServerInventory_SQL_ConfigurationOptions](
	[RefConfigOptionID] [int] IDENTITY(1,1) NOT NULL,
	[configuration_id] [int] NULL,
	[name] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[minimum] [sql_variant] NULL,
	[maximum] [sql_variant] NULL,
	[description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_dynamic] [bit] NULL,
	[is_advanced] [bit] NULL,
 CONSTRAINT [PK__ServerInventory_SQL_ConfigurationOptions__RefConfigOptionID] PRIMARY KEY CLUSTERED 
(
	[RefConfigOptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ServerInventory_SQL_BuildLevelDesc]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_BuildLevelDesc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_SQL_BuildLevelDesc](
	[ProductVersion] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SQLVersion] [smallint] NOT NULL,
	[Build] [int] NOT NULL,
	[ProductLevel] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ServicePack] [tinyint] NOT NULL,
	[CumulativeUpdate] [tinyint] NOT NULL,
	[Description] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReleaseDate] [smalldatetime] NULL,
	[KBArticle] [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Link] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ServerInventory_SQL_BuildLevelDesc__ProductVersion] PRIMARY KEY CLUSTERED 
(
	[ProductVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServerInventory_SQL_AttributeMaster]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_SQL_AttributeMaster](
	[AttribID] [int] IDENTITY(1,1) NOT NULL,
	[AttribName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK__ServerInventory_SQL_AttributeMaster__AttribID] PRIMARY KEY CLUSTERED 
(
	[AttribID] ASC
)WITH (PAD_INDEX  = ON, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeMaster]') AND name = N'IX_AttribName')
CREATE UNIQUE NONCLUSTERED INDEX [IX_AttribName] ON [dbo].[ServerInventory_SQL_AttributeMaster] 
(
	[AttribName] ASC
)WITH (PAD_INDEX  = ON, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
/****** Object:  Table [hist].[ServerInventory_SQL_DatabaseIDs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_DatabaseIDs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_SQL_DatabaseIDs](
	[DatabaseID] [int] IDENTITY(1,1) NOT NULL,
	[DBName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__ServerInventory_SQL_DatabaseIDs__DatabaseID] PRIMARY KEY NONCLUSTERED 
(
	[DatabaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_DatabaseIDs]') AND name = N'UIX_DatabaseIDs_DatabaseName')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_DatabaseIDs_DatabaseName] ON [hist].[ServerInventory_SQL_DatabaseIDs] 
(
	[DBName] ASC
)
INCLUDE ( [DatabaseID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  StoredProcedure [hist].[ServerInventory_SQL_GetDatabaseID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_GetDatabaseID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [hist].[ServerInventory_SQL_GetDatabaseID] (
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
' 
END
GO
/****** Object:  Table [hist].[ServerInventory_SQL_ConfigurationValues]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ConfigurationValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_SQL_ConfigurationValues](
	[HistConfigValueID] [int] IDENTITY(1,1) NOT NULL,
	[RefConfigOptionID] [int] NULL,
	[HistServerID] [int] NULL,
	[value] [sql_variant] NOT NULL,
	[value_in_use] [sql_variant] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateLastSeenOn] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__SQL_ConfigValues__HistConfigValueID] PRIMARY KEY CLUSTERED 
(
	[HistConfigValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
/****** Object:  Table [dbo].[ServerInventory_SQL_Master]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_SQL_Master](
	[ServerID] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[InstanceName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PortNumber] [int] NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SQLVersion] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[EnvironmentID] [tinyint] NOT NULL,
	[EditionID] [smallint] NOT NULL,
	[UseCredential] [bit] NULL,
	[CredentialID] [int] NULL,
 CONSTRAINT [PK__ServerInventory_SQL_Master__ServerID] PRIMARY KEY NONCLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]') AND name = N'IX_DoNotAllowDuplicateServers')
CREATE UNIQUE NONCLUSTERED INDEX [IX_DoNotAllowDuplicateServers] ON [dbo].[ServerInventory_SQL_Master] 
(
	[ServerName] ASC,
	[InstanceName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [hist].[ServerInventory_SQL_GetObjectID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_GetObjectID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
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
CREATE PROCEDURE [hist].[ServerInventory_SQL_GetObjectID] (
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

' 
END
GO
/****** Object:  Table [ref].[ServerInventory_SQL_DataTypes]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ref].[ServerInventory_SQL_DataTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [ref].[ServerInventory_SQL_DataTypes](
	[RefDataTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RefSQLVersionID] [int] NULL,
	[name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[system_type_id] [int] NULL,
	[max_length] [smallint] NULL,
	[precision] [tinyint] NULL,
	[scale] [tinyint] NULL,
 CONSTRAINT [PK__ServerInventory_SQL_DataTypes__RefDataTypeID] PRIMARY KEY CLUSTERED 
(
	[RefDataTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [hist].[ServerInventory_SQL_GetTableID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_GetTableID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [hist].[ServerInventory_SQL_GetTableID] (
	@TableName			SYSNAME
	,@SchemaName		SYSNAME
	,@TableID			INT OUTPUT
)
AS

SELECT 
	@TableID = TableID
FROM 
	[hist].[ServerInventory_SQL_TableIDs] id
WHERE id.[TableName] = @TableName
AND id.[SchemaName] = @SchemaName

IF @TableID IS NULL
BEGIN
	INSERT INTO [hist].[ServerInventory_SQL_TableIDs] ([TableName], [SchemaName]) 
	VALUES (@TableName,@SchemaName)
	
	SET @TableID = SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  Table [hist].[ServerInventory_SQL_ServerDBTableIDs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ServerDBTableIDs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_SQL_ServerDBTableIDs](
	[ServerDBTableID] [int] IDENTITY(1,1) NOT NULL,
	[HistServerID] [int] NULL,
	[DatabaseID] [int] NULL,
	[TableID] [int] NULL,
	[LastUpdated] [smalldatetime] NULL,
 CONSTRAINT [PK__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID] PRIMARY KEY NONCLUSTERED 
(
	[ServerDBTableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ServerDBTableIDs]') AND name = N'IX__ServerInventory_SQL_ServerDBTableIDs__DatabaseID')
CREATE NONCLUSTERED INDEX [IX__ServerInventory_SQL_ServerDBTableIDs__DatabaseID] ON [hist].[ServerInventory_SQL_ServerDBTableIDs] 
(
	[DatabaseID] ASC
)
INCLUDE ( [HistServerID],
[ServerDBTableID],
[TableID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ServerDBTableIDs]') AND name = N'IX__ServerInventory_SQL_ServerDBTableIDs__HistServerID_DatabaseID_TableID')
CREATE NONCLUSTERED INDEX [IX__ServerInventory_SQL_ServerDBTableIDs__HistServerID_DatabaseID_TableID] ON [hist].[ServerInventory_SQL_ServerDBTableIDs] 
(
	[HistServerID] ASC,
	[DatabaseID] ASC,
	[TableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 85) ON [History]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ServerDBTableIDs]') AND name = N'IX__ServerInventory_SQL_ServerDBTableIDs__TableID')
CREATE NONCLUSTERED INDEX [IX__ServerInventory_SQL_ServerDBTableIDs__TableID] ON [hist].[ServerInventory_SQL_ServerDBTableIDs] 
(
	[TableID] ASC
)
INCLUDE ( [DatabaseID],
[HistServerID],
[ServerDBTableID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  View [rpt].[Reporting_Environments_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[rpt].[Reporting_Environments_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [rpt].[Reporting_Environments_vw]
AS

SELECT     Environment
           ,EnvironmentCategory
FROM         rpt.Reporting_Environments
'
GO
/****** Object:  StoredProcedure [hist].[Users_GetUserID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Users_GetUserID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  Table [hist].[SpaceUsed_DatabaseSizes]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[SpaceUsed_DatabaseSizes](
	[HistServerID] [int] NULL,
	[DatabaseID] [int] NULL,
	[DataSizeMB] [bigint] NULL,
	[LogSizeMB] [bigint] NULL,
	[SampleDate] [smalldatetime] NULL,
	[DataSizeUnusedMB] [bigint] NULL,
	[LogSizeUnusedMB] [bigint] NULL
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]') AND name = N'IX__SpaceUsed_DBSizes__SampleDate')
CREATE CLUSTERED INDEX [IX__SpaceUsed_DBSizes__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes] 
(
	[SampleDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [History]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]') AND name = N'IX__SpaceUsed_DatabaseSizes__HistServerID_DatabaseID')
CREATE NONCLUSTERED INDEX [IX__SpaceUsed_DatabaseSizes__HistServerID_DatabaseID] ON [hist].[SpaceUsed_DatabaseSizes] 
(
	[HistServerID] ASC
)
INCLUDE ( [DatabaseID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 85) ON [History]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]') AND name = N'IX__SpaceUsed_DBSizes__DatabaseID__SampleDate')
CREATE NONCLUSTERED INDEX [IX__SpaceUsed_DBSizes__DatabaseID__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes] 
(
	[DatabaseID] ASC,
	[SampleDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 85) ON [History]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]') AND name = N'IX__SpaceUsed_DBSizes__HistServerID__SampleDate')
CREATE NONCLUSTERED INDEX [IX__SpaceUsed_DBSizes__HistServerID__SampleDate] ON [hist].[SpaceUsed_DatabaseSizes] 
(
	[HistServerID] ASC,
	[SampleDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 85) ON [History]
GO
/****** Object:  Table [hist].[ChangeTracking_SQL_ObjectIDs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ObjectIDs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ChangeTracking_SQL_ObjectIDs](
	[ObjectID] [int] IDENTITY(1,1) NOT NULL,
	[SchemaName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ObjectName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ObjectTypeID] [int] NULL,
 CONSTRAINT [PK__ChangeTracking_SQL_ObjectIDs__ObjectID] PRIMARY KEY NONCLUSTERED 
(
	[ObjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ObjectIDs]') AND name = N'IX_ChangeTracking_SQL_ObjectIDs')
CREATE NONCLUSTERED INDEX [IX_ChangeTracking_SQL_ObjectIDs] ON [hist].[ChangeTracking_SQL_ObjectIDs] 
(
	[SchemaName] ASC,
	[ObjectName] ASC,
	[ObjectTypeID] ASC
)
INCLUDE ( [ObjectID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 60) ON [History]
GO
/****** Object:  StoredProcedure [hist].[ChangeTracking_SQL_GETObjectTypeIDs]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_GETObjectTypeIDs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

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
	SET @MSG = ''This reference type "'' + @RefType + ''" do not exist in the ChangeTracking_SQL_ObjectTypeIDs table.''
	Raiserror (@MSG,15,255)
END

' 
END
GO
/****** Object:  Table [dbo].[Collectors_Log]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Collectors_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Collectors_Log](
	[RecipeName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HistUserID] [int] NULL,
	[HistServerID] [int] NULL,
	[State] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LogMessage] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LogVersion] [smallint] NULL,
	[DateCreated] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[ChangeControl_ScriptDatabaseXref]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeControl_ScriptDatabaseXref]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ChangeControl_ScriptDatabaseXref](
	[ScriptID] [int] NOT NULL,
	[DatabaseID] [int] NOT NULL,
 CONSTRAINT [PK__ChangeControl_ScriptDatabaseXref__ScriptID__DatabaseID] PRIMARY KEY CLUSTERED 
(
	[ScriptID] ASC,
	[DatabaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
/****** Object:  Table [hist].[ChangeControl_DeployHistory]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeControl_DeployHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ChangeControl_DeployHistory](
	[HistServerID] [int] NULL,
	[InstanceName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EnvironmentName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DeployName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PackageName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ScriptID] [int] NULL,
	[Output] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OutputType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsError] [bit] NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChangeControl_DeployDetail]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChangeControl_DeployDetail](
	[DeployID] [int] NULL,
	[ScriptID] [int] NULL,
	[Sequence] [smallint] NULL,
	[IsEnabled] [bit] NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployDetail]') AND name = N'IX__ChangeControl_DeployDetail__DeployID__ScriptID')
CREATE UNIQUE CLUSTERED INDEX [IX__ChangeControl_DeployDetail__DeployID__ScriptID] ON [dbo].[ChangeControl_DeployDetail] 
(
	[DeployID] ASC,
	[ScriptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [hist].[Backups_History]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Backups_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Backups_History](
	[HistServerID] [int] NOT NULL,
	[MachineID] [int] NULL,
	[DatabaseID] [int] NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NULL,
	[Size_MBytes] [int] NULL,
	[BUTypeID] [int] NOT NULL,
	[LogicalDeviceID] [int] NULL,
	[PhysicalDeviceID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK__Backups_History__HistServerID__DatabaseID__BUTypeID__StartDate] PRIMARY KEY CLUSTERED 
(
	[HistServerID] ASC,
	[DatabaseID] ASC,
	[BUTypeID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
/****** Object:  StoredProcedure [hist].[Backups_GetTypeID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Backups_GetTypeID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  StoredProcedure [hist].[Backups_GetDeviceID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Backups_GetDeviceID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [hist].[Backups_GetDeviceID] (
	@DeviceName				NVARCHAR(260)
	,@DeviceID				INT OUTPUT
)
AS

DECLARE 
	@Msg					NVARCHAR(4000)
	,@DeviceNameToInsert	NVARCHAR(260)

IF (@DeviceName IS NULL)
	SET @DeviceNameToInsert = ''NULL''
ELSE IF (@DeviceName LIKE ''Red Gate SQL Backup (%'')
	SET @DeviceNameToInsert = ''Red Gate SQL Backup''
ELSE IF (@DeviceName LIKE ''SQLBACKUP_%'')
	SET @DeviceNameToInsert = ''Red Gate SQL Backup''
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
		SET @Msg = ''Just tried to insert '' + @DeviceNameToInsert
		RAISERROR(@Msg,16,2)
	END CATCH
END

' 
END
GO
/****** Object:  Table [dbo].[Backups_BackupCommands]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Backups_BackupCommands]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Backups_BackupCommands](
	[CommandID] [int] IDENTITY(1,1) NOT NULL,
	[BackupTypeID] [int] NULL,
	[BackupAgentID] [int] NULL,
	[Command] [varchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Backups_BackupCommands__CommandID] PRIMARY KEY CLUSTERED 
(
	[CommandID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChangeControl_ChangeSet]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChangeControl_ChangeSet](
	[ChangeSetID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InstanceName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sequence] [smallint] NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__ChangeControl_ChangeSet__PackageDetailID] PRIMARY KEY CLUSTERED 
(
	[ChangeSetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[Deadlock_Deadlocks]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_Deadlocks]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Deadlock_Deadlocks](
	[HistDeadlockID] [int] IDENTITY(1,1) NOT NULL,
	[HistServerID] [int] NULL,
	[DeadlockSPID] [varchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VictimProcess] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DeadlockDate] [datetime] NULL,
	[SampleDate] [datetime] NULL,
 CONSTRAINT [PK__Deadlock_Deadlocks__HistDeadlockID] PRIMARY KEY CLUSTERED 
(
	[HistDeadlockID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_Deadlocks]') AND name = N'UIX__Deadlock_Deadlocks__HistServerID__DeadlockSPID__DeadlockDate')
CREATE UNIQUE NONCLUSTERED INDEX [UIX__Deadlock_Deadlocks__HistServerID__DeadlockSPID__DeadlockDate] ON [hist].[Deadlock_Deadlocks] 
(
	[HistServerID] ASC,
	[DeadlockSPID] ASC,
	[DeadlockDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [hist].[DatabaseMaintenance_CheckDB_OK]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_OK]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[DatabaseMaintenance_CheckDB_OK](
	[HistServerID] [int] NOT NULL,
	[DatabaseID] [int] NOT NULL,
	[CheckDBID] [bigint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK__DatabaseMaintenance_CheckDB_OK__HistServerID__DatabaseID__CheckDBID] PRIMARY KEY NONCLUSTERED 
(
	[HistServerID] ASC,
	[DatabaseID] ASC,
	[CheckDBID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_OK]') AND name = N'CIX_CheckDB_OK__DateCreated')
CREATE CLUSTERED INDEX [CIX_CheckDB_OK__DateCreated] ON [hist].[DatabaseMaintenance_CheckDB_OK] 
(
	[DateCreated] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [History]
GO
/****** Object:  Table [hist].[DatabaseMaintenance_CheckDB_Errors]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_Errors]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[DatabaseMaintenance_CheckDB_Errors](
	[HistServerID] [int] NOT NULL,
	[DatabaseID] [int] NOT NULL,
	[CheckDBID] [bigint] NOT NULL,
	[RunID] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Error] [int] NULL,
	[Level] [int] NULL,
	[State] [int] NULL,
	[MessageText] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RepairLevel] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[Allocation] [int] NULL,
 CONSTRAINT [PK__DatabaseMaintenance_CheckDB_Errors__HistServerID__DatabaseID__CheckDBID] PRIMARY KEY NONCLUSTERED 
(
	[HistServerID] ASC,
	[DatabaseID] ASC,
	[CheckDBID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_Errors]') AND name = N'CIX_CheckDB_Errors__DateCreated')
CREATE CLUSTERED INDEX [CIX_CheckDB_Errors__DateCreated] ON [hist].[DatabaseMaintenance_CheckDB_Errors] 
(
	[DateCreated] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [History]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_Errors]') AND name = N'IX_CheckDB_Errors__RunID')
CREATE NONCLUSTERED INDEX [IX_CheckDB_Errors__RunID] ON [hist].[DatabaseMaintenance_CheckDB_Errors] 
(
	[RunID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  Table [dbo].[Collectors_RecipeDetails]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Collectors_RecipeDetails](
	[RecipeID] [int] NOT NULL,
	[ScriptID] [int] NOT NULL,
	[Sequence] [tinyint] NULL,
	[Enabled] [bit] NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Collectors_RecipeDetails__RecipeID__ScriptID] PRIMARY KEY NONCLUSTERED 
(
	[RecipeID] ASC,
	[ScriptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [hist].[ChangeTracking_SQL_GETActionID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_GETActionID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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
	SET @msg = ''This Action type "'' + ISNULL (@ActionType,''NULL'') + ''" does not exist''
	Raiserror (@msg,15,255)
END

' 
END
GO
/****** Object:  StoredProcedure [hist].[DTSStore_GetPackageNameID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_GetPackageNameID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  StoredProcedure [hist].[DTSStore_GetOwnerID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_GetOwnerID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  StoredProcedure [hist].[DTSStore_GetDescriptionID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_GetDescriptionID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  StoredProcedure [hist].[DTSStore_GetCategoryID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_GetCategoryID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  Table [hist].[Metrics_QueryStats]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Metrics_QueryStats](
	[HistServerID] [int] NULL,
	[HistDatabaseID] [int] NULL,
	[HistObjectID] [int] NULL,
	[Count] [bigint] NULL,
	[Total_CPU_Time] [bigint] NULL,
	[Last_CPU] [bigint] NULL,
	[Min_CPU] [bigint] NULL,
	[Max_CPU] [bigint] NULL,
	[Total_Run_Time] [bigint] NULL,
	[Last_Run_Time] [bigint] NULL,
	[Min_Run_Time] [bigint] NULL,
	[Max_Run_Time] [bigint] NULL,
	[Total_Logical_Writes] [bigint] NULL,
	[Last_Logical_Writes] [bigint] NULL,
	[Min_Logical_Writes] [bigint] NULL,
	[Max_Logical_Writes] [bigint] NULL,
	[Total_Physical_Reads] [bigint] NULL,
	[Last_Physical_Reads] [bigint] NULL,
	[Min_Physical_Reads] [bigint] NULL,
	[Max_Physical_Reads] [bigint] NULL,
	[Total_Logical_Reads] [bigint] NULL,
	[Last_Logical_Reads] [bigint] NULL,
	[Min_Logical_Reads] [bigint] NULL,
	[Max_Logical_Reads] [bigint] NULL,
	[SampleDate] [smalldatetime] NULL
) ON [History]
END
GO
/****** Object:  Table [dbo].[NTPermissions_EnvironmentExceptions]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NTPermissions_EnvironmentExceptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NTPermissions_EnvironmentExceptions](
	[EnvironmentID] [tinyint] NULL,
	[StatementID] [int] NULL,
	[RunInAdditionToDefault] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [hist].[Jobs_SQL_Jobs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_Jobs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Jobs_SQL_Jobs](
	[HistJobID] [int] IDENTITY(1,1) NOT NULL,
	[HistServerID] [int] NULL,
	[job_id] [uniqueidentifier] NOT NULL,
	[name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[enabled] [tinyint] NOT NULL,
	[description] [nvarchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[start_step_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[owner_sid] [varbinary](85) NOT NULL,
	[delete_level] [int] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[date_modified] [datetime] NOT NULL,
	[version_number] [int] NOT NULL,
	[DateCreated] [smalldatetime] NULL,
	[LastSeenOn] [smalldatetime] NULL,
 CONSTRAINT [PK__Jobs_SQL_Jobs__HistJobID] PRIMARY KEY CLUSTERED 
(
	[HistJobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_Jobs]') AND name = N'UIX_sysjobs_ServerID_job_id')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_sysjobs_ServerID_job_id] ON [hist].[Jobs_SQL_Jobs] 
(
	[HistServerID] ASC,
	[job_id] ASC,
	[date_modified] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
GO
/****** Object:  Table [hist].[DTSStore_PackageStore]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[DTSStore_PackageStore](
	[HistServerID] [int] NOT NULL,
	[PackageNameID] [int] NOT NULL,
	[VersionID] [uniqueidentifier] NOT NULL,
	[DescriptionID] [int] NULL,
	[CategoryID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[OwnerID] [int] NULL,
	[PackageData] [image] NULL,
	[PackageType] [int] NOT NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__DTSStore_PackageStore__HistServerID__PackageNameID__VersionID] PRIMARY KEY CLUSTERED 
(
	[HistServerID] ASC,
	[PackageNameID] ASC,
	[VersionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History] TEXTIMAGE_ON [History]
END
GO
/****** Object:  StoredProcedure [hist].[General_GetPathID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[General_GetPathID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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
	
' 
END
GO
/****** Object:  StoredProcedure [hist].[General_GetFileNameID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[General_GetFileNameID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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
	
' 
END
GO
/****** Object:  Table [hist].[General_FullFileName]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[General_FullFileName]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[General_FullFileName](
	[HistPathFileNameID] [int] IDENTITY(1,1) NOT NULL,
	[HistPathID] [int] NULL,
	[HistFileNameID] [int] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK__General_FullFileName__HistPathFileNameID] PRIMARY KEY CLUSTERED 
(
	[HistPathFileNameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[General_FullFileName]') AND name = N'UIX_FullFileName')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_FullFileName] ON [hist].[General_FullFileName] 
(
	[HistPathID] ASC,
	[HistFileNameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [History]
GO
/****** Object:  StoredProcedure [hist].[ServerInventory_GetServerID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_GetServerID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_GetServerID]
**  Desc:			Gets/Creates a HistServerID based on the Server Name
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090716	Matt Stanford	Reduced the data type from VARCHAR(1000) to VARCHAR(200)
**								Changed because of HistServerID change
********************************************************************************************************/
CREATE PROCEDURE [hist].[ServerInventory_GetServerID] (
	@ServerName			VARCHAR(200)
	,@ServerID			INT OUTPUT
)
AS

-- Find the ServerID
SELECT 
	@ServerID = [HistServerID]
FROM 
	[hist].[ServerInventory_ServerIDs] id
WHERE (id.[ServerName] = @ServerName AND @ServerName IS NOT NULL)
OR (id.[ServerName] IS NULL AND @ServerName IS NULL)

IF @ServerID IS NULL
BEGIN
	INSERT INTO [hist].[ServerInventory_ServerIDs] ([ServerName]) 
	VALUES (@ServerName)
	
	SET @ServerID = SCOPE_IDENTITY()
END

' 
END
GO
/****** Object:  Table [dbo].[ServerInventory_ApplicationOwners_Xref]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_ApplicationOwners_Xref]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_ApplicationOwners_Xref](
	[ApplicationID] [int] NULL,
	[OwnerID] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_ApplicationOwners_Xref]') AND name = N'CUIX__SI_ApplicationOwnerXref__ApplicationID__OwnerID')
CREATE UNIQUE CLUSTERED INDEX [CUIX__SI_ApplicationOwnerXref__ApplicationID__OwnerID] ON [dbo].[ServerInventory_ApplicationOwners_Xref] 
(
	[ApplicationID] ASC,
	[OwnerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerInventory_ServerApplications_Xref]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerApplications_Xref]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_ServerApplications_Xref](
	[ServerID] [int] NULL,
	[ApplicationID] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerApplications_Xref]') AND name = N'CUIX__SrvAppXref__ServerID__ApplicationID')
CREATE UNIQUE CLUSTERED INDEX [CUIX__SrvAppXref__ServerID__ApplicationID] ON [dbo].[ServerInventory_ServerApplications_Xref] 
(
	[ServerID] ASC,
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ServerInventory_ApplicationOwners_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_ApplicationOwners_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_ApplicationOwners_vw]
**  Desc:			View to pair owners up to thier applications
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-07-21
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE VIEW [dbo].[ServerInventory_ApplicationOwners_vw]
AS

SELECT
	a.[ApplicationName]
	,o.[OwnerName]
FROM [dbo].[ServerInventory_ApplicationOwners_Xref] ax
INNER JOIN [dbo].[ServerInventory_Applications] a
	ON ax.[ApplicationID] = a.[ApplicationID]
INNER JOIN [dbo].[ServerInventory_Owners] o
	ON ax.[OwnerID] = o.[OwnerID]
'
GO
/****** Object:  Table [dbo].[ServerInventory_DatabaseOwners_Xref]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_DatabaseOwners_Xref]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_DatabaseOwners_Xref](
	[ServerID] [int] NULL,
	[DatabaseID] [int] NULL,
	[OwnerID] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_DatabaseOwners_Xref]') AND name = N'CUIX__DBOwnerXref__ServerID__DatabaseID')
CREATE UNIQUE CLUSTERED INDEX [CUIX__DBOwnerXref__ServerID__DatabaseID] ON [dbo].[ServerInventory_DatabaseOwners_Xref] 
(
	[ServerID] ASC,
	[DatabaseID] ASC,
	[OwnerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [hist].[Jobs_SQL_InsertJob]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_InsertJob]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

-- See if we''ve already got a record
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

' 
END
GO
/****** Object:  StoredProcedure [hist].[Jobs_SQL_GetJobIDByName]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_GetJobIDByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  StoredProcedure [hist].[General_GetFullFileNameID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[General_GetFullFileNameID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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
	
' 
END
GO
/****** Object:  StoredProcedure [hist].[DTSStore_StorePackageData]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_StorePackageData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[DTSStore_StorePackageData]
**  Desc:			Procedure to save DTS packages into the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090728	Matt Stanford	Emergency change because of broken HistServerID
********************************************************************************************************/
CREATE PROCEDURE [hist].[DTSStore_StorePackageData] (
	@SourceServer			SYSNAME
	,@name					SYSNAME
	,@id					UNIQUEIDENTIFIER
	,@versionid				UNIQUEIDENTIFIER
	,@description			NVARCHAR(1024)
	,@categoryid			UNIQUEIDENTIFIER
	,@createdate			DATETIME
	,@owner					SYSNAME
	,@packagedata			IMAGE
	,@owner_sid				VARBINARY(85)
	,@packagetype			INT
)
AS

DECLARE
	@CategoryID_INT			INT
	,@DescriptionID			INT
	,@OwnerID				INT
	,@PackageNameID			INT
	,@ServerID				INT
	
EXECUTE [hist].[DTSStore_GetCategoryID] @CategoryID, @CategoryID_INT OUTPUT
EXECUTE [hist].[DTSStore_GetDescriptionID] @Description, @DescriptionID OUTPUT
EXECUTE [hist].[DTSStore_GetOwnerID] @owner, @owner_sid, @OwnerID OUTPUT
EXECUTE [hist].[DTSStore_GetPackageNameID] @name, @id, @PackageNameID OUTPUT
EXECUTE [hist].[ServerInventory_GetServerID] @SourceServer, @ServerID OUTPUT

-- Now that all of the IDs have been collected, lets insert the data into 
-- the main table

IF NOT EXISTS (
	SELECT 
		[HistServerID]
		,[PackageNameID]
		,[VersionID] 
	FROM [hist].[DTSStore_PackageStore] 
	WHERE [HistServerID] = @ServerID
	AND [PackageNameID] = @PackageNameID
	AND [VersionID] = @versionid
	)
BEGIN
	INSERT INTO [hist].[DTSStore_PackageStore] ([HistServerID], PackageNameID, VersionID, DescriptionID, CategoryID, CreateDate, OwnerID, PackageData, PackageType)
	VALUES (@ServerID, @PackageNameID, @versionid, @DescriptionID, @CategoryID_INT, @createdate, @OwnerID, @packagedata, @packagetype)
END

' 
END
GO
/****** Object:  View [hist].[DTSStore_Packages_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[DTSStore_Packages_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[DTSStore_Packages_vw]
**  Desc:			View to pull DTS package definitions from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
CREATE VIEW [hist].[DTSStore_Packages_vw]
AS
SELECT 
	srvr.[ServerName]		AS [SourceServer]
	,names.[PackageName]	AS [name]
	,names.[PackageID]		AS [id]
	,ps.[VersionID]			AS [versionid]
	,descs.[Description]	AS [description]
	,cats.[CategoryID_GUID]	AS [categoryid]
	,ps.[CreateDate]		AS [createdate]
	,owners.[Owner]			AS [owner]
	,ps.[PackageData]		AS [packagedata]
	,owners.[Owner_sid]		AS [owner_sid]
	,ps.[PackageType]		AS [packagetype]
	,ps.[DateCreated]		AS [datecreated]
FROM [hist].[DTSStore_PackageStore] ps
INNER JOIN [hist].[DTSStore_PackageNames] names
	ON ps.[PackageNameID] = names.[PackageNameID]
INNER JOIN [hist].[DTSStore_Categories] cats
	ON ps.[CategoryID] = cats.[CategoryID]
INNER JOIN [hist].[DTSStore_Descriptions] descs
	ON ps.[DescriptionID] = descs.[DescriptionID]
INNER JOIN [hist].[DTSStore_Owners] owners
	ON ps.[OwnerID] = owners.[OwnerID]
INNER JOIN [hist].[ServerInventory_ServerIDs] srvr
	ON ps.[HistServerID] = srvr.[HistServerID]

'
GO
/****** Object:  Table [hist].[Jobs_SQL_JobSteps]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobSteps]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Jobs_SQL_JobSteps](
	[HistJobID] [int] NOT NULL,
	[step_id] [int] NOT NULL,
	[step_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[subsystem] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[command] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[flags] [int] NOT NULL,
	[additional_parameters] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cmdexec_success_code] [int] NOT NULL,
	[on_success_action] [tinyint] NOT NULL,
	[on_success_step_id] [int] NOT NULL,
	[on_fail_action] [tinyint] NOT NULL,
	[on_fail_step_id] [int] NOT NULL,
	[HistServerIDForServerCol] [int] NULL,
	[HistDatabaseID] [int] NULL,
	[database_user_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[retry_attempts] [int] NOT NULL,
	[retry_interval] [int] NOT NULL,
	[os_run_priority] [int] NOT NULL,
	[output_file_name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Jobs_SQL_JobSteps__HistJobID__step_id] PRIMARY KEY CLUSTERED 
(
	[HistJobID] ASC,
	[step_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History] TEXTIMAGE_ON [History]
END
GO
/****** Object:  View [hist].[Jobs_SQL_Jobs_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_Jobs_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[Jobs_SQL_Jobs_vw]
**  Desc:			View to pull back the job definitions from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
**	20100125	Matt Stanford	Fixed bug, now actually pulls the latest jobs only
********************************************************************************************************/
CREATE VIEW [hist].[Jobs_SQL_Jobs_vw]
AS

WITH CurrentJobs (HistJobID)
AS
(
	SELECT
		MAX([HistJobID])
	FROM [hist].[Jobs_SQL_Jobs]
	GROUP BY [HistServerID], [name]
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
	ON j.[HistServerID] = s.[HistServerID]
INNER JOIN [CurrentJobs] cj
	ON j.[HistJobID] = cj.[HistJobID]

'
GO
/****** Object:  Table [hist].[Jobs_SQL_JobHistory]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Jobs_SQL_JobHistory](
	[HistJobID] [int] NOT NULL,
	[instance_id] [int] NOT NULL,
	[step_id] [int] NOT NULL,
	[step_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sql_message_id] [int] NOT NULL,
	[sql_severity] [int] NOT NULL,
	[message] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[run_status] [int] NOT NULL,
	[run_datetime] [datetime] NOT NULL,
	[run_duration] [int] NOT NULL,
	[operator_id_emailed] [int] NOT NULL,
	[operator_id_netsent] [int] NOT NULL,
	[operator_id_paged] [int] NOT NULL,
	[retries_attempted] [int] NOT NULL,
	[HistServerID] [int] NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Jobs_SQL_JobHistory__HistJobID__instance_id] PRIMARY KEY CLUSTERED 
(
	[HistJobID] ASC,
	[instance_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobHistory]') AND name = N'IX__Jobs_SQL_JobHistory__run_datetime_HistJobID_HistServerID')
CREATE NONCLUSTERED INDEX [IX__Jobs_SQL_JobHistory__run_datetime_HistJobID_HistServerID] ON [hist].[Jobs_SQL_JobHistory] 
(
	[run_datetime] ASC
)
INCLUDE ( [HistJobID],
[HistServerID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 85) ON [History]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobHistory]') AND name = N'IX__Jobs_SQL_JobHistory__step_id_run_status_run_datetime_histJobID_HistServerID')
CREATE NONCLUSTERED INDEX [IX__Jobs_SQL_JobHistory__step_id_run_status_run_datetime_histJobID_HistServerID] ON [hist].[Jobs_SQL_JobHistory] 
(
	[step_id] ASC,
	[run_status] ASC,
	[run_datetime] ASC
)
INCLUDE ( [HistJobID],
[HistServerID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 85) ON [History]
GO
/****** Object:  View [hist].[Metrics_QueryStats_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[Metrics_QueryStats_vw]
**  Desc:			View to pull query usage metrics from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009.12.15
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20100218	Matt Stanford	Removed the average columns, now calculating them
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
	,qs.[Total_CPU_Time]/qs.[Count]				AS [AVG_CPU_Time]
	,qs.[Last_CPU]
	,qs.[Min_CPU]
	,qs.[Max_CPU]
	,qs.[Total_Run_Time]
	,qs.[Total_Run_Time]/qs.[Count]				AS [AVG_Run_Time]
	,qs.[Last_Run_Time]
	,qs.[Min_Run_Time]
	,qs.[Max_Run_Time]
	,qs.[Total_Logical_Writes]
	,qs.[Total_Logical_Writes]/qs.[Count]		AS [Avg_Logical_Writes]
	,qs.[Last_Logical_Writes]
	,qs.[Min_Logical_Writes]
	,qs.[Max_Logical_Writes]
	,qs.[Total_Physical_Reads]
	,qs.[Total_Physical_Reads]/qs.[Count]		AS [Avg_Physical_Reads]
	,qs.[Last_Physical_Reads]
	,qs.[Min_Physical_Reads]
	,qs.[Max_Physical_Reads]
	,qs.[Total_Logical_Reads]
	,qs.[Total_Logical_Reads]/qs.[Count]		AS [Avg_Logical_Reads]
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


'
GO
/****** Object:  StoredProcedure [hist].[Metrics_QueryStats_Insert]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/*******************************************************************************************************
**  Name:			[hist].[Metrics_QueryStats_Insert]
**  Desc:			Procedure to insert history values
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-12-11
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20100218	Matt Stanford	Removed the average columns
********************************************************************************************************/
CREATE PROCEDURE [hist].[Metrics_QueryStats_Insert] (
	@ServerName					VARCHAR(200)
	,@DBName					NVARCHAR(128)
	,@Schema					NVARCHAR(128)
	,@Object					NVARCHAR(128)
	,@Count						BIGINT 
	,@Total_CPU_Time			BIGINT 
	,@Last_CPU					BIGINT 
	,@Min_CPU					BIGINT 
	,@Max_CPU					BIGINT 
	,@Total_Run_Time			BIGINT 
	,@Last_Run_Time				BIGINT 
	,@Min_Run_Time				BIGINT 
	,@Max_Run_Time				BIGINT 
	,@Total_Logical_Writes		BIGINT 
	,@Last_Logical_Writes		BIGINT 
	,@Min_Logical_Writes		BIGINT 
	,@Max_Logical_Writes		BIGINT 
	,@Total_Physical_Reads		BIGINT 
	,@Last_Physical_Reads		BIGINT 
	,@Min_Physical_Reads		BIGINT 
	,@Max_Physical_Reads		BIGINT 
	,@Total_Logical_Reads		BIGINT 
	,@Last_Logical_Reads		BIGINT 
	,@Min_Logical_Reads			BIGINT 
	,@Max_Logical_Reads			BIGINT 
)
AS

-- Lookup the server id
DECLARE
	@HistServerID			INT
	,@HistObjectID			INT
	,@HistDatabaseID		INT
	
EXEC [hist].[ServerInventory_GetServerID] @ServerName, @HistServerID OUTPUT

-- Get the database id
EXEC [hist].[ServerInventory_SQL_GetDatabaseID] @DBName, @HistDatabaseID OUTPUT

-- Get the object id
EXEC [hist].[ServerInventory_SQL_GetObjectID] @Object, @Schema, NULL, @HistObjectID OUTPUT

-- insert the data
INSERT INTO [hist].[Metrics_QueryStats] ([HistServerID], [HistDatabaseID], [HistObjectID], [Count], [Total_CPU_Time], [Last_CPU], [Min_CPU], [Max_CPU], [Total_Run_Time], [Last_Run_Time], [Min_Run_Time], [Max_Run_Time], [Total_Logical_Writes], [Last_Logical_Writes], [Min_Logical_Writes], [Max_Logical_Writes], [Total_Physical_Reads], [Last_Physical_Reads], [Min_Physical_Reads], [Max_Physical_Reads], [Total_Logical_Reads], [Last_Logical_Reads], [Min_Logical_Reads], [Max_Logical_Reads])
VALUES (@HistServerID,@HistDatabaseID, @HistObjectID,@Count, @Total_CPU_Time, @Last_CPU, @Min_CPU, @Max_CPU, @Total_Run_Time, @Last_Run_Time, @Min_Run_Time, @Max_Run_Time, @Total_Logical_Writes, @Last_Logical_Writes, @Min_Logical_Writes, @Max_Logical_Writes, @Total_Physical_Reads, @Last_Physical_Reads, @Min_Physical_Reads, @Max_Physical_Reads, @Total_Logical_Reads, @Last_Logical_Reads, @Min_Logical_Reads, @Max_Logical_Reads)


' 
END
GO
/****** Object:  Table [hist].[Deadlock_ResourceList]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Deadlock_ResourceList](
	[HistDeadlockResourceID] [int] IDENTITY(1,1) NOT NULL,
	[HistDeadlockID] [int] NULL,
	[id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[locktype] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[objectnameHistTableID] [int] NULL,
	[dbnameHistDatabaseID] [int] NULL,
	[indexname] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[hobtid] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[modeRefLockModeID] [int] NULL,
	[associatedObjectID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dbid] [smallint] NULL,
	[fileid] [smallint] NULL,
	[pageid] [int] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK__Deadlock_ResourceList__HistDeadlockResourceID] PRIMARY KEY CLUSTERED 
(
	[HistDeadlockResourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [hist].[DatabaseMaintenance_InsertCheckDBResults]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_InsertCheckDBResults]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  View [hist].[DatabaseMaintenance_CheckDB_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[DatabaseMaintenance_CheckDB_vw]
**  Desc:			View to pull back the checkdb results from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
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
	ON s.[HistServerID] = e.[HistServerID]
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
	,''No errors encountered''
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
	ON s.[HistServerID] = o.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON d.[DatabaseID] = o.[DatabaseID]


'
GO
/****** Object:  View [hist].[Deadlock_Deadlocks_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_Deadlocks_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_Deadlocks_vw]
**	Desc:			View to assemble basic deadlock information
					Note that each deadlock is identified uniquely by the Server, SPID and DATE combination
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE VIEW [hist].[Deadlock_Deadlocks_vw]
AS

SELECT [HistDeadlockID]
      ,s.[ServerName]
      ,[DeadlockSPID]
      ,[VictimProcess]
      ,[DeadlockDate]
      ,[SampleDate]
FROM [hist].[Deadlock_Deadlocks] d
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON d.[HistServerID] = s.[HistServerID]

	
'
GO
/****** Object:  StoredProcedure [hist].[Deadlock_NewDeadlock_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_NewDeadlock_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_NewDeadlock_InsertValue]
**	Desc:			Procedure to inset new deadlocks into schema
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE PROCEDURE [hist].[Deadlock_NewDeadlock_InsertValue] (
	@ServerName						VARCHAR(200)
	,@DeadlockSPID					VARCHAR(11)
	,@DeadlockDate					DATETIME
	,@VictimProcess					VARCHAR(20)
	,@HistDeadlockID				INT OUTPUT
)
AS

SET NOCOUNT ON

DECLARE
	@HistServerID			INT

EXEC [hist].[ServerInventory_GetServerID] @ServerName, @HistServerID OUTPUT

SELECT 
	@HistDeadlockID = [HistDeadlockID]
FROM [hist].[Deadlock_Deadlocks] 
WHERE [HistServerID] = @HistServerID 
AND [DeadlockSPID] = @DeadlockSPID 
AND [DeadlockDate] = @DeadlockDate

IF (@HistDeadlockID IS NULL)
BEGIN
	INSERT INTO [hist].[Deadlock_Deadlocks] ([HistServerID], [DeadlockSPID], [DeadlockDate], [VictimProcess])
	VALUES (@HistServerID, @DeadlockSPID, @DeadlockDate, @VictimProcess)
	
	SET @HistDeadlockID = SCOPE_IDENTITY()
END

' 
END
GO
/****** Object:  Table [hist].[Deadlock_ProcessList]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Deadlock_ProcessList](
	[HistDeadlockProcessID] [int] IDENTITY(1,1) NOT NULL,
	[HistDeadlockID] [int] NULL,
	[processid] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[clientapp] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[currentdb] [int] NULL,
	[hostnameHistServerID] [int] NULL,
	[hostpid] [smallint] NULL,
	[RefIsolationLevelID] [int] NULL,
	[kpid] [smallint] NULL,
	[lastbatchstarted] [datetime] NULL,
	[lastbatchcompleted] [datetime] NULL,
	[lasttranstarted] [datetime] NULL,
	[modeRefLockModeID] [int] NULL,
	[loginnameHistUserID] [int] NULL,
	[priority] [smallint] NULL,
	[taskpriority] [smallint] NULL,
	[sbid] [smallint] NULL,
	[schedulerid] [tinyint] NULL,
	[spid] [smallint] NULL,
	[RefRunStatusID] [int] NULL,
	[transactionname] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[transcount] [smallint] NULL,
	[waitresource] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[waittime] [int] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK__Deadlock_ProcessList__HistDeadlockProcessID] PRIMARY KEY CLUSTERED 
(
	[HistDeadlockProcessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]') AND name = N'UIX__Deadlock_ProcessList__HistDeadlockID__processid')
CREATE UNIQUE NONCLUSTERED INDEX [UIX__Deadlock_ProcessList__HistDeadlockID__processid] ON [hist].[Deadlock_ProcessList] 
(
	[HistDeadlockID] ASC,
	[processid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Collectors_Log_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Collectors_Log_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[Collectors_Log_InsertValue]
**  Desc:			Procedure to add logging information about the collectors
**  Auth:			Matt Stanford 
**  Date:			2009-10-13
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [dbo].[Collectors_Log_InsertValue] (
	@ServerName				VARCHAR(200)
	,@LoginName				NVARCHAR(50)
	,@RecipeName			VARCHAR(200)
	,@State					VARCHAR(10)
	,@LogMessage			VARCHAR(1000)
	,@LogVersion			SMALLINT
	,@RetentionDays			SMALLINT = 60
)
AS
SET NOCOUNT ON

DECLARE 
	@HistServerID			INT
	,@HistUserID			INT
	,@RetentionDate			DATETIME

-- Get the server ID	
EXEC [hist].[ServerInventory_GetServerID] @ServerName = @ServerName, @ServerID = @HistServerID OUTPUT

-- Get the user ID
EXEC [hist].[Users_GetUserID] @UserName = @LoginName, @UserID = @HistUserID OUTPUT

-- Insert the row
INSERT INTO [dbo].[Collectors_Log] ([RecipeName],[HistUserID],[HistServerID],[State],[LogMessage],[LogVersion],[DateCreated])
VALUES (@RecipeName,@HistUserID,@HistServerID,@State,@LogMessage,@LogVersion,GETDATE())

SET @RetentionDate = DATEADD(day,-@RetentionDays,GETDATE())

-- Trim up the data
DELETE l
FROM [dbo].[Collectors_Log] l
WHERE l.[DateCreated] < @RetentionDate
AND l.[RecipeName] = @RecipeName
AND l.[HistServerID] = @HistServerID

' 
END
GO
/****** Object:  Table [dbo].[Backups_Jobs]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Backups_Jobs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Backups_Jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ServerID] [int] NULL,
	[TargetServer] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TargetShare] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecordHistory] [bit] NULL,
	[AlertLevel] [tinyint] NULL,
	[Enabled] [bit] NULL,
	[LoggingLevel] [tinyint] NULL,
	[CompressionLevel] [tinyint] NULL,
	[ThreadCount] [tinyint] NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Backups_Jobs__JobID] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [hist].[Backups_History_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[Backups_History_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[Backups_History_vw]
**  Desc:			View to pull back the backup history from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
CREATE VIEW [hist].[Backups_History_vw]
AS

SELECT
	sn.[ServerName]			AS [ServerName]
	,mn.[ServerName]		AS [MachineName]
	,db.[DBName]			AS [DatabaseName]
	,h.[StartDate]			AS [StartDate]
	,h.[EndDate]			AS [EndDate]
	,DATEDIFF(second,h.[StartDate],h.[EndDate]) AS [BUTime_Seconds]
	,h.[Size_MBytes]		AS [Size_MBytes]
	,t.[BackupType]			AS [BackupType]
	,t.[BackupTypeDesc]		AS [BackupTypeDesc]
	,u.[UserName]			AS [UserName]
	,CASE ld.[DeviceName]	
		WHEN ''NULL'' THEN NULL
		ELSE ld.[DeviceName]	
	END						AS [LogicalDeviceName]
	,CASE pd.[DeviceName]		
		WHEN ''NULL'' THEN NULL
		ELSE pd.[DeviceName] 
	END						AS [PhysicalDeviceName]
	,LEFT(pd.[DeviceName],LEN(pd.[DeviceName]) - CHARINDEX(''\'',REVERSE(pd.[DeviceName]))) as [BackupPath]
	,REPLACE(RIGHT(pd.[DeviceName],CHARINDEX(''\'',REVERSE(pd.[DeviceName]))),''\'','''') as [FileName]
FROM [hist].[Backups_History] h
INNER JOIN [hist].[ServerInventory_ServerIDs] sn
	ON h.[HistServerID] = sn.[HistServerID]
INNER JOIN [hist].[ServerInventory_ServerIDs] mn
	ON h.[HistServerID] = mn.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] db
	ON h.[DatabaseID] = db.[DatabaseID]
INNER JOIN [hist].[Backups_Types] t
	ON h.[BUTypeID] = t.[BackupTypeID]
INNER JOIN [hist].[Backups_Devices] ld
	ON h.[LogicalDeviceID] = ld.[DeviceID]
INNER JOIN [hist].[Backups_Devices] pd
	ON h.[PhysicalDeviceID] = pd.[DeviceID]
INNER JOIN [hist].[Users_UserNames] u
	ON h.[UserID] = u.[UserID]

'
GO
/****** Object:  StoredProcedure [hist].[Backups_SaveBackupHistory]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Backups_SaveBackupHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[Backups_SaveBackupHistory]
**  Desc:			Adds a backup history into repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090728	Matt Stanford	Emergency change because of broken HistServerID
********************************************************************************************************/
CREATE PROCEDURE [hist].[Backups_SaveBackupHistory] (
	@ServerName				SYSNAME
	,@MachineName			SYSNAME
	,@DatabaseName			SYSNAME
	,@StartDate				SMALLDATETIME
	,@EndDate				SMALLDATETIME
	,@Size_Mbytes			INT
	,@BUType				CHAR(1)
	,@UserName				SYSNAME
	,@LogicalDevice			NVARCHAR(128)
	,@PhysicalDevice		NVARCHAR(260)
)
AS
SET NOCOUNT ON

DECLARE 
	@ServerID				INT
	,@MachineID				INT
	,@DatabaseID			INT
	,@BackupTypeID			INT
	,@LogicalID				INT
	,@PhysicalID			INT
	,@UserID				INT
	
EXEC [hist].[ServerInventory_GetServerID] @ServerName, @ServerID OUTPUT
EXEC [hist].[ServerInventory_GetServerID] @MachineName, @MachineID OUTPUT
EXEC [hist].[ServerInventory_SQL_GetDatabaseID] @DatabaseName, @DatabaseID OUTPUT
EXEC [hist].[Backups_GetTypeID] @BUType, @BackupTypeID OUTPUT
EXEC [hist].[Backups_GetDeviceID] @LogicalDevice, @LogicalID OUTPUT
EXEC [hist].[Backups_GetDeviceID] @PhysicalDevice, @PhysicalID OUTPUT
EXEC [hist].[Users_GetUserID] @UserName, @UserID OUTPUT

IF NOT EXISTS (
	SELECT * 
	FROM [hist].[Backups_History] 
	WHERE [HistServerID] = @ServerID
	AND [DatabaseID] = @DatabaseID
	AND [BUTypeID] = @BackupTypeID
	AND [StartDate] = @StartDate
	)
BEGIN

	INSERT INTO [hist].[Backups_History] ([HistServerID], [MachineID], [DatabaseID], [StartDate], [EndDate], [Size_MBytes], [BUTypeID], [UserID], [LogicalDeviceID], [PhysicalDeviceID])
	VALUES (@ServerID,@MachineID,@DatabaseID,@StartDate,@EndDate,@Size_Mbytes,@BackupTypeID,@UserID,@LogicalID,@PhysicalID)

END

' 
END
GO
/****** Object:  View [hist].[ChangeControl_DeployHistory_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[ChangeControl_DeployHistory_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ChangeControl_DeployHistory_vw]
**  Desc:			View to assemble all history data
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-09-04
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	
********************************************************************************************************/
CREATE VIEW [hist].[ChangeControl_DeployHistory_vw]
AS

SELECT
	h.[DeployName]
	,h.[PackageName]
	,s.[ServerName]
	,h.[InstanceName]
	,h.[EnvironmentName]
	,sm.[Definition]
	,sm.[FileName]
	,h.[Output]
	,h.[OutputType]
	,h.[DateCreated]
	,h.[UserName]
FROM [hist].[ChangeControl_DeployHistory] h
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON h.[HistServerID] = s.[HistServerID]
INNER JOIN [hist].[ChangeControl_ScriptMaster] sm
	ON h.[ScriptID] = sm.[ScriptID]

'
GO
/****** Object:  StoredProcedure [hist].[ChangeControl_DeployHistory_Insert]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeControl_DeployHistory_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ChangeControl_DeployHistory_Insert]
**  Desc:			Procedure to insert history values
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-09-04
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	
********************************************************************************************************/
CREATE PROCEDURE [hist].[ChangeControl_DeployHistory_Insert] (
	@ServerName				VARCHAR(200)
	,@InstanceName			VARCHAR(50)
	,@EnvironmentName		VARCHAR(50)
	,@DeployName			VARCHAR(50) = NULL
	,@PackageName			VARCHAR(50)
	,@ScriptID				INT
	,@Output				NVARCHAR(MAX)
	,@OutputType			VARCHAR(50)
	,@IsError				BIT
	,@UserName				VARCHAR(50)
	,@DateCreated			SMALLDATETIME
)
AS

-- Lookup the server id
DECLARE
	@HistServerID			INT
	
EXEC [hist].[ServerInventory_GetServerID] @ServerName, @HistServerID OUTPUT

-- insert the data
INSERT INTO [hist].[ChangeControl_DeployHistory] ([HistServerID], [InstanceName], [EnvironmentName], [ScriptID], [Output], [OutputType], [UserName], [DateCreated])
VALUES (@HistServerID,@InstanceName,@EnvironmentName,@ScriptID,@Output,@OutputType,@UserName,@DateCreated)

' 
END
GO
/****** Object:  Table [dbo].[ChangeControl_ChangeSetDetail]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSetDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChangeControl_ChangeSetDetail](
	[ChangeSetID] [int] NULL,
	[ScriptID] [int] NULL,
	[Sequence] [smallint] NULL,
	[IsRemoved] [bit] NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs](
	[HistServerID] [int] NOT NULL,
	[DatabaseID] [int] NOT NULL,
	[ObjectID] [int] NOT NULL,
	[ActionID] [int] NOT NULL,
	[DateModified] [date] NOT NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__ChangeTracking_SQL_ServerDBObjectActionIDs__HistServerID__DatabaseID__ObjectID__ActionID__DateModified] PRIMARY KEY CLUSTERED 
(
	[HistServerID] ASC,
	[DatabaseID] ASC,
	[ObjectID] ASC,
	[ActionID] ASC,
	[DateModified] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 60) ON [History]
) ON [History]
END
GO
/****** Object:  StoredProcedure [hist].[ChangeTracking_SQL_GetObjectIDs]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_GetObjectIDs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  Table [hist].[SpaceUsed_TableSizes]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_TableSizes]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[SpaceUsed_TableSizes](
	[ServerDBTableID] [int] NULL,
	[RowCount] [bigint] NULL,
	[ReservedSpaceKB] [bigint] NULL,
	[DataSpaceKB] [bigint] NULL,
	[IndexSizeKB] [bigint] NULL,
	[UnusedKB] [bigint] NULL,
	[SampleDate] [smalldatetime] NULL
) ON [History]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_TableSizes]') AND name = N'IX__SpaceUsed_TableSizes__ServerDBTableID_SampleDate_RowCount_ReservedSpaceKB_DataSpaceKBIndexSizeKB_UnusedKB')
CREATE NONCLUSTERED INDEX [IX__SpaceUsed_TableSizes__ServerDBTableID_SampleDate_RowCount_ReservedSpaceKB_DataSpaceKBIndexSizeKB_UnusedKB] ON [hist].[SpaceUsed_TableSizes] 
(
	[ServerDBTableID] ASC,
	[SampleDate] ASC
)
INCLUDE ( [DataSpaceKB],
[IndexSizeKB],
[ReservedSpaceKB],
[RowCount],
[UnusedKB]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 85) ON [History]
GO
/****** Object:  Table [hist].[SpaceUsed_FileSizes]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_FileSizes]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[SpaceUsed_FileSizes](
	[HistServerID] [int] NOT NULL,
	[HistPathFileNameID] [int] NOT NULL,
	[FileAttribute] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FileSizeKB] [bigint] NULL,
	[SampleDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__SpaceUsed_FileSizes__HistServerID__SampleDate__HistPathFileNameID] PRIMARY KEY CLUSTERED 
(
	[HistServerID] ASC,
	[SampleDate] ASC,
	[HistPathFileNameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [hist].[SpaceUsed_DatabaseSizes_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[SpaceUsed_DatabaseSizes_vw]
**  Desc:			View to pull back the database sizes from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090706	Matt Stanford	Fully backwards-compatible change to add DataSizeUnusedMB and LogSizeUnusedMB
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
CREATE VIEW [hist].[SpaceUsed_DatabaseSizes_vw]
AS

SELECT 
	s.[ServerName]
	,d.[DBName]
	,det.[DataSizeMB]
	,det.[LogSizeMB]
	,det.[DataSizeUnusedMB]
	,det.[LogSizeUnusedMB]
	,det.[DataSizeMB] - det.[DataSizeUnusedMB]		AS [DataSizeUsedMB]
	,det.[LogSizeMB] - det.[LogSizeUnusedMB]		AS [LogSizeUsedMB]
	,det.[SampleDate]
FROM [hist].[SpaceUsed_DatabaseSizes] det
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON s.[HistServerID] = det.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON d.[DatabaseID] = det.[DatabaseID]


'
GO
/****** Object:  StoredProcedure [hist].[SpaceUsed_DatabaseSizes_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[SpaceUsed_DatabaseSizes_InsertValue]
**  Desc:			Adds a database size sampling into the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090706	Matt Stanford	Fully backwards-compatible change to add DataSizeUnusedMB and LogSizeUnusedMB
********************************************************************************************************/
CREATE PROCEDURE [hist].[SpaceUsed_DatabaseSizes_InsertValue] (
	@ServerName			VARCHAR(1000)
	,@DBName			SYSNAME
	,@DataSizeMB		BIGINT
	,@LogSizeMB			BIGINT
	,@DataSizeUnusedMB	BIGINT = NULL
	,@LogSizeUnusedMB	BIGINT = NULL
)
AS

DECLARE 
	@ServerID			INT
	,@DatabaseID		INT
	
-- Find the ServerID
EXEC [hist].[ServerInventory_GetServerID] @ServerName, @ServerID OUTPUT

-- Find the DatabaseID
EXEC [hist].[ServerInventory_SQL_GetDatabaseID] @DBName, @DatabaseID OUTPUT

-- Now that we''ve got that, just insert into our detail table
INSERT INTO [hist].[SpaceUsed_DatabaseSizes] ([HistServerID], [DatabaseID], [DataSizeMB], [LogSizeMB], [DataSizeUnusedMB], [LogSizeUnusedMB], [SampleDate])
VALUES (@ServerID, @DatabaseID, @DataSizeMB, @LogSizeMB, @DataSizeUnusedMB, @LogSizeUnusedMB, GETDATE())

' 
END
GO
/****** Object:  View [hist].[SpaceUsed_DatabaseSizes_Delta_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes_Delta_vw]'))
EXEC dbo.sp_executesql @statement = N'
/*******************************************************************************************************
**  Name:			[hist].[SpaceUsed_DatabaseSizes_Delta_vw]
**  Desc:			View to pull back the database sizes from the repository and show the daily delta
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090706	Matt Stanford	Fully backwards-compatible change to add DataSizeUnusedMB and LogSizeUnusedMB
**	20090716	Matt Stanford	Added DataPercentChange and LogPercentChange columns
********************************************************************************************************/
CREATE VIEW [hist].[SpaceUsed_DatabaseSizes_Delta_vw]
AS
WITH DBData AS (
	SELECT 
		[HistServerID]
		,[DatabaseID]
		,[DataSizeMB]
		,[LogSizeMB]
		,[DataSizeUnusedMB]
		,[LogSizeUnusedMB]
		,[SampleDate]
		,ROW_NUMBER() OVER (PARTITION BY [HistServerID], [DatabaseID] ORDER BY SampleDate) as rownum
	FROM [hist].[SpaceUsed_DatabaseSizes]
)
SELECT 
	s.[ServerName]
	,d.[DBName]
	,currow.[DataSizeMB]
	,currow.[DataSizeMB] - prevrow.[DataSizeMB]					AS [DataSizeMBIncrease]
	,CASE
		WHEN prevrow.[DataSizeMB] = 0 THEN 0
		ELSE CAST(CAST(currow.[DataSizeMB] - prevrow.[DataSizeMB] AS DECIMAL(10,2)) * 100 / prevrow.[DataSizeMB] AS DECIMAL(10,2))
	END															AS [DataPercentChange]
	,currow.[LogSizeMB]
	,currow.[LogSizeMB] - prevrow.[LogSizeMB]					AS [LogSizeMBIncrease]
	,CASE
		WHEN prevrow.[LogSizeMB] = 0 THEN 0
		ELSE CAST(CAST(currow.[LogSizeMB] - prevrow.[LogSizeMB] AS DECIMAL(10,2)) * 100 / prevrow.[LogSizeMB] AS DECIMAL(10,2))
	END															AS [LogPercentChange]
	,currow.[DataSizeUnusedMB]
	,currow.[DataSizeUnusedMB] - prevrow.[DataSizeUnusedMB]		AS [DataSizeUnusedMBIncrease]
	,currow.[LogSizeUnusedMB]
	,currow.[LogSizeUnusedMB] - prevrow.[LogSizeUnusedMB]		AS [LogSizeUnusedMBIncrease]
	,currow.[SampleDate]
FROM DBData currow
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON s.[HistServerID] = currow.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON d.[DatabaseID] = currow.[DatabaseID]
LEFT OUTER JOIN DBData prevrow
	ON prevrow.[HistServerID] = currow.[HistServerID]
	AND prevrow.[DatabaseID] = currow.[DatabaseID]
	AND currow.[rownum] = prevrow.[rownum] + 1


'
GO
/****** Object:  Table [dbo].[ServerInventory_SQL_sysjobs]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_sysjobs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_SQL_sysjobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [int] NULL,
	[job_id] [uniqueidentifier] NOT NULL,
	[originating_server_id] [int] NOT NULL,
	[name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[enabled] [tinyint] NOT NULL,
	[description] [nvarchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[start_step_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[owner_sid] [varbinary](85) NOT NULL,
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
	[version_number] [int] NOT NULL,
 CONSTRAINT [PK__ServerInventory_SQL_sysjobs__JobID] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_sysjobs]') AND name = N'UIX_sysjobs_ServerID_job_id')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_sysjobs_ServerID_job_id] ON [dbo].[ServerInventory_SQL_sysjobs] 
(
	[ServerID] ASC,
	[job_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [hist].[ServerInventory_SQL_IndexMaster]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_SQL_IndexMaster](
	[HistIndexID] [int] IDENTITY(1,1) NOT NULL,
	[HistServerDBTableID] [int] NULL,
	[IndexName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IndexType] [tinyint] NULL,
	[is_unique] [bit] NULL,
	[ignore_dup_key] [bit] NULL,
	[is_primary_key] [bit] NULL,
	[fillfactor] [tinyint] NULL,
	[is_padded] [bit] NULL,
	[is_disabled] [bit] NULL,
	[allow_row_locks] [bit] NULL,
	[allow_page_locks] [bit] NULL,
	[has_filter] [bit] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateLastSeenOn] [smalldatetime] NULL,
 CONSTRAINT [PK__ServerInventory_SQL_IndexMaster__HistIndexID] PRIMARY KEY CLUSTERED 
(
	[HistIndexID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
/****** Object:  StoredProcedure [hist].[ServerInventory_SQL_GetServerDBTableID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_GetServerDBTableID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_SQL_GetServerDBTableID]
**  Desc:			Procedure to save table/server pairings into the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090728	Matt Stanford	Emergency change because of broken HistServerID
********************************************************************************************************/
CREATE PROCEDURE [hist].[ServerInventory_SQL_GetServerDBTableID] (
	@ServerName			VARCHAR(1000)
	,@DatabaseName		SYSNAME
	,@SchemaName		SYSNAME
	,@TableName			SYSNAME
	,@ServerDBTableID	INT OUTPUT
)
AS

DECLARE 
	@ServerID			INT
	,@DatabaseID		INT
	,@TableID			INT

-- Find the ServerID
EXEC [hist].[ServerInventory_GetServerID] @ServerName, @ServerID OUTPUT

-- Find the DatabaseID
EXEC [hist].[ServerInventory_SQL_GetDatabaseID] @DatabaseName, @DatabaseID OUTPUT

-- Find the TableID
EXEC [hist].[ServerInventory_SQL_GetTableID] @TableName, @SchemaName, @TableID OUTPUT

-- Find the ServerDBTableID	
SELECT 
	@ServerDBTableID = ServerDBTableID
FROM
	[hist].[ServerInventory_SQL_ServerDBTableIDs] id
WHERE id.[HistServerID]	= @ServerID
AND	id.[DatabaseID]	= @DatabaseID
AND id.[TableID]	= @TableID

-- Add the server/db/schema/table combo if necessary
IF @ServerDBTableID IS NULL
BEGIN
	INSERT INTO [hist].[ServerInventory_SQL_ServerDBTableIDs] ([HistServerID], [DatabaseID], [TableID], [LastUpdated]) 
	VALUES (@ServerID, @DatabaseID, @TableID, GETDATE())
	
	SET @ServerDBTableID = SCOPE_IDENTITY()
END

' 
END
GO
/****** Object:  Table [dbo].[ServerInventory_SQL_AttributeList]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_SQL_AttributeList](
	[UniqueID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [int] NOT NULL,
	[AttribID] [int] NOT NULL,
	[AttribValue] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
	[LastModified] [smalldatetime] NULL,
 CONSTRAINT [PK__ServerInventory_SQL_AttributeList__UniqueID] PRIMARY KEY NONCLUSTERED 
(
	[UniqueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeList]') AND name = N'IX_AttribID')
CREATE NONCLUSTERED INDEX [IX_AttribID] ON [dbo].[ServerInventory_SQL_AttributeList] 
(
	[AttribID] ASC
)WITH (PAD_INDEX  = ON, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeList]') AND name = N'IX_ServerID_AttribID')
CREATE NONCLUSTERED INDEX [IX_ServerID_AttribID] ON [dbo].[ServerInventory_SQL_AttributeList] 
(
	[ServerID] ASC,
	[AttribID] ASC
)WITH (PAD_INDEX  = ON, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ServerInventory_SQL_AllServers_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AllServers_vw]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[ServerInventory_SQL_AllServers_vw]
AS
SELECT 
	m.[ServerID]
	,m.[ServerName]
	,m.[InstanceName]
	,m.[PortNumber]
	,CASE 
		WHEN m.[InstanceName] IS NOT NULL AND m.[PortNumber] IS NOT NULL
			THEN m.[ServerName] + ''\'' + m.[InstanceName] + '','' + CAST(m.[PortNumber] AS VARCHAR(10))
		WHEN m.[InstanceName] IS NOT NULL
			THEN m.[ServerName] + ''\'' + m.[InstanceName]
		WHEN m.[PortNumber] IS NOT NULL
			THEN m.[ServerName] + '','' + CAST(m.[PortNumber] AS VARCHAR(10))
		ELSE m.[ServerName]
	END as [FullName]
	,m.[SQLVersion]
	,env.[EnvironmentName]	as Environment
	,ed.[EditionName]		as Edition
	,m.[Description]
	,m.[UseCredential]
	,cred.[UserName]
	,cred.[Password]
	,''Data Source='' + CASE 
		WHEN m.[InstanceName] IS NOT NULL AND m.[PortNumber] IS NOT NULL
			THEN m.[ServerName] + ''\'' + m.[InstanceName] + '','' + CAST(m.[PortNumber] AS VARCHAR(10))
		WHEN m.[InstanceName] IS NOT NULL
			THEN m.[ServerName] + ''\'' + m.InstanceName
		WHEN m.[PortNumber] IS NOT NULL
			THEN m.[ServerName] + '','' + CAST(m.[PortNumber] AS VARCHAR(10))
		ELSE m.[ServerName]
	END + '';Initial Catalog=master;'' + CASE
		WHEN m.[UseCredential] = 0 
			THEN ''Integrated Security=SSPI;''
		ELSE ''User Id='' + cred.[UserName] + '';Password='' + cred.[Password] + '';''
	END AS [DotNetConnectionString]
FROM [dbo].[ServerInventory_SQL_Master] m
INNER JOIN [dbo].[ServerInventory_Environments] env
	ON env.[EnvironmentID] = m.[EnvironmentID]
INNER JOIN [dbo].[ServerInventory_SQL_Editions] ed
	ON ed.[EditionID] = m.[EditionID]
LEFT OUTER JOIN [dbo].[ServerInventory_SQL_ServerCredentials] cred
	ON cred.[CredentialID] = m.[CredentialID]
WHERE m.[Enabled] = 1

'
GO
/****** Object:  Table [dbo].[ServerInventory_ServerOwners_Xref]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerOwners_Xref]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_ServerOwners_Xref](
	[ServerID] [int] NULL,
	[OwnerID] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerOwners_Xref]') AND name = N'CUIX__SI_SrvOwnerXref__ServerID__OwnerID')
CREATE UNIQUE CLUSTERED INDEX [CUIX__SI_SrvOwnerXref__ServerID__OwnerID] ON [dbo].[ServerInventory_ServerOwners_Xref] 
(
	[ServerID] ASC,
	[OwnerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NTPermissions_ServerExceptions]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NTPermissions_ServerExceptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NTPermissions_ServerExceptions](
	[ServerID] [int] NULL,
	[StatementID] [int] NULL,
	[RunInAdditionToDefault] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [hist].[ServerInventory_SQL_ColumnNames]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ColumnNames]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_SQL_ColumnNames](
	[HistColumnID] [int] IDENTITY(1,1) NOT NULL,
	[ColumnName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ColumnTypeID] [int] NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__ServerInventory_SQL_ColumnNames__HistColumnID] PRIMARY KEY CLUSTERED 
(
	[HistColumnID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [History]
) ON [History]
END
GO
/****** Object:  View [hist].[ServerInventory_SQL_ConfigurationValues_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ConfigurationValues_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_SQL_ConfigurationValues_vw]
**  Desc:			View to show Configuration values of SQL servers
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
CREATE VIEW [hist].[ServerInventory_SQL_ConfigurationValues_vw]
AS

SELECT 
	s.[ServerName]
	,o.[configuration_id]
	,o.[name]
	,v.[value]
	,o.[minimum]
	,o.[maximum]
	,v.[value_in_use]
	,o.[description]
	,o.[is_dynamic]
	,o.[is_advanced]
	,v.[DateCreated]
FROM [hist].[ServerInventory_SQL_ConfigurationValues] v
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON v.[HistServerID] = s.[HistServerID]
INNER JOIN [ref].[ServerInventory_SQL_ConfigurationOptions] o
	ON v.[RefConfigOptionID] = o.[RefConfigOptionID]

'
GO
/****** Object:  View [hist].[ServerInventory_SQL_ConfigurationValues_Current_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ConfigurationValues_Current_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_SQL_ConfigurationValues_Current_vw]
**  Desc:			View display only the current (or most current) configuration values
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-08-12
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE VIEW [hist].[ServerInventory_SQL_ConfigurationValues_Current_vw]
AS

SELECT 
	s.[ServerName]
	,o.[configuration_id]
	,o.[name]
	,v.[value]
	,o.[minimum]
	,o.[maximum]
	,v.[value_in_use]
	,o.[description]
	,o.[is_dynamic]
	,o.[is_advanced]
	,v.[DateCreated]
	,v.[DateLastSeenOn]
FROM [hist].[ServerInventory_SQL_ConfigurationValues] v
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON v.[HistServerID]			= s.[HistServerID]
INNER JOIN [ref].[ServerInventory_SQL_ConfigurationOptions] o
	ON v.[RefConfigOptionID]	= o.[RefConfigOptionID]
INNER JOIN (
	SELECT 
		[RefConfigOptionID]
		,[HistServerID]
		,MAX([DateCreated]) AS [DateCreated]
	FROM [hist].[ServerInventory_SQL_ConfigurationValues]
	GROUP BY [RefConfigOptionID], [HistServerID]
) a
	ON a.[RefConfigOptionID]		= v.[RefConfigOptionID]
	AND a.[HistServerID]			= v.[HistServerID]
	AND a.[DateCreated]				= v.[DateCreated]

'
GO
/****** Object:  Table [dbo].[ServerInventory_SQL_ClusterNodes]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ClusterNodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServerInventory_SQL_ClusterNodes](
	[NodeID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [int] NULL,
	[HistServerID] [int] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK__ServerInventory_SQL_ClusterNodes__NodeID] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [hist].[ServerInventory_SQL_Configurations_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_Configurations_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_SQL_Configurations_InsertValue]
**  Desc:			Adds all of the configuration values historically for all servers
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [hist].[ServerInventory_SQL_Configurations_InsertValue] (
	@ServerName					VARCHAR(200)
	,@ConfigName				NVARCHAR(35)
	,@ConfigValue				SQL_VARIANT
	,@ConfigValueInUse			SQL_VARIANT
)
AS

DECLARE 
	@RefConfigOptionID			INT
	,@HistServerID				INT
	,@HistConfigValueID			INT

-- Get/Create the HistServerID
EXEC [hist].[ServerInventory_GetServerID] @ServerName, @HistServerID OUTPUT

-- Lookup the ConfigOptionID
SELECT
	@RefConfigOptionID = co.[RefConfigOptionID]
FROM [ref].[ServerInventory_SQL_ConfigurationOptions] co
WHERE co.[name] = @ConfigName

IF @RefConfigOptionID IS NOT NULL
BEGIN

	-- Check to see if the value already exists
	SELECT 
		@HistConfigValueID = MAX([HistConfigValueID])
	FROM [hist].[ServerInventory_SQL_ConfigurationValues]
	WHERE [RefConfigOptionID]	= @RefConfigOptionID
	AND [HistServerID]			= @HistServerID
	AND [value]					= @ConfigValue
	AND [value_in_use]			= @ConfigValueInUse
	
	IF @HistConfigValueID IS NOT NULL
	BEGIN
		-- Configuration Exists, mark it as "seen"
		-- Do an update
		UPDATE [hist].[ServerInventory_SQL_ConfigurationValues]
		SET [DateLastSeenOn] = GETDATE()
		WHERE [HistConfigValueID] = @HistConfigValueID
	END
	ELSE
	BEGIN
		-- Doesn''t exist, new configuration!!!
		-- Do an insert
		INSERT INTO [hist].[ServerInventory_SQL_ConfigurationValues] ([RefConfigOptionID], [HistServerID], [value], [value_in_use])
		VALUES (@RefConfigOptionID, @HistServerID, @ConfigValue, @ConfigValueInUse)
	
	END

END
' 
END
GO
/****** Object:  StoredProcedure [rpt].[ServerInventory_SQL_Configurations_CompareServers]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rpt].[ServerInventory_SQL_Configurations_CompareServers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[rpt].[ServerInventory_SQL_Configurations_CompareServers]
**  Desc:			Compares the current system configuration of two different servers
**  Auth:			Matt Stanford
**  Date:			2009-08-12
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [rpt].[ServerInventory_SQL_Configurations_CompareServers]
(
	@ServerA			VARCHAR(200)
	,@ServerB			VARCHAR(200)
	,@ShowDifferentOnly	BIT = 0
)
AS

--DECLARE 
--	@ServerA VARCHAR(200)
--	,@ServerB VARCHAR(200)

IF OBJECT_ID(''tempdb.dbo.#ServerAVals'') IS NOT NULL
	DROP TABLE #ServerAVals

IF OBJECT_ID(''tempdb.dbo.#ServerBVals'') IS NOT NULL
	DROP TABLE #ServerBVals

IF OBJECT_ID(''tempdb.dbo.#ConfigOpts'') IS NOT NULL
	DROP TABLE #ConfigOpts
	
-- Collect the union of the options between the two servers
SELECT DISTINCT
	[configuration_id]
	,[name]
	,[description]
	,[minimum]
	,[maximum]
	,[is_dynamic]
	,[is_advanced]
INTO #ConfigOpts
FROM [hist].[ServerInventory_SQL_ConfigurationValues_Current_vw]
WHERE [ServerName] IN (@ServerA,@ServerB)

-- Get all of Server A''s current values
SELECT
	[ServerName]
	,[configuration_id]
	,[value]
	,[value_in_use]
	,[DateCreated]
	,[DateLastSeenOn]
INTO #ServerAVals
FROM [hist].[ServerInventory_SQL_ConfigurationValues_Current_vw]
WHERE [ServerName] = @ServerA

-- Get all of Server B''s current values
SELECT
	[ServerName]
	,[configuration_id]
	,[value]
	,[value_in_use]
	,[DateCreated]
	,[DateLastSeenOn]
INTO #ServerBVals
FROM [hist].[ServerInventory_SQL_ConfigurationValues_Current_vw]
WHERE [ServerName] = @ServerB

SELECT
	@ServerA												AS [ServerA]
	,@ServerB												AS [ServerB]
	,co.[configuration_id]
	,co.[name]
	,co.[description]
	,co.[minimum]
	,co.[maximum]
	,co.[is_dynamic]
	,co.[is_advanced]
	,a.[value]												AS [ServerA_value]
	,b.[value]												AS [ServerB_value]
	,a.[value_in_use]										AS [ServerA_value_in_use]
	,b.[value_in_use]										AS [ServerB_value_in_use]
	,CASE 
		WHEN a.[value] = b.[value] 
			AND a.[value_in_use] = b.[value_in_use]
			THEN 0
		ELSE 1
	END														AS [is_different]
FROM #ConfigOpts co
LEFT OUTER JOIN #ServerAVals a
	ON a.[configuration_id] = co.[configuration_id]
LEFT OUTER JOIN #ServerBVals b
	ON b.[configuration_id] = co.[configuration_id]
WHERE (@ShowDifferentOnly = 0)
OR (@ShowDifferentOnly = 1 AND 
CASE 
	WHEN a.[value] = b.[value] 
		AND a.[value_in_use] = b.[value_in_use]
		THEN 0
	ELSE 1
END = 1
)
' 
END
GO
/****** Object:  View [dbo].[ServerInventory_SQL_ClusterNodes_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ClusterNodes_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_SQL_ClusterNodes_vw]
**  Desc:			View to show which servers are part of which clusters
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			20090706
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
CREATE VIEW [dbo].[ServerInventory_SQL_ClusterNodes_vw]
AS

SELECT 
	m.[ServerID]					AS [ServerID]
	,m.[FullName]					AS [FullSQLInstanceName]
	,s.[ServerName]					AS [NodeName]
FROM [dbo].[ServerInventory_SQL_ClusterNodes] c
INNER JOIN [dbo].[ServerInventory_SQL_AllServers_vw] m
	ON c.[ServerID] = m.[ServerID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON c.[HistServerID] = s.[HistServerID]
	
'
GO
/****** Object:  View [dbo].[ServerInventory_SQL_BackupLicensing_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_BackupLicensing_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ServerInventory_SQL_BackupLicensing_vw]
AS
SELECT DISTINCT
	 vw.servername
	,am.AttribName AS [Software]
	,at.AttribValue AS [Status]
FROM dbo.ServerInventory_SQL_AllServers_vw vw
INNER JOIN dbo.ServerInventory_SQL_AttributeList at
	ON vw.serverid = at.serverid
INNER JOIN [dbo].[ServerInventory_SQL_AttributeMaster] am
	ON at.AttribID = am.AttribID
WHERE am.AttribName = ''redgate''
'
GO
/****** Object:  View [dbo].[ServerInventory_ServerOwners_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerOwners_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_ServerOwners_vw]
**  Desc:			View to pair owners up to thier servers
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-07-21
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE VIEW [dbo].[ServerInventory_ServerOwners_vw]
AS

SELECT
	s.[ServerID]
	,s.[ServerName] + ISNULL(''\'' + s.[InstanceName],'''') AS [ServerName]
	,o.[OwnerName]
	,s.[Environment]
	,s.[Description]
FROM [dbo].[ServerInventory_ServerOwners_Xref] sx
INNER JOIN [dbo].[ServerInventory_Owners] o
	ON o.[OwnerID] = sx.[OwnerID]
INNER JOIN [dbo].[ServerInventory_SQL_AllServers_vw] s
	ON s.[ServerID] = sx.[ServerID]
'
GO
/****** Object:  View [dbo].[ServerInventory_SQL_AllServers_Compatibility_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AllServers_Compatibility_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ServerInventory_SQL_AllServers_Compatibility_vw]
AS

SELECT
	m.[ServerID]
	,m.[FullName]			AS ServerName
	,m.[SQLVersion]
	,m.[Environment]
	,m.[Edition]
	,m.[Description]
	,CASE WHEN CHARINDEX('','',m.[FullName]) = 0
		THEN m.[FullName]
		ELSE LEFT(m.[FullName],CHARINDEX('','',m.[FullName]) - 1)
	END as [ServerNameNoPort]
FROM [dbo].[ServerInventory_SQL_AllServers_vw] m
'
GO
/****** Object:  Table [hist].[ServerInventory_SQL_IndexDetails]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_SQL_IndexDetails](
	[HistIndexID] [int] NULL,
	[HistColumnID] [int] NULL,
	[Sequence] [tinyint] NULL,
	[IsDescending] [bit] NULL,
	[DateCreated] [smalldatetime] NULL
) ON [History]
END
GO
/****** Object:  StoredProcedure [hist].[ServerInventory_SQL_GetHistIndexID]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_GetHistIndexID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_SQL_GetHistIndexID]
**  Desc:			Adds/Looks up the HistIndexID for each Index
**  Auth:			Matt Stanford
**  Date:			2009-10-13
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [hist].[ServerInventory_SQL_GetHistIndexID] (
	@ServerName				VARCHAR(200)
	,@DatabaseName			NVARCHAR(128)
	,@SchemaName			NVARCHAR(128)
	,@TableName				NVARCHAR(128)
	,@IndexName				NVARCHAR(128)
	,@IndexType				TINYINT
	,@is_unique				BIT
	,@ignore_dup_key		BIT
	,@is_primary_key		BIT
	,@fillfactor			TINYINT
	,@is_padded				BIT
	,@is_disabled			BIT
	,@allow_row_locks		BIT
	,@allow_page_locks		BIT
	,@has_filter			BIT
	,@HistIndexID			INT OUTPUT
)

AS
SET NOCOUNT ON

DECLARE
	@HistServerDBTableID	INT
	
-- Get the Server - DB - Schema - Table ID
EXEC [hist].[ServerInventory_SQL_GetServerDBTableID] 
	@ServerName			= @ServerName
	,@DatabaseName		= @DatabaseName
	,@SchemaName		= @SchemaName
	,@TableName			= @TableName
	,@ServerDBTableID	= @HistServerDBTableID OUTPUT
	
-- Lookup the index
SELECT 
	@HistIndexID = [HistIndexID]
FROM [hist].[ServerInventory_SQL_IndexMaster] im
WHERE [HistServerDBTableID] = @HistServerDBTableID
AND [IndexName] = @IndexName
AND [is_unique] = @is_unique
AND [ignore_dup_key] = @ignore_dup_key
AND [is_primary_key] = @is_primary_key
AND [fillfactor] = @fillfactor
AND [is_padded] = @is_padded
AND [is_disabled] = @is_disabled
AND [allow_row_locks] = @allow_row_locks
AND [allow_page_locks] = @allow_page_locks
AND [has_filter] = @has_filter

IF @HistIndexID IS NOT NULL
BEGIN -- Update the last seen date

	UPDATE [hist].[ServerInventory_SQL_IndexMaster]
		SET [DateLastSeenOn] = GETDATE()
	WHERE [HistIndexID] = @HistIndexID

END
ELSE -- Gotta do an insert
BEGIN
	INSERT INTO [hist].[ServerInventory_SQL_IndexMaster]
	VALUES (@HistServerDBTableID,@IndexName,@IndexType,@is_unique,@ignore_dup_key,@is_primary_key,@fillfactor,@is_padded
	,@is_disabled,@allow_row_locks,@allow_page_locks,@has_filter,GETDATE(),GETDATE())
	
	SET @HistIndexID = SCOPE_IDENTITY()
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[ServerInventory_SQL_DeleteClusterNode]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_DeleteClusterNode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_SQL_DeleteClusterNode]
**  Desc:			Procedure to manage deleting data from the ClusterNodes table
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009.06.25
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [dbo].[ServerInventory_SQL_DeleteClusterNode] (
	@ServerName						VARCHAR(100)
	,@InstanceName					VARCHAR(100) = NULL
	,@NodeName						VARCHAR(200)
)
AS

SET NOCOUNT ON

DECLARE
	@ServerID		INT
	,@HistServerID	INT

-- Lookup the master server id
SELECT
	@ServerID = [ServerID]
FROM [dbo].[ServerInventory_SQL_Master]
WHERE [ServerName] = @ServerName
AND ISNULL([InstanceName],'''') = ISNULL(@InstanceName,'''')

-- Lookup the hist server id for the node name
EXEC [hist].[ServerInventory_GetServerID] @NodeName, @HistServerID OUTPUT

IF @ServerID IS NOT NULL AND @HistServerID IS NOT NULL
BEGIN
	-- Try to delete
	DELETE FROM [dbo].[ServerInventory_SQL_ClusterNodes] WHERE [ServerID] = @ServerID AND [HistServerID] = @HistServerID
END 
ELSE
	PRINT(''Server Not Found'')

' 
END
GO
/****** Object:  Table [hist].[ServerInventory_SQL_IndexUsage]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexUsage]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[ServerInventory_SQL_IndexUsage](
	[HistIndexID] [int] NULL,
	[ReadCount] [bigint] NULL,
	[WriteCount] [bigint] NULL,
	[SampleDate] [smalldatetime] NULL,
	[SampleMSTicks] [bigint] NULL
) ON [History]
END
GO
/****** Object:  StoredProcedure [dbo].[ServerInventory_SQL_InsertClusterNode]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_InsertClusterNode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_SQL_InsertClusterNode]
**  Desc:			Procedure to manage inserting data into the ClusterNodes table
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009.06.25
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [dbo].[ServerInventory_SQL_InsertClusterNode] (
	@ServerName						VARCHAR(100)
	,@InstanceName					VARCHAR(100) = NULL
	,@NodeName						VARCHAR(200)
)
AS

SET NOCOUNT ON

DECLARE
	@ServerID		INT
	,@HistServerID	INT

-- Lookup the master server id
SELECT
	@ServerID = [ServerID]
FROM [dbo].[ServerInventory_SQL_Master]
WHERE [ServerName] = @ServerName
AND ISNULL([InstanceName],'''') = ISNULL(@InstanceName,'''')

-- Lookup the hist server id for the node name
EXEC [hist].[ServerInventory_GetServerID] @NodeName, @HistServerID OUTPUT

IF @ServerID IS NOT NULL AND @HistServerID IS NOT NULL
BEGIN
	-- Try to insert
	IF NOT EXISTS (SELECT * FROM [dbo].[ServerInventory_SQL_ClusterNodes] WHERE [ServerID] = @ServerID AND [HistServerID] = @HistServerID)
		INSERT INTO [dbo].[ServerInventory_SQL_ClusterNodes] ([ServerID],[HistServerID])
		VALUES(@ServerID,@HistServerID)
	ELSE
		PRINT(''Node already attached to this instance'')
END 
ELSE
	PRINT(''Server Not Found'')

' 
END
GO
/****** Object:  View [dbo].[ServerInventory_SQL_ServerAttributes_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ServerAttributes_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ServerInventory_SQL_ServerAttributes_vw]
AS

SELECT 
	m.[ServerID]
	,m.[FullName]				AS ServerName
	,m.[SQLVersion]
	,m.[Environment]			AS EnvironmentName
	,am.[AttribName]
	,attrib.[AttribValue]
FROM [dbo].[ServerInventory_SQL_AllServers_vw] m
INNER JOIN [dbo].[ServerInventory_SQL_AttributeList] attrib
	ON attrib.[ServerID] = m.[ServerID]
INNER JOIN [dbo].[ServerInventory_SQL_AttributeMaster] am
	ON attrib.[AttribID] = am.[AttribID]
'
GO
/****** Object:  View [hist].[SpaceUsed_TableSizes_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_TableSizes_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[SpaceUsed_TableSizes_vw]
**  Desc:			View to show all table sizes
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
CREATE VIEW [hist].[SpaceUsed_TableSizes_vw]
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
	ON s.[HistServerID] = m.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON d.[DatabaseID] = m.[DatabaseID]
INNER JOIN [hist].[ServerInventory_SQL_TableIDs] t
	ON t.[TableID] = m.[TableID]

'
GO
/****** Object:  StoredProcedure [hist].[SpaceUsed_TableSizes_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_TableSizes_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [hist].[SpaceUsed_TableSizes_InsertValue] (
	@ServerName			VARCHAR(1000)
	,@DBName			SYSNAME
	,@SchemaName		SYSNAME
	,@TableName			SYSNAME
	,@RowCount			BIGINT
	,@ReservedSpaceKB	BIGINT
	,@DataSpaceKB		BIGINT
	,@IndexSizeKB		BIGINT
	,@UnusedKB			BIGINT
)
AS

SET NOCOUNT ON

DECLARE 
	@ServerDBTableID	INT
	
-- Get the ServerDBTableID
EXEC [hist].[ServerInventory_SQL_GetServerDBTableID] @ServerName, @DBName, @SchemaName, @TableName, @ServerDBTableID OUTPUT

-- Now that we''ve got that, just insert into our detail table
INSERT INTO [hist].[SpaceUsed_TableSizes] ([ServerDBTableID], [RowCount], [ReservedSpaceKB], [DataSpaceKB], [IndexSizeKB], [UnusedKB], [SampleDate])
VALUES (@ServerDBTableID, @RowCount, @ReservedSpaceKB, @DataSpaceKB, @IndexSizeKB, @UnusedKB, GETDATE())
' 
END
GO
/****** Object:  View [hist].[SpaceUsed_TableSizes_Delta_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_TableSizes_Delta_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[SpaceUsed_TableSizes_Delta_vw]
**  Desc:			View to show all table size differences day over day
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
CREATE VIEW [hist].[SpaceUsed_TableSizes_Delta_vw]
AS
WITH TableData AS (
	SELECT 
		[ServerDBTableID]
		,[RowCount]
		,[ReservedSpaceKB]
		,[DataSpaceKB]
		,[IndexSizeKB]
		,[UnusedKB]
		,[SampleDate]
		,ROW_NUMBER() OVER (PARTITION BY [ServerDBTableID] ORDER BY SampleDate) as rownum
	FROM [hist].[SpaceUsed_TableSizes]
)
SELECT 
	s.[ServerName]
	,d.[DBName]
	,t.[SchemaName]
	,t.[TableName]
	,currow.[RowCount]
	,currow.[RowCount] - prevrow.[RowCount] as [RowsAdded]
	,currow.[ReservedSpaceKB]
	,currow.[ReservedSpaceKB] - prevrow.[ReservedSpaceKB] as [ReservedSpaceKBAdded]
	,currow.[DataSpaceKB]
	,currow.[DataSpaceKB] - prevrow.[DataSpaceKB] as [DataSpaceKBAdded]
	,currow.[IndexSizeKB]
	,currow.[IndexSizeKB] - prevrow.[IndexSizeKB] as [IndexSizeKBAdded]
	,currow.[UnusedKB]
	,currow.[UnusedKB] - prevrow.[UnusedKB] as [UnusedKBAdded]
	,currow.[SampleDate] 
FROM TableData currow
INNER JOIN [hist].[ServerInventory_SQL_ServerDBTableIDs] m
	ON m.[ServerDBTableID] = currow.[ServerDBTableID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON s.[HistServerID] = m.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON d.[DatabaseID] = m.[DatabaseID]
INNER JOIN [hist].[ServerInventory_SQL_TableIDs] t
	ON t.[TableID] = m.[TableID]
LEFT OUTER JOIN TableData prevrow
	ON currow.rownum = prevrow.rownum + 1
	AND currow.ServerDBTableID = prevrow.ServerDBTableID

'
GO
/****** Object:  StoredProcedure [rpt].[SpaceUsed_AvgDBGrowthPerDay]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rpt].[SpaceUsed_AvgDBGrowthPerDay]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[rpt].[SpaceUsed_AvgDBGrowthPerDay]
**	Desc:			Reporting procedure to get average database growth per day
**	Auth:			Matt Stanford
**	Debug:			
DECLARE
	@Exclusions	[DatabaseListType]
	
INSERT INTO @Exclusions
VALUES(''OECArchive''),(''OECImports''),(''admin''),(''master''),(''model''),(''OECFaxManager''),(''tempdb''),(''OECConquest'')

EXEC [report].[SpaceUsed_AvgDBGrowthPerDay] ''2009-01-17'', ''2009-04-01'', ''S227938HZ1SQL1\Legacy'', @Exclusions

**	Date:			2009-04-28
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090716	Matt Stanford	Moved from "report" schema to "rpt"
********************************************************************************************************/
CREATE PROCEDURE [rpt].[SpaceUsed_AvgDBGrowthPerDay] (
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
VALUES(''OECArchive''),(''OECImports''),(''admin''),(''master''),(''model''),(''OECFaxManager''),(''tempdb''),(''OECConquest'')
	
SET @StartDate = ''2009-01-17''
SET @EndDate = ''2009-04-01''
SET @ServerName = ''s227938hz1sql1\legacy''
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

' 
END
GO
/****** Object:  StoredProcedure [dbo].[ServerInventory_SQL_SaveAttribute]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_SaveAttribute]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_SQL_SaveAttribute]
**  Desc:			Procedure to manage inserting data into the AttributeList table
**  Auth:			Matt Stanford
**  Date:			2008.12.29
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:		Description:
**	--------	--------	---------------------------------------
********************************************************************************************************/

CREATE PROCEDURE [dbo].[ServerInventory_SQL_SaveAttribute] (
	@ServerID			INT
	,@AttribName		VARCHAR(100)
	,@AttribValue		NVARCHAR(1000)
)
AS

DECLARE
	@AttribID		INT
	
SET @AttribID = (SELECT AttribID FROM [dbo].[ServerInventory_SQL_AttributeMaster] WHERE AttribName = @AttribName)

IF @AttribID IS NOT NULL
BEGIN
	IF NOT EXISTS(SELECT * FROM [dbo].[ServerInventory_SQL_AttributeList] WHERE ServerID = @ServerID AND AttribID = @AttribID)
	BEGIN
		-- Its an insert!
		INSERT INTO [dbo].[ServerInventory_SQL_AttributeList] ([ServerID], [AttribID], [AttribValue])
		VALUES (@ServerID, @AttribID, @AttribValue)
	END
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[ServerInventory_SQL_AttributeList] WHERE ServerID = @ServerID AND AttribID = @AttribID AND AttribValue = @AttribValue)
	BEGIN 
		-- Its an update!
		UPDATE al SET al.AttribValue = @AttribValue
		FROM [dbo].[ServerInventory_SQL_AttributeList] al
		WHERE al.ServerID = @ServerID 
		AND al.AttribID = @AttribID
	END
	ELSE
	BEGIN
		-- Its a trick!
		PRINT(''Nothing to do here'')
	END
END
ELSE
BEGIN
	PRINT(''Attribute does not exist'')
END
' 
END
GO
/****** Object:  View [hist].[SpaceUsed_FileSizes_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_FileSizes_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[SpaceUsed_FileSizes_vw]
**  Desc:			View to pull file size information from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
CREATE VIEW [hist].[SpaceUsed_FileSizes_vw]
AS

SELECT
	s.[ServerName]
	,p.[Path]
	,fn.[FileName]
	,CASE WHEN SUBSTRING(fs.[FileAttribute],1,1) = ''d''
		THEN 1
		ELSE 0
	END AS [IsDirectory]
	,CASE WHEN SUBSTRING(fs.[FileAttribute],2,1) = ''a''
		THEN 1
		ELSE 0
	END AS [IsArchiveSet]
	,CASE WHEN SUBSTRING(fs.[FileAttribute],3,1) = ''?''
		THEN 1
		ELSE 0
	END AS [IsSomething]
	,CASE WHEN SUBSTRING(fs.[FileAttribute],4,1) = ''h''
		THEN 1
		ELSE 0
	END AS [IsHidden]
	,fs.[FileAttribute]
	,fs.[FileSizeKB]
	,fs.[SampleDate]
FROM [hist].[SpaceUsed_FileSizes] fs
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON fs.[HistServerID] = s.[HistServerID]
INNER JOIN [hist].[General_FullFileName] ffn
	ON ffn.[HistPathFileNameID] = fs.[HistPathFileNameID]
INNER JOIN [hist].[General_Paths] p
	ON ffn.[HistPathID] = p.[HistPathID]
INNER JOIN [hist].[General_FileNames] fn
	ON ffn.[HistFileNameID] = fn.[HistFileNameID]

'
GO
/****** Object:  StoredProcedure [hist].[SpaceUsed_FileSizes_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[SpaceUsed_FileSizes_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  StoredProcedure [hist].[ChangeTracking_SQL_GetServerDBObjectActionIDs]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_GetServerDBObjectActionIDs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ChangeTracking_SQL_GetServerDBObjectActionIDs]
**  Desc:			Procedure to save object change into the repository
**  Auth:			Kathy Toth (SQLSlayer)
**  Date:			(unknown)
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090728	Matt Stanford	Emergency change because of broken HistServerID
********************************************************************************************************/
CREATE PROCEDURE [hist].[ChangeTracking_SQL_GetServerDBObjectActionIDs] (
	@ServerName		SYSNAME
	,@DatabaseName	SYSNAME 
	,@SchemaName	SYSNAME
	,@ObjectName	SYSNAME
	,@RefType		NVARCHAR (128)
	,@ActionType	VARCHAR (255)
	,@DateModified	DATE
)
AS

DECLARE @DatabaseID INT
DECLARE @ServerID INT
DECLARE @ActionID INT
DECLARE @ObjectID INT
DECLARE @RecordID INT

-- Find the ServerID
EXEC [hist].[ServerInventory_GetServerID] @ServerName, @ServerID OUTPUT

-- Find the DatabaseID
EXEC [hist].[ServerInventory_SQL_GetDatabaseID] @DatabaseName, @DatabaseID OUTPUT

--Find the ActionID
EXEC [hist].[ChangeTracking_SQL_GETActionID] @ActionType, @ActionID OUTPUT

--find the Objects and their types
EXEC [hist].[ChangeTracking_SQL_GetObjectIDs] @SchemaName, @ObjectName, @RefType, @ObjectID OUTPUT


--Find the DateModified -hmm not to sure how to handle this

-- Add the  combo if necessary
IF NOT EXISTS (SELECT [HistServerID], [DatabaseID], [ObjectID], [ActionID], [DateModified]
				FROM [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]
				WHERE [HistServerID] = @ServerID
				AND DatabaseID = @DatabaseID
				AND ObjectID = @ObjectID
				AND ActionID = @ActionID
				AND DateModified = @DateModified
				)
BEGIN
	INSERT INTO [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] ([HistServerID], [DatabaseID], [ObjectID], [ActionID], [DateModified], [DateCreated]) 
	VALUES (@ServerID, @DatabaseID, @ObjectID, @ActionID, @DateModified, GETDATE())
END

' 
END
GO
/****** Object:  View [hist].[ChangeTracking_AllDatabaseChanges_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[ChangeTracking_AllDatabaseChanges_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ChangeTracking_AllDatabaseChanges_vw]
**  Desc:			View to show all database changes
**  Auth:			Kathy Toth (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
CREATE VIEW [hist].[ChangeTracking_AllDatabaseChanges_vw]
AS
SELECT 
	m.[ServerName]
	,d.[DBName]
	,ot.[SchemaName]
	,ot.[ObjectName]
	,ob.[SQLType] AS [SQL_Object_Type]
	,ob.[RefType] AS [Reference_Object_Type]
	,ob.[SQLDesc] AS [Description]
	,ac.[ActionType] AS [Action]
	,id.[DateModified]
		
FROM [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] id
INNER JOIN [hist].[ChangeTracking_SQL_ObjectIDs] ot
	ON ot.[ObjectID] = id.[ObjectID]
INNER JOIN [hist].[ServerInventory_ServerIDs] m
	ON m.[HistServerID] = id.[HistServerID]
INNER JOIN [hist].[ChangeTracking_SQL_ObjectTypeIDs] ob
	ON ob.[ObjectTypeID] = ot.[ObjectTypeID]
INNER JOIN [hist].[ChangeTracking_SQL_ActionIDs] ac
	ON ac.[ActionID] = id.[ActionID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs]d
	ON d.[DatabaseID] = id.[DatabaseID]

'
GO
/****** Object:  Table [dbo].[Backups_JobSchedules]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Backups_JobSchedules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Backups_JobSchedules](
	[JobScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NULL,
	[BackupAgentID] [int] NULL,
	[BackupTypeID] [int] NULL,
	[Schedule] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Backups_JobSchedules__JobScheduleID] PRIMARY KEY CLUSTERED 
(
	[JobScheduleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [rpt].[Backup_Summary_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[rpt].[Backup_Summary_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[rpt].[Backup_Summary_vw]
**	Desc:			View to retrieve backup history SSRS report
**	Auth:			Adam Bean (SQLSlayer.com)
**	Date:			2009.04.02
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  20090716	Matt Stanford	Changed the join criteria to be based on name, not ID
********************************************************************************************************/
CREATE VIEW [rpt].[Backup_Summary_vw]

AS

SELECT 
	ISNULL(s.[Environment],''Server Was Removed'') AS [Environment]
	,b.[ServerName]
	,b.[DatabaseName]			AS [DBName]
	,b.[StartDate]
	,b.[EndDate]
	,b.[BUTime_Seconds]
	,b.[BUTime_Seconds] / 60	AS [BUTime_Minutes]
	,b.[Size_MBytes]			AS [Size_MB]
	,b.[Size_MBytes] / 1024		AS [Size_GB]
	,b.[BackupType]
	,b.[UserName]
	,b.[PhysicalDeviceName]
	,b.[BackupPath]
	,b.[FileName]
FROM [hist].[Backups_History_vw] b
LEFT OUTER JOIN [dbo].[ServerInventory_SQL_AllServers_vw] s
	ON CASE 
		WHEN s.[InstanceName] IS NOT NULL THEN s.[ServerName] + ''\'' + s.[InstanceName]
		ELSE s.[ServerName]
	END = b.[ServerName]

'
GO
/****** Object:  View [rpt].[DBSizes_Summary_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[rpt].[DBSizes_Summary_vw]'))
EXEC dbo.sp_executesql @statement = N'/******************************************************************************
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
	ON d.[ServerName] = ISNULL(s.[ServerName] + ''\'' + s.[InstanceName], s.[ServerName])
'
GO
/****** Object:  View [hist].[Deadlock_ProcessList_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_ProcessList_vw]
**	Desc:			View to assemble the process list information for each deadlock
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE VIEW [hist].[Deadlock_ProcessList_vw]
AS
SELECT 
	dl.[HistDeadlockID]				AS [HistDeadlockID]
	,p.[HistDeadlockProcessID]		AS [HistDeadlockProcessID]
	,dl_sn.[ServerName]				AS [Deadlock_ServerName]
	,dl.[DeadlockSPID]				AS [Deadlock_SPID]
	,dl.[DeadlockDate]				AS [DeadlockDate]
	,CASE WHEN dl.[VictimProcess] = p.[processid] THEN 1 
		ELSE 0
	END								AS [Was_Deadlock_Victim]
	,p.[processid]					AS [processid]
	,p.[clientapp]					AS [clientapp]
	,p.[currentdb]					AS [DBID]
	,p_sn.[ServerName]				AS [Process_ServerName]
	,p.[hostpid]					AS [hostpid]
	,iso.[IsolationLevel]			AS [IsolationLevel]
	,p.[kpid]						AS [kpid]
	,p.[lastbatchstarted]
	,p.[lastbatchcompleted]
	,p.[lasttranstarted]
	,lm.[LockMode]
	,lm.[LockName]					AS [LockName]
	,lm.[Description]				AS [LockDesc]
	,u.[UserName]					AS [loginname]
	,p.[priority]
	,p.[taskpriority]
	,p.[sbid]
	,p.[schedulerid]
	,p.[spid]
	,stat.[RunStatus]				AS [status]
	,p.[transactionname]
	,p.[transcount]
	,p.[waitresource]
	,p.[waittime]
	,p.[DateCreated]
FROM [hist].[Deadlock_Deadlocks] dl
INNER JOIN [hist].[Deadlock_ProcessList] p
	ON dl.[HistDeadlockID] = p.[HistDeadlockID]
INNER JOIN [hist].[ServerInventory_ServerIDs] dl_sn
	ON dl.[HistServerID] = dl_sn.[HistServerID]
INNER JOIN [hist].[ServerInventory_ServerIDs] p_sn
	ON p.[hostnameHistServerID] = p_sn.[HistServerID]
LEFT OUTER JOIN [ref].[SQLServer_IsolationLevels] iso
	ON p.[RefIsolationLevelID] = iso.[RefIsolationLevelID]
LEFT OUTER JOIN [hist].[Users_UserNames] u
	ON p.[loginnameHistUserID] = u.[UserID]
LEFT OUTER JOIN [ref].[SQLServer_RunStatus] stat
	ON p.[RefRunStatusID] = stat.[RefRunStatusID]
LEFT OUTER JOIN [ref].[SQLServer_LockModes] lm
	ON p.[modeRefLockModeID] = lm.[RefLockModeID]
	
'
GO
/****** Object:  StoredProcedure [hist].[Deadlock_ProcessList_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_ProcessList_InsertValue]
**	Desc:			Procedure to save process info for each deadlock
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE PROCEDURE [hist].[Deadlock_ProcessList_InsertValue] (
	@HistDeadlockID					INT
	,@clientapp						VARCHAR(128)	= NULL
	,@currentdb						INT				= NULL
	,@hostname						VARCHAR(200)	= NULL
	,@hostpid						SMALLINT		= NULL
	,@isolationlevel				VARCHAR(50)		= NULL
	,@kpid							SMALLINT		= NULL
	,@lastbatchstarted				DATETIME		= NULL
	,@lastbatchcompleted			DATETIME		= NULL
	,@lasttranstarted				DATETIME		= NULL
	,@lockmode						VARCHAR(10)		= NULL
	,@loginname						NVARCHAR(128)	= NULL
	,@priority						SMALLINT		= NULL
	,@processid						VARCHAR(20)
	,@taskpriority					SMALLINT		= NULL
	,@sbid							SMALLINT		= NULL
	,@schedulerid					TINYINT			= NULL
	,@spid							SMALLINT		= NULL
	,@runstatus						VARCHAR(50)		= NULL
	,@transactionname				VARCHAR(128)	= NULL
	,@transcount					SMALLINT		= NULL
	,@waitresource					VARCHAR(128)	= NULL
	,@waittime						INT				= NULL
)
AS

DECLARE
	@hostnameHistServerID		INT
	,@loginnameHistUserID		INT
	,@RefIsolationLevelID		INT
	,@RefRunStatusID			INT
	,@RefLockModeID				INT
	
SET @loginname = ISNULL(@loginname,'''')
SET @hostname = ISNULL(@hostname,'''')

EXEC [hist].[Users_GetUserID] @loginname, @loginnameHistUserID OUTPUT
EXEC [hist].[ServerInventory_GetServerID] @hostname, @hostnameHistServerID OUTPUT

SELECT
	@RefIsolationLevelID = [RefIsolationLevelID]
FROM [ref].[SQLServer_IsolationLevels]
WHERE [IsolationLevel] = @isolationlevel

SELECT
	@RefRunStatusID = [RefRunStatusID]
FROM [ref].[SQLServer_RunStatus]
WHERE [RunStatus] = @runstatus

SELECT 
	@RefLockModeID = [RefLockModeID]
FROM [ref].[SQLServer_LockModes]
WHERE [LockMode] = @lockmode

IF NOT EXISTS (SELECT * FROM [hist].[Deadlock_ProcessList] WHERE [HistDeadlockID] = @HistDeadlockID AND [processid] = @processid)
BEGIN
	INSERT INTO [hist].[Deadlock_ProcessList] ([HistDeadlockID],[clientapp],[currentdb],[hostnameHistServerID],[hostpid],[RefIsolationLevelID],[kpid]
		,[lastbatchstarted],[lastbatchcompleted],[lasttranstarted],[modeRefLockModeID],[loginnameHistUserID],[priority]
		,[processid],[taskpriority],[sbid],[schedulerid],[spid],[RefRunStatusID],[transactionname],[transcount],[waitresource],[waittime])
	VALUES (@HistDeadlockID, @clientapp,@currentdb,@hostnameHistServerID,@hostpid,@RefIsolationLevelID,@kpid
		,@lastbatchstarted,@lastbatchcompleted,@lasttranstarted,@RefLockModeID,@loginnameHistUserID,@priority
		,@processid,@taskpriority,@sbid,@schedulerid,@spid,@RefRunStatusID,@transactionname,@transcount,@waitresource,@waittime)
END

' 
END
GO
/****** Object:  View [hist].[Deadlock_ResourceList_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_ResourceList_vw]
**	Desc:			View to assemble the resource list information for each deadlock
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE VIEW [hist].[Deadlock_ResourceList_vw]
AS
SELECT 
	rl.[HistDeadlockResourceID]
	,rl.[HistDeadlockID]
	,rl.[id]
	,rl.[locktype]
	,db.[DBName]
	,tbl.[SchemaName]
	,tbl.[TableName]
	,rl.[indexname]
	,rl.[hobtid]
	,lm.[LockMode]
	,lm.[LockName]					AS [LockName]
	,lm.[Description]				AS [LockDesc]
	,rl.[associatedObjectID]
	,rl.[dbid]
	,rl.[fileid]
	,rl.[pageid]
	,rl.[DateCreated]
FROM [hist].[Deadlock_ResourceList] rl
LEFT OUTER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] db
	ON rl.[dbnameHistDatabaseID] = db.[DatabaseID]
LEFT OUTER JOIN [hist].[ServerInventory_SQL_TableIDs] tbl
	ON rl.[objectnameHistTableID] = tbl.[TableID]
INNER JOIN [ref].[SQLServer_LockModes] lm
	ON rl.[modeRefLockModeID] = lm.[RefLockModeID]
'
GO
/****** Object:  StoredProcedure [hist].[Deadlock_ResourceList_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_ResourceList_InsertValue]
**	Desc:			Procedure to save resource info for each deadlock
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE PROCEDURE [hist].[Deadlock_ResourceList_InsertValue] (
	@HistDeadlockID					INT
	,@id							VARCHAR(20)
	,@locktype						VARCHAR(10)		= NULL
	,@objectname					VARCHAR(500)	= NULL
	,@indexname						VARCHAR(128)	= NULL
	,@hobtid						VARCHAR(50)		= NULL
	,@mode							VARCHAR(10)		= NULL
	,@associatedObjectID			VARCHAR(50)		= NULL
	,@dbid							SMALLINT		= NULL
	,@fileid						SMALLINT		= NULL
	,@pageid						INT				= NULL
)
AS 

DECLARE
	@ServerName						VARCHAR(200)
	,@HistTableID					INT
	,@HistDatabaseID				INT
	,@vDBName						VARCHAR(128)
	,@vSchemaName					VARCHAR(128)
	,@vObjectName					VARCHAR(128)
	,@firstDot						INT
	,@secondDot						INT
	,@RefLockModeID					INT

SELECT 
	@RefLockModeID = [RefLockModeID]
FROM [ref].[SQLServer_LockModes]
WHERE [LockMode] = @mode

IF @locktype = ''dblock''
BEGIN
	-- In here, @objectname is the database name
	SET @vDBName = @objectname
END 
ELSE
BEGIN
	SET @firstDot = CHARINDEX(''.'',@objectname)
	SET @secondDot = CHARINDEX(''.'',@objectname,@firstDot + 1)
		
	IF (@firstDot > 0 AND @secondDot > 0)
	BEGIN
		SET @vDBName = LEFT(@objectname,@firstDot - 1)
		SET @vSchemaName = SUBSTRING(@objectName,@firstdot + 1, @seconddot - @firstdot - 1)
		SET @vObjectName = RIGHT(@objectname,LEN(@objectname) - @seconddot)

		EXEC [hist].[ServerInventory_SQL_GetTableID] @vObjectName, @vSchemaName, @HistTableID OUTPUT
	END
END

-- Get database id
EXEC [hist].[ServerInventory_SQL_GetDatabaseID] @vDBName, @HistDatabaseID OUTPUT

IF NOT EXISTS (SELECT * FROM [hist].[Deadlock_ResourceList] WHERE [HistDeadlockID] = @HistDeadlockID AND [id] = @id)
BEGIN
	INSERT INTO [hist].[Deadlock_ResourceList] ([HistDeadlockID], [id], [locktype], [objectnameHistTableID], [dbnameHistDatabaseID], [indexname],
		[hobtid],[modeRefLockModeID],[associatedObjectID],[dbid],[fileid],[pageid])
	VALUES (@HistDeadlockID, @id, @locktype, @HistTableID, @HistDatabaseID, @indexname,
		@hobtid, @RefLockModeID, @associatedObjectID, @dbid, @fileid, @pageid)
END

' 
END
GO
/****** Object:  Table [hist].[Deadlock_Process_ExecutionStack]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_Process_ExecutionStack]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Deadlock_Process_ExecutionStack](
	[HistDeadlockExecutionStackID] [int] IDENTITY(1,1) NOT NULL,
	[HistDeadlockProcessID] [int] NULL,
	[Sequence] [smallint] NULL,
	[Stack] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__Deadlock_Process_ExecutionStack__HistDeadlockExecutionStackID] PRIMARY KEY CLUSTERED 
(
	[HistDeadlockExecutionStackID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_Process_ExecutionStack]') AND name = N'UIX__Deadlock_Process_ExecutionStack__HistDeadlockProcessID__Sequence')
CREATE UNIQUE NONCLUSTERED INDEX [UIX__Deadlock_Process_ExecutionStack__HistDeadlockProcessID__Sequence] ON [hist].[Deadlock_Process_ExecutionStack] 
(
	[HistDeadlockProcessID] ASC,
	[Sequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [hist].[Deadlock_ResourceOwners]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceOwners]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Deadlock_ResourceOwners](
	[HistDeadlockResourceID] [int] NULL,
	[HistDeadlockProcessID] [int] NULL,
	[modeRefLockModeID] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceOwners]') AND name = N'UIX__Deadlock_ResourceOwners__HistDeadlockResourceID__HistDeadlockProcessID')
CREATE UNIQUE NONCLUSTERED INDEX [UIX__Deadlock_ResourceOwners__HistDeadlockResourceID__HistDeadlockProcessID] ON [hist].[Deadlock_ResourceOwners] 
(
	[HistDeadlockResourceID] ASC,
	[HistDeadlockProcessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[NTPermissions_SQLStatements_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NTPermissions_SQLStatements_vw]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[NTPermissions_SQLStatements_vw]
AS
-- Select all servers that don''t have a "instead of" flag set
-- Select all environment specific things
-- Select all server specific things

-- Default action for all servers that don''t have the "instead of" flag set
SELECT
	srv.[ServerID]
	,srv.[FullName]
	,srv.[DotNetConnectionString]
	,N''EXEC [admin].[dbo].[NTPermissions_AllDBs]'' AS [SQLToExecute]
	,''Default'' AS [Description]
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

'
GO
/****** Object:  View [dbo].[NTPermissions_ShowMappings_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NTPermissions_ShowMappings_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NTPermissions_ShowMappings_vw]
AS

SELECT
	sql_sta.[Description]
	,env.[EnvironmentName] as [Name]
	,''Environment'' as [EnvOrSrv]
	,sql_sta.[SQLToExecute]
FROM [dbo].[NTPermissions_EnvironmentExceptions] e_ex
INNER JOIN [dbo].[NTPermissions_PermissionSQLStatements] sql_sta
	ON e_ex.[StatementID] = sql_sta.[StatementID]
INNER JOIN [dbo].[ServerInventory_Environments] env
	ON e_ex.[EnvironmentID] = env.[EnvironmentID]
	
UNION ALL

SELECT
	sql_sta.[Description]
	,srv.[FullName] as [ItemName]
	,''Server'' as [EnvOrSrv]
	,sql_sta.[SQLToExecute]
FROM [dbo].[NTPermissions_ServerExceptions] s_ex
INNER JOIN [dbo].[NTPermissions_PermissionSQLStatements] sql_sta
	ON s_ex.[StatementID] = sql_sta.[StatementID]
INNER JOIN [dbo].[ServerInventory_SQL_AllServers_vw] srv
	ON s_ex.[ServerID] = srv.[ServerID]
'
GO
/****** Object:  View [hist].[Jobs_SQL_JobSteps_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobSteps_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[Jobs_SQL_JobSteps_vw]
**  Desc:			View to pull back the job step definitions from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
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
	ON job_s.[HistServerID] = j.[HistServerID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON s.[HistServerID] = js.[HistServerIDForServerCol]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON js.[HistDatabaseID] = d.[DatabaseID]
INNER JOIN [CurrentJobs] cj
	ON js.[HistJobID] = cj.[HistJobID]

'
GO
/****** Object:  StoredProcedure [hist].[Jobs_SQL_InsertJobStep]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_InsertJobStep]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  StoredProcedure [hist].[Jobs_SQL_InsertJobHistory]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_InsertJobHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

SET @dt = RIGHT(''00000000'' + CAST(@run_date AS VARCHAR(8)),8)
SET @tm = RIGHT(''000000'' + CAST(@run_time AS VARCHAR(6)),6)

SET @run_datetime = CAST(LEFT(@dt,4) + ''-'' + SUBSTRING(@dt,5,2) + ''-'' + RIGHT(@dt,2) + '' '' + LEFT(@tm,2) + '':'' + SUBSTRING(@tm,3,2) + '':'' + RIGHT(@tm,2) AS DATETIME)

IF @HistJobID IS NOT NULL
BEGIN

	IF NOT EXISTS (SELECT * FROM [hist].[Jobs_SQL_JobHistory] WHERE [HistJobID] = @HistJobID AND [instance_id] = @instance_id)
	BEGIN
		-- INSERT The record
		INSERT INTO [hist].[Jobs_SQL_JobHistory] ([HistJobID], [instance_id], [step_id], [step_name], [sql_message_id], [sql_severity], [message], [run_status], [run_datetime], [run_duration], [operator_id_emailed], [operator_id_netsent], [operator_id_paged], [retries_attempted], [HistServerID])
		VALUES(@HistJobID,@instance_id,@step_id,@step_name,@sql_message_id,@sql_severity,@message,@run_status,@run_datetime,@run_duration,@operator_id_emailed,@operator_id_netsent,@operator_id_paged,@retries_attempted,@HistServerID)
	
	END

END

' 
END
GO
/****** Object:  View [hist].[Jobs_SQL_JobHistory_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobHistory_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[Jobs_SQL_JobHistory_vw]
**  Desc:			View to pull back the job history results from the repository
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			(unknown)
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**	20090717	Matt Stanford	Changed because of HistServerID change
********************************************************************************************************/
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
	ON j.[HistServerID] = s.[HistServerID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s2
	ON jh.[HistServerID] = s2.[HistServerID]
	

'
GO
/****** Object:  Table [hist].[Deadlock_ResourceWaiters]    Script Date: 01/05/2011 14:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceWaiters]') AND type in (N'U'))
BEGIN
CREATE TABLE [hist].[Deadlock_ResourceWaiters](
	[HistDeadlockResourceID] [int] NULL,
	[HistDeadlockProcessID] [int] NULL,
	[modeRefLockModeID] [int] NULL,
	[requestType] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceWaiters]') AND name = N'UIX__Deadlock_ResourceWaiters__HistDeadlockResourceID__HistDeadlockProcessID')
CREATE UNIQUE NONCLUSTERED INDEX [UIX__Deadlock_ResourceWaiters__HistDeadlockResourceID__HistDeadlockProcessID] ON [hist].[Deadlock_ResourceWaiters] 
(
	[HistDeadlockResourceID] ASC,
	[HistDeadlockProcessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ServerInventory_DatabaseOwners_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_DatabaseOwners_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_DatabaseOwners_vw]
**  Desc:			View to pair databases up to thier owners
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-07-21
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE VIEW [dbo].[ServerInventory_DatabaseOwners_vw]
AS

SELECT
	s.[ServerName] + ISNULL(''\'' + s.[InstanceName],'''') AS [ServerName]
	,d.[DBName]
	,o.[OwnerName]
FROM [dbo].[ServerInventory_DatabaseOwners_Xref] dox
INNER JOIN [dbo].[ServerInventory_Owners] o
	ON dox.[OwnerID] = o.[OwnerID]
INNER JOIN [dbo].[ServerInventory_SQL_AllServers_vw] s
	ON dox.[ServerID] = s.[ServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON dox.[DatabaseID] = d.[DatabaseID]

'
GO
/****** Object:  View [dbo].[ServerInventory_ServerApplications_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerApplications_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_ServerApplications_vw]
**  Desc:			View to pair servers up to thier applications
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-07-21
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE VIEW [dbo].[ServerInventory_ServerApplications_vw]
AS

SELECT 
	s.[ServerID]
	,s.[ServerName] + ISNULL(''\'' + s.[InstanceName],'''') AS [ServerName]
	,a.[ApplicationName]
	,s.[Environment]
	,s.[Description]
FROM [dbo].[ServerInventory_ServerApplications_Xref] sax
INNER JOIN [dbo].[ServerInventory_SQL_AllServers_vw] s
	ON sax.[ServerID] = s.[ServerID]
INNER JOIN [dbo].[ServerInventory_Applications] a
	ON sax.[ApplicationID] = a.[ApplicationID]
'
GO
/****** Object:  View [dbo].[ServerInventory_Owners_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_Owners_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_Owners_vw]
**  Desc:			View to show all of an owner''s items
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009-07-21
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE VIEW [dbo].[ServerInventory_Owners_vw]
AS

SELECT
	''SERVER''												AS [Type]
	,NULL													AS [ParentItem]
	,[ServerName]											AS [Item]
	,[OwnerName]											AS [OwnerName]
FROM [dbo].[ServerInventory_ServerOwners_vw]

UNION ALL

SELECT
	''APPLICATION''											AS [Type]
	,NULL													AS [ParentItem]
	,[ApplicationName]										AS [Item]
	,[OwnerName]											AS [OwnerName]
FROM [dbo].[ServerInventory_ApplicationOwners_vw]

UNION ALL

SELECT
	''DATABASE''												AS [Type]
	,[ServerName]											AS [ParentItem]
	,[DBName]												AS [Item]
	,[OwnerName]											AS [OwnerName]
FROM [dbo].[ServerInventory_DatabaseOwners_vw]
	
'
GO
/****** Object:  View [dbo].[ServerInventory_AllServers_Compatibility_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_AllServers_Compatibility_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ServerInventory_AllServers_Compatibility_vw]
AS
SELECT *
FROM dbo.ServerInventory_SQL_AllServers_Compatibility_vw
'
GO
/****** Object:  StoredProcedure [hist].[Deadlock_ResourceWaiter_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceWaiter_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_ResourceWaiter_InsertValue]
**	Desc:			Procedure to save waiter information for each deadlock
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE PROCEDURE [hist].[Deadlock_ResourceWaiter_InsertValue] (
	@HistDeadlockID					INT
	,@ResourceID					VARCHAR(20)
	,@ProcessID						VARCHAR(20)
	,@mode							VARCHAR(10)		= NULL
	,@requestType					VARCHAR(10)		= NULL
)
AS

DECLARE
	@HistDeadlockResourceID			INT
	,@HistDeadlockProcessID			INT
	,@RefLockModeID					INT
	
SELECT
	@HistDeadlockProcessID = [HistDeadlockProcessID]
FROM [hist].[Deadlock_ProcessList]
WHERE [HistDeadlockID] = @HistDeadlockID
AND [processid] = @ProcessID

SELECT
	@HistDeadlockResourceID = [HistDeadlockResourceID] 
FROM [hist].[Deadlock_ResourceList]
WHERE [HistDeadlockID] = @HistDeadlockID
AND [id] = @ResourceID

SELECT 
	@RefLockModeID = [RefLockModeID]
FROM [ref].[SQLServer_LockModes]
WHERE [LockMode] = @mode

IF NOT EXISTS (SELECT * FROM [hist].[Deadlock_ResourceWaiters] WHERE [HistDeadlockProcessID] = @HistDeadlockProcessID 
		AND [HistDeadlockResourceID] = @HistDeadlockResourceID)
BEGIN
	INSERT INTO [hist].[Deadlock_ResourceWaiters] ([HistDeadlockProcessID], [HistDeadlockResourceID], [modeRefLockModeID], [requestType])
	VALUES (@HistDeadlockProcessID, @HistDeadlockResourceID, @RefLockModeID, @requestType)
END

' 
END
GO
/****** Object:  StoredProcedure [hist].[Deadlock_ResourceOwner_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceOwner_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_ResourceOwner_InsertValue]
**	Desc:			Procedure to save resource owner information for each deadlock
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE PROCEDURE [hist].[Deadlock_ResourceOwner_InsertValue] (
	@HistDeadlockID					INT
	,@ResourceID					VARCHAR(20)
	,@ProcessID						VARCHAR(20)
	,@mode							VARCHAR(10)		= NULL
)
AS

DECLARE
	@HistDeadlockResourceID			INT
	,@HistDeadlockProcessID			INT
	,@RefLockModeID					INT
	
SELECT
	@HistDeadlockProcessID = [HistDeadlockProcessID]
FROM [hist].[Deadlock_ProcessList]
WHERE [HistDeadlockID] = @HistDeadlockID
AND [processid] = @ProcessID

SELECT
	@HistDeadlockResourceID = [HistDeadlockResourceID] 
FROM [hist].[Deadlock_ResourceList]
WHERE [HistDeadlockID] = @HistDeadlockID
AND [id] = @ResourceID

SELECT 
	@RefLockModeID = [RefLockModeID]
FROM [ref].[SQLServer_LockModes]
WHERE [LockMode] = @mode

IF NOT EXISTS (SELECT * FROM [hist].[Deadlock_ResourceOwners] WHERE [HistDeadlockProcessID] = @HistDeadlockProcessID 
		AND [HistDeadlockResourceID] = @HistDeadlockResourceID)
BEGIN
	INSERT INTO [hist].[Deadlock_ResourceOwners] ([HistDeadlockProcessID], [HistDeadlockResourceID], [modeRefLockModeID])
	VALUES (@HistDeadlockProcessID, @HistDeadlockResourceID, @RefLockModeID)
END

' 
END
GO
/****** Object:  StoredProcedure [hist].[Deadlock_Process_ExecutionStack_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_Process_ExecutionStack_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_Process_ExecutionStack_InsertValue]
**	Desc:			Procedure to save execution stack information for each deadlock process
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE PROCEDURE [hist].[Deadlock_Process_ExecutionStack_InsertValue] (
	@HistDeadlockID					INT
	,@processid						VARCHAR(20)
	,@Stack							NVARCHAR(4000)
	,@sequence						SMALLINT
)
AS

DECLARE
	@HistDeadlockProcessID			INT
	
-- Lookup process id
SELECT
	@HistDeadlockProcessID = [HistDeadlockProcessID]
FROM [hist].[Deadlock_ProcessList]
WHERE [HistDeadlockID] = @HistDeadlockID
AND [processid] = @processid

IF @HistDeadlockProcessID IS NOT NULL AND @Stack NOT IN (''inputbuf'',''sp_executesql     '',''EXECUTE sp_executeSQL @SQL     '')
BEGIN
	IF NOT EXISTS (SELECT * FROM [hist].[Deadlock_Process_ExecutionStack] WHERE [HistDeadlockProcessID] = @HistDeadlockProcessID AND [Sequence] = @sequence)
	BEGIN
		INSERT INTO [hist].[Deadlock_Process_ExecutionStack] ([HistDeadlockProcessID],[Stack],[sequence])
		VALUES (@HistDeadlockProcessID,@Stack,@sequence)
	END
END

' 
END
GO
/****** Object:  StoredProcedure [hist].[Deadlock_GetDeadlockInfo]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[Deadlock_GetDeadlockInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[hist].[Deadlock_GetDeadlockInfo]
**	Desc:			Procedure to gather all of the deadlock info and output it all at once
**	Auth:			Matt Stanford
**	Date:			2010.12.20
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
**  
********************************************************************************************************/
CREATE PROCEDURE [hist].[Deadlock_GetDeadlockInfo] (
	@HistDeadlockID					INT
)
AS

SELECT 
	''Deadlock''						AS [WhatIsThis]
	,*
FROM [hist].[Deadlock_Deadlocks_vw] 
WHERE [HistDeadlockID] = @HistDeadlockID

SELECT
	''ProcessList''					AS [WhatIsThis]
	,*
FROM [hist].[Deadlock_ProcessList_vw]
WHERE [HistDeadlockID] = @HistDeadlockID

SELECT
	''ExecutionStack''				AS [WhatIsThis]
	,p.[processid]
	,st.[Sequence]
	,st.[Stack]
FROM [hist].[Deadlock_Process_ExecutionStack] st
INNER JOIN [hist].[Deadlock_ProcessList_vw] p
	ON st.[HistDeadlockProcessID] = p.[HistDeadlockProcessID]
WHERE p.[HistDeadlockID] = @HistDeadlockID
ORDER BY p.[processid], st.[Sequence]

SELECT
	''ResourceList''					AS [WhatIsThis]
	,*
FROM [hist].[Deadlock_ResourceList_vw]
WHERE [HistDeadlockID] = @HistDeadlockID

SELECT
	''ResourceOwners''				AS [WhatIsThis]
	,r.[id]							AS [ResourceID]
	,p.[processid]
	,lm.[LockMode]
	,lm.[LockName]
	,ISNULL(db.[DBName],'''') + ISNULL(''.'' + tbl.[SchemaName],'''') + ISNULL(''.'' + tbl.[TableName],'''') AS [ObjectName]
	,r.[IndexName]					AS [IndexName]
FROM [hist].[Deadlock_ResourceOwners] ro
INNER JOIN [hist].[Deadlock_ResourceList] r
	ON ro.[HistDeadlockResourceID] = r.[HistDeadlockResourceID]
INNER JOIN [hist].[Deadlock_ProcessList] p
	ON ro.[HistDeadlockProcessID] = p.[HistDeadlockProcessID]
INNER JOIN [ref].[SQLServer_LockModes] lm
	ON ro.[modeRefLockModeID] = lm.[RefLockModeID]
LEFT OUTER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] db
	ON r.[dbnameHistDatabaseID] = db.[DatabaseID]
LEFT OUTER JOIN [hist].[ServerInventory_SQL_TableIDs] tbl
	ON r.[objectnameHistTableID] = tbl.[TableID]
WHERE r.[HistDeadlockID] = @HistDeadlockID

SELECT
	''ResourceWaiters''				AS [WhatIsThis]
	,r.[id]							AS [ResourceID]
	,p.[processid]
	,rw.[requestType]
	,lm.[LockMode]
	,lm.[LockName]
	,ISNULL(db.[DBName],'''') + ISNULL(''.'' + tbl.[SchemaName],'''') + ISNULL(''.'' + tbl.[TableName],'''') AS [ObjectName]
	,r.[IndexName]					AS [IndexName]
FROM [hist].[Deadlock_ResourceWaiters] rw
INNER JOIN [hist].[Deadlock_ResourceList] r
	ON rw.[HistDeadlockResourceID] = r.[HistDeadlockResourceID]
INNER JOIN [hist].[Deadlock_ProcessList] p
	ON rw.[HistDeadlockProcessID] = p.[HistDeadlockProcessID]
INNER JOIN [ref].[SQLServer_LockModes] lm
	ON rw.[modeRefLockModeID] = lm.[RefLockModeID]
LEFT OUTER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] db
	ON r.[dbnameHistDatabaseID] = db.[DatabaseID]
LEFT OUTER JOIN [hist].[ServerInventory_SQL_TableIDs] tbl
	ON r.[objectnameHistTableID] = tbl.[TableID]
WHERE r.[HistDeadlockID] = @HistDeadlockID
' 
END
GO
/****** Object:  StoredProcedure [rpt].[DBSizes_Summary]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rpt].[DBSizes_Summary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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
LEFT JOIN [dbo].[Split_fn](@Environment,'','') e
	ON s.[Environment] = e.[item]
LEFT JOIN [dbo].[Split_fn](@ServerName,'','') sn
	ON s.[ServerName] = sn.[item]
LEFT JOIN [dbo].[Split_fn](@DBName,'','') db
	ON s.[DBName] = db.[item]
WHERE (@DateStart IS NULL AND @DateEnd IS NULL OR [SampleDate] BETWEEN @DateStart AND @DateEnd)
AND ((e.[item] IS NOT NULL AND @Environment IS NOT NULL) OR @Environment IS NULL) -- Specified environment(s), or all
AND ((sn.[item] IS NOT NULL AND @ServerName IS NOT NULL) OR @ServerName IS NULL) -- Specified server name(s), or all
AND ((db.[item] IS NOT NULL AND @DBName IS NOT NULL) OR @DBName IS NULL) -- Specified database name(s), or all

SET NOCOUNT OFF
' 
END
GO
/****** Object:  View [rpt].[DBSizes_FileGrowth_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[rpt].[DBSizes_FileGrowth_vw]'))
EXEC dbo.sp_executesql @statement = N'
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
'
GO
/****** Object:  View [rpt].[DBSizes_DBCounts_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[rpt].[DBSizes_DBCounts_vw]'))
EXEC dbo.sp_executesql @statement = N'
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
			WHEN [DBName] IN (''admin'',''master'',''model'',''msdb'',''tempdb'') OR [DBName] LIKE ''%adventureworks%'' THEN 0
			ELSE 1
		END AS [IsUser]
		,CASE
			WHEN [DBName] IN (''admin'',''master'',''model'',''msdb'',''tempdb'') OR [DBName] LIKE ''%adventureworks%'' THEN 1
			ELSE 0
		END AS [IsSystem]
	FROM [rpt].[DBSizes_Summary_vw]
	WHERE [SampleDate] > DATEADD(dd,-2,GETDATE())
) t
GROUP BY [ServerName]
'
GO
/****** Object:  Table [dbo].[Backups_DBsToNotBackup]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Backups_DBsToNotBackup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Backups_DBsToNotBackup](
	[DBsToNotBackupID] [int] IDENTITY(1,1) NOT NULL,
	[JobScheduleID] [int] NULL,
	[DatabaseName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Backups_DBsToNotBackup__DBsToNotBackupID] PRIMARY KEY CLUSTERED 
(
	[DBsToNotBackupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Backups_DBsToBackup]    Script Date: 01/05/2011 14:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Backups_DBsToBackup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Backups_DBsToBackup](
	[DBsToBackupID] [int] IDENTITY(1,1) NOT NULL,
	[JobScheduleID] [int] NULL,
	[DatabaseName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateCreated] [smalldatetime] NULL,
 CONSTRAINT [PK__Backups_DBsToBackup__DBsToBackupID] PRIMARY KEY CLUSTERED 
(
	[DBsToBackupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [rpt].[Backup_Summary]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rpt].[Backup_Summary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**	Name:			[rpt].[Backup_Summary]
**	Desc:			Reporting procedure for backup history SSRS report
**	Auth:			Adam Bean (SQLSlayer.com)
**	Date:			2009.04.02
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:		Description:
**	--------	--------	---------------------------------------
**  
********************************************************************************************************/

CREATE PROCEDURE [rpt].[Backup_Summary]
(
	@Environment	VARCHAR(MAX)	= NULL
	,@ServerName	VARCHAR(MAX)	= NULL
	,@DBName		NVARCHAR(MAX)	= NULL
	,@DateStart		DATETIME		= NULL
	,@DateEnd		DATETIME		= NULL
)

AS

SET NOCOUNT ON

SELECT 
	[Environment]
	,[ServerName]
	,[DBName]
	,[StartDate]
	,[EndDate]
	,[BUTime_Seconds]
	,[BUTime_Minutes]
	,[Size_MB]
	,[Size_GB]
	,[BackupType]
	,[UserName]
	,[PhysicalDeviceName]
	,[BackupPath]
	,[FileName]
FROM [rpt].[Backup_Summary_vw]
WHERE (@Environment IS NULL OR [Environment] IN (SELECT [item] AS [Environment] FROM [admin].[dbo].[Split_fn](@Environment,'','')))
AND (@ServerName IS NULL OR [ServerName] IN (SELECT [item] AS [ServerName] FROM [admin].[dbo].[Split_fn](@ServerName,'','')))
AND (@DBName IS NULL OR [DBName] IN (SELECT [item] AS [DatabaseName] FROM [admin].[dbo].[Split_fn](@DBName,'','')))
AND (@DateStart IS NULL AND @DateEnd IS NULL OR [StartDate] BETWEEN @DateStart AND @DateEnd)

SET NOCOUNT OFF

' 
END
GO
/****** Object:  View [dbo].[SpaceUsed_CollectTableOrDatabase_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SpaceUsed_CollectTableOrDatabase_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[SpaceUsed_CollectTableOrDatabase_vw]
AS

WITH TableOrDB
AS
(
	SELECT 
		a.[ServerName]
		,a.[SQLVersion]
		,a.[AttribName]
		,a.[AttribValue]
		,s.[DotNetConnectionString]
	FROM [dbo].[ServerInventory_SQL_ServerAttributes_vw] a
	INNER JOIN [dbo].[ServerInventory_SQL_AllServers_vw] s
		ON a.ServerID = s.ServerID
	WHERE a.[AttribName] IN (''SpaceUsed_Collect_Database'', ''SpaceUsed_Collect_Table'')
)
SELECT 
	COALESCE(t.[ServerName],d.[ServerName]) as ServerName
	,COALESCE(t.[SQLVersion],d.[SQLVersion]) as SQLVersion
	,CASE WHEN t.[AttribValue] IS NULL 
		THEN 0
		ELSE 1
	END as CollectTable
	,CASE WHEN d.[AttribValue] IS NULL 
		THEN 0
		ELSE 1
	END as CollectDatabase
	,COALESCE(t.[DotNetConnectionString],d.[DotNetConnectionString]) as ConnectionString
FROM (SELECT * FROM TableOrDB WHERE [AttribName] = ''SpaceUsed_Collect_Table'' AND [AttribValue] = ''TRUE'') t
FULL OUTER JOIN (SELECT * FROM TableOrDB WHERE [AttribName] = ''SpaceUsed_Collect_Database'' AND [AttribValue] = ''TRUE'') d
ON t.[ServerName] = d.[ServerName]
'
GO
/****** Object:  View [dbo].[ServerInventory_SQL_ServerInstances_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ServerInstances_vw]'))
EXEC dbo.sp_executesql @statement = N'
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
	WHERE [AttribName] = ''InstanceName''
)
SELECT 
	i.[InstanceName]
	,d.[ServerName] as DEV
	,q.[ServerName] as QA
	,p.[ServerName] as Prod
FROM (SELECT DISTINCT [InstanceName] FROM SN) i
LEFT OUTER JOIN (SELECT [ServerName],[InstanceName] FROM SN WHERE [Environment] = ''DEV'') d
	ON d.[InstanceName] = i.[InstanceName]
LEFT OUTER JOIN (SELECT [ServerName],[InstanceName] FROM SN WHERE [Environment] = ''QA'') q
	ON q.[InstanceName] = i.[InstanceName]
LEFT OUTER JOIN (SELECT [ServerName],[InstanceName] FROM SN WHERE [Environment] IN (''SAVVIS'',''BI'',''OECPROD'',''OEC Production'')) p
	ON p.[InstanceName] = i.[InstanceName]

'
GO
/****** Object:  View [dbo].[ServerInventory_SQL_ServerInfo_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ServerInfo_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ServerInventory_SQL_ServerInfo_vw]
AS

SELECT 
	srv.[ServerID]
	,srv.[FullName] as [ServerName]
	,srv.[Environment]
	,srv.[Description]
	,COALESCE(att.[SQLVersion],srv.[SQLVersion]) AS [SQLVersion]
	,att.[SQLServer_ServicePack]
	,att.[CumulativeUpdate]
	,att.[Description] as [ProductVersionDescription]
	,att.[SQLServer_Build]
	,COALESCE(att.[SQLServer_Edition],srv.[Edition]) AS [Edition]
FROM [dbo].[ServerInventory_SQL_AllServers_vw] srv
LEFT OUTER JOIN (
	SELECT 
		PVT.[ServerName]
		,[SQLServer_Build]
		,bd.[SQLVersion]
		,bd.[ProductLevel]
		,bd.[CumulativeUpdate]
		,[SQLServer_Edition]
		,[SQLServer_ServicePack]
		,bd.[Description]
	FROM
	(
		SELECT 
			s.FullName as ServerName
			,sa.AttribName
			,sa.AttribValue
		FROM [dbo].[ServerInventory_SQL_AllServers_vw] s
		LEFT OUTER JOIN [dbo].[ServerInventory_SQL_ServerAttributes_vw] sa
			ON sa.ServerName = s.FullName
		WHERE sa.AttribName IN (''SQLServer_Build'',''SQLServer_ServicePack'',''SQLServer_Edition'',''SQLServer_Engine'')
	) as st
	PIVOT
	(
		MAX(AttribValue)
		FOR AttribName 
			IN ([SQLServer_Build],[SQLServer_ServicePack],[SQLServer_Edition],[SQLServer_Engine])
	) as PVT
	LEFT OUTER JOIN [dbo].[ServerInventory_SQL_BuildLevelDesc] bd
		ON bd.[ProductVersion] = PVT.[SQLServer_Build]
) att
ON att.[ServerName] = srv.[FullName]
'
GO
/****** Object:  StoredProcedure [dbo].[ServerInventory_SQL_SaveAttributes]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_SaveAttributes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_SQL_SaveAttributes]
**  Desc:			Procedure to manage inserting data into the Attributes table
					Contains a cursor... but it should only run when servers are added to the master table
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009.06.25
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [dbo].[ServerInventory_SQL_SaveAttributes] (
	@ServerID						INT
	,@AttributesToAdd				[dbo].[AttributeListType] READONLY
)
AS

DECLARE 
	@AttribName						VARCHAR(100)
	,@AttribValue					NVARCHAR(1000)

DECLARE #savAtt CURSOR LOCAL STATIC FOR
SELECT
	AttributeName
	,AttributeValue
FROM @AttributesToAdd

OPEN #savAtt

FETCH NEXT FROM #savAtt INTO @AttribName, @AttribValue
WHILE @@FETCH_STATUS = 0
BEGIN
	EXEC [dbo].[ServerInventory_SQL_SaveAttribute] @ServerID, @AttribName, @AttribValue
	FETCH NEXT FROM #savAtt INTO @AttribName, @AttribValue
END

CLOSE #savAtt
DEALLOCATE #savAtt

' 
END
GO
/****** Object:  View [hist].[ServerInventory_SQL_IndexUsage_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexUsage_vw]'))
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_SQL_IndexUsage_vw] 
**  Desc:			View index usage data over time
**  Auth:			Matt Stanford 
**  Date:			2009-10-13
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE VIEW [hist].[ServerInventory_SQL_IndexUsage_vw] 
AS

SELECT 
	im.[HistIndexID]
	,s.[ServerName]
	,d.[DBName]
	,t.[SchemaName]
	,t.[TableName]
	,im.[IndexName]
	,iu.[ReadCount]
	,iu.[WriteCount]
	,iu.[SampleMSTicks]
	,iu.[SampleDate]
FROM [hist].[ServerInventory_SQL_IndexMaster] im
INNER JOIN [hist].[ServerInventory_SQL_IndexUsage] iu
	ON im.[HistIndexID] = iu.[HistIndexID]
INNER JOIN [hist].[ServerInventory_SQL_ServerDBTableIDs] sdbt
	ON sdbt.[ServerDBTableID] = im.[HistServerDBTableID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON sdbt.[HistServerID] = s.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON sdbt.[DatabaseID] = d.[DatabaseID]
INNER JOIN [hist].[ServerInventory_SQL_TableIDs] t
	ON sdbt.[TableID] = t.[TableID]

'
GO
/****** Object:  StoredProcedure [hist].[ServerInventory_SQL_IndexUsage_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexUsage_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_SQL_IndexUsage_InsertValue]
**  Desc:			Inserts Usage information for each index
**  Auth:			Matt Stanford
**  Date:			2009-10-13
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [hist].[ServerInventory_SQL_IndexUsage_InsertValue] (
	@ServerName				VARCHAR(200)
	,@DatabaseName			NVARCHAR(128)
	,@SchemaName			NVARCHAR(128)
	,@TableName				NVARCHAR(128)
	,@IndexName				NVARCHAR(128)
	,@IndexType				TINYINT
	,@is_unique				BIT
	,@ignore_dup_key		BIT
	,@is_primary_key		BIT
	,@fillfactor			TINYINT
	,@is_padded				BIT
	,@is_disabled			BIT
	,@allow_row_locks		BIT
	,@allow_page_locks		BIT
	,@has_filter			BIT
	,@ReadCount				BIGINT
	,@WriteCount			BIGINT
	,@SampleMSTicks			BIGINT
)
AS

SET NOCOUNT ON

DECLARE
	@HistIndexID			INT

EXEC [hist].[ServerInventory_SQL_GetHistIndexID] 
	@ServerName = @ServerName
	,@DatabaseName = @DatabaseName
	,@SchemaName = @SchemaName
	,@TableName = @TableName
	,@IndexName = @IndexName
	,@IndexType = @IndexType
	,@is_unique = @is_unique
	,@ignore_dup_key = @ignore_dup_key
	,@is_primary_key = @is_primary_key
	,@fillfactor = @fillfactor
	,@is_padded = @is_padded
	,@is_disabled = @is_disabled
	,@allow_row_locks = @allow_row_locks
	,@allow_page_locks = @allow_page_locks
	,@has_filter = @has_filter
	,@HistIndexID = @HistIndexID OUTPUT

INSERT INTO [hist].[ServerInventory_SQL_IndexUsage] ([HistIndexID],[ReadCount],[WriteCount],[SampleMSTicks],[SampleDate])
VALUES (@HistIndexID,@ReadCount,@WriteCount,@SampleMSTicks,GETDATE())

' 
END
GO
/****** Object:  View [hist].[ServerInventory_SQL_Indexes_vw]    Script Date: 01/05/2011 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_Indexes_vw]'))
EXEC dbo.sp_executesql @statement = N'
/*******************************************************************************************************
**  Name:			[hist].[ServerInventory_SQL_Indexes_vw]
**  Desc:			View index information
**  Auth:			Matt Stanford 
**  Date:			2009-10-13
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE VIEW [hist].[ServerInventory_SQL_Indexes_vw]
AS

SELECT
	s.[ServerName]
	,d.[DBName]
	,t.[SchemaName]
	,t.[TableName]
	,im.[IndexName]
	,KeyCols.[Col1] + KeyCols.[Col2] + KeyCols.[Col3] + KeyCols.[Col4] + KeyCols.[Col5] 
		+ KeyCols.[Col6] + KeyCols.[Col7] + KeyCols.[Col8] + KeyCols.[Col9] + KeyCols.[Col10] + KeyCols.[Col11] as KeyCols
	,NonKeyCols.[Col1] + NonKeyCols.[Col2] + NonKeyCols.[Col3] + NonKeyCols.[Col4] + NonKeyCols.[Col5] 
		+ NonKeyCols.[Col6] + NonKeyCols.[Col7] + NonKeyCols.[Col8] + NonKeyCols.[Col9] + NonKeyCols.[Col10] + NonKeyCols.[Col11] as NonKeyCols
FROM [hist].[ServerInventory_SQL_IndexMaster] im
INNER JOIN [hist].[ServerInventory_SQL_ServerDBTableIDs] sdbt
	ON sdbt.[ServerDBTableID] = im.[HistServerDBTableID]
INNER JOIN [hist].[ServerInventory_ServerIDs] s
	ON sdbt.[HistServerID] = s.[HistServerID]
INNER JOIN [hist].[ServerInventory_SQL_DatabaseIDs] d
	ON sdbt.[DatabaseID] = d.[DatabaseID]
INNER JOIN [hist].[ServerInventory_SQL_TableIDs] t
	ON sdbt.[TableID] = t.[TableID]
LEFT OUTER JOIN 
	(
	SELECT
		[HistIndexID]
		,''['' + [1] + '']'' AS ''Col1''
		,ISNULL('',['' + [2] + '']'','''') AS ''Col2''
		,ISNULL('',['' + [3] + '']'','''') AS ''Col3''
		,ISNULL('',['' + [4] + '']'','''') AS ''Col4''
		,ISNULL('',['' + [5] + '']'','''') AS ''Col5''
		,ISNULL('',['' + [6] + '']'','''') AS ''Col6''
		,ISNULL('',['' + [7] + '']'','''') AS ''Col7''
		,ISNULL('',['' + [8] + '']'','''') AS ''Col8''
		,ISNULL('',['' + [9] + '']'','''') AS ''Col9''
		,ISNULL('',['' + [10] + '']'','''') AS ''Col10''
		,ISNULL('',['' + [11] + '']'','''') AS ''Col11''
	FROM (
		SELECT 
			ic.[HistIndexID]
			,c.[ColumnName]
			,ROW_NUMBER() OVER (PARTITION BY ic.[HistIndexID] ORDER BY ic.[Sequence]) pt
		FROM [hist].[ServerInventory_SQL_IndexDetails] ic
		INNER JOIN [hist].[ServerInventory_SQL_ColumnNames] c
			ON ic.[HistColumnID] = c.[HistColumnID]
		WHERE ic.[Sequence] >= 1 -- No nonkey columns
	) as ST
	PIVOT
	(
		MAX([ColumnName])
		FOR pt IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11])
	) as PvT
) AS KeyCols
	ON im.[HistIndexID] = KeyCols.[HistIndexID]
LEFT OUTER JOIN  (
	SELECT
		[HistIndexID]
		,''['' + [1] + '']'' AS ''Col1''
		,ISNULL('',['' + [2] + '']'','''') AS ''Col2''
		,ISNULL('',['' + [3] + '']'','''') AS ''Col3''
		,ISNULL('',['' + [4] + '']'','''') AS ''Col4''
		,ISNULL('',['' + [5] + '']'','''') AS ''Col5''
		,ISNULL('',['' + [6] + '']'','''') AS ''Col6''
		,ISNULL('',['' + [7] + '']'','''') AS ''Col7''
		,ISNULL('',['' + [8] + '']'','''') AS ''Col8''
		,ISNULL('',['' + [9] + '']'','''') AS ''Col9''
		,ISNULL('',['' + [10] + '']'','''') AS ''Col10''
		,ISNULL('',['' + [11] + '']'','''') AS ''Col11''
	FROM (
		SELECT 
			ic.[HistIndexID]
			,c.[ColumnName]
			,ROW_NUMBER() OVER (PARTITION BY ic.[HistIndexID] ORDER BY ic.[Sequence]) pt
		FROM [hist].[ServerInventory_SQL_IndexDetails] ic
		INNER JOIN [hist].[ServerInventory_SQL_ColumnNames] c
			ON ic.[HistColumnID] = c.[HistColumnID]
		WHERE ic.[Sequence] = 0 -- No key columns
	) as ST
	PIVOT
	(
		MAX([ColumnName])
		FOR pt IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11])
	) as PvT
) AS NonKeyCols
	ON KeyCols.[HistIndexID] = NonKeyCols.[HistIndexID]

'
GO
/****** Object:  StoredProcedure [dbo].[ServerInventory_SQL_SQLBackup_Audit_InsertValue]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_SQLBackup_Audit_InsertValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
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
	(''SQLBackup_Version'',@Version)
	,(''SQLBackup_License'',@License)
	,(''SQLBackup_SerialNumber'',@SerialNumber)
	,(''SQLBackup_AuditDate'',CAST(GETDATE() AS NVARCHAR(1000)))

EXEC [dbo].[ServerInventory_SQL_SaveAttributes] @ServerID, @ALT

' 
END
GO
/****** Object:  StoredProcedure [dbo].[ServerInventory_SQL_InsertServer]    Script Date: 01/05/2011 14:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_InsertServer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*******************************************************************************************************
**  Name:			[dbo].[ServerInventory_SQL_InsertServer]
**  Desc:			Adds a new instance to the SQL_Master table
**  Auth:			Matt Stanford (SQLSlayer)
**  Date:			2009.06.25
**  Debug:			
*******************************************************************************
**	Change History
*******************************************************************************
**	Date:		Author:			Description:
**	--------	--------		---------------------------------------
********************************************************************************************************/
CREATE PROCEDURE [dbo].[ServerInventory_SQL_InsertServer] (
	@ServerName						VARCHAR(100)
	,@InstanceName					VARCHAR(100) = NULL
	,@PortNumber					INT = NULL
	,@Description					NVARCHAR(MAX)
	,@SQLVersion					INT
	,@Enabled						BIT = 1
	,@EnvrionmentName				VARCHAR(100)
	,@EditionName					VARCHAR(100)
	,@AttributesToAdd				[dbo].[AttributeListType] READONLY
	,@ServerID						INT OUTPUT
)

AS

SET NOCOUNT ON

DECLARE
	@EnvironmentID					INT
	,@EditionID						INT

-- Lookup the Environment ID
SELECT
	@EnvironmentID = [EnvironmentID]
FROM [dbo].[ServerInventory_Environments]
WHERE [EnvironmentName] = @EnvrionmentName

IF @EnvironmentID IS NULL
BEGIN
	PRINT(''Environment is not recognized'')
	RETURN 255
END

-- Lookup the Edition ID
SELECT
	@EditionID = [EditionID]
FROM [dbo].[ServerInventory_SQL_Editions]
WHERE [EditionName] = @EditionName

IF @EditionID IS NULL
BEGIN
	PRINT(''Edition is not recognized'')
	RETURN 255
END

-- Make sure there isn''t already a server like this
IF NOT EXISTS (
	SELECT * 
	FROM [dbo].[ServerInventory_SQL_Master] 
	WHERE [ServerName] = @ServerName 
	AND ISNULL([InstanceName],'''') = ISNULL(@InstanceName,'''')
	AND ISNULL([PortNumber],0) = ISNULL(@PortNumber,0)
	AND [EditionID] = @EditionID
	AND [EnvironmentID] = @EnvironmentID
	)
BEGIN
	-- All clear, do the insert
	INSERT INTO [dbo].[ServerInventory_SQL_Master] ([ServerName], [InstanceName], [PortNumber], [Description], [SQLVersion], [Enabled], [EnvironmentID], [EditionID], [UseCredential])
	VALUES(@ServerName,@InstanceName,@PortNumber,@Description,@SQLVersion,@Enabled,@EnvironmentID,@EditionID,0)
	
	SET @ServerID = SCOPE_IDENTITY()
	
	EXEC [dbo].[ServerInventory_SQL_SaveAttributes] @ServerID, @AttributesToAdd

END
ELSE
	PRINT(''Server already in the table'')
' 
END
GO
/****** Object:  Default [DF__Backups_BackupAgents__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Backups_BackupAgents__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_BackupAgents]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_BackupAgents__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_BackupAgents] ADD  CONSTRAINT [DF__Backups_BackupAgents__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Backups_BackupCommands__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Backups_BackupCommands__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_BackupCommands]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_BackupCommands__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_BackupCommands] ADD  CONSTRAINT [DF__Backups_BackupCommands__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Backups_BackupTypes__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Backups_BackupTypes__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_BackupTypes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_BackupTypes__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_BackupTypes] ADD  CONSTRAINT [DF__Backups_BackupTypes__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Backups_Jobs__RecordHistory]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Backups_Jobs__RecordHistory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_Jobs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_Jobs__RecordHistory]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_Jobs] ADD  CONSTRAINT [DF__Backups_Jobs__RecordHistory]  DEFAULT ((1)) FOR [RecordHistory]
END


End
GO
/****** Object:  Default [DF__Backups_Jobs__Enabled]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Backups_Jobs__Enabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_Jobs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_Jobs__Enabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_Jobs] ADD  CONSTRAINT [DF__Backups_Jobs__Enabled]  DEFAULT ((1)) FOR [Enabled]
END


End
GO
/****** Object:  Default [DF__Backups_Jobs__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Backups_Jobs__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_Jobs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_Jobs__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_Jobs] ADD  CONSTRAINT [DF__Backups_Jobs__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Backups_JobSchedules__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Backups_JobSchedules__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_JobSchedules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_JobSchedules__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_JobSchedules] ADD  CONSTRAINT [DF__Backups_JobSchedules__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF_SrvSettings_targetSrv]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_SrvSettings_targetSrv]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_SrvSettings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SrvSettings_targetSrv]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_SrvSettings] ADD  CONSTRAINT [DF_SrvSettings_targetSrv]  DEFAULT ('oecfp3') FOR [targetSrv]
END


End
GO
/****** Object:  Default [DF_SrvSettings_targetShare]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_SrvSettings_targetShare]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_SrvSettings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SrvSettings_targetShare]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_SrvSettings] ADD  CONSTRAINT [DF_SrvSettings_targetShare]  DEFAULT ('sqlbu$') FOR [targetShare]
END


End
GO
/****** Object:  Default [DF_SrvSettings_dbRecord]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_SrvSettings_dbRecord]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_SrvSettings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SrvSettings_dbRecord]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_SrvSettings] ADD  CONSTRAINT [DF_SrvSettings_dbRecord]  DEFAULT ((1)) FOR [dbRecord]
END


End
GO
/****** Object:  Default [DF_SrvSettings_buExeptions]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_SrvSettings_buExeptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_SrvSettings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SrvSettings_buExeptions]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_SrvSettings] ADD  CONSTRAINT [DF_SrvSettings_buExeptions]  DEFAULT ((0)) FOR [buExceptions]
END


End
GO
/****** Object:  Default [DF_SrvSettings_alertLevel]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_SrvSettings_alertLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_SrvSettings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SrvSettings_alertLevel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_SrvSettings] ADD  CONSTRAINT [DF_SrvSettings_alertLevel]  DEFAULT ((2)) FOR [alertLevel]
END


End
GO
/****** Object:  Default [DF_SrvSettings_jobEnabled]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_SrvSettings_jobEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_SrvSettings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SrvSettings_jobEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_SrvSettings] ADD  CONSTRAINT [DF_SrvSettings_jobEnabled]  DEFAULT ((1)) FOR [jobEnabled]
END


End
GO
/****** Object:  Default [DF_SrvSettings_loggingLevel]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_SrvSettings_loggingLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_SrvSettings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SrvSettings_loggingLevel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Backups_SrvSettings] ADD  CONSTRAINT [DF_SrvSettings_loggingLevel]  DEFAULT ((0)) FOR [loggingLevel]
END


End
GO
/****** Object:  Default [DF__ChangeControl_ChangeSet__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ChangeControl_ChangeSet__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSet]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ChangeControl_ChangeSet__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ChangeControl_ChangeSet] ADD  CONSTRAINT [DF__ChangeControl_ChangeSet__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__ChangeControl_ChangeSetDetail__IsRemoved]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ChangeControl_ChangeSetDetail__IsRemoved]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSetDetail]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ChangeControl_ChangeSetDetail__IsRemoved]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ChangeControl_ChangeSetDetail] ADD  CONSTRAINT [DF__ChangeControl_ChangeSetDetail__IsRemoved]  DEFAULT ((0)) FOR [IsRemoved]
END


End
GO
/****** Object:  Default [DF__ChangeControl_ChangeSetDetail__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ChangeControl_ChangeSetDetail__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSetDetail]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ChangeControl_ChangeSetDetail__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ChangeControl_ChangeSetDetail] ADD  CONSTRAINT [DF__ChangeControl_ChangeSetDetail__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__ChangeControl_DeployMaster__IsEnabled]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ChangeControl_DeployMaster__IsEnabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployDetail]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ChangeControl_DeployMaster__IsEnabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ChangeControl_DeployDetail] ADD  CONSTRAINT [DF__ChangeControl_DeployMaster__IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
END


End
GO
/****** Object:  Default [DF__ChangeControl_DeployDetail__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ChangeControl_DeployDetail__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployDetail]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ChangeControl_DeployDetail__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ChangeControl_DeployDetail] ADD  CONSTRAINT [DF__ChangeControl_DeployDetail__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__ChangeControl_DeployMaster__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ChangeControl_DeployMaster__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ChangeControl_DeployMaster__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ChangeControl_DeployMaster] ADD  CONSTRAINT [DF__ChangeControl_DeployMaster__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Collectors_Log__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Collectors_Log__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_Log]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Collectors_Log__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Collectors_Log] ADD  CONSTRAINT [DF__Collectors_Log__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Collectors_RecipeDetails__Enabled]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Collectors_RecipeDetails__Enabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeDetails]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Collectors_RecipeDetails__Enabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Collectors_RecipeDetails] ADD  CONSTRAINT [DF__Collectors_RecipeDetails__Enabled]  DEFAULT ((1)) FOR [Enabled]
END


End
GO
/****** Object:  Default [DF__Collectors_RecipeDetails__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Collectors_RecipeDetails__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeDetails]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Collectors_RecipeDetails__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Collectors_RecipeDetails] ADD  CONSTRAINT [DF__Collectors_RecipeDetails__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Collectors_RecipeMaster__Enabled]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Collectors_RecipeMaster__Enabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Collectors_RecipeMaster__Enabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Collectors_RecipeMaster] ADD  CONSTRAINT [DF__Collectors_RecipeMaster__Enabled]  DEFAULT ((1)) FOR [Enabled]
END


End
GO
/****** Object:  Default [DF__Collectors_RecipeMaster__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Collectors_RecipeMaster__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Collectors_RecipeMaster__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Collectors_RecipeMaster] ADD  CONSTRAINT [DF__Collectors_RecipeMaster__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Collectors_Scripts__Enabled]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Collectors_Scripts__Enabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_Scripts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Collectors_Scripts__Enabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Collectors_Scripts] ADD  CONSTRAINT [DF__Collectors_Scripts__Enabled]  DEFAULT ((1)) FOR [Enabled]
END


End
GO
/****** Object:  Default [DF__Collectors_Scripts__DateCreated]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Collectors_Scripts__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_Scripts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Collectors_Scripts__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Collectors_Scripts] ADD  CONSTRAINT [DF__Collectors_Scripts__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__NTPermissions_EnvironmentExceptions__RunInAdditionToDefault]    Script Date: 01/05/2011 14:39:52 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__NTPermissions_EnvironmentExceptions__RunInAdditionToDefault]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_EnvironmentExceptions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__NTPermissions_EnvironmentExceptions__RunInAdditionToDefault]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NTPermissions_EnvironmentExceptions] ADD  CONSTRAINT [DF__NTPermissions_EnvironmentExceptions__RunInAdditionToDefault]  DEFAULT ((1)) FOR [RunInAdditionToDefault]
END


End
GO
/****** Object:  Default [DF__NTPermissions_ServerExceptions__RunInAdditionToDefault]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__NTPermissions_ServerExceptions__RunInAdditionToDefault]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_ServerExceptions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__NTPermissions_ServerExceptions__RunInAdditionToDefault]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NTPermissions_ServerExceptions] ADD  CONSTRAINT [DF__NTPermissions_ServerExceptions__RunInAdditionToDefault]  DEFAULT ((1)) FOR [RunInAdditionToDefault]
END


End
GO
/****** Object:  Default [DF__ServerInventory_SQL_AttributeList__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ServerInventory_SQL_AttributeList__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeList]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ServerInventory_SQL_AttributeList__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServerInventory_SQL_AttributeList] ADD  CONSTRAINT [DF__ServerInventory_SQL_AttributeList__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__ServerInventory_SQL_AttributeList__LastModified]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ServerInventory_SQL_AttributeList__LastModified]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeList]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ServerInventory_SQL_AttributeList__LastModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServerInventory_SQL_AttributeList] ADD  CONSTRAINT [DF__ServerInventory_SQL_AttributeList__LastModified]  DEFAULT (getdate()) FOR [LastModified]
END


End
GO
/****** Object:  Default [DF__SI_SQL_ClusterNodes__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__SI_SQL_ClusterNodes__DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ClusterNodes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SI_SQL_ClusterNodes__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServerInventory_SQL_ClusterNodes] ADD  CONSTRAINT [DF__SI_SQL_ClusterNodes__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__ServerInventory_SQL_Master__Enabled]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ServerInventory_SQL_Master__Enabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ServerInventory_SQL_Master__Enabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServerInventory_SQL_Master] ADD  CONSTRAINT [DF__ServerInventory_SQL_Master__Enabled]  DEFAULT ((1)) FOR [Enabled]
END


End
GO
/****** Object:  Default [DF__ServerInventory_SQL_Master__UseCredential]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ServerInventory_SQL_Master__UseCredential]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ServerInventory_SQL_Master__UseCredential]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServerInventory_SQL_Master] ADD  CONSTRAINT [DF__ServerInventory_SQL_Master__UseCredential]  DEFAULT ((0)) FOR [UseCredential]
END


End
GO
/****** Object:  Default [DF__Backups_BackupJobHistory__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Backups_BackupJobHistory__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_BackupJobHistory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_BackupJobHistory__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Backups_BackupJobHistory] ADD  CONSTRAINT [DF__Backups_BackupJobHistory__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Backups_Devices__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Backups_Devices__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_Devices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_Devices__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Backups_Devices] ADD  CONSTRAINT [DF__Backups_Devices__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Backups_Types__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Backups_Types__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_Types]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Backups_Types__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Backups_Types] ADD  CONSTRAINT [DF__Backups_Types__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__ChangeControl_DeployHistory__IsError]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__ChangeControl_DeployHistory__IsError]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_DeployHistory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ChangeControl_DeployHistory__IsError]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ChangeControl_DeployHistory] ADD  CONSTRAINT [DF__ChangeControl_DeployHistory__IsError]  DEFAULT ((0)) FOR [IsError]
END


End
GO
/****** Object:  Default [DF__ChangeControl_DeployHistory__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__ChangeControl_DeployHistory__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_DeployHistory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ChangeControl_DeployHistory__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ChangeControl_DeployHistory] ADD  CONSTRAINT [DF__ChangeControl_DeployHistory__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__ChangeTracking_SQL_ServerDBObjectActionIDs__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__ChangeTracking_SQL_ServerDBObjectActionIDs__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ChangeTracking_SQL_ServerDBObjectActionIDs__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] ADD  CONSTRAINT [DF__ChangeTracking_SQL_ServerDBObjectActionIDs__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Deadlock_Deadlocks__SampleDate]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Deadlock_Deadlocks__SampleDate]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_Deadlocks]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Deadlock_Deadlocks__SampleDate]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Deadlock_Deadlocks] ADD  CONSTRAINT [DF__Deadlock_Deadlocks__SampleDate]  DEFAULT (getdate()) FOR [SampleDate]
END


End
GO
/****** Object:  Default [DF__Deadlock_ProcessList__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Deadlock_ProcessList__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Deadlock_ProcessList__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Deadlock_ProcessList] ADD  CONSTRAINT [DF__Deadlock_ProcessList__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Deadlock_ResourceList__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Deadlock_ResourceList__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Deadlock_ResourceList__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Deadlock_ResourceList] ADD  CONSTRAINT [DF__Deadlock_ResourceList__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__DTSStore_Categories__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__DTSStore_Categories__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_Categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__DTSStore_Categories__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[DTSStore_Categories] ADD  CONSTRAINT [DF__DTSStore_Categories__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__DTSStore_Descriptions__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__DTSStore_Descriptions__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_Descriptions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__DTSStore_Descriptions__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[DTSStore_Descriptions] ADD  CONSTRAINT [DF__DTSStore_Descriptions__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__DTSStore_Owners__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__DTSStore_Owners__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_Owners]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__DTSStore_Owners__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[DTSStore_Owners] ADD  CONSTRAINT [DF__DTSStore_Owners__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__DTSStore_PackageNames__datecreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__DTSStore_PackageNames__datecreated]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageNames]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__DTSStore_PackageNames__datecreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[DTSStore_PackageNames] ADD  CONSTRAINT [DF__DTSStore_PackageNames__datecreated]  DEFAULT (getdate()) FOR [datecreated]
END


End
GO
/****** Object:  Default [DF__DTSStore_PackageStore__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__DTSStore_PackageStore__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__DTSStore_PackageStore__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[DTSStore_PackageStore] ADD  CONSTRAINT [DF__DTSStore_PackageStore__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__General_FileNames__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__General_FileNames__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[General_FileNames]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__General_FileNames__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[General_FileNames] ADD  CONSTRAINT [DF__General_FileNames__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__General_FullFileName__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__General_FullFileName__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[General_FullFileName]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__General_FullFileName__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[General_FullFileName] ADD  CONSTRAINT [DF__General_FullFileName__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__General_Paths__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__General_Paths__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[General_Paths]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__General_Paths__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[General_Paths] ADD  CONSTRAINT [DF__General_Paths__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Jobs_SQL_JobHistory__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Jobs_SQL_JobHistory__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobHistory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Jobs_SQL_JobHistory__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Jobs_SQL_JobHistory] ADD  CONSTRAINT [DF__Jobs_SQL_JobHistory__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Jobs_SQL_Jobs__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Jobs_SQL_Jobs__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_Jobs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Jobs_SQL_Jobs__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Jobs_SQL_Jobs] ADD  CONSTRAINT [DF__Jobs_SQL_Jobs__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Jobs_SQL_Jobs__LastSeenOn]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Jobs_SQL_Jobs__LastSeenOn]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_Jobs]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Jobs_SQL_Jobs__LastSeenOn]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Jobs_SQL_Jobs] ADD  CONSTRAINT [DF__Jobs_SQL_Jobs__LastSeenOn]  DEFAULT (getdate()) FOR [LastSeenOn]
END


End
GO
/****** Object:  Default [DF__Jobs_SQL_JobSteps__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Jobs_SQL_JobSteps__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobSteps]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Jobs_SQL_JobSteps__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Jobs_SQL_JobSteps] ADD  CONSTRAINT [DF__Jobs_SQL_JobSteps__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__Metrics_QueryStats__SampleDate]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Metrics_QueryStats__SampleDate]') AND parent_object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Metrics_QueryStats__SampleDate]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Metrics_QueryStats] ADD  CONSTRAINT [DF__Metrics_QueryStats__SampleDate]  DEFAULT (getdate()) FOR [SampleDate]
END


End
GO
/****** Object:  Default [DF__ServerInventory_SQL_ColumnNames__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__ServerInventory_SQL_ColumnNames__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ColumnNames]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ServerInventory_SQL_ColumnNames__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ServerInventory_SQL_ColumnNames] ADD  CONSTRAINT [DF__ServerInventory_SQL_ColumnNames__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__SQL_ConfigValues__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__SQL_ConfigValues__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ConfigurationValues]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SQL_ConfigValues__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ServerInventory_SQL_ConfigurationValues] ADD  CONSTRAINT [DF__SQL_ConfigValues__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__SQL_ConfigValues__DateLastSeenOn]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__SQL_ConfigValues__DateLastSeenOn]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ConfigurationValues]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SQL_ConfigValues__DateLastSeenOn]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ServerInventory_SQL_ConfigurationValues] ADD  CONSTRAINT [DF__SQL_ConfigValues__DateLastSeenOn]  DEFAULT (getdate()) FOR [DateLastSeenOn]
END


End
GO
/****** Object:  Default [DF__ServerInventory_SQL_IndexDetails__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__ServerInventory_SQL_IndexDetails__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexDetails]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ServerInventory_SQL_IndexDetails__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ServerInventory_SQL_IndexDetails] ADD  CONSTRAINT [DF__ServerInventory_SQL_IndexDetails__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__ServerInventory_SQL_IndexMaster__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__ServerInventory_SQL_IndexMaster__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ServerInventory_SQL_IndexMaster__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ServerInventory_SQL_IndexMaster] ADD  CONSTRAINT [DF__ServerInventory_SQL_IndexMaster__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__ServerInventory_SQL_IndexMaster__DateLastSeenOn]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__ServerInventory_SQL_IndexMaster__DateLastSeenOn]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ServerInventory_SQL_IndexMaster__DateLastSeenOn]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ServerInventory_SQL_IndexMaster] ADD  CONSTRAINT [DF__ServerInventory_SQL_IndexMaster__DateLastSeenOn]  DEFAULT (getdate()) FOR [DateLastSeenOn]
END


End
GO
/****** Object:  Default [DF__ServerInventory_SQL_IndexUsage__SampleDate]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__ServerInventory_SQL_IndexUsage__SampleDate]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexUsage]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ServerInventory_SQL_IndexUsage__SampleDate]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[ServerInventory_SQL_IndexUsage] ADD  CONSTRAINT [DF__ServerInventory_SQL_IndexUsage__SampleDate]  DEFAULT (getdate()) FOR [SampleDate]
END


End
GO
/****** Object:  Default [DF__SpaceUsed_DatabaseSizes__SampleDate]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__SpaceUsed_DatabaseSizes__SampleDate]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SpaceUsed_DatabaseSizes__SampleDate]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[SpaceUsed_DatabaseSizes] ADD  CONSTRAINT [DF__SpaceUsed_DatabaseSizes__SampleDate]  DEFAULT (getdate()) FOR [SampleDate]
END


End
GO
/****** Object:  Default [DF__SpaceUsed_FileSizes__SampleDate]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__SpaceUsed_FileSizes__SampleDate]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_FileSizes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SpaceUsed_FileSizes__SampleDate]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[SpaceUsed_FileSizes] ADD  CONSTRAINT [DF__SpaceUsed_FileSizes__SampleDate]  DEFAULT (getdate()) FOR [SampleDate]
END


End
GO
/****** Object:  Default [DF__Users_UserNames__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[hist].[DF__Users_UserNames__DateCreated]') AND parent_object_id = OBJECT_ID(N'[hist].[Users_UserNames]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Users_UserNames__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [hist].[Users_UserNames] ADD  CONSTRAINT [DF__Users_UserNames__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__SQLServer_IsolationLevels__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ref].[DF__SQLServer_IsolationLevels__DateCreated]') AND parent_object_id = OBJECT_ID(N'[ref].[SQLServer_IsolationLevels]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SQLServer_IsolationLevels__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [ref].[SQLServer_IsolationLevels] ADD  CONSTRAINT [DF__SQLServer_IsolationLevels__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__SQLServer_LockModes__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ref].[DF__SQLServer_LockModes__DateCreated]') AND parent_object_id = OBJECT_ID(N'[ref].[SQLServer_LockModes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SQLServer_LockModes__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [ref].[SQLServer_LockModes] ADD  CONSTRAINT [DF__SQLServer_LockModes__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF__SQLServer_RunStatus__DateCreated]    Script Date: 01/05/2011 14:39:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ref].[DF__SQLServer_RunStatus__DateCreated]') AND parent_object_id = OBJECT_ID(N'[ref].[SQLServer_RunStatus]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SQLServer_RunStatus__DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [ref].[SQLServer_RunStatus] ADD  CONSTRAINT [DF__SQLServer_RunStatus__DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Check [CK__ServerInventory_SQL_IndexMaster__fillfactor]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[hist].[CK__ServerInventory_SQL_IndexMaster__fillfactor]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexMaster]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexMaster]  WITH CHECK ADD  CONSTRAINT [CK__ServerInventory_SQL_IndexMaster__fillfactor] CHECK  (([fillfactor]>=(100)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[hist].[CK__ServerInventory_SQL_IndexMaster__fillfactor]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexMaster]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexMaster] CHECK CONSTRAINT [CK__ServerInventory_SQL_IndexMaster__fillfactor]
GO
/****** Object:  ForeignKey [FK__Backups_BackupCommands__BackupAgentID__Backups_BackupAgents__BackupAgentID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_BackupCommands__BackupAgentID__Backups_BackupAgents__BackupAgentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_BackupCommands]'))
ALTER TABLE [dbo].[Backups_BackupCommands]  WITH CHECK ADD  CONSTRAINT [FK__Backups_BackupCommands__BackupAgentID__Backups_BackupAgents__BackupAgentID] FOREIGN KEY([BackupAgentID])
REFERENCES [dbo].[Backups_BackupAgents] ([BackupAgentID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_BackupCommands__BackupAgentID__Backups_BackupAgents__BackupAgentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_BackupCommands]'))
ALTER TABLE [dbo].[Backups_BackupCommands] CHECK CONSTRAINT [FK__Backups_BackupCommands__BackupAgentID__Backups_BackupAgents__BackupAgentID]
GO
/****** Object:  ForeignKey [FK__Backups_BackupCommands__BackupTypeID__Backups_BackupTypes__BackupTypeID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_BackupCommands__BackupTypeID__Backups_BackupTypes__BackupTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_BackupCommands]'))
ALTER TABLE [dbo].[Backups_BackupCommands]  WITH CHECK ADD  CONSTRAINT [FK__Backups_BackupCommands__BackupTypeID__Backups_BackupTypes__BackupTypeID] FOREIGN KEY([BackupTypeID])
REFERENCES [dbo].[Backups_BackupTypes] ([BackupTypeID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_BackupCommands__BackupTypeID__Backups_BackupTypes__BackupTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_BackupCommands]'))
ALTER TABLE [dbo].[Backups_BackupCommands] CHECK CONSTRAINT [FK__Backups_BackupCommands__BackupTypeID__Backups_BackupTypes__BackupTypeID]
GO
/****** Object:  ForeignKey [FK__Backups_DBsToBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_DBsToBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_DBsToBackup]'))
ALTER TABLE [dbo].[Backups_DBsToBackup]  WITH CHECK ADD  CONSTRAINT [FK__Backups_DBsToBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID] FOREIGN KEY([JobScheduleID])
REFERENCES [dbo].[Backups_JobSchedules] ([JobScheduleID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_DBsToBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_DBsToBackup]'))
ALTER TABLE [dbo].[Backups_DBsToBackup] CHECK CONSTRAINT [FK__Backups_DBsToBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID]
GO
/****** Object:  ForeignKey [FK__Backups_DBsToNotBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_DBsToNotBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_DBsToNotBackup]'))
ALTER TABLE [dbo].[Backups_DBsToNotBackup]  WITH CHECK ADD  CONSTRAINT [FK__Backups_DBsToNotBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID] FOREIGN KEY([JobScheduleID])
REFERENCES [dbo].[Backups_JobSchedules] ([JobScheduleID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_DBsToNotBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_DBsToNotBackup]'))
ALTER TABLE [dbo].[Backups_DBsToNotBackup] CHECK CONSTRAINT [FK__Backups_DBsToNotBackup__JobScheduleID__Backups_JobSchedules__JobScheduleID]
GO
/****** Object:  ForeignKey [FK__Backups_Jobs__ServerID__ServerInventory_SQL_Master__ServerID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_Jobs__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_Jobs]'))
ALTER TABLE [dbo].[Backups_Jobs]  WITH CHECK ADD  CONSTRAINT [FK__Backups_Jobs__ServerID__ServerInventory_SQL_Master__ServerID] FOREIGN KEY([ServerID])
REFERENCES [dbo].[ServerInventory_SQL_Master] ([ServerID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_Jobs__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_Jobs]'))
ALTER TABLE [dbo].[Backups_Jobs] CHECK CONSTRAINT [FK__Backups_Jobs__ServerID__ServerInventory_SQL_Master__ServerID]
GO
/****** Object:  ForeignKey [FK__Backups_JobSchedules__BackupAgentID__Backups_BackupAgents__BackupAgentID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_JobSchedules__BackupAgentID__Backups_BackupAgents__BackupAgentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_JobSchedules]'))
ALTER TABLE [dbo].[Backups_JobSchedules]  WITH CHECK ADD  CONSTRAINT [FK__Backups_JobSchedules__BackupAgentID__Backups_BackupAgents__BackupAgentID] FOREIGN KEY([BackupAgentID])
REFERENCES [dbo].[Backups_BackupAgents] ([BackupAgentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_JobSchedules__BackupAgentID__Backups_BackupAgents__BackupAgentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_JobSchedules]'))
ALTER TABLE [dbo].[Backups_JobSchedules] CHECK CONSTRAINT [FK__Backups_JobSchedules__BackupAgentID__Backups_BackupAgents__BackupAgentID]
GO
/****** Object:  ForeignKey [FK__Backups_JobSchedules__BackupTypeID__Backups_BackupTypes__BackupTypeID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_JobSchedules__BackupTypeID__Backups_BackupTypes__BackupTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_JobSchedules]'))
ALTER TABLE [dbo].[Backups_JobSchedules]  WITH CHECK ADD  CONSTRAINT [FK__Backups_JobSchedules__BackupTypeID__Backups_BackupTypes__BackupTypeID] FOREIGN KEY([BackupTypeID])
REFERENCES [dbo].[Backups_BackupTypes] ([BackupTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_JobSchedules__BackupTypeID__Backups_BackupTypes__BackupTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_JobSchedules]'))
ALTER TABLE [dbo].[Backups_JobSchedules] CHECK CONSTRAINT [FK__Backups_JobSchedules__BackupTypeID__Backups_BackupTypes__BackupTypeID]
GO
/****** Object:  ForeignKey [FK__Backups_JobSchedules__JobID__Backups_Jobs__JobID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_JobSchedules__JobID__Backups_Jobs__JobID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_JobSchedules]'))
ALTER TABLE [dbo].[Backups_JobSchedules]  WITH CHECK ADD  CONSTRAINT [FK__Backups_JobSchedules__JobID__Backups_Jobs__JobID] FOREIGN KEY([JobID])
REFERENCES [dbo].[Backups_Jobs] ([JobID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Backups_JobSchedules__JobID__Backups_Jobs__JobID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Backups_JobSchedules]'))
ALTER TABLE [dbo].[Backups_JobSchedules] CHECK CONSTRAINT [FK__Backups_JobSchedules__JobID__Backups_Jobs__JobID]
GO
/****** Object:  ForeignKey [FK__ChangeControl_ChangeSet__PackageID__ChangeControl_PackageMaster_PackageID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_ChangeSet__PackageID__ChangeControl_PackageMaster_PackageID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSet]'))
ALTER TABLE [dbo].[ChangeControl_ChangeSet]  WITH CHECK ADD  CONSTRAINT [FK__ChangeControl_ChangeSet__PackageID__ChangeControl_PackageMaster_PackageID] FOREIGN KEY([PackageID])
REFERENCES [dbo].[ChangeControl_PackageMaster] ([PackageID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_ChangeSet__PackageID__ChangeControl_PackageMaster_PackageID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSet]'))
ALTER TABLE [dbo].[ChangeControl_ChangeSet] CHECK CONSTRAINT [FK__ChangeControl_ChangeSet__PackageID__ChangeControl_PackageMaster_PackageID]
GO
/****** Object:  ForeignKey [FK__ChangeControl_ChangeSet__ScriptID__ChangeControl_ScriptMaster__ScriptID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_ChangeSet__ScriptID__ChangeControl_ScriptMaster__ScriptID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSetDetail]'))
ALTER TABLE [dbo].[ChangeControl_ChangeSetDetail]  WITH CHECK ADD  CONSTRAINT [FK__ChangeControl_ChangeSet__ScriptID__ChangeControl_ScriptMaster__ScriptID] FOREIGN KEY([ScriptID])
REFERENCES [hist].[ChangeControl_ScriptMaster] ([ScriptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_ChangeSet__ScriptID__ChangeControl_ScriptMaster__ScriptID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSetDetail]'))
ALTER TABLE [dbo].[ChangeControl_ChangeSetDetail] CHECK CONSTRAINT [FK__ChangeControl_ChangeSet__ScriptID__ChangeControl_ScriptMaster__ScriptID]
GO
/****** Object:  ForeignKey [FK__ChangeControl_ChangeSetDetail__ChangeSetID__ChangeControl_ChangeSet__ChangeSetID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_ChangeSetDetail__ChangeSetID__ChangeControl_ChangeSet__ChangeSetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSetDetail]'))
ALTER TABLE [dbo].[ChangeControl_ChangeSetDetail]  WITH CHECK ADD  CONSTRAINT [FK__ChangeControl_ChangeSetDetail__ChangeSetID__ChangeControl_ChangeSet__ChangeSetID] FOREIGN KEY([ChangeSetID])
REFERENCES [dbo].[ChangeControl_ChangeSet] ([ChangeSetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_ChangeSetDetail__ChangeSetID__ChangeControl_ChangeSet__ChangeSetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_ChangeSetDetail]'))
ALTER TABLE [dbo].[ChangeControl_ChangeSetDetail] CHECK CONSTRAINT [FK__ChangeControl_ChangeSetDetail__ChangeSetID__ChangeControl_ChangeSet__ChangeSetID]
GO
/****** Object:  ForeignKey [FK__ChangeControl_DeployDetail__DeployID__ChangeControl_DeployMaster__DeployID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_DeployDetail__DeployID__ChangeControl_DeployMaster__DeployID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployDetail]'))
ALTER TABLE [dbo].[ChangeControl_DeployDetail]  WITH CHECK ADD  CONSTRAINT [FK__ChangeControl_DeployDetail__DeployID__ChangeControl_DeployMaster__DeployID] FOREIGN KEY([DeployID])
REFERENCES [dbo].[ChangeControl_DeployMaster] ([DeployID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_DeployDetail__DeployID__ChangeControl_DeployMaster__DeployID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployDetail]'))
ALTER TABLE [dbo].[ChangeControl_DeployDetail] CHECK CONSTRAINT [FK__ChangeControl_DeployDetail__DeployID__ChangeControl_DeployMaster__DeployID]
GO
/****** Object:  ForeignKey [FK__ChangeControl_DeployMaster__ScriptID__ChangeControl_ScriptMaster__ScriptID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_DeployMaster__ScriptID__ChangeControl_ScriptMaster__ScriptID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployDetail]'))
ALTER TABLE [dbo].[ChangeControl_DeployDetail]  WITH CHECK ADD  CONSTRAINT [FK__ChangeControl_DeployMaster__ScriptID__ChangeControl_ScriptMaster__ScriptID] FOREIGN KEY([ScriptID])
REFERENCES [hist].[ChangeControl_ScriptMaster] ([ScriptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ChangeControl_DeployMaster__ScriptID__ChangeControl_ScriptMaster__ScriptID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChangeControl_DeployDetail]'))
ALTER TABLE [dbo].[ChangeControl_DeployDetail] CHECK CONSTRAINT [FK__ChangeControl_DeployMaster__ScriptID__ChangeControl_ScriptMaster__ScriptID]
GO
/****** Object:  ForeignKey [FK__Collectors_Log__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Collectors_Log__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_Log]'))
ALTER TABLE [dbo].[Collectors_Log]  WITH CHECK ADD  CONSTRAINT [FK__Collectors_Log__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Collectors_Log__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_Log]'))
ALTER TABLE [dbo].[Collectors_Log] CHECK CONSTRAINT [FK__Collectors_Log__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__Collectors_Log__HistUserID__Users_UserNames__UserID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Collectors_Log__HistUserID__Users_UserNames__UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_Log]'))
ALTER TABLE [dbo].[Collectors_Log]  WITH CHECK ADD  CONSTRAINT [FK__Collectors_Log__HistUserID__Users_UserNames__UserID] FOREIGN KEY([HistUserID])
REFERENCES [hist].[Users_UserNames] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Collectors_Log__HistUserID__Users_UserNames__UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_Log]'))
ALTER TABLE [dbo].[Collectors_Log] CHECK CONSTRAINT [FK__Collectors_Log__HistUserID__Users_UserNames__UserID]
GO
/****** Object:  ForeignKey [FK__Collectors_RecipeDetails__RecipeID__Collectors_RecipeMaster__RecipeID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Collectors_RecipeDetails__RecipeID__Collectors_RecipeMaster__RecipeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeDetails]'))
ALTER TABLE [dbo].[Collectors_RecipeDetails]  WITH CHECK ADD  CONSTRAINT [FK__Collectors_RecipeDetails__RecipeID__Collectors_RecipeMaster__RecipeID] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Collectors_RecipeMaster] ([RecipeID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Collectors_RecipeDetails__RecipeID__Collectors_RecipeMaster__RecipeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeDetails]'))
ALTER TABLE [dbo].[Collectors_RecipeDetails] CHECK CONSTRAINT [FK__Collectors_RecipeDetails__RecipeID__Collectors_RecipeMaster__RecipeID]
GO
/****** Object:  ForeignKey [FK__Collectors_RecipeDetails__ScriptID__Collectors_Scripts__ScriptID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Collectors_RecipeDetails__ScriptID__Collectors_Scripts__ScriptID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeDetails]'))
ALTER TABLE [dbo].[Collectors_RecipeDetails]  WITH CHECK ADD  CONSTRAINT [FK__Collectors_RecipeDetails__ScriptID__Collectors_Scripts__ScriptID] FOREIGN KEY([ScriptID])
REFERENCES [dbo].[Collectors_Scripts] ([ScriptID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Collectors_RecipeDetails__ScriptID__Collectors_Scripts__ScriptID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Collectors_RecipeDetails]'))
ALTER TABLE [dbo].[Collectors_RecipeDetails] CHECK CONSTRAINT [FK__Collectors_RecipeDetails__ScriptID__Collectors_Scripts__ScriptID]
GO
/****** Object:  ForeignKey [FK__NTPermissions_EnvironmentExceptions__EnvironmentID__ServerInventory_Environments__EnvironmentID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__NTPermissions_EnvironmentExceptions__EnvironmentID__ServerInventory_Environments__EnvironmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_EnvironmentExceptions]'))
ALTER TABLE [dbo].[NTPermissions_EnvironmentExceptions]  WITH CHECK ADD  CONSTRAINT [FK__NTPermissions_EnvironmentExceptions__EnvironmentID__ServerInventory_Environments__EnvironmentID] FOREIGN KEY([EnvironmentID])
REFERENCES [dbo].[ServerInventory_Environments] ([EnvironmentID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__NTPermissions_EnvironmentExceptions__EnvironmentID__ServerInventory_Environments__EnvironmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_EnvironmentExceptions]'))
ALTER TABLE [dbo].[NTPermissions_EnvironmentExceptions] CHECK CONSTRAINT [FK__NTPermissions_EnvironmentExceptions__EnvironmentID__ServerInventory_Environments__EnvironmentID]
GO
/****** Object:  ForeignKey [FK__NTPermissions_EnvironmentExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID]    Script Date: 01/05/2011 14:39:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__NTPermissions_EnvironmentExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_EnvironmentExceptions]'))
ALTER TABLE [dbo].[NTPermissions_EnvironmentExceptions]  WITH CHECK ADD  CONSTRAINT [FK__NTPermissions_EnvironmentExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID] FOREIGN KEY([StatementID])
REFERENCES [dbo].[NTPermissions_PermissionSQLStatements] ([StatementID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__NTPermissions_EnvironmentExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_EnvironmentExceptions]'))
ALTER TABLE [dbo].[NTPermissions_EnvironmentExceptions] CHECK CONSTRAINT [FK__NTPermissions_EnvironmentExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID]
GO
/****** Object:  ForeignKey [FK__NTPermissions_ServerExceptions__ServerID__ServerInventory_SQL_Master__ServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__NTPermissions_ServerExceptions__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_ServerExceptions]'))
ALTER TABLE [dbo].[NTPermissions_ServerExceptions]  WITH CHECK ADD  CONSTRAINT [FK__NTPermissions_ServerExceptions__ServerID__ServerInventory_SQL_Master__ServerID] FOREIGN KEY([ServerID])
REFERENCES [dbo].[ServerInventory_SQL_Master] ([ServerID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__NTPermissions_ServerExceptions__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_ServerExceptions]'))
ALTER TABLE [dbo].[NTPermissions_ServerExceptions] CHECK CONSTRAINT [FK__NTPermissions_ServerExceptions__ServerID__ServerInventory_SQL_Master__ServerID]
GO
/****** Object:  ForeignKey [FK__NTPermissions_ServerExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__NTPermissions_ServerExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_ServerExceptions]'))
ALTER TABLE [dbo].[NTPermissions_ServerExceptions]  WITH CHECK ADD  CONSTRAINT [FK__NTPermissions_ServerExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID] FOREIGN KEY([StatementID])
REFERENCES [dbo].[NTPermissions_PermissionSQLStatements] ([StatementID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__NTPermissions_ServerExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID]') AND parent_object_id = OBJECT_ID(N'[dbo].[NTPermissions_ServerExceptions]'))
ALTER TABLE [dbo].[NTPermissions_ServerExceptions] CHECK CONSTRAINT [FK__NTPermissions_ServerExceptions__StatementID__NTPermissions_PermissionSQLStatements__StatementID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_ApplicationOwners_Xref__ApplicationID__ServerInventory_Applications__ApplicationID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ApplicationOwners_Xref__ApplicationID__ServerInventory_Applications__ApplicationID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ApplicationOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ApplicationOwners_Xref]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_ApplicationOwners_Xref__ApplicationID__ServerInventory_Applications__ApplicationID] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[ServerInventory_Applications] ([ApplicationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ApplicationOwners_Xref__ApplicationID__ServerInventory_Applications__ApplicationID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ApplicationOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ApplicationOwners_Xref] CHECK CONSTRAINT [FK__ServerInventory_ApplicationOwners_Xref__ApplicationID__ServerInventory_Applications__ApplicationID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_ApplicationOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ApplicationOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ApplicationOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ApplicationOwners_Xref]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_ApplicationOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[ServerInventory_Owners] ([OwnerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ApplicationOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ApplicationOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ApplicationOwners_Xref] CHECK CONSTRAINT [FK__ServerInventory_ApplicationOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_DatabaseOwners_Xref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_DatabaseOwners_Xref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_DatabaseOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_DatabaseOwners_Xref]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_DatabaseOwners_Xref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([DatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_DatabaseOwners_Xref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_DatabaseOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_DatabaseOwners_Xref] CHECK CONSTRAINT [FK__ServerInventory_DatabaseOwners_Xref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_DatabaseOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_DatabaseOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_DatabaseOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_DatabaseOwners_Xref]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_DatabaseOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[ServerInventory_Owners] ([OwnerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_DatabaseOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_DatabaseOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_DatabaseOwners_Xref] CHECK CONSTRAINT [FK__ServerInventory_DatabaseOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_DatabaseOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_DatabaseOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_DatabaseOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_DatabaseOwners_Xref]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_DatabaseOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID] FOREIGN KEY([ServerID])
REFERENCES [dbo].[ServerInventory_SQL_Master] ([ServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_DatabaseOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_DatabaseOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_DatabaseOwners_Xref] CHECK CONSTRAINT [FK__ServerInventory_DatabaseOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_ServerApplications_Xref__ApplicationID__ServerInventory_Applications__ApplicationID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ServerApplications_Xref__ApplicationID__ServerInventory_Applications__ApplicationID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerApplications_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ServerApplications_Xref]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_ServerApplications_Xref__ApplicationID__ServerInventory_Applications__ApplicationID] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[ServerInventory_Applications] ([ApplicationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ServerApplications_Xref__ApplicationID__ServerInventory_Applications__ApplicationID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerApplications_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ServerApplications_Xref] CHECK CONSTRAINT [FK__ServerInventory_ServerApplications_Xref__ApplicationID__ServerInventory_Applications__ApplicationID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_ServerApplications_Xref__ServerID__ServerInventory_SQL_Master__ServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ServerApplications_Xref__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerApplications_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ServerApplications_Xref]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_ServerApplications_Xref__ServerID__ServerInventory_SQL_Master__ServerID] FOREIGN KEY([ServerID])
REFERENCES [dbo].[ServerInventory_SQL_Master] ([ServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ServerApplications_Xref__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerApplications_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ServerApplications_Xref] CHECK CONSTRAINT [FK__ServerInventory_ServerApplications_Xref__ServerID__ServerInventory_SQL_Master__ServerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_ServerOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ServerOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ServerOwners_Xref]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_ServerOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[ServerInventory_Owners] ([OwnerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ServerOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ServerOwners_Xref] CHECK CONSTRAINT [FK__ServerInventory_ServerOwners_Xref__OwnerID__ServerInventory_Owners__OwnerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_ServerOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ServerOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ServerOwners_Xref]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_ServerOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID] FOREIGN KEY([ServerID])
REFERENCES [dbo].[ServerInventory_SQL_Master] ([ServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_ServerOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_ServerOwners_Xref]'))
ALTER TABLE [dbo].[ServerInventory_ServerOwners_Xref] CHECK CONSTRAINT [FK__ServerInventory_ServerOwners_Xref__ServerID__ServerInventory_SQL_Master__ServerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_AttributeList__AttribID__ServerInventory_SQL_AttributeMaster__AttribID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_AttributeList__AttribID__ServerInventory_SQL_AttributeMaster__AttribID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeList]'))
ALTER TABLE [dbo].[ServerInventory_SQL_AttributeList]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_AttributeList__AttribID__ServerInventory_SQL_AttributeMaster__AttribID] FOREIGN KEY([AttribID])
REFERENCES [dbo].[ServerInventory_SQL_AttributeMaster] ([AttribID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_AttributeList__AttribID__ServerInventory_SQL_AttributeMaster__AttribID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeList]'))
ALTER TABLE [dbo].[ServerInventory_SQL_AttributeList] CHECK CONSTRAINT [FK__ServerInventory_SQL_AttributeList__AttribID__ServerInventory_SQL_AttributeMaster__AttribID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_AttributeList__ServerID__ServerInventory_SQL_Master__ServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_AttributeList__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeList]'))
ALTER TABLE [dbo].[ServerInventory_SQL_AttributeList]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_AttributeList__ServerID__ServerInventory_SQL_Master__ServerID] FOREIGN KEY([ServerID])
REFERENCES [dbo].[ServerInventory_SQL_Master] ([ServerID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_AttributeList__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_AttributeList]'))
ALTER TABLE [dbo].[ServerInventory_SQL_AttributeList] CHECK CONSTRAINT [FK__ServerInventory_SQL_AttributeList__ServerID__ServerInventory_SQL_Master__ServerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_ClusterNodes__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_ClusterNodes__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ClusterNodes]'))
ALTER TABLE [dbo].[ServerInventory_SQL_ClusterNodes]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_ClusterNodes__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_ClusterNodes__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ClusterNodes]'))
ALTER TABLE [dbo].[ServerInventory_SQL_ClusterNodes] CHECK CONSTRAINT [FK__ServerInventory_SQL_ClusterNodes__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_ClusterNodes__ServerID__ServerInventory_SQL_Master__ServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_ClusterNodes__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ClusterNodes]'))
ALTER TABLE [dbo].[ServerInventory_SQL_ClusterNodes]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_ClusterNodes__ServerID__ServerInventory_SQL_Master__ServerID] FOREIGN KEY([ServerID])
REFERENCES [dbo].[ServerInventory_SQL_Master] ([ServerID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_ClusterNodes__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_ClusterNodes]'))
ALTER TABLE [dbo].[ServerInventory_SQL_ClusterNodes] CHECK CONSTRAINT [FK__ServerInventory_SQL_ClusterNodes__ServerID__ServerInventory_SQL_Master__ServerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_Master__CredentialID__ServerInventory_SQL_ServerCredentials__CredentialID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_Master__CredentialID__ServerInventory_SQL_ServerCredentials__CredentialID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]'))
ALTER TABLE [dbo].[ServerInventory_SQL_Master]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_Master__CredentialID__ServerInventory_SQL_ServerCredentials__CredentialID] FOREIGN KEY([CredentialID])
REFERENCES [dbo].[ServerInventory_SQL_ServerCredentials] ([CredentialID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_Master__CredentialID__ServerInventory_SQL_ServerCredentials__CredentialID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]'))
ALTER TABLE [dbo].[ServerInventory_SQL_Master] CHECK CONSTRAINT [FK__ServerInventory_SQL_Master__CredentialID__ServerInventory_SQL_ServerCredentials__CredentialID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_Master__EditionID__ServerInventory_SQL_Editions__EditionID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_Master__EditionID__ServerInventory_SQL_Editions__EditionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]'))
ALTER TABLE [dbo].[ServerInventory_SQL_Master]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_Master__EditionID__ServerInventory_SQL_Editions__EditionID] FOREIGN KEY([EditionID])
REFERENCES [dbo].[ServerInventory_SQL_Editions] ([EditionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_Master__EditionID__ServerInventory_SQL_Editions__EditionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]'))
ALTER TABLE [dbo].[ServerInventory_SQL_Master] CHECK CONSTRAINT [FK__ServerInventory_SQL_Master__EditionID__ServerInventory_SQL_Editions__EditionID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_Master__EnvironmentID__ServerInventory_Environments__EnvironmentID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_Master__EnvironmentID__ServerInventory_Environments__EnvironmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]'))
ALTER TABLE [dbo].[ServerInventory_SQL_Master]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_Master__EnvironmentID__ServerInventory_Environments__EnvironmentID] FOREIGN KEY([EnvironmentID])
REFERENCES [dbo].[ServerInventory_Environments] ([EnvironmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_Master__EnvironmentID__ServerInventory_Environments__EnvironmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_Master]'))
ALTER TABLE [dbo].[ServerInventory_SQL_Master] CHECK CONSTRAINT [FK__ServerInventory_SQL_Master__EnvironmentID__ServerInventory_Environments__EnvironmentID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_sysjobs__ServerID__ServerInventory_SQL_Master__ServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_sysjobs__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_sysjobs]'))
ALTER TABLE [dbo].[ServerInventory_SQL_sysjobs]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_sysjobs__ServerID__ServerInventory_SQL_Master__ServerID] FOREIGN KEY([ServerID])
REFERENCES [dbo].[ServerInventory_SQL_Master] ([ServerID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ServerInventory_SQL_sysjobs__ServerID__ServerInventory_SQL_Master__ServerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerInventory_SQL_sysjobs]'))
ALTER TABLE [dbo].[ServerInventory_SQL_sysjobs] CHECK CONSTRAINT [FK__ServerInventory_SQL_sysjobs__ServerID__ServerInventory_SQL_Master__ServerID]
GO
/****** Object:  ForeignKey [FK__Backups_History__BUTypeID__Backups_Types__BackupTypeID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__BUTypeID__Backups_Types__BackupTypeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History]  WITH CHECK ADD  CONSTRAINT [FK__Backups_History__BUTypeID__Backups_Types__BackupTypeID] FOREIGN KEY([BUTypeID])
REFERENCES [hist].[Backups_Types] ([BackupTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__BUTypeID__Backups_Types__BackupTypeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History] CHECK CONSTRAINT [FK__Backups_History__BUTypeID__Backups_Types__BackupTypeID]
GO
/****** Object:  ForeignKey [FK__Backups_History__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History]  WITH CHECK ADD  CONSTRAINT [FK__Backups_History__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([DatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History] CHECK CONSTRAINT [FK__Backups_History__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__Backups_History__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History]  WITH CHECK ADD  CONSTRAINT [FK__Backups_History__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History] CHECK CONSTRAINT [FK__Backups_History__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__Backups_History__LogicalDeviceID__Backups_Devices__DeviceID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__LogicalDeviceID__Backups_Devices__DeviceID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History]  WITH CHECK ADD  CONSTRAINT [FK__Backups_History__LogicalDeviceID__Backups_Devices__DeviceID] FOREIGN KEY([LogicalDeviceID])
REFERENCES [hist].[Backups_Devices] ([DeviceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__LogicalDeviceID__Backups_Devices__DeviceID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History] CHECK CONSTRAINT [FK__Backups_History__LogicalDeviceID__Backups_Devices__DeviceID]
GO
/****** Object:  ForeignKey [FK__Backups_History__MachineID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__MachineID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History]  WITH CHECK ADD  CONSTRAINT [FK__Backups_History__MachineID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([MachineID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__MachineID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History] CHECK CONSTRAINT [FK__Backups_History__MachineID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__Backups_History__PhysicalDeviceID__Backups_Devices__DeviceID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__PhysicalDeviceID__Backups_Devices__DeviceID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History]  WITH CHECK ADD  CONSTRAINT [FK__Backups_History__PhysicalDeviceID__Backups_Devices__DeviceID] FOREIGN KEY([PhysicalDeviceID])
REFERENCES [hist].[Backups_Devices] ([DeviceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__PhysicalDeviceID__Backups_Devices__DeviceID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History] CHECK CONSTRAINT [FK__Backups_History__PhysicalDeviceID__Backups_Devices__DeviceID]
GO
/****** Object:  ForeignKey [FK__Backups_History__UserID__Users_UserNames__UserID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__UserID__Users_UserNames__UserID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History]  WITH CHECK ADD  CONSTRAINT [FK__Backups_History__UserID__Users_UserNames__UserID] FOREIGN KEY([UserID])
REFERENCES [hist].[Users_UserNames] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Backups_History__UserID__Users_UserNames__UserID]') AND parent_object_id = OBJECT_ID(N'[hist].[Backups_History]'))
ALTER TABLE [hist].[Backups_History] CHECK CONSTRAINT [FK__Backups_History__UserID__Users_UserNames__UserID]
GO
/****** Object:  ForeignKey [FK__ChangeControl_DeployHistory__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeControl_DeployHistory__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_DeployHistory]'))
ALTER TABLE [hist].[ChangeControl_DeployHistory]  WITH CHECK ADD  CONSTRAINT [FK__ChangeControl_DeployHistory__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeControl_DeployHistory__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_DeployHistory]'))
ALTER TABLE [hist].[ChangeControl_DeployHistory] CHECK CONSTRAINT [FK__ChangeControl_DeployHistory__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__ChangeControl_DeployHistory__ScriptID__ChangeControl_ScriptMaster__ScriptID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeControl_DeployHistory__ScriptID__ChangeControl_ScriptMaster__ScriptID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_DeployHistory]'))
ALTER TABLE [hist].[ChangeControl_DeployHistory]  WITH CHECK ADD  CONSTRAINT [FK__ChangeControl_DeployHistory__ScriptID__ChangeControl_ScriptMaster__ScriptID] FOREIGN KEY([ScriptID])
REFERENCES [hist].[ChangeControl_ScriptMaster] ([ScriptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeControl_DeployHistory__ScriptID__ChangeControl_ScriptMaster__ScriptID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_DeployHistory]'))
ALTER TABLE [hist].[ChangeControl_DeployHistory] CHECK CONSTRAINT [FK__ChangeControl_DeployHistory__ScriptID__ChangeControl_ScriptMaster__ScriptID]
GO
/****** Object:  ForeignKey [FK__ChangeControl_ScriptDatabaseXref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeControl_ScriptDatabaseXref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_ScriptDatabaseXref]'))
ALTER TABLE [hist].[ChangeControl_ScriptDatabaseXref]  WITH CHECK ADD  CONSTRAINT [FK__ChangeControl_ScriptDatabaseXref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([DatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeControl_ScriptDatabaseXref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_ScriptDatabaseXref]'))
ALTER TABLE [hist].[ChangeControl_ScriptDatabaseXref] CHECK CONSTRAINT [FK__ChangeControl_ScriptDatabaseXref__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__ChangeControl_ScriptDatabaseXref__ScriptID__ChangeControl_ScriptMaster__ScriptID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeControl_ScriptDatabaseXref__ScriptID__ChangeControl_ScriptMaster__ScriptID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_ScriptDatabaseXref]'))
ALTER TABLE [hist].[ChangeControl_ScriptDatabaseXref]  WITH CHECK ADD  CONSTRAINT [FK__ChangeControl_ScriptDatabaseXref__ScriptID__ChangeControl_ScriptMaster__ScriptID] FOREIGN KEY([ScriptID])
REFERENCES [hist].[ChangeControl_ScriptMaster] ([ScriptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeControl_ScriptDatabaseXref__ScriptID__ChangeControl_ScriptMaster__ScriptID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeControl_ScriptDatabaseXref]'))
ALTER TABLE [hist].[ChangeControl_ScriptDatabaseXref] CHECK CONSTRAINT [FK__ChangeControl_ScriptDatabaseXref__ScriptID__ChangeControl_ScriptMaster__ScriptID]
GO
/****** Object:  ForeignKey [FK__ChangeTracking_SQL_ObjectIDs__ObjectTypeID__ChangeTracking_SQL_ObjectTypeIDs__ObjectTypeId]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ObjectIDs__ObjectTypeID__ChangeTracking_SQL_ObjectTypeIDs__ObjectTypeId]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ObjectIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ObjectIDs]  WITH CHECK ADD  CONSTRAINT [FK__ChangeTracking_SQL_ObjectIDs__ObjectTypeID__ChangeTracking_SQL_ObjectTypeIDs__ObjectTypeId] FOREIGN KEY([ObjectTypeID])
REFERENCES [hist].[ChangeTracking_SQL_ObjectTypeIDs] ([ObjectTypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ObjectIDs__ObjectTypeID__ChangeTracking_SQL_ObjectTypeIDs__ObjectTypeId]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ObjectIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ObjectIDs] CHECK CONSTRAINT [FK__ChangeTracking_SQL_ObjectIDs__ObjectTypeID__ChangeTracking_SQL_ObjectTypeIDs__ObjectTypeId]
GO
/****** Object:  ForeignKey [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ActionID__ChangeTracking_SQL_ActionIDs__ActionID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ActionID__ChangeTracking_SQL_ActionIDs__ActionID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]  WITH CHECK ADD  CONSTRAINT [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ActionID__ChangeTracking_SQL_ActionIDs__ActionID] FOREIGN KEY([ActionID])
REFERENCES [hist].[ChangeTracking_SQL_ActionIDs] ([ActionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ActionID__ChangeTracking_SQL_ActionIDs__ActionID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] CHECK CONSTRAINT [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ActionID__ChangeTracking_SQL_ActionIDs__ActionID]
GO
/****** Object:  ForeignKey [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ServerDBObjectActionIDs__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]  WITH CHECK ADD  CONSTRAINT [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([DatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ServerDBObjectActionIDs__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] CHECK CONSTRAINT [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ServerDBObjectActionIDs__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]  WITH CHECK ADD  CONSTRAINT [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ServerDBObjectActionIDs__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] CHECK CONSTRAINT [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ObjectID__ChangeTracking_SQL_ObjectIDs__ObjectID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ObjectID__ChangeTracking_SQL_ObjectIDs__ObjectID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]  WITH CHECK ADD  CONSTRAINT [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ObjectID__ChangeTracking_SQL_ObjectIDs__ObjectID] FOREIGN KEY([ObjectID])
REFERENCES [hist].[ChangeTracking_SQL_ObjectIDs] ([ObjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ObjectID__ChangeTracking_SQL_ObjectIDs__ObjectID]') AND parent_object_id = OBJECT_ID(N'[hist].[ChangeTracking_SQL_ServerDBObjectActionIDs]'))
ALTER TABLE [hist].[ChangeTracking_SQL_ServerDBObjectActionIDs] CHECK CONSTRAINT [FK__ChangeTracking_SQL_ServerDBObjectActionIDs__ObjectID__ChangeTracking_SQL_ObjectIDs__ObjectID]
GO
/****** Object:  ForeignKey [FK__DatabaseMaintenance_CheckDB_Errors__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DatabaseMaintenance_CheckDB_Errors__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_Errors]'))
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_Errors]  WITH CHECK ADD  CONSTRAINT [FK__DatabaseMaintenance_CheckDB_Errors__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([DatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DatabaseMaintenance_CheckDB_Errors__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_Errors]'))
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_Errors] CHECK CONSTRAINT [FK__DatabaseMaintenance_CheckDB_Errors__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__DatabaseMaintenance_CheckDB_Errors__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DatabaseMaintenance_CheckDB_Errors__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_Errors]'))
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_Errors]  WITH CHECK ADD  CONSTRAINT [FK__DatabaseMaintenance_CheckDB_Errors__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DatabaseMaintenance_CheckDB_Errors__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_Errors]'))
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_Errors] CHECK CONSTRAINT [FK__DatabaseMaintenance_CheckDB_Errors__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__DatabaseMaintenance_CheckDB_OK__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DatabaseMaintenance_CheckDB_OK__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_OK]'))
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_OK]  WITH CHECK ADD  CONSTRAINT [FK__DatabaseMaintenance_CheckDB_OK__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([DatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DatabaseMaintenance_CheckDB_OK__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_OK]'))
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_OK] CHECK CONSTRAINT [FK__DatabaseMaintenance_CheckDB_OK__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__DatabaseMaintenance_CheckDB_OK__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DatabaseMaintenance_CheckDB_OK__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_OK]'))
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_OK]  WITH CHECK ADD  CONSTRAINT [FK__DatabaseMaintenance_CheckDB_OK__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DatabaseMaintenance_CheckDB_OK__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[DatabaseMaintenance_CheckDB_OK]'))
ALTER TABLE [hist].[DatabaseMaintenance_CheckDB_OK] CHECK CONSTRAINT [FK__DatabaseMaintenance_CheckDB_OK__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__Deadlock_Deadlocks__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_Deadlocks__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_Deadlocks]'))
ALTER TABLE [hist].[Deadlock_Deadlocks]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_Deadlocks__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_Deadlocks__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_Deadlocks]'))
ALTER TABLE [hist].[Deadlock_Deadlocks] CHECK CONSTRAINT [FK__Deadlock_Deadlocks__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__Deadlock_Process_ExecutionStack__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_Process_ExecutionStack__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_Process_ExecutionStack]'))
ALTER TABLE [hist].[Deadlock_Process_ExecutionStack]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_Process_ExecutionStack__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID] FOREIGN KEY([HistDeadlockProcessID])
REFERENCES [hist].[Deadlock_ProcessList] ([HistDeadlockProcessID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_Process_ExecutionStack__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_Process_ExecutionStack]'))
ALTER TABLE [hist].[Deadlock_Process_ExecutionStack] CHECK CONSTRAINT [FK__Deadlock_Process_ExecutionStack__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ProcessList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ProcessList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID] FOREIGN KEY([HistDeadlockID])
REFERENCES [hist].[Deadlock_Deadlocks] ([HistDeadlockID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList] CHECK CONSTRAINT [FK__Deadlock_ProcessList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ProcessList__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ProcessList__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([hostnameHistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList] CHECK CONSTRAINT [FK__Deadlock_ProcessList__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ProcessList__loginnameHistUserID__Users_UserNames__HistUserID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__loginnameHistUserID__Users_UserNames__HistUserID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ProcessList__loginnameHistUserID__Users_UserNames__HistUserID] FOREIGN KEY([loginnameHistUserID])
REFERENCES [hist].[Users_UserNames] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__loginnameHistUserID__Users_UserNames__HistUserID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList] CHECK CONSTRAINT [FK__Deadlock_ProcessList__loginnameHistUserID__Users_UserNames__HistUserID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ProcessList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ProcessList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID] FOREIGN KEY([modeRefLockModeID])
REFERENCES [ref].[SQLServer_LockModes] ([RefLockModeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList] CHECK CONSTRAINT [FK__Deadlock_ProcessList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ProcessList__RefIsolationLevelID__SQLServer_IsolationLevels__RefIsolationLevelID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__RefIsolationLevelID__SQLServer_IsolationLevels__RefIsolationLevelID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ProcessList__RefIsolationLevelID__SQLServer_IsolationLevels__RefIsolationLevelID] FOREIGN KEY([RefIsolationLevelID])
REFERENCES [ref].[SQLServer_IsolationLevels] ([RefIsolationLevelID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__RefIsolationLevelID__SQLServer_IsolationLevels__RefIsolationLevelID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList] CHECK CONSTRAINT [FK__Deadlock_ProcessList__RefIsolationLevelID__SQLServer_IsolationLevels__RefIsolationLevelID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ProcessList__RefRunStatusID__SQLServer_RunStatus__RefRunStatusID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__RefRunStatusID__SQLServer_RunStatus__RefRunStatusID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ProcessList__RefRunStatusID__SQLServer_RunStatus__RefRunStatusID] FOREIGN KEY([RefRunStatusID])
REFERENCES [ref].[SQLServer_RunStatus] ([RefRunStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ProcessList__RefRunStatusID__SQLServer_RunStatus__RefRunStatusID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ProcessList]'))
ALTER TABLE [hist].[Deadlock_ProcessList] CHECK CONSTRAINT [FK__Deadlock_ProcessList__RefRunStatusID__SQLServer_RunStatus__RefRunStatusID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceList__dbnameHistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceList__dbnameHistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]'))
ALTER TABLE [hist].[Deadlock_ResourceList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceList__dbnameHistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([dbnameHistDatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceList__dbnameHistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]'))
ALTER TABLE [hist].[Deadlock_ResourceList] CHECK CONSTRAINT [FK__Deadlock_ResourceList__dbnameHistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]'))
ALTER TABLE [hist].[Deadlock_ResourceList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID] FOREIGN KEY([HistDeadlockID])
REFERENCES [hist].[Deadlock_Deadlocks] ([HistDeadlockID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]'))
ALTER TABLE [hist].[Deadlock_ResourceList] CHECK CONSTRAINT [FK__Deadlock_ResourceList__HistDeadlockID__Deadlock_Deadlocks__HistDeadlockID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]'))
ALTER TABLE [hist].[Deadlock_ResourceList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID] FOREIGN KEY([modeRefLockModeID])
REFERENCES [ref].[SQLServer_LockModes] ([RefLockModeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]'))
ALTER TABLE [hist].[Deadlock_ResourceList] CHECK CONSTRAINT [FK__Deadlock_ResourceList__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceList__objectnameHistTableID__ServerInventory_SQL_TableIDs__TableID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceList__objectnameHistTableID__ServerInventory_SQL_TableIDs__TableID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]'))
ALTER TABLE [hist].[Deadlock_ResourceList]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceList__objectnameHistTableID__ServerInventory_SQL_TableIDs__TableID] FOREIGN KEY([objectnameHistTableID])
REFERENCES [hist].[ServerInventory_SQL_TableIDs] ([TableID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceList__objectnameHistTableID__ServerInventory_SQL_TableIDs__TableID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceList]'))
ALTER TABLE [hist].[Deadlock_ResourceList] CHECK CONSTRAINT [FK__Deadlock_ResourceList__objectnameHistTableID__ServerInventory_SQL_TableIDs__TableID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceOwners__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceOwners__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceOwners]'))
ALTER TABLE [hist].[Deadlock_ResourceOwners]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceOwners__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID] FOREIGN KEY([HistDeadlockProcessID])
REFERENCES [hist].[Deadlock_ProcessList] ([HistDeadlockProcessID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceOwners__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceOwners]'))
ALTER TABLE [hist].[Deadlock_ResourceOwners] CHECK CONSTRAINT [FK__Deadlock_ResourceOwners__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceOwners__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceOwners__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceOwners]'))
ALTER TABLE [hist].[Deadlock_ResourceOwners]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceOwners__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID] FOREIGN KEY([HistDeadlockResourceID])
REFERENCES [hist].[Deadlock_ResourceList] ([HistDeadlockResourceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceOwners__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceOwners]'))
ALTER TABLE [hist].[Deadlock_ResourceOwners] CHECK CONSTRAINT [FK__Deadlock_ResourceOwners__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceOwners__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceOwners__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceOwners]'))
ALTER TABLE [hist].[Deadlock_ResourceOwners]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceOwners__modeRefLockModeID__SQLServer_LockModes__RefLockModeID] FOREIGN KEY([modeRefLockModeID])
REFERENCES [ref].[SQLServer_LockModes] ([RefLockModeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceOwners__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceOwners]'))
ALTER TABLE [hist].[Deadlock_ResourceOwners] CHECK CONSTRAINT [FK__Deadlock_ResourceOwners__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceWaiters__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceWaiters__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceWaiters]'))
ALTER TABLE [hist].[Deadlock_ResourceWaiters]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceWaiters__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID] FOREIGN KEY([HistDeadlockProcessID])
REFERENCES [hist].[Deadlock_ProcessList] ([HistDeadlockProcessID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceWaiters__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceWaiters]'))
ALTER TABLE [hist].[Deadlock_ResourceWaiters] CHECK CONSTRAINT [FK__Deadlock_ResourceWaiters__HistDeadlockProcessID__Deadlock_ProcessList__HistDeadlockProcessID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceWaiters__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceWaiters__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceWaiters]'))
ALTER TABLE [hist].[Deadlock_ResourceWaiters]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceWaiters__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID] FOREIGN KEY([HistDeadlockResourceID])
REFERENCES [hist].[Deadlock_ResourceList] ([HistDeadlockResourceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceWaiters__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceWaiters]'))
ALTER TABLE [hist].[Deadlock_ResourceWaiters] CHECK CONSTRAINT [FK__Deadlock_ResourceWaiters__HistDeadlockResourceID__Deadlock_ResourceList__HistDeadlockResourceID]
GO
/****** Object:  ForeignKey [FK__Deadlock_ResourceWaiters__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceWaiters__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceWaiters]'))
ALTER TABLE [hist].[Deadlock_ResourceWaiters]  WITH CHECK ADD  CONSTRAINT [FK__Deadlock_ResourceWaiters__modeRefLockModeID__SQLServer_LockModes__RefLockModeID] FOREIGN KEY([modeRefLockModeID])
REFERENCES [ref].[SQLServer_LockModes] ([RefLockModeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Deadlock_ResourceWaiters__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]') AND parent_object_id = OBJECT_ID(N'[hist].[Deadlock_ResourceWaiters]'))
ALTER TABLE [hist].[Deadlock_ResourceWaiters] CHECK CONSTRAINT [FK__Deadlock_ResourceWaiters__modeRefLockModeID__SQLServer_LockModes__RefLockModeID]
GO
/****** Object:  ForeignKey [FK__DTSStore_PackageStore__CategoryID__DTSStore_Categories__CategoryID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__CategoryID__DTSStore_Categories__CategoryID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore]  WITH CHECK ADD  CONSTRAINT [FK__DTSStore_PackageStore__CategoryID__DTSStore_Categories__CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [hist].[DTSStore_Categories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__CategoryID__DTSStore_Categories__CategoryID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore] CHECK CONSTRAINT [FK__DTSStore_PackageStore__CategoryID__DTSStore_Categories__CategoryID]
GO
/****** Object:  ForeignKey [FK__DTSStore_PackageStore__DescriptionID__DTSStore_Descriptions__DescriptionID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__DescriptionID__DTSStore_Descriptions__DescriptionID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore]  WITH CHECK ADD  CONSTRAINT [FK__DTSStore_PackageStore__DescriptionID__DTSStore_Descriptions__DescriptionID] FOREIGN KEY([DescriptionID])
REFERENCES [hist].[DTSStore_Descriptions] ([DescriptionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__DescriptionID__DTSStore_Descriptions__DescriptionID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore] CHECK CONSTRAINT [FK__DTSStore_PackageStore__DescriptionID__DTSStore_Descriptions__DescriptionID]
GO
/****** Object:  ForeignKey [FK__DTSStore_PackageStore__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore]  WITH CHECK ADD  CONSTRAINT [FK__DTSStore_PackageStore__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore] CHECK CONSTRAINT [FK__DTSStore_PackageStore__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__DTSStore_PackageStore__OwnerID__DTSStore_Owners__OwnerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__OwnerID__DTSStore_Owners__OwnerID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore]  WITH CHECK ADD  CONSTRAINT [FK__DTSStore_PackageStore__OwnerID__DTSStore_Owners__OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [hist].[DTSStore_Owners] ([OwnerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__OwnerID__DTSStore_Owners__OwnerID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore] CHECK CONSTRAINT [FK__DTSStore_PackageStore__OwnerID__DTSStore_Owners__OwnerID]
GO
/****** Object:  ForeignKey [FK__DTSStore_PackageStore__PackageNameID__DTSStore_PackageNames__PackageNameID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__PackageNameID__DTSStore_PackageNames__PackageNameID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore]  WITH CHECK ADD  CONSTRAINT [FK__DTSStore_PackageStore__PackageNameID__DTSStore_PackageNames__PackageNameID] FOREIGN KEY([PackageNameID])
REFERENCES [hist].[DTSStore_PackageNames] ([PackageNameID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__DTSStore_PackageStore__PackageNameID__DTSStore_PackageNames__PackageNameID]') AND parent_object_id = OBJECT_ID(N'[hist].[DTSStore_PackageStore]'))
ALTER TABLE [hist].[DTSStore_PackageStore] CHECK CONSTRAINT [FK__DTSStore_PackageStore__PackageNameID__DTSStore_PackageNames__PackageNameID]
GO
/****** Object:  ForeignKey [FK__General_FullFileName__HistFileNameID__General_FileNames__HistFileNameID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__General_FullFileName__HistFileNameID__General_FileNames__HistFileNameID]') AND parent_object_id = OBJECT_ID(N'[hist].[General_FullFileName]'))
ALTER TABLE [hist].[General_FullFileName]  WITH CHECK ADD  CONSTRAINT [FK__General_FullFileName__HistFileNameID__General_FileNames__HistFileNameID] FOREIGN KEY([HistFileNameID])
REFERENCES [hist].[General_FileNames] ([HistFileNameID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__General_FullFileName__HistFileNameID__General_FileNames__HistFileNameID]') AND parent_object_id = OBJECT_ID(N'[hist].[General_FullFileName]'))
ALTER TABLE [hist].[General_FullFileName] CHECK CONSTRAINT [FK__General_FullFileName__HistFileNameID__General_FileNames__HistFileNameID]
GO
/****** Object:  ForeignKey [FK__General_FullFileName__HistPathID__General_Paths__HistPathID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__General_FullFileName__HistPathID__General_Paths__HistPathID]') AND parent_object_id = OBJECT_ID(N'[hist].[General_FullFileName]'))
ALTER TABLE [hist].[General_FullFileName]  WITH CHECK ADD  CONSTRAINT [FK__General_FullFileName__HistPathID__General_Paths__HistPathID] FOREIGN KEY([HistPathID])
REFERENCES [hist].[General_Paths] ([HistPathID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__General_FullFileName__HistPathID__General_Paths__HistPathID]') AND parent_object_id = OBJECT_ID(N'[hist].[General_FullFileName]'))
ALTER TABLE [hist].[General_FullFileName] CHECK CONSTRAINT [FK__General_FullFileName__HistPathID__General_Paths__HistPathID]
GO
/****** Object:  ForeignKey [FK__Jobs_SQL_JobHistory__HistJobID__Jobs_SQL_Jobs__HistJobID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobHistory__HistJobID__Jobs_SQL_Jobs__HistJobID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobHistory]'))
ALTER TABLE [hist].[Jobs_SQL_JobHistory]  WITH CHECK ADD  CONSTRAINT [FK__Jobs_SQL_JobHistory__HistJobID__Jobs_SQL_Jobs__HistJobID] FOREIGN KEY([HistJobID])
REFERENCES [hist].[Jobs_SQL_Jobs] ([HistJobID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobHistory__HistJobID__Jobs_SQL_Jobs__HistJobID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobHistory]'))
ALTER TABLE [hist].[Jobs_SQL_JobHistory] CHECK CONSTRAINT [FK__Jobs_SQL_JobHistory__HistJobID__Jobs_SQL_Jobs__HistJobID]
GO
/****** Object:  ForeignKey [FK__Jobs_SQL_JobHistory__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobHistory__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobHistory]'))
ALTER TABLE [hist].[Jobs_SQL_JobHistory]  WITH CHECK ADD  CONSTRAINT [FK__Jobs_SQL_JobHistory__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobHistory__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobHistory]'))
ALTER TABLE [hist].[Jobs_SQL_JobHistory] CHECK CONSTRAINT [FK__Jobs_SQL_JobHistory__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__Jobs_SQL_Jobs__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_Jobs__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_Jobs]'))
ALTER TABLE [hist].[Jobs_SQL_Jobs]  WITH CHECK ADD  CONSTRAINT [FK__Jobs_SQL_Jobs__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_Jobs__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_Jobs]'))
ALTER TABLE [hist].[Jobs_SQL_Jobs] CHECK CONSTRAINT [FK__Jobs_SQL_Jobs__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__Jobs_SQL_JobSteps__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobSteps__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobSteps]'))
ALTER TABLE [hist].[Jobs_SQL_JobSteps]  WITH CHECK ADD  CONSTRAINT [FK__Jobs_SQL_JobSteps__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([HistDatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobSteps__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobSteps]'))
ALTER TABLE [hist].[Jobs_SQL_JobSteps] CHECK CONSTRAINT [FK__Jobs_SQL_JobSteps__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__Jobs_SQL_JobSteps__HistJobID__Jobs_SQL_Jobs__HistJobID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobSteps__HistJobID__Jobs_SQL_Jobs__HistJobID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobSteps]'))
ALTER TABLE [hist].[Jobs_SQL_JobSteps]  WITH CHECK ADD  CONSTRAINT [FK__Jobs_SQL_JobSteps__HistJobID__Jobs_SQL_Jobs__HistJobID] FOREIGN KEY([HistJobID])
REFERENCES [hist].[Jobs_SQL_Jobs] ([HistJobID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobSteps__HistJobID__Jobs_SQL_Jobs__HistJobID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobSteps]'))
ALTER TABLE [hist].[Jobs_SQL_JobSteps] CHECK CONSTRAINT [FK__Jobs_SQL_JobSteps__HistJobID__Jobs_SQL_Jobs__HistJobID]
GO
/****** Object:  ForeignKey [FK__Jobs_SQL_JobSteps__HistServerIDForServerCol__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobSteps__HistServerIDForServerCol__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobSteps]'))
ALTER TABLE [hist].[Jobs_SQL_JobSteps]  WITH CHECK ADD  CONSTRAINT [FK__Jobs_SQL_JobSteps__HistServerIDForServerCol__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerIDForServerCol])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Jobs_SQL_JobSteps__HistServerIDForServerCol__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Jobs_SQL_JobSteps]'))
ALTER TABLE [hist].[Jobs_SQL_JobSteps] CHECK CONSTRAINT [FK__Jobs_SQL_JobSteps__HistServerIDForServerCol__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__Metrics_QueryStats__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Metrics_QueryStats__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats]'))
ALTER TABLE [hist].[Metrics_QueryStats]  WITH CHECK ADD  CONSTRAINT [FK__Metrics_QueryStats__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([HistDatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Metrics_QueryStats__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats]'))
ALTER TABLE [hist].[Metrics_QueryStats] CHECK CONSTRAINT [FK__Metrics_QueryStats__HistDatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__Metrics_QueryStats__HistObjectID__ServerInventory_SQL_ObjectIDs__HistObjectID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Metrics_QueryStats__HistObjectID__ServerInventory_SQL_ObjectIDs__HistObjectID]') AND parent_object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats]'))
ALTER TABLE [hist].[Metrics_QueryStats]  WITH CHECK ADD  CONSTRAINT [FK__Metrics_QueryStats__HistObjectID__ServerInventory_SQL_ObjectIDs__HistObjectID] FOREIGN KEY([HistObjectID])
REFERENCES [hist].[ServerInventory_SQL_ObjectIDs] ([ObjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Metrics_QueryStats__HistObjectID__ServerInventory_SQL_ObjectIDs__HistObjectID]') AND parent_object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats]'))
ALTER TABLE [hist].[Metrics_QueryStats] CHECK CONSTRAINT [FK__Metrics_QueryStats__HistObjectID__ServerInventory_SQL_ObjectIDs__HistObjectID]
GO
/****** Object:  ForeignKey [FK__Metrics_QueryStats__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Metrics_QueryStats__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats]'))
ALTER TABLE [hist].[Metrics_QueryStats]  WITH CHECK ADD  CONSTRAINT [FK__Metrics_QueryStats__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__Metrics_QueryStats__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[Metrics_QueryStats]'))
ALTER TABLE [hist].[Metrics_QueryStats] CHECK CONSTRAINT [FK__Metrics_QueryStats__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_ColumnNames__ColumnTypeID__ServerInventory_SQL_DataTypes__RefDataTypeID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_ColumnNames__ColumnTypeID__ServerInventory_SQL_DataTypes__RefDataTypeID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ColumnNames]'))
ALTER TABLE [hist].[ServerInventory_SQL_ColumnNames]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_ColumnNames__ColumnTypeID__ServerInventory_SQL_DataTypes__RefDataTypeID] FOREIGN KEY([ColumnTypeID])
REFERENCES [ref].[ServerInventory_SQL_DataTypes] ([RefDataTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_ColumnNames__ColumnTypeID__ServerInventory_SQL_DataTypes__RefDataTypeID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ColumnNames]'))
ALTER TABLE [hist].[ServerInventory_SQL_ColumnNames] CHECK CONSTRAINT [FK__ServerInventory_SQL_ColumnNames__ColumnTypeID__ServerInventory_SQL_DataTypes__RefDataTypeID]
GO
/****** Object:  ForeignKey [FK__SQL_ConfigValues__ConfigOptions]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SQL_ConfigValues__ConfigOptions]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ConfigurationValues]'))
ALTER TABLE [hist].[ServerInventory_SQL_ConfigurationValues]  WITH CHECK ADD  CONSTRAINT [FK__SQL_ConfigValues__ConfigOptions] FOREIGN KEY([RefConfigOptionID])
REFERENCES [ref].[ServerInventory_SQL_ConfigurationOptions] ([RefConfigOptionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SQL_ConfigValues__ConfigOptions]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ConfigurationValues]'))
ALTER TABLE [hist].[ServerInventory_SQL_ConfigurationValues] CHECK CONSTRAINT [FK__SQL_ConfigValues__ConfigOptions]
GO
/****** Object:  ForeignKey [FK__SQL_ConfigValues__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SQL_ConfigValues__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ConfigurationValues]'))
ALTER TABLE [hist].[ServerInventory_SQL_ConfigurationValues]  WITH CHECK ADD  CONSTRAINT [FK__SQL_ConfigValues__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SQL_ConfigValues__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ConfigurationValues]'))
ALTER TABLE [hist].[ServerInventory_SQL_ConfigurationValues] CHECK CONSTRAINT [FK__SQL_ConfigValues__HistServerID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_IndexDetails__HistColumnID__ServerInventory_SQL_ColumnNames__HistColumnID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_IndexDetails__HistColumnID__ServerInventory_SQL_ColumnNames__HistColumnID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexDetails]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexDetails]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_IndexDetails__HistColumnID__ServerInventory_SQL_ColumnNames__HistColumnID] FOREIGN KEY([HistColumnID])
REFERENCES [hist].[ServerInventory_SQL_ColumnNames] ([HistColumnID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_IndexDetails__HistColumnID__ServerInventory_SQL_ColumnNames__HistColumnID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexDetails]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexDetails] CHECK CONSTRAINT [FK__ServerInventory_SQL_IndexDetails__HistColumnID__ServerInventory_SQL_ColumnNames__HistColumnID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_IndexDetails__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_IndexDetails__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexDetails]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexDetails]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_IndexDetails__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID] FOREIGN KEY([HistIndexID])
REFERENCES [hist].[ServerInventory_SQL_IndexMaster] ([HistIndexID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_IndexDetails__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexDetails]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexDetails] CHECK CONSTRAINT [FK__ServerInventory_SQL_IndexDetails__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_IndexMaster__HistServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_IndexMaster__HistServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexMaster]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexMaster]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_IndexMaster__HistServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID] FOREIGN KEY([HistServerDBTableID])
REFERENCES [hist].[ServerInventory_SQL_ServerDBTableIDs] ([ServerDBTableID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_IndexMaster__HistServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexMaster]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexMaster] CHECK CONSTRAINT [FK__ServerInventory_SQL_IndexMaster__HistServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_IndexUsage__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_IndexUsage__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexUsage]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexUsage]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_IndexUsage__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID] FOREIGN KEY([HistIndexID])
REFERENCES [hist].[ServerInventory_SQL_IndexMaster] ([HistIndexID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_IndexUsage__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_IndexUsage]'))
ALTER TABLE [hist].[ServerInventory_SQL_IndexUsage] CHECK CONSTRAINT [FK__ServerInventory_SQL_IndexUsage__HistIndexID__ServerInventory_SQL_IndexMaster__HistIndexID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_ServerDBTableIDs__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_ServerDBTableIDs__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ServerDBTableIDs]'))
ALTER TABLE [hist].[ServerInventory_SQL_ServerDBTableIDs]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_ServerDBTableIDs__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__ServerInventory_SQL_ServerDBTableIDs__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[ServerInventory_SQL_ServerDBTableIDs]'))
ALTER TABLE [hist].[ServerInventory_SQL_ServerDBTableIDs] CHECK CONSTRAINT [FK__ServerInventory_SQL_ServerDBTableIDs__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__SpaceUsed_DatabaseSizes__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_DatabaseSizes__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]'))
ALTER TABLE [hist].[SpaceUsed_DatabaseSizes]  WITH CHECK ADD  CONSTRAINT [FK__SpaceUsed_DatabaseSizes__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID] FOREIGN KEY([DatabaseID])
REFERENCES [hist].[ServerInventory_SQL_DatabaseIDs] ([DatabaseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_DatabaseSizes__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]'))
ALTER TABLE [hist].[SpaceUsed_DatabaseSizes] CHECK CONSTRAINT [FK__SpaceUsed_DatabaseSizes__DatabaseID__ServerInventory_SQL_DatabaseIDs__DatabaseID]
GO
/****** Object:  ForeignKey [FK__SpaceUsed_DatabaseSizes__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_DatabaseSizes__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]'))
ALTER TABLE [hist].[SpaceUsed_DatabaseSizes]  WITH CHECK ADD  CONSTRAINT [FK__SpaceUsed_DatabaseSizes__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_DatabaseSizes__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_DatabaseSizes]'))
ALTER TABLE [hist].[SpaceUsed_DatabaseSizes] CHECK CONSTRAINT [FK__SpaceUsed_DatabaseSizes__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__SpaceUsed_FileSizes__HistPathFileNameID__General_FullFileName__HistPathFileNameID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_FileSizes__HistPathFileNameID__General_FullFileName__HistPathFileNameID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_FileSizes]'))
ALTER TABLE [hist].[SpaceUsed_FileSizes]  WITH CHECK ADD  CONSTRAINT [FK__SpaceUsed_FileSizes__HistPathFileNameID__General_FullFileName__HistPathFileNameID] FOREIGN KEY([HistPathFileNameID])
REFERENCES [hist].[General_FullFileName] ([HistPathFileNameID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_FileSizes__HistPathFileNameID__General_FullFileName__HistPathFileNameID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_FileSizes]'))
ALTER TABLE [hist].[SpaceUsed_FileSizes] CHECK CONSTRAINT [FK__SpaceUsed_FileSizes__HistPathFileNameID__General_FullFileName__HistPathFileNameID]
GO
/****** Object:  ForeignKey [FK__SpaceUsed_FileSizes__HistServerID__ServerInventory_ServerIDs__HistServerID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_FileSizes__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_FileSizes]'))
ALTER TABLE [hist].[SpaceUsed_FileSizes]  WITH CHECK ADD  CONSTRAINT [FK__SpaceUsed_FileSizes__HistServerID__ServerInventory_ServerIDs__HistServerID] FOREIGN KEY([HistServerID])
REFERENCES [hist].[ServerInventory_ServerIDs] ([HistServerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_FileSizes__HistServerID__ServerInventory_ServerIDs__HistServerID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_FileSizes]'))
ALTER TABLE [hist].[SpaceUsed_FileSizes] CHECK CONSTRAINT [FK__SpaceUsed_FileSizes__HistServerID__ServerInventory_ServerIDs__HistServerID]
GO
/****** Object:  ForeignKey [FK__SpaceUsed_TableSizes__ServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_TableSizes__ServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_TableSizes]'))
ALTER TABLE [hist].[SpaceUsed_TableSizes]  WITH CHECK ADD  CONSTRAINT [FK__SpaceUsed_TableSizes__ServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID] FOREIGN KEY([ServerDBTableID])
REFERENCES [hist].[ServerInventory_SQL_ServerDBTableIDs] ([ServerDBTableID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[hist].[FK__SpaceUsed_TableSizes__ServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID]') AND parent_object_id = OBJECT_ID(N'[hist].[SpaceUsed_TableSizes]'))
ALTER TABLE [hist].[SpaceUsed_TableSizes] CHECK CONSTRAINT [FK__SpaceUsed_TableSizes__ServerDBTableID__ServerInventory_SQL_ServerDBTableIDs__ServerDBTableID]
GO
/****** Object:  ForeignKey [FK__ServerInventory_SQL_DataTypes__RefSQLVersionID__ServerInventory_SQL_ServerVersions__RefSQLVersionID]    Script Date: 01/05/2011 14:39:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ref].[FK__ServerInventory_SQL_DataTypes__RefSQLVersionID__ServerInventory_SQL_ServerVersions__RefSQLVersionID]') AND parent_object_id = OBJECT_ID(N'[ref].[ServerInventory_SQL_DataTypes]'))
ALTER TABLE [ref].[ServerInventory_SQL_DataTypes]  WITH CHECK ADD  CONSTRAINT [FK__ServerInventory_SQL_DataTypes__RefSQLVersionID__ServerInventory_SQL_ServerVersions__RefSQLVersionID] FOREIGN KEY([RefSQLVersionID])
REFERENCES [ref].[ServerInventory_SQL_ServerVersions] ([RefSQLVersionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ref].[FK__ServerInventory_SQL_DataTypes__RefSQLVersionID__ServerInventory_SQL_ServerVersions__RefSQLVersionID]') AND parent_object_id = OBJECT_ID(N'[ref].[ServerInventory_SQL_DataTypes]'))
ALTER TABLE [ref].[ServerInventory_SQL_DataTypes] CHECK CONSTRAINT [FK__ServerInventory_SQL_DataTypes__RefSQLVersionID__ServerInventory_SQL_ServerVersions__RefSQLVersionID]
GO
