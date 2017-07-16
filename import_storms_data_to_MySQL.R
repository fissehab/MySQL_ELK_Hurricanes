
library(dplyr)

library(RMySQL)

my_storms = storms
my_storms$DateTime = paste0(storms$year, "-",storms$month, "-",storms$day, " ", storms$hour,":00:00")
my_storms = my_storms %>% select(name, DateTime, lat, long, status, category, wind, pressure)

mydb = dbConnect(MySQL(), 
                 dbname = "storms",
                 host = "127.0.0.1",
                 port = 3306,
                 user = "root",
                 password = "mypassword")


dbWriteTable(mydb,'storms', 
             my_storms, 
             row.names = FALSE,
             overwrite = TRUE)


