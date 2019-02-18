SELECT TOP (1000) [mID]
      ,[title]
      ,[year]
      ,[director]
  FROM [movie_rating].[dbo].[Movie];

SELECT * FROM dbo.Movie WHERE CONVERT(VARCHAR, director) = 'Steven Spielberg';

SELECT * FROM dbo.Movie 
INNER JOIN dbo.Rating ON dbo.Movie.mID = dbo.Rating.mID WHERE dbo.Rating.stars = 4 OR dbo.Rating.stars = 5 ORDER BY dbo.Movie.year DESC;

SELECT * FROM dbo.Movie
WHERE dbo.Movie.mID NOT IN (SELECT mID FROM dbo.Rating)