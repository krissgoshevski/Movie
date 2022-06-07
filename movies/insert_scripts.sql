USE [MoviesChriss]
GO

INSERT INTO [dbo].[movie]
           ([movie_title]           ,[movie_description]           ,[movie_released_date]           ,[movie_duration_time]           ,[director_id])
     VALUES
           ('First Blood VVVV','A veteran Green Beret is forced by a cruel Sheriff and his deputies to flee into the mountains and wage an escalating one-man war against his pursuers.',
          '1982-01-01 00:00:00.000',
           '01:33:00.0000000',
           1)
GO


INSERT INTO [dbo].[movie]
           ([movie_title]           ,[movie_description]           ,[movie_released_date]           ,[movie_duration_time]           ,[director_id])
     VALUES
           ('Rambo','In Thailand, John Rambo joins a group of mercenaries to venture into war-torn Burma, and rescue a group of Christian aid workers who were kidnapped by the ruthless local infantry unit.',
          '2008-01-01 00:00:00.000',
           '01:32:00.0000000',
           13)
GO

INSERT INTO [dbo].[movie]
           ([movie_title]           ,[movie_description]           ,[movie_released_date]           ,[movie_duration_time]           ,[director_id])
     VALUES
           ('Rambo |||','Rambo mounts a one-man mission to rescue his friend Colonel Trautman from the clutches of the formidable invading Soviet forces in Afghanistan.',
          '1988-01-01 00:00:00.000',
           '01:42:00.0000000',
           12)
GO
---------------------------------------------------------------
select * from genres
USE [MoviesChriss]
GO

INSERT INTO [dbo].[genres]
           ([genres_title]  ,[genres_description])
     VALUES
           ('Action', 'An action story is similar to action, and the protagonist usually takes a risky turn, which leads to desperate situations (including explosions, fight scenes, daring escapes, etc.). Action and adventure are usually categorized together (sometimes even as "action-adventure") because they have much in common, and many stories fall under both genres simultaneously (for instance, the James Bond series can be classified as both).')
		    )
GO


INSERT INTO [dbo].[genres]
           ([genres_title]  ,[genres_description])
     VALUES
           ('Adventure', 'An action story is similar to adventure, and the protagonist usually takes a risky turn, which leads to desperate situations (including explosions, fight scenes, daring escapes, etc.). Action and adventure are usually categorized together (sometimes even as "action-adventure") because they have much in common, and many stories fall under both genres simultaneously (for instance, the James Bond series can be classified as both).')
		    )
GO


INSERT INTO [dbo].[genres]
           ([genres_title]  ,[genres_description])
     VALUES
           ('Comedy', 'An action story is similar to comedy, and the protagonist usually takes a risky turn, which leads to desperate situations (including explosions, fight scenes, daring escapes, etc.). Action and adventure are usually categorized together (sometimes even as "action-adventure") because they have much in common, and many stories fall under both genres simultaneously (for instance, the James Bond series can be classified as both).')
		    )
GO


INSERT INTO [dbo].[genres]
           ([genres_title]  ,[genres_description])
     VALUES
           ('Thriller', 'An action story is similar to thriller, and the protagonist usually takes a risky turn, which leads to desperate situations (including explosions, fight scenes, daring escapes, etc.). Action and adventure are usually categorized together (sometimes even as "action-adventure") because they have much in common, and many stories fall under both genres simultaneously (for instance, the James Bond series can be classified as both).')
		    )
GO
---------------------------------------------------------------
select * from movie_genres
USE [MoviesChriss]
GO

INSERT INTO [dbo].[movie_genres]
           ([movie_id],   [genres_id])
     VALUES
           (1,1)
GO

INSERT INTO [dbo].[movie_genres]
           ([movie_id],   [genres_id])
     VALUES
           (1,2)
GO


INSERT INTO [dbo].[movie_genres]
           ([movie_id],   [genres_id])
     VALUES
           (1,4)
GO


---------------------------------------------------------------------------
select * from movie_stars
USE [MoviesChriss]
GO

INSERT INTO [dbo].[movie_stars]
           ([movie_id]  ,[user_id])
     VALUES
           (1,6)
GO

INSERT INTO [dbo].[movie_stars]
           ([movie_id]  ,[user_id])
     VALUES
           (1,7)
GO


INSERT INTO [dbo].[movie_stars]
           ([movie_id]  ,[user_id])
     VALUES
           (1,8)
GO
---------------------------------------------------------------
select * from movie_writers
USE [MoviesChriss]
GO

INSERT INTO [dbo].[movie_writers]
           ([movie_id]
           ,[user_id])
     VALUES
           (1,3)
GO

INSERT INTO [dbo].[movie_writers]
           ([movie_id]
           ,[user_id])
     VALUES
           (1,4)
GO

INSERT INTO [dbo].[movie_writers]
           ([movie_id]
           ,[user_id])
     VALUES
           (1,5)
GO

---------------------------------------------------------------
select * from users
USE [MoviesChriss]
GO

INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Kotcheff', 'Ted')
GO

INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Gosevski', 'Criss')
GO

INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Morell', 'David')
GO


INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Kozoll', 'Michael')
GO

INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Sacheim', 'Willian')
GO


INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Stallone', 'Sylvester')
GO


INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Dennehy', 'Brian')
GO

INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Crenna', 'Richard')
GO


INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Monterastelli', 'Art')
GO


INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Benz', 'Julie')
GO


INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('GOMarsden', 'Matthew')



INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('MacDonald', 'Peter')
GO


INSERT INTO [dbo].[users]
           ([last_name] ,[first_name])
     VALUES
           ('Stojkov', 'Vojo')
GO

















