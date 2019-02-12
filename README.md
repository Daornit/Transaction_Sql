# Transaction_Sql 
Lab1_B:

        1. SELECT Reviewer.name, Movie.title, Rating.stars, Rating.ratingDate FROM Rating
        INNER JOIN Movie ON Movie.mID = Rating.mID
        INNER JOIN Reviewer ON Reviewer.rID = Rating.rID
        ORDER BY convert(varchar, Reviewer.name),convert(varchar, Movie.title),Rating.stars;
        
        2. SELECT Reviewer.name, Movie.title
        FROM Movie
        INNER JOIN Rating R1 ON R1.mID = Movie.mID
        INNER JOIN Rating R2 ON R2.mID = Movie.mID
        INNER JOIN Reviewer ON Reviewer.rID = R1.rID
        WHERE R1.rID = R2.rID AND R1.stars < R2.stars AND R1.ratingDate < R2.ratingDate;
        
        3. SELECT Movie.title, m.stars FROM (
            SELECT mID, MAX(stars) as stars FROM Rating
            GROUP BY Rating.mID
        ) m 
        INNER JOIN Movie ON Movie.mID = m.mID;
        
        4. SELECT Movie.title, m.dist FROM (
            SELECT mID, MAX(stars) - MIN(stars) AS dist FROM Rating GROUP BY mID
        ) m 
        INNER JOIN Movie ON Movie.mID = m.mID
        ORDER BY m.dist DESC;
        
        5. SELECT f.BooleanYear, AVG(f.average) AS avge FROM (SELECT
        CASE
            WHEN Movie.year<1980 THEN 'Before1980'
            WHEN Movie.year>=1980 THEN 'After1980'
        END AS BooleanYear, m.average
        FROM 
        (SELECT mID, AVG(stars) average FROM Rating
        GROUP BY mID) AS m
        INNER JOIN Movie ON Movie.mID = m.mID) AS f
        GROUP BY f.BooleanYear;
