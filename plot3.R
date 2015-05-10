#Jeremy Short - Coursera Data Plotting Course Project 1
#loads data from txt file and retruns data set to plot
#this file assumes you have already downloaded the dataset and placed in the working directory

# load the get data script to import data
source("get_data.R")

plot3 <- function(){
      
      #load the data and set Global_active_power and submettering to numeric and setup a timestamp
      electric_data <- get_data()
      electric_data$Global_active_power <- as.numeric(as.character(electric_data$Global_active_power))
      electric_data <- transform(electric_data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
      electric_data$Sub_metering_1 <- as.numeric(as.character(electric_data$Sub_metering_1))
      electric_data$Sub_metering_2 <- as.numeric(as.character(electric_data$Sub_metering_2))
      electric_data$Sub_metering_3 <- as.numeric(as.character(electric_data$Sub_metering_3))

      png("plot3.png", width=480, height=480)
      
      plot(electric_data$timestamp, electric_data$Sub_metering_1, type="l", col="black",
           xlab="", ylab="Energy sub metering")
      
      lines(electric_data$timestamp, electric_data$Sub_metering_2, col="red")
      lines(electric_data$timestamp, electric_data$Sub_metering_3, col="blue")
      
      legend("topright", col=c("black", "red", "blue"),
             c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
 
      dev.off()

}