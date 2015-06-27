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

# Read in big.txt, a 6.5 mb collection of different English texts.
raw_text <- paste(readLines("http://www.norvig.com/big.txt"), collapse = " ")
# Make the text lowercase and split it up creating a huge vector of word tokens.
split_text <- strsplit(tolower(raw_text), "[^a-z]+")
# Count the number of different type of words.
word_count <- table(split_text)
# Sort the words and create an ordered vector with the most common type of words first.
sorted_words <- names(sort(word_count, decreasing = TRUE))

correct <- function(word) {
  # Calculate the edit distance between the word and all other words in sorted_words.
  edit_dist <- adist(word, sorted_words)
  # Calculate the minimum edit distance to find a word that exists in big.txt 
  # with a limit of two edits.
  min_edit_dist <- min(edit_dist, 2)
  # Generate a vector with all words with this minimum edit distance.
  # Since sorted_words is ordered from most common to least common, the resulting
  # vector will have the most common / probable match first.
  proposals_by_prob <- c(sorted_words[ edit_dist <= min(edit_dist, 2)])
  # In case proposals_by_prob would be empty we append the word to be corrected...
  proposals_by_prob <- c(proposals_by_prob, word)
  # ... and return the first / most probable word in the vector.
  proposals_by_prob[1]
}

