# https://theoldreader.com/feeds/5492cceefea0e76433000405

library(dplyr)
"https://www.norvig.com/big.txt" %>%
  url() %>%
  readLines(n = 1e1L) %>%
  paste(collapse = " ") %>%
  tolower %>%
  strsplit("[^a-z]+") %>%
  table() %>%
  sort(decreasing = TRUE) %>%
  names() ->
  sorted_words

"http://www.google.com" %>%
  url() %>%
  readLines(n = 1e1L)


args(readLines)
urls <- "http://www.google.com"
sorted_words <- names(sort(table(strsplit(tolower(paste(readLines(urls), collapse = " ")), "[^a-z]+")), decreasing = TRUE))
correct <- function(word) { c(sorted_words[ adist(word, sorted_words) <= min(adist(word, sorted_words), 2)], word)[1] }
correct("piese")
## [1] "piece"
correct("ov")
## [1] "of"
correct("cakke")
## [1] "cake"

