USE [MoviesChriss]
GO

create table [dbo].[movie](
	[movie_id] [int] IDENTITY(1,1) NOT NULL,
	[movie_title] [varchar](200) NULL,
	[movie_description] [varchar](2000) NULL,
	[movie_released_date] [datetime] NULL,
	[movie_duration_time] [time](7) NULL,
	[director_id] [int] NULL,
PRIMARY KEY CLUSTERED  
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[genres](
	[genres_id] [int] IDENTITY(1,1) NOT NULL,
	[genres_title] [varchar](100) NULL,
	[genres_description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[genres_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



create table [dbo].[movie_genres](
	[movie_id] [int] NULL,
	[genres_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[movie_genres]  WITH CHECK ADD FOREIGN KEY([genres_id])
REFERENCES [dbo].[genres] ([genres_id])
GO

ALTER TABLE [dbo].[movie_genres]  WITH CHECK ADD FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([movie_id])
GO



create table [dbo].[movie_stars](
	[movie_id] [int] NULL,
	[user_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[movie_stars]  WITH CHECK ADD FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([movie_id])
GO

ALTER TABLE [dbo].[movie_stars]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO



create table [dbo].[movie_writers](
	[movie_id] [int] NULL,
	[user_id] [int] NULL
) ON [PRIMARY]
GO



create table [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[last_name] [varchar](255) NULL,
	[first_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


