USE [SeattleCityVehicles]
GO

 

/****** Object:  Table [dbo].[Active_PHEVs]    Script Date: 5/23/2021 3:10:36 PM ******/
SET ANSI_NULLS ON
GO

 

SET QUOTED_IDENTIFIER ON
GO

 

CREATE TABLE [dbo].[Active_PHEVs](
    [ActivePHEVKey] [int] IDENTITY(1,1) NOT NULL,
    [Year] [int] NOT NULL,
    [Make] [int] NOT NULL,
    [Model] [nvarchar](50) NOT NULL,
    [Description] [nvarchar](50) NOT NULL,
    [Department] [int] NOT NULL,
    [InServiceDate] [date] NOT NULL,
    [EstReplacementYear] [int] NOT NULL,
    [EquipmentType] [nvarchar](50) NOT NULL,
    [InServiceCost] [money] NOT NULL,
    [FuelType] [int] NOT NULL,
 CONSTRAINT [PK_Active_PHEVs_ActivePHEVKey] PRIMARY KEY CLUSTERED 
(
    [ActivePHEVKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

 

ALTER TABLE [dbo].[Active_PHEVs]  WITH CHECK ADD  CONSTRAINT [FK_Active_PHEVs_VehicleMake] FOREIGN KEY([Make])
REFERENCES [dbo].[VehicleMake] ([VehicleMakeKey])
GO

 

ALTER TABLE [dbo].[Active_PHEVs] CHECK CONSTRAINT [FK_Active_PHEVs_VehicleMake]
GO

 

ALTER TABLE [dbo].[Active_PHEVs]  WITH CHECK ADD  CONSTRAINT [FK_Active_PHEVs_DepartmentName] FOREIGN KEY([Department])
REFERENCES [dbo].[DepartmentName] ([DeptPrimaryKey])
GO

 

ALTER TABLE [dbo].[Active_PHEVs] CHECK CONSTRAINT [FK_Active_PHEVs_DepartmentName]
GO

 

ALTER TABLE [dbo].[Active_PHEVs]  WITH CHECK ADD  CONSTRAINT [FK_Active_PHEVs_FuelType] FOREIGN KEY([FuelType])
REFERENCES [dbo].[FuelType] ([FuelTypeKey])
GO

 

ALTER TABLE [dbo].[Active_PHEVs] CHECK CONSTRAINT [FK_Active_PHEVs_FuelType]
GO
