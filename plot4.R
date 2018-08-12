### R code to produce 'plot4.png' file

# Set the working directory
setwd("/Users/dad/Documents/Coursera/Data-Science-Specialization/Course4ExploratoryDataAnalysis/CourseProject1/ExData_Plotting1")

# Load required packages into R
library(grDevices)

# Load data into R and subset the data by the date
dataFile <- "/Users/dad/Documents/Coursera/Data-Science-Specialization/Course4ExploratoryDataAnalysis/CourseProject1/household_power_consumption.txt"
pwrConData <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataSubset <- pwrConData[pwrConData$Date %in% c("1/2/2007", "2/2/2007") ,]

# Create and save voltage version of 'Global Active Power' plot
dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(dataSubset$Global_active_power)
globalReactivePower <- as.numeric(dataSubset$Global_reactive_power)
voltage <- as.numeric(dataSubset$Voltage)
subMetering1 <- as.numeric(dataSubset$Sub_metering_1)
subMetering2 <- as.numeric(dataSubset$Sub_metering_2)
subMetering3 <- as.numeric(dataSubset$Sub_metering_3)
png("plot4.png", width = 500, height = 500)
par(mfrow = c(2, 2))
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(dateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dateTime, subMetering1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(dateTime, subMetering2, type = "l", col = "red")
lines(dateTime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "o")
plot(dateTime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()