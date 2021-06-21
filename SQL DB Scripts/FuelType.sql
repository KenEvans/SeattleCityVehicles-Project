USE [SeattleCityVehicles]
GO

 

/****** Object:  Table [dbo].[FuelType]    Script Date: 5/23/2021 3:35:19 PM ******/
SET ANSI_NULLS ON
GO

 

SET QUOTED_IDENTIFIER ON
GO

 

CREATE TABLE [dbo].[FuelType](
    [FuelTypeKey] [int] IDENTITY(1,1) NOT NULL,
    [FuelType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FuelType_FuelTypeKey] PRIMARY KEY CLUSTERED 
(
    [FuelTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
