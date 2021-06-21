USE [SeattleCityVehicles]
GO


/****** Object:  Table [dbo].[Sold_Fleet_Equipment]    Script Date: 5/23/2021 3:24:54 PM ******/
SET ANSI_NULLS ON
GO


SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Sold_Fleet_Equipment](
    [SoldFleetKey] [int] IDENTITY(1,1) NOT NULL,
    [Year] [int] NOT NULL,
    [Make] [int] NOT NULL,
    [Model] [nvarchar](50) NOT NULL,
    [Description] [nvarchar](50) NOT NULL,
    [Department] [int] NOT NULL,
    [SalePrice] [money] NOT NULL,
    [SaleDate] [date] NOT NULL,
    [EquipmentType] [nvarchar](50) NOT NULL,
    [FuelType] [int] NOT NULL,
 CONSTRAINT [PK_Sold_Fleet_Equipment_SoldFleetKey] PRIMARY KEY CLUSTERED 
(
    [SoldFleetKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[Sold_Fleet_Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Sold_Fleet_Equipment_VehicleMake] FOREIGN KEY([Make])
REFERENCES [dbo].[VehicleMake] ([VehicleMakeKey])
GO


ALTER TABLE [dbo].[Sold_Fleet_Equipment] CHECK CONSTRAINT [FK_Sold_Fleet_Equipment_VehicleMake]
GO


ALTER TABLE [dbo].[Sold_Fleet_Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Sold_Fleet_Equipment_DepartmentName] FOREIGN KEY([Department])
REFERENCES [dbo].[DepartmentName] ([DeptPrimaryKey])
GO


ALTER TABLE [dbo].[Sold_Fleet_Equipment] CHECK CONSTRAINT [FK_Sold_Fleet_Equipment_DepartmentName]
GO


ALTER TABLE [dbo].[Sold_Fleet_Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Sold_Fleet_Equipment_FuelType] FOREIGN KEY([FuelType])
REFERENCES [dbo].[FuelType] ([FuelTypeKey])
GO


ALTER TABLE [dbo].[Sold_Fleet_Equipment] CHECK CONSTRAINT [FK_Sold_Fleet_Equipment_FuelType]
GO
