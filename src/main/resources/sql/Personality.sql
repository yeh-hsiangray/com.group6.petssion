USE [Topic]

/****** Object:  Table [dbo].[Personality]    Script Date: 2021/6/12 下午 05:24:00 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Personality]([id] [int] NOT NULL,[name] [varchar](255) NULL,PRIMARY KEY CLUSTERED ([id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

INSERT [dbo].[Personality] ([id], [name]) VALUES (1, N'親人')

INSERT [dbo].[Personality] ([id], [name]) VALUES (2, N'活潑')

INSERT [dbo].[Personality] ([id], [name]) VALUES (3, N'怕生')
