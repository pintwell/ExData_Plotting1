#Jeremy Short - Coursera Data Plotting Course Project 1
#loads data from txt file and retruns data set to plot
#this file assumes you have already downloaded the dataset and placed in the working directory

# load the get data script to import data
source("get_data.R")

plot4 <- function(){
      
      #load the data and set Global_active_power and submettering to numeric and setup a timestamp
      electric_data <- get_data()
      
      electric_data$Global_active_power <- as.numeric(as.character(electric_data$Global_active_power))
      
      electric_data <- transform(electric_data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
      
      electric_data$Sub_metering_1 <- as.numeric(as.character(electric_data$Sub_metering_1))
      electric_data$Sub_metering_2 <- as.numeric(as.character(electric_data$Sub_metering_2))
      electric_data$Sub_metering_3 <- as.numeric(as.character(electric_data$Sub_metering_3))
      
      electric_data$Global_reactive_power <- as.numeric(as.character(electric_data$Global_reactive_power))
      electric_data$Voltage <- as.numeric(as.character(electric_data$Voltage))
      
      png("plot4.png", width=480, height=480)
      
      par(mfrow=c(2,2))
      
      #First Plot
      plot(electric_data$timestamp, electric_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

      #Second Plot
      plot(electric_data$timestamp, electric_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

      #Third Plot
      plot(electric_data$timestamp, electric_data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
      lines(electric_data$timestamp, electric_data$Sub_metering_2, col="red")
      lines(electric_data$timestamp, electric_data$Sub_metering_3, col="blue")
      legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lwd=0)

      #Fourth Plot
      plot(electric_data$timestamp, electric_data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
      lines(electric_data$timestamp, electric_data$Global_reactive_power)

      dev.off()

}