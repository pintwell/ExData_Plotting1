#Jeremy Short - Coursera Data Plotting Course Project 1
#loads data from txt file and retruns data set to plot
#this file assumes you have already downloaded the dataset and placed in the working directory

get_data <- function() {
      electric_data <- read.table("household_power_consumption.txt", header = T, sep = ";")
      
      #set Date as date format
      electric_data$Date <- as.Date(electric_data$Date, format="%d/%m/%Y")
      
      #create subset of data for Feb 1, 2007 and Feb 2, 2007
      electric_data <- electric_data[(electric_data$Date == "2007-02-01") | (electric_data$Date == "2007-02-02"), ]
      
      # return subset to plot
      electric_data
      
}