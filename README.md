# IMDB_MovieLens_SQL [still updating]

## Summary
* merge imdb metadata and movielens user rating (20 million) and tag (11 million) data 
* query in MySQL and R with SQL for exploratory data analysis/EDA

## Background 
This is a pet project I started August 2017. I was looking for sample data to play with a few R packages for recommender system/RS. I got imdb data late August and soon moved to MovieLens rating and tag data. At first, I loaded them to R as data frame and mainly used dplyr for merging and cleaning. Then I fed the sample data that had both metadata and user generated ratings & tags to a few RS R packages, sometime it ran well, other times it ran out of memory and crashed. My surface was four years old, I typed most of my dissertation on her so I stopped torturing her and the project took a hiatus. About October I upgraded to a new Mac and a friend suggested R data.table package to speed up the query so I picked up SQL again and resumed the project. I used SQL for class projects when I took data mining and big data analytics at business school. I found Derek Banas and Telusko Learning on YouTube very enjoyable. 

[* now redo what I have done in R before and create documentation, upload here for fun and catch up with habits in industry, at least in my field, academia tend to share codes in other ways]  

## Data Source
* IMDB metadata and average rating came from http://www.imdb.com/interfaces/ ;
* MovieLens rating and tag data came from https://grouplens.org/datasets/movielens/

## Documentation

### unpack in R 
  - imdb files end with "tsv.gz", for later use, objects saved as .Rda files. R script is saved as '1.loadingimdb.R'
  - movielens files end with "csv", made a subsample of 1 million most recent ratings for testing, R script '2.loadingml.R'
  - not all movies in imdb were rated in movielens, so merge and match the movies got rated and tagged by users from movielens, and saved these movies cast and metadata, mainly used dplyr. R script '3.flitering.R'

### load to MySQL 
MovieLens provided 20 million ratings from 1995 to 2015, IMDB provided metadata on title and cast, re-saved file to local:
  - genome-scores.csv (movieId,tagId,relevance)(long format)
  - genome-tags.csv (tagId,tag)(with primary key)
  - tags.csv (userId,movieId,tag,timestamp)(long format)
  - ratings.csv (userId,movieId,rating,timestamp)(long format) 
  - movies.csv (movieId,title,genres)(genres have multiple value in one cell, separated by |)(with primary key)
  - links.csv (movieId,imbdId,tmdbId)(with primary key)
  
 [to be continued]
