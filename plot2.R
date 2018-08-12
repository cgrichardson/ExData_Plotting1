### R code to produce 'plot2.png' file

# Set the working directory
setwd("/Users/dad/Documents/Coursera/Data-Science-Specialization/Course4ExploratoryDataAnalysis/CourseProject1/ExData_Plotting1")

# Load required packages into R
library(grDevices)

# Load data into R and subset the data by the date
dataFile <- "/Users/dad/Documents/Coursera/Data-Science-Specialization/Course4ExploratoryDataAnalysis/CourseProject1/household_power_consumption.txt"
pwrConData <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataSubset <- pwrConData[pwrConData$Date %in% c("1/2/2007", "2/2/2007") ,]

# Create and save date/time version of 'Global Active Power' plot
dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(dataSubset$Global_active_power)
png("plot2.png", width = 500, height = 500)
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()