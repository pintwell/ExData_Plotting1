#Jeremy Short - Coursera Data Plotting Course Project 1
#loads data from txt file and retruns data set to plot
#this file assumes you have already downloaded the dataset and placed in the working directory

# load the get data script to import data
source("get_data.R")

plot1 <- function(){
      
      #load the data and set Global_active_power to numeric
      electric_data <- get_data()
      electric_data$Global_active_power <- as.numeric(as.character(electric_data$Global_active_power))

      png("plot1.png", width=480, height=480)
      
      hist(electric_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",
           ylab="Frequency", col="red")
 
      dev.off()

}