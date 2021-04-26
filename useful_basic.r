# some basic useful functions

# function: is not in
'%!in%' <- function(x,y)!('%in%'(x,y))

# function: remove '\xa0' chars
phrase_clean <- function(x) gsub("[\xA0]", "", x)

# function: replace double spaces with single spaces
space_clean <- function(x) gsub("  ", " ", x)

# function: apply a function to ALL character columns
char_fun <- function(x,y){ # x = dataframe, y = function to apply
  setDT(x)
  cols_to_be_rectified <- names(x)[vapply(x, is.character, logical(1))]
  x[,c(cols_to_be_rectified) := lapply(.SD, y), .SDcols = cols_to_be_rectified]
}

# function: get everything from INSIDE any parenthesis
inparens <- function(x)gsub("(?<=\\()[^()]*(?=\\))(*SKIP)(*F)|.", "", x, perl=T)

# function: get everything from OUTSIDE any parenthesis
outparens <- function(x){
  trimws(gsub("\\([^()]*\\)", "", x))
}

# combine data frames that do not have the same column headers and keep all columns
combine <- function(x,y) # x and y are the dataframes to be combined
  rbindlist(list(x, y), fill = TRUE)

# get a dataframe of duplicates in a single column
duplicated <- function(x,y){ # x is the dataframe to look for duplicates, y is the column to check
  dupe <- x[,c('y')] # list data in column to check duplicates in
  review_dups <- x[duplicated(dupe) | duplicated(dupe, fromLast=TRUE),] # create duplicates data frame
  }
