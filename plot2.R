#Jeremy Short - Coursera Data Plotting Course Project 1
#loads data from txt file and retruns data set to plot
#this file assumes you have already downloaded the dataset and placed in the working directory

# load the get data script to import data
source("get_data.R")

plot2 <- function(){
      
      #load the data and set Global_active_power to numeric and setup a timestamp
      electric_data <- get_data()
      electric_data$Global_active_power <- as.numeric(as.character(electric_data$Global_active_power))
      electric_data <- transform(electric_data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

      png("plot2.png", width=480, height=480)
      
      plot(electric_data$timestamp, electric_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
 
      dev.off()

}