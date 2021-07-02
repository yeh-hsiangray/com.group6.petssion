USE [Topic]

/****** Object:  Table [dbo].[Job]    Script Date: 2021/6/19 上午 12:00:22 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Job]([id] [int] NOT NULL,[name] [varchar](255) NOT NULL,CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED ([id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

INSERT [dbo].[Job] ([id], [name]) VALUES (1, N'機師')

INSERT [dbo].[Job] ([id], [name]) VALUES (2, N'空服員')

INSERT [dbo].[Job] ([id], [name]) VALUES (3, N'消防員')

INSERT [dbo].[Job] ([id], [name]) VALUES (4, N'警察')

INSERT [dbo].[Job] ([id], [name]) VALUES (5, N'軍人')

INSERT [dbo].[Job] ([id], [name]) VALUES (6, N'影視傳播')

INSERT [dbo].[Job] ([id], [name]) VALUES (7, N'老師')

INSERT [dbo].[Job] ([id], [name]) VALUES (8, N'工程師')

INSERT [dbo].[Job] ([id], [name]) VALUES (9, N'模特兒')

INSERT [dbo].[Job] ([id], [name]) VALUES (10, N'藥劑師')

INSERT [dbo].[Job] ([id], [name]) VALUES (11, N'學生')

INSERT [dbo].[Job] ([id], [name]) VALUES (12, N'律師')

INSERT [dbo].[Job] ([id], [name]) VALUES (13, N'健身教練')

INSERT [dbo].[Job] ([id], [name]) VALUES (14, N'財經顧問')

INSERT [dbo].[Job] ([id], [name]) VALUES (15, N'護理師')

INSERT [dbo].[Job] ([id], [name]) VALUES (16, N'醫生')

INSERT [dbo].[Job] ([id], [name]) VALUES (17, N'房仲')

INSERT [dbo].[Job] ([id], [name]) VALUES (18, N'畫家')

INSERT [dbo].[Job] ([id], [name]) VALUES (19, N'企業家')

INSERT [dbo].[Job] ([id], [name]) VALUES (20, N'飛行員')