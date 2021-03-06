IF OBJECT_ID('audit.ConnectionCounts_Collector','P') IS NOT NULL 
	DROP PROCEDURE [audit].[ConnectionCounts_Collector]
GO

/******************************************************************************
**	Name:			[audit].[ConnectionCounts_Collector]
**	Desc:			Procedure to manage inserting connection counts from a remote instance
**	Auth:			Adam Bean (SQLSlayer.com)
**	Date:			2010.10.16
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
**  20110510	Adam Bean		Updated to use ServerName instead of ServerID
********************************************************************************************************/

CREATE PROCEDURE [audit].[ConnectionCounts_Collector]
(
	@RunID			INT
	,@ServerName	VARCHAR(256)
	,@CntrValue		INT
)

AS

SET NOCOUNT ON

DECLARE 
	@HistServerID	INT
	
-- Get the server ID	
EXEC [hist].[ServerInventory_GetServerID] @ServerName = @ServerName, @ServerID = @HistServerID OUTPUT

-- Insert the new RunID
IF NOT EXISTS
(
	SELECT [RunID]
	FROM [audit].[ConnectionCounts_RunIDs]
	WHERE [RunID] = @RunID
)
BEGIN
	INSERT INTO [audit].[ConnectionCounts_RunIDs]
	([RunID])
	SELECT @RunID
END

-- Insert the values
IF NOT EXISTS 
(
	SELECT 
		[HistServerID]
		,[RunID]
	FROM [audit].[ConnectionCounts]
	WHERE [HistServerID] = @HistServerID
	AND [RunID] = @RunID
)
BEGIN
	INSERT INTO [audit].[ConnectionCounts]
	([HistServerID],[RunID],[CounterValue])
	SELECT
		@HistServerID
		,@RunID
		,@CntrValue
END

SET NOCOUNT OFF