# Loop through columns and add rows to basic data, then remove extra columns

# get synonyms from columns syn2-last
for (i in 2:colno){
  syn <- paste('syn', i, sep="")
  synonyms_append <- df_synonym[which(!is.na(df_synonym[[syn]]))] # get next set of synonyms
  synonyms_append$scientificName <- synonyms_append[[syn]] # move synonyms to scientific name
  synonyms <- rbind(synonyms, synonyms_append) # combine with synonyms
}

# remove parsed columns from synonyms
for (i in 1:colno){
  syn <- paste('syn', i, sep="")
  synonyms[[syn]] <- NULL 
}