USE [CC_DB_SEOC_TEST]
GO

/****** Data: Table [dbo].[Event] ******/
PRINT '**** INSERTING DATA INTO TABLE [dbo].[Event] ****'
SET IDENTITY_INSERT [dbo].[Event] ON 
GO
INSERT INTO [dbo].[Event]([Id], [action],[description])
VALUES(1, 'Save','Save draft SEOC (new or revised) from VA Community Care: SEOC Administrator')
GO
INSERT INTO [dbo].[Event]([Id], [action],[description])
VALUES(2, 'Delete','Delete draft SEOC from VA Community Care: SEOC Administrator')
GO
INSERT INTO [dbo].[Event]([Id], [action],[description])
VALUES(3, 'Activate','Activate draft SEOC (new or revised) from VA Community Care: SEOC Administrator')
GO
INSERT INTO [dbo].[Event]([Id], [action],[description])
VALUES(4, 'Discontinue','Discontinue active SEOC from VA Community Care: SEOC Administrator')
GO
INSERT INTO [dbo].[Event]([Id], [action],[description])
VALUES(5, 'Reverse','Reverse Date Hold SEOC from VA Community Care: SEOC Administrator')
GO
SET IDENTITY_INSERT [dbo].[Event] OFF
GO


/****** Data: Table [dbo].[SeocUser] ******/
PRINT '**** Insert User data in SeocUser table ****'
INSERT [dbo].[SeocUser] ([vaUserId], [role], [userName]) 
VALUES ('DEV\SEOCSYSTEMUSER', 'Administrator', 'Test User')
GO --- default System User
INSERT INTO[dbo].[SeocUser] ([vaUserId], [role], [createDate], [modifiedDate], [userName], [deactivatedDate]) 
VALUES ('Vhamaster\VHAJITWangL', 'Administrator',  CAST('2018-12-11T19:56:02.4700000' AS DateTime2), NULL, 'Lilly Wang', NULL)
GO	--- Lilly Wang