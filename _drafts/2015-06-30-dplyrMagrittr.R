library(dplyr)
library(tidyr)
x <- rl('https://raw.githubusercontent.com/JeffSackmann/tennis_slam_pointbypoint/master/2011-ausopen-points.csv', method = 'libcurl') %>%
  read.csv 
  head
  
???'https://raw.githubusercontent.com/JeffSackmann/tennis_slam_pointbypoint/master/2011-ausopen-points.csv' %>%
  url(method = 'libcurl') %>%
  read.csv %>% 
  tbl_df %>%
  { glimpse(.) ; .} ->
  x
str(x)
  url %>%
  read.csv %>% head
  {glimpse(.) ; .} %>%
  tbl_df ->
  x
str(x)
