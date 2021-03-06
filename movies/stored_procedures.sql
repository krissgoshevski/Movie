USE [MoviesChriss]
GO


create or alter procedure [dbo].[sp_manage_movies_data]
@method varchar(200)='',
@movie_id int = 0
as 

begin

	if (@method =  'getallmovies')
	begin
		select movie_id,
				movie_title,
				movie_description,movie_released_date,
				movie_duration_time,
				users.first_name+ ' ' + users.last_name as movie_director_full_name
		from movie
		left join users on users.user_id = movie.director_id 
	end 

	
	if (@method =  'getallusers')
	begin
		select user_id,
			first_name+ ' ' + last_name as full_name
		from users
	end 

	if (@method =  'getallgenres')
	begin
		select *
		from genres
	end 


	if (@method =  'getallmovies_writers')
	begin

		select users.first_name,
				users.last_name 
		from movie_writers
		inner join users on users.user_id = movie_writers.user_id 
		where movie_id= @movie_id
	end 

	if (@method =  'getallmovies_stars')
	begin

		select users.first_name,
				users.last_name 
		from movie_stars
		inner join users on users.user_id = movie_stars.user_id 
		where movie_id= @movie_id
	end 



	if (@method =  'getallmovies_genres')
	begin
	
		select genres.genres_id, genres_title
		from genres
		inner join movie_genres on movie_genres.genres_id = genres.genres_id		
		where movie_id= @movie_id
	end 


end 


go


CREATE procedure [dbo].[sp_InsertMovieData]
(
	@movie_title varchar(200),
	@movie_description varchar(2000),
	@movie_released_date date,
	@movie_duration_time time,
	@movie_director int=null,
	@movie_director_first_name varchar(100),
	@movie_director_last_name varchar(100),

	@genres varchar(200)--, --= '1,2,4' 
	--@writers varchar(200), 
	--@stars varchar(200) --= '1,2,4' 
)
as
begin 

	declare @movie_id int 

	 

	if (@movie_director_first_name<>'' and @movie_director_last_name <>'')
	begin  
		insert into users (first_name, last_name ) values (@movie_director_first_name,@movie_director_last_name)
		select @movie_director = (select SCOPE_IDENTITY())
	end 


	insert into movie (movie_title,
					   movie_description,
					   movie_released_date,
					   movie_duration_time,
					   director_id)
	values (
		@movie_title,
		@movie_description,
		@movie_released_date,
		@movie_duration_time,
		@movie_director
	)
	select @movie_id  = (select SCOPE_IDENTITY())
	
	
	declare @count int
	declare @genres_id int
	select @count = count(*) from string_split(@genres, ',')  where rtrim(value) <> '';	

	while (@count >=0)
	begin 
		select @genres_id
		select @genres_id = value from string_split(@genres, ',')  where rtrim(value) <> '';			

		insert into movie_genres (genres_id,movie_id) values (@genres_id, @movie_id)

		set @count  = @count-1		
	end 

end 

GO



