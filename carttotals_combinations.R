## date: 1/28/2022
## author: PF
## description: 
# create list of possible cart totals based on the product catalog of a merchant. 
# used dummy data but could upload an excel file with actual product prices
# use combn function which takes all possible comibations of data taken "i" at a time
# assumes customer is only buying 1 of each product


################################## INSTALL LIBRARIES ################################################

list.of.packages  <- c("plyr") #,"data.table", "tidyverse","ggplot2", "xlsx", "RPostgres","reshape2","sqldf")
new.packages <- list.of.packages [!(list.of.packages  %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages, library, character.only = TRUE)

################################# Create Dummy Data ##################################
Products <- c("Product A", "Product B", "Product C", "Product D", "Product E", "Product F", "Product G")
Prices <- c(10.52,2.16,130.30,11.20,35.46,3.20,11.95)

test_data <- data.frame(Products,Prices)

totals <- c()

for (i in 1:nrow(test_data) ){
  cart_values <- combn(test_data$Prices,i, FUN = sum)
  totals <- c(totals,cart_values)
}

totals_unique <- unique(totals)

print(totals_unique)
