USE moviedb;

# see how many movies were rated in MovieLens data
SELECT COUNT(DISTINCT movieId) FROM rating; 

# the number of tags created by users
SELECT COUNT(*) FROM tagLink;

# the tags assigned to movies over 1000 times
SELECT COUNT(*) AS 'amount', tag
	FROM tag 
    GROUP BY tag 
	HAVING amount > 1000
    ORDER BY amount DESC;
    
# which movies got tagged most fequently
SELECT COUNT(*) AS 'frequency', title
	FROM tag, movie
    WHERE tag.movieId = movie.movieId
    GROUP BY tag.movieId 
    HAVING frequency > 700
    ORDER BY frequency DESC;
    
# which movies have the most number of distinct tags
SELECT COUNT(DISTINCT tag) AS 'nums', title
	FROM tag
    JOIN movie
    ON tag.movieId = movie.movieId
    GROUP BY tag.movieId
    HAVING nums > 130
    ORDER BY nums DESC; 
    
# tags frequently used for pulp fiction
SELECT tag, COUNT(*) AS freq FROM tag WHERE movieId = 296 GROUP BY tag HAVING freq >=10 ORDER BY freq DESC;

