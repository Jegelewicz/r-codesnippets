# these functions mimic things I use in Excel often

# libraries required
library(stringi)

# right function works like RIGHT
right <- function (string, char) {
  substr(string,(unlist(lapply(gregexpr(pattern = char, string), min)) + 1),nchar(string))
}

# left function works like LEFT
left <- function (string,char) {
  substr(string,1,unlist(lapply(gregexpr(pattern = char, string), min)))
}

# text to columns
text_to_columns <- function(dataframe, column, separator, new_col_name_prefix) { # x is the name of the column to be split
  colno <- max(lengths(strsplit(dataframe$column, 'separator'))) # get max number of terms for any value in the column to be split
  setDT(dataframe)[, paste0("new_col_name_prefix", 1:colno) := tstrsplit(column, "separator")] # parse out terms into separate columns
}
