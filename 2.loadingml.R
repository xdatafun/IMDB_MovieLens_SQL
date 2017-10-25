
ml.idLink <- read.csv("links.csv")
ml.tagRelevance <- read.csv("genome-scores.csv")
ml.tagList <- read.csv("genome-tags.csv")
ml.movieGenre <- read.csv("movies.csv")
ml.userRating <- read.csv("ratings.csv")
ml.userTag <- read.csv("tags.csv")

# summary(ml.tagRelevance)
# summary(ml.userRating)

# rm(list=grep("ml.",ls(),value=T))

# sample the most recent 1 million rating
library(dplyr)
ratings <- arrange(ml.userRating,desc(timestamp))
ratings1m <- ratings[1:1000000,]
write.csv(ratings1m[,-4],file="ratings1m.csv",row.names=F)
# ml.userRating1m <- read.csv("ratings1m.csv")
# identical(ml.userRating1m,ratings1m[,-4])