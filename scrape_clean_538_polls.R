library(readr) #reads in csv files faster than the base package

polls_url <- "https://projects.fivethirtyeight.com/polls-page/president_primary_polls.csv"

polls <- read_csv(polls_url)

View(polls)

library(dplyr)

dem_primary_polls <- polls %>% filter(stage=="primary", party=="DEM")

View(dem_primary_polls)

dem_primary_polls <- dem_primary_polls %>% 
  mutate(start_date=as.Date(start_date, "%m/%d/%y"),
         end_date=as.Date(start_date, "%m/%d/%y"),
         create_date=as.Date(created_at, "%m/%d/%y")
         ) 


fte_grades <- read_csv("fte_grades.csv")
View(fte_grades)

dem_primary_polls <- left_join(dem_primary_polls, fte_grades, by="fte_grade")
