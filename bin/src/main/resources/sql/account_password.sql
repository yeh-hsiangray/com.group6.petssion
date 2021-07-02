USE [Topic]

/****** Object:  Table [dbo].[account_password]    Script Date: 2021/6/19 上午 12:09:49 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[account_password]([id] [int] IDENTITY(1,1) NOT NULL,[account] [varchar](255) NOT NULL,[password] [varchar](255) NOT NULL,CONSTRAINT [PK__account___3213E83F4F13DE84] PRIMARY KEY CLUSTERED ([id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

SET IDENTITY_INSERT [dbo].[account_password] ON;

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (1, 'testaccount1', 'test12345', 1)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (2, 'testaccount2', 'test12345', 2)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (3, 'testaccount3', 'test12345', 3)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (4, 'testaccount4', 'test12345', 4)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (5, 'testaccount5', 'test12345', 5)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (6, 'testaccount6', 'test12345', 6)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (7, 'testaccount7', 'test12345', 7)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (8, 'testaccount8', 'test12345', 8)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (9, 'testaccount9', 'test12345', 9)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (10, 'testaccount10', 'test12345', 10)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (11, 'testaccount11', 'test12345', 11)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (12, 'testaccount12', 'test12345', 12)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (13, 'testaccount13', 'test12345', 13)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (14, 'testaccount14', 'test12345', 14)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (15, 'testaccount15', 'test12345', 15)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (16, 'testaccount16', 'test12345', 16)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (17, 'testaccount17', 'test12345', 17)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (18, 'testaccount18', 'test12345', 18)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (19, 'testaccount19', 'test12345', 19)

INSERT [dbo].[account_password] ([id], [account], [password], [fk_users_id]) VALUES (20, 'testaccount20', 'test12345', 20)