USE [SeattleCityVehicles]
GO

 

/****** Object:  Table [dbo].[VehicleMake]    Script Date: 5/23/2021 2:27:34 PM ******/
SET ANSI_NULLS ON
GO

 

SET QUOTED_IDENTIFIER ON
GO

 

CREATE TABLE [dbo].[VehicleMake](
    [VehicleMakeKey] [int] IDENTITY(1,1) NOT NULL,
    [VehicleMake] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VehicleMake_VehicleMakeKey] PRIMARY KEY CLUSTERED 
(
    [VehicleMakeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
