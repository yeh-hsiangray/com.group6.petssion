USE [Topic]


/****** Object:  Table [dbo].[Hobby]    Script Date: 2021/6/15 下午 02:46:49 ******/
SET ANSI_NULLS ON


SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Hobby]([id] [int] NOT NULL,[name] [varchar](255) NULL,PRIMARY KEY CLUSTERED ([id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

INSERT [dbo].[Hobby] ([id], [name]) VALUES (1, N'散步')

INSERT [dbo].[Hobby] ([id], [name]) VALUES (2, N'旅行')

INSERT [dbo].[Hobby] ([id], [name]) VALUES (3, N'美食')

INSERT [dbo].[Hobby] ([id], [name]) VALUES (4, N'運動')

INSERT [dbo].[Hobby] ([id], [name]) VALUES (5, N'音樂')

INSERT [dbo].[Hobby] ([id], [name]) VALUES (6, N'閱讀')

INSERT [dbo].[Hobby] ([id], [name]) VALUES (7, N'攝影')

INSERT [dbo].[Hobby] ([id], [name]) VALUES (8, N'野外露營')

INSERT [dbo].[Hobby] ([id], [name]) VALUES (9, N'衝浪')

INSERT [dbo].[Hobby] ([id], [name]) VALUES (10, N'野餐')