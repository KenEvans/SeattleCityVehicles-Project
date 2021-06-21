USE [SeattleCityVehicles]
GO

 

/****** Object:  Table [dbo].[DepartmentName]    Script Date: 5/23/2021 2:25:27 PM ******/
SET ANSI_NULLS ON
GO

 

SET QUOTED_IDENTIFIER ON
GO

 

CREATE TABLE [dbo].[DepartmentName](
    [DeptPrimaryKey] [int] IDENTITY(1,1) NOT NULL,
    [DeptName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DepartmentName_DeptPrimaryKey] PRIMARY KEY CLUSTERED 
(
    [DeptPrimaryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
