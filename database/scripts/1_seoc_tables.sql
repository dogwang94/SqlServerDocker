/*******************************************************
CREATED BY : Lilly Wang
CREATION DATE : 11/01/2020 
DESCRIPTION: Script to create all tables in CC_DB_SEOC_TEST
*********************************************************/

USE CC_DB_SEOC_TEST;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ClinicalService]  ******/
PRINT '**** CREATING TABLE [dbo].[ClinicalService] ****'
CREATE TABLE [dbo].[ClinicalService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[discontinued] [bit] NULL,
 CONSTRAINT [PK_clinicalService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClinicalService] ADD  DEFAULT ((0)) FOR [discontinued]
GO

/****** Object:  Table [dbo].[ServiceLine]  ******/
PRINT '**** CREATING TABLE [dbo].[ServiceLine] ****'
CREATE TABLE [dbo].[ServiceLine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[serviceLineAbbr] [varchar](3) NOT NULL,
	[discontinued] [bit] NULL,
 CONSTRAINT [PK_serviceLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServiceLine] ADD  DEFAULT ((0)) FOR [discontinued]
GO

/****** Object:  Table [dbo].[CategoryOfCare]  ******/
PRINT '**** CREATING TABLE [dbo].[CategoryOfCare] ****'
CREATE TABLE [dbo].[CategoryOfCare](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[serviceLineId] [int] NOT NULL,
	[discontinued] [bit] NULL,
 CONSTRAINT [PK_categoryOfCare] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoryOfCare] ADD  DEFAULT ((0)) FOR [discontinued]
GO
ALTER TABLE [dbo].[CategoryOfCare]  WITH CHECK ADD  CONSTRAINT [FK_CoC_SL] FOREIGN KEY([serviceLineId])
REFERENCES [dbo].[ServiceLine] ([Id])
GO
ALTER TABLE [dbo].[CategoryOfCare] CHECK CONSTRAINT [FK_CoC_SL]
GO

/****** Object:  Table [dbo].[Status]  ******/
PRINT '**** CREATING TABLE [dbo].[Status] ****'
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BillingCode]  ******/
PRINT '**** CREATING TABLE [dbo].[BillingCode] ****'
CREATE TABLE [dbo].[BillingCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[billingCode] [varchar](25) NOT NULL,
	[codeType] [varchar](25) NOT NULL,
	[description] [varchar](2000) NULL,
	[precertRqd] [bit] NULL,
	[deactivated] [bit] NULL,
 CONSTRAINT [PK_billingCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BillingCode] ADD  DEFAULT ((0)) FOR [deactivated]
GO

/****** Object:  Table [dbo].[Qasp]  ******/
PRINT '**** CREATING TABLE [dbo].[Qasp] ****'
CREATE TABLE [dbo].[Qasp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[discontinued] [bit] NULL,
 CONSTRAINT [PK_qasp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Qasp] ADD  DEFAULT ((0)) FOR [discontinued]
GO

/****** Object:  Table [dbo].[Seoc]  ******/
PRINT '**** CREATING TABLE [dbo].[Seoc] ****'
CREATE TABLE [dbo].[Seoc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[seocKey] [int] NOT NULL,
	[name] [varchar](250) NOT NULL,
	[versionNumber] [varchar](25) NULL,
	[effectiveDate] [datetime2](7) NULL,
	[endDate] [datetime2](7) NULL,
	[duration] [int] NULL,
	[description] [varchar](2000) NULL,
	[REV] [bit] NULL,
	[categoryOfCareId] [int] NULL,
	[serviceLineId] [int] NULL,
	[statusId] [int] NOT NULL,
	[qaspId] [int] NULL,
	[maxAllowableVisits] [int] NULL,
	[proceduralOverview] [varchar](5000) NULL,
	[activatedTimestamp] [datetime2](7) NULL,
	[activatedBy] [varchar](80) NULL,
	[discontinuedTimestamp] [datetime2](7) NULL,
	[discontinuedBy] [varchar](80) NULL,
	[disclaimerId] [int] NOT NULL,
	[additionalInformation] [varchar](2000) NULL,
 CONSTRAINT [PK_seoc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Seoc] ADD  DEFAULT ((1)) FOR [disclaimerId]
GO
ALTER TABLE [dbo].[Seoc] ADD  DEFAULT (NULL) FOR [additionalInformation]
GO
ALTER TABLE [dbo].[Seoc]  WITH CHECK ADD  CONSTRAINT [FK_SEOC_CoC] FOREIGN KEY([categoryOfCareId])
REFERENCES [dbo].[CategoryOfCare] ([Id])
GO
ALTER TABLE [dbo].[Seoc] CHECK CONSTRAINT [FK_SEOC_CoC]
GO
ALTER TABLE [dbo].[Seoc]  WITH CHECK ADD  CONSTRAINT [FK_SEOC_QASP] FOREIGN KEY([qaspId])
REFERENCES [dbo].[Qasp] ([Id])
GO
ALTER TABLE [dbo].[Seoc] CHECK CONSTRAINT [FK_SEOC_QASP]
GO
ALTER TABLE [dbo].[Seoc]  WITH CHECK ADD  CONSTRAINT [FK_SEOC_SL] FOREIGN KEY([serviceLineId])
REFERENCES [dbo].[ServiceLine] ([Id])
GO
ALTER TABLE [dbo].[Seoc] CHECK CONSTRAINT [FK_SEOC_SL]
GO
ALTER TABLE [dbo].[Seoc]  WITH CHECK ADD  CONSTRAINT [FK_SEOC_ST] FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Seoc] CHECK CONSTRAINT [FK_SEOC_ST]
GO

/****** Object:  Table [dbo].[Service]  ******/
PRINT '**** CREATING TABLE [dbo].[Service] ****'
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[seocId] [int] NOT NULL,
	[description] [varchar](2000) NULL,
	[frequency] [int] NULL,
	[frequencyType] [varchar](25) NULL,
	[visits] [int] NULL,
	[codeRequired] [char](3) NULL,
	[codedBy] [varchar](80) NULL,
	[codedTimestamp] [date] NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_S_SEOC] FOREIGN KEY([seocId])
REFERENCES [dbo].[Seoc] ([Id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_S_SEOC]
GO

/****** Object:  Table [dbo].[ServiceBillingCode]  ******/
PRINT '**** CREATING TABLE [dbo].[ServiceBillingCode] ****'
CREATE TABLE [dbo].[ServiceBillingCode](
	[serviceId] [int] NOT NULL,
	[billingCodeId] [int] NOT NULL,
 CONSTRAINT [PK_serviceId] PRIMARY KEY CLUSTERED 
(
	[serviceId] ASC,
	[billingCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServiceBillingCode]  WITH CHECK ADD  CONSTRAINT [FK_SBC_BC] FOREIGN KEY([billingCodeId])
REFERENCES [dbo].[BillingCode] ([Id])
GO
ALTER TABLE [dbo].[ServiceBillingCode] CHECK CONSTRAINT [FK_SBC_BC]
GO
ALTER TABLE [dbo].[ServiceBillingCode]  WITH CHECK ADD  CONSTRAINT [FK_SBC_S] FOREIGN KEY([serviceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[ServiceBillingCode] CHECK CONSTRAINT [FK_SBC_S]
GO

/****** Object:  Table [dbo].[Hptc]  ******/
PRINT '**** CREATING TABLE [dbo].[Hptc] ****'
CREATE TABLE [dbo].[Hptc](
	[hptc] [varchar](10) NOT NULL,
	[grouping] [varchar](100) NULL,
	[classification] [varchar](100) NULL,
	[specialization] [varchar](100) NULL,
 CONSTRAINT [PK_Hptc] PRIMARY KEY CLUSTERED 
(
	[hptc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SeocHptc]  ******/
PRINT '**** CREATING TABLE [dbo].[SeocHptc] ****'
CREATE TABLE [dbo].[SeocHptc](
	[hptc] [varchar](10) NOT NULL,
	[seocId] [int] NOT NULL,
 CONSTRAINT [PK_SeocHptc] PRIMARY KEY CLUSTERED 
(
	[hptc] ASC,
	[seocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SeocHptc]  WITH CHECK ADD  CONSTRAINT [FK_SH_Hptc] FOREIGN KEY([hptc])
REFERENCES [dbo].[Hptc] ([hptc])
GO
ALTER TABLE [dbo].[SeocHptc] CHECK CONSTRAINT [FK_SH_Hptc]
GO
ALTER TABLE [dbo].[SeocHptc]  WITH CHECK ADD  CONSTRAINT [FK_SH_SEOC] FOREIGN KEY([seocId])
REFERENCES [dbo].[Seoc] ([Id])
GO
ALTER TABLE [dbo].[SeocHptc] CHECK CONSTRAINT [FK_SH_SEOC]
GO

/****** Object:  Table [dbo].[serviceHptc]  ******/
PRINT '**** CREATING TABLE [dbo].[serviceHptc] ****'
CREATE TABLE [dbo].[serviceHptc](
	[medicareCode] [varchar](2) NOT NULL,
	[hptc] [varchar](10) NOT NULL,
 CONSTRAINT [PK_serviceHptc] PRIMARY KEY CLUSTERED 
(
	[hptc] ASC,
	[medicareCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[serviceHptc]  WITH CHECK ADD  CONSTRAINT [FK_SERV_HPTC] FOREIGN KEY([hptc])
REFERENCES [dbo].[Hptc] ([hptc])
GO
ALTER TABLE [dbo].[serviceHptc] CHECK CONSTRAINT [FK_SERV_HPTC]
GO

/****** Object:  Table [dbo].[SeocConfig]  ******/
PRINT '**** CREATING TABLE [dbo].[SeocConfig] ****'
CREATE TABLE [dbo].[SeocConfig](
	[currProgram] [varchar](25) NOT NULL,
	[currProgramVersion] [int] NOT NULL,
	[inMaintenanceBy] [varchar](80) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ServiceClinicalService]  ******/
PRINT '**** CREATING TABLE [dbo].[ServiceClinicalService] ****'
CREATE TABLE [dbo].[ServiceClinicalService](
	[serviceId] [int] NOT NULL,
	[clinicalServiceId] [int] NOT NULL,
 CONSTRAINT [PK_ServiceClinicalServiceId] PRIMARY KEY CLUSTERED 
(
	[serviceId] ASC,
	[clinicalServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServiceClinicalService]  WITH CHECK ADD  CONSTRAINT [FK_SCS_CS] FOREIGN KEY([clinicalServiceId])
REFERENCES [dbo].[ClinicalService] ([Id])
GO
ALTER TABLE [dbo].[ServiceClinicalService] CHECK CONSTRAINT [FK_SCS_CS]
GO
ALTER TABLE [dbo].[ServiceClinicalService]  WITH CHECK ADD  CONSTRAINT [FK_SCS_S] FOREIGN KEY([serviceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[ServiceClinicalService] CHECK CONSTRAINT [FK_SCS_S]
GO

/****** Object:  Table [dbo].[Disclaimer]  ******/
PRINT '**** CREATING TABLE [dbo].[Disclaimer] ****'
CREATE TABLE [dbo].[Disclaimer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](2000),
 CONSTRAINT [PK_disclaimer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Seoc]  WITH CHECK ADD  CONSTRAINT [FK_SEOC_DISCLAIMER] FOREIGN KEY([disclaimerId])
REFERENCES [dbo].[Disclaimer] ([Id])
GO
ALTER TABLE [dbo].[Seoc] CHECK CONSTRAINT [FK_SEOC_DISCLAIMER]
GO


/****** Object:  Table [dbo].[SeocUser] ******/
PRINT '**** CREATE TABLE [dbo].[SeocUser] ****'
CREATE TABLE [dbo].[SeocUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[vaUserId] [varchar](80) NOT NULL,
	[role] [varchar](25) NULL,
	[createDate] [datetime2](7) NOT NULL,
	[modifiedDate] [datetime2](7) NULL,
	[userName] [varchar](50) NOT NULL,
	[deactivatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SeocUser] ADD  DEFAULT (getutcdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[SeocUser] ADD  DEFAULT ('0') FOR [userName]
GO
ALTER TABLE [dbo].[SeocUser] ADD  DEFAULT (NULL) FOR [deactivatedDate]
GO

/****** Object:  Table [dbo].[Event] ******/
PRINT '**** CREATE TABLE [dbo].[Event] ****'
CREATE TABLE [dbo].[Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[action] [varchar](50) NOT NULL,
	[description] [varchar](250) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ChangeLog]  ******/
PRINT '**** CREATE TABLE [dbo].[ChangeLog] ****'
CREATE TABLE [dbo].[ChangeLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[seocId] [int] NOT NULL,
	[seocKey] [int] NOT NULL,
	[eventId] [int] NOT NULL,
	[comments] [varchar](500) NULL,
	[eventDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ChangeLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChangeLog] ADD  DEFAULT (getutcdate()) FOR [eventDate]
GO
ALTER TABLE [dbo].[ChangeLog]  WITH CHECK ADD  CONSTRAINT [FK_CL_EId] FOREIGN KEY([eventId])
REFERENCES [dbo].[Event] ([Id])
GO
ALTER TABLE [dbo].[ChangeLog] CHECK CONSTRAINT [FK_CL_EId]
GO
ALTER TABLE [dbo].[ChangeLog]  WITH CHECK ADD  CONSTRAINT [FK_CL_UId] FOREIGN KEY([userId])
REFERENCES [dbo].[SeocUser] ([Id])
GO
ALTER TABLE [dbo].[ChangeLog] CHECK CONSTRAINT [FK_CL_UId]
GO


/****** Object:  Table  ******/
CREATE TABLE testTable(
  Id nvarchar(max),
  Value nvarchar(max)
);
GO