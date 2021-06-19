USE [Topic]

/****** Object:  Table [dbo].[Kind]    Script Date: 2021/6/12 下午 05:00:21 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Kind]([id] [int] NOT NULL,[name] [varchar](255) NULL,[type] [varchar](255) NULL,PRIMARY KEY CLUSTERED ([id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

INSERT [dbo].[Kind] ([id], [name], [type]) VALUES (1, N'大型犬', N'狗')

INSERT [dbo].[Kind] ([id], [name], [type]) VALUES (2, N'中型犬', N'狗')

INSERT [dbo].[Kind] ([id], [name], [type]) VALUES (3, N'小型犬', N'狗')

INSERT [dbo].[Kind] ([id], [name], [type]) VALUES (4, N'混血貓', N'貓')

INSERT [dbo].[Kind] ([id], [name], [type]) VALUES (5, N'純種貓', N'貓')