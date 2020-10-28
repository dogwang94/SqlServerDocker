/*******************************************************
CREATED BY : Lilly Wang
CREATION DATE : 11/01/2020
 
DESCRIPTION: Script to create the database named CC_DB_SEOC 
that hosts the schema for SEOC tables for SEOC Test
*********************************************************/

USE CC_DB_SEOC_TEST;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table  ******/
CREATE TABLE testTable(
  Id nvarchar(max),
  Value nvarchar(max)
);
GO