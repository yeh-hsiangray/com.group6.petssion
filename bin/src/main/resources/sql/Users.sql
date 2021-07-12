USE [Topic]

/****** Object:  Table [dbo].[Users]    Script Date: 2021/6/18 下午 06:22:14 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Users]([id] [int] IDENTITY(1,1) NOT NULL,[name] [varchar](255) NOT NULL,[gender] [varchar](255) NOT NULL,[birthday] [date] NOT NULL,[address] [varchar](255) NOT NULL,[constellation] [varchar](255) NULL,[height] [int] NULL,[weight] [int] NULL,[mobilephone] [varchar](255) NOT NULL,[selfintroduction] [varchar](255) NULL,[email] [varchar](255) NOT NULL,[manager] [int] NOT NULL,[regdate] [date] NOT NULL,[fk_job_id] [int] NOT NULL,[Blockade] [int] NOT NULL,
 CONSTRAINT [PK__Users__3213E83F4B02B7C4] PRIMARY KEY CLUSTERED ([id] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

SET IDENTITY_INSERT [dbo].[Users] ON;

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (1, N'張家華', N'男', '1993-06-25', N'新北市板橋區中山路二段89巷8弄5號', N'巨蟹座', 171, 65, '0987654325', N'嗨我叫張家華啾咪', 'a8640586@gmail.com', 1, '2021-06-05', 8, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (2, N'陳冠士', N'男', '1994-09-25', N'台北市松山區三民路74巷2號', N'天秤座', 177, 69, '0986235444', N'嗨我叫陳冠士啾咪', 'happy1234@gmail.com', 2, '2021-06-05', 4, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (3, N'周心怡', N'女', '1996-02-05', N'台北市大安區復興南路二段148巷24號', N'水瓶座', 166, 52, '0963214568', N'嗨我叫周心怡啾咪', 'helloword@gmail.com', 2, '2021-06-05', 11, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (4, N'王林偉', N'男', '1993-06-25', N'桃園市中壢區中山東路二段5號', N'巨蟹座', 169, 62, '0978412362', N'嗨我叫王林偉啾咪', 'java0123@gmail.com', 2, '2021-06-05', 15, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (5, N'倪雅嵐', N'女', '1990-07-24', N'桃園市中壢區中大路148巷10號', N'獅子座', 152, 49, '0932014785', N'嗨我叫倪雅嵐啾咪', 'python996@gmail.com', 2, '2021-06-05', 10, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (6, N'謝明剛', N'男', '1989-11-26', N'台中市東區東光園路163號', N'射手座', 182, 75, '0963254123', N'嗨我叫謝明剛啾咪', 'lonely225@gmail.com', 2, '2021-06-05', 7, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (7, N'陸志偉', N'男', '1987-01-02', N'新北市中和區錦和路191號', N'魔羯座', 172, 67, '0975693001', N'嗨我叫陸志偉啾咪', 'betele11@gmail.com', 2, '2021-06-05', 1, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (8, N'簡士賢', N'男', '1995-09-04', N'桃園市中壢區興仁路二段7號', N'處女座', 178, 72, '0974154547', N'嗨我叫簡士賢啾咪', 'velits98@gmail.com', 2, '2021-06-05', 6, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (9, N'李嘉凡', N'男', '1996-08-17', N'台中市霧峰區福新路28號', N'獅子座', 183, 75, '0989632587', N'嗨我叫李嘉凡啾咪', 'elison74@gmail.com', 2, '2021-06-05', 4, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (10, N'吳佩依', N'女', '1994-12-14', N'新竹縣新埔鎮新關路77巷26號', N'射手座', 148, 47, '0998777445', N'嗨我叫吳佩依啾咪', '0985rthg@gmail.com', 2, '2021-06-05', 17, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (11, N'廖靜怡', N'女', '1984-06-25', N'台北市士林區中正路114巷5號', N'巨蟹座', 156, 54, '0966332114', N'嗨我叫廖靜怡啾咪', '78562gty@gmail.com', 2, '2021-06-05', 13, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (12, N'陳政哲', N'男', '1995-11-12', N'新北市新店區光明街272號', N'天蠍座', 174, 67, '0963223665', N'嗨我叫陳政哲啾咪', '25963green@gmail.com', 2, '2021-06-05', 12, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (13, N'周信宏', N'男', '1985-05-25', N'台北市中山區五常街190巷13號6樓', N'雙子座', 171, 65, '0985663654', N'嗨我叫周信宏啾咪', 'hlowf66@gmail.com', 2, '2021-06-05', 9, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (14, N'倪婷瑄', N'女', '1986-01-19', N'桃園市桃園區龍祥街151巷26號', N'魔羯座', 171, 65, '0988885412', N'嗨我叫倪婷瑄啾咪', 'gorv112f@gmail.com', 2, '2021-06-05', 5, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (15, N'吳慧柔', N'女', '1989-08-17', N'台中市沙鹿區正英路120號', N'獅子座', 171, 65, '0966544411', N'嗨我叫吳慧柔啾咪', 'erer58e@gmail.com', 2, '2021-06-05', 8, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (16, N'李政寶', N'男', '1994-05-28', N'高雄市前鎮區翠亨北路126巷18號', N'雙子座', 171, 65, '0922236665', N'嗨我叫李政寶啾咪', 'sdfert85@gmail.com', 2, '2021-06-05', 14, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (17, N'王云亞', N'女', '1990-04-22', N'基隆市七堵區明德三路136巷1號', N'金牛座', 171, 65, '0965788963', N'嗨我叫王云亞啾咪', 'fashion66@gmail.com', 2, '2021-06-05', 17, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (18, N'呂幼仲', N'男', '1991-04-15', N'台中市神岡區大豐路四段84巷7號', N'牡羊座', 171, 65, '0963214785', N'嗨我叫呂幼仲啾咪', 'loertyh888@gmail.com', 2, '2021-06-05', 9, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (19, N'孫佳慧', N'女', '1985-06-20', N'桃園市蘆竹區海山路一段69號', N'雙子座', 171, 65, '0963025202', N'嗨我叫孫佳慧啾咪', 'olive77796@gmail.com', 2, '2021-06-05', 8, 0)

INSERT [dbo].[Users] ([id], [name], [gender], [birthday], [address], [constellation], [height], [weight], [mobilephone], [selfintroduction], [email], [manager], [regdate], [fk_job_id], [Blockade]) VALUES (20, N'李佳芸', N'女', '1992-06-25', N'高雄市岡山區柳橋西路一段125巷22號', N'巨蟹座', 171, 65, '0996777885', N'嗨我叫李佳芸啾咪', 'ruby7788@gmail.com', 2, '2021-06-05', 2, 0)