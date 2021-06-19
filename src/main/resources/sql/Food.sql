USE [Topic]

/****** Object:  Table [dbo].[Food]    Script Date: 2021/6/12 下午 04:05:37 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Food]([id] [int] NOT NULL,[name] [varchar](255) NULL,PRIMARY KEY CLUSTERED ([id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

INSERT [dbo].[Food] ([id], [name]) VALUES (1, N'罐罐')

INSERT [dbo].[Food] ([id], [name]) VALUES (2, N'飼料')

INSERT [dbo].[Food] ([id], [name]) VALUES (3, N'零食')

INSERT [dbo].[Food] ([id], [name]) VALUES (4, N'鮮食')
