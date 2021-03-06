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

# text to columns function
text_to_columns <- function(dat, col, data="", column="", separator="", new_col_name_prefix="") { # dat is the data frame to operate on and col is the name of the column to be split
  colno <- max(lengths(strsplit(col, separator))) # get max number of terms for any value in the column to be split
  setDT(dat)[, paste0(new_col_name_prefix, 1:colno) := tstrsplit(col, separator)] # parse out terms into separate columns with column names prefixed with new_col_name_prefix plus consecutive numbers from 1
}

# define function VLOOKUP (x = return value dataframe and column,
# y = lookup value dataframe and column, z = lookup dataframe and column
# x and z should be from the same dataframe)
vlookup <- function(x,y,z){
  x[match(y,z)]
}
