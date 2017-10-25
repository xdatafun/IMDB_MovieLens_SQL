# eliminate files that will not be useful 

rm(df.episodes)

# subset the movies that have ratings in movielens 

library(dplyr)
# df.names<-select(df.names,-(birthYear:deathYear))
df.crew <- mutate(df.crew, shortId=substr(df.crew$tconst,3,10))
df.ratings <- mutate(df.ratings,shortId=substr(df.ratings$tconst,3,10))
df.principals <- mutate(df.principals,shortId=substr(df.principals$tconst,3,10))
df.titles <- mutate(df.titles,shortId=substr(df.titles$tconst,3,10))

df.crew$shortId <- as.integer(df.crew$shortId)
df.ratings$shortId <- as.integer(df.ratings$shortId)
df.principals$shortId <- as.integer(df.principals$shortId)
df.titles$shortId <- as.integer(df.titles$shortId)


# bigger file %in% smaller file 
ind.ratings <- df.ratings$shortId %in% ml.idLink$imdbId
mat.ratings <- df.ratings[ind.ratings,]
sum(ind.ratings)

ind.crew <- df.crew$shortId %in% ml.idLink$imdbId
mat.crew <- df.crew[ind.crew,]
sum(ind.crew)

ind.principals <- df.principals$shortId %in% ml.idLink$imdbId
mat.principals <- df.principals[ind.principals,]
sum(ind.principals)

ind.titles <- df.titles$shortId %in% ml.idLink$imdbId
mat.titles <- df.titles[ind.titles,]
sum(ind.titles)

## double checking
ml.idLink.sort <- arrange(ml.idLink,imdbId)
mat.crew.sort <- arrange(mat.crew,shortId)
df.crew.sort <- arrange(df.crew,shortId)
mat.ratings.sort <- arrange(mat.ratings,shortId)
## end checking 

# filter actors 
table(nchar(df.names$knownForTitles))
# 1-7 movie titles as known for, but mostly \N or 1-4, therefore cut the first 4
fil.names <- mutate(df.names,known1=substring(knownForTitles,3,9))
fil.names <- mutate(fil.names,known2=substring(knownForTitles,13,19))
fil.names <- mutate(fil.names,known3=substring(knownForTitles,23,29))
fil.names <- mutate(fil.names,known4=substring(knownForTitles,33,39))
head(fil.names)

fil.names$known1 <- as.integer(fil.names$known1)
fil.names$known2 <- as.integer(fil.names$known2)
fil.names$known3 <- as.integer(fil.names$known3)
fil.names$known4 <- as.integer(fil.names$known4)

# use most known for title for now 
ind.names <- fil.names$known1 %in% ml.idLink$imdbId
mat.names <- fil.names[ind.names,]

rm(list=ls(pattern="df."))
rm(list=ls(pattern="ind."))
rm(fil.names)

saveRDS(mat.crew,file="mat.crew.Rda")
saveRDS(mat.names,file="mat.names.Rda")
saveRDS(mat.principals,file="mat.principals.Rda")
saveRDS(mat.ratings,file="mat.ratings.Rda")
saveRDS(mat.titles,file="mat.titles.Rda")

mat.crew <- readRDS("mat.crew.Rda")
mat.names <- readRDS("mat.names.Rda")
mat.principals <- readRDS("mat.principals.Rda")
mat.ratings <- readRDS("mat.ratings.Rda")
mat.titles <- readRDS("mat.titles.Rda")