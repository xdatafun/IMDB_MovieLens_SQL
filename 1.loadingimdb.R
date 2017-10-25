
# read in .gz file 
imdb.titles <- readLines("title.basics.tsv.gz")
imdb.crew <- readLines("title.crew.tsv.gz")
imdb.episodes <- readLines("title.episode.tsv.gz")
imdb.principals <- readLines("title.principals.tsv.gz")
imdb.ratings <- readLines("title.ratings.tsv.gz")
imdb.names <- readLines("name.basics.tsv.gz")

# format into data frame
library(reshape2)
df.titles <- colsplit(imdb.titles[-1],"\t",
                       c("tconst","titleType","primaryTitle",
                         "originalTitle","isAdult","startYear",
                         "endYear","runtimeMinutes","genres"))

df.crew <- strsplit(imdb.crew," ")
df.crew <- colsplit(df.crew[-1],"\t",
                    c("tconst","directors","writers"))

df.episodes <- strsplit(imdb.episodes," ")
df.episodes <- colsplit(df.episodes[-1],"\t",
                        c("tconst","parentTconst","seasonNumber",
                          "episodeNumber"))

df.principals <- strsplit(imdb.principals," ")
df.principals <- colsplit(df.principals[-1],"\t",
                          c("tconst","principalCast"))

df.ratings <- strsplit(imdb.ratings," ")
df.ratings <- colsplit(df.ratings[-1],"\t",
                       c("tconst","averageRating","numVotes"))

df.names <- colsplit(imdb.names[-1],"\t",
                     c("nconst","primaryName","birthYear",
                       "deathYear","primaryProfession","knownForTitles"))

# save 
saveRDS(df.titles,file="titles.Rda")
saveRDS(df.crew,file="crew.Rda")
saveRDS(df.episodes,file="episodes.Rda")
saveRDS(df.principals,file="principals.Rda")
saveRDS(df.ratings,file="ratings.Rda")
saveRDS(df.names,file="names.Rda")

rm(list=ls(pattern="df."))
rm(list=grep("df.",ls(),value=T))
rm(list=grep("imdb.",ls(),value=T))

# load again
df.titles <- readRDS("titles.Rda")
df.crew <- readRDS("crew.Rda")
# df.episodes <- readRDS("episodes.Rda")
df.principals <- readRDS("principals.Rda")
df.ratings <- readRDS("ratings.Rda")
df.names <- readRDS("names.Rda")
