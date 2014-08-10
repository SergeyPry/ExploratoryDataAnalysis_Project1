# move to the current project folder
setwd("d://Coursera//00_Data_Science_Specialization//ExploratoryDataAnalysis//Project1")

# functions
as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}

# load the data
powerdata <- read.csv("household_power_consumption.txt", sep = ";", header = T)

# convert the date column to Date column type
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

# select the date from 2 days in February 2007
powerdata_2days <- powerdata[powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02",]

# clean up the dataset from NAs
powerdata_2days[powerdata_2days$Sub_metering_1 != "?",]

# convert the global active power to kilowatts
powerdata_2days$Sub_metering_1 <- as.numeric.factor(powerdata_2days$Sub_metering_1)

# generate a composite Date variable
powerdata_2days$Date <- as.POSIXct(paste(powerdata_2days$Date,powerdata_2days$Time), "%d/%m/%Y %H:%M:%S")

# generate the plot
plot(powerdata_2days$Date, powerdata_2days$Sub_metering_1, xlab="", ylab="Energy sum metering", type = "l")
lines(powerdata_2days$Date, powerdata_2days$Sub_metering_2, col="red", type = "l")
lines(powerdata_2days$Date, powerdata_2days$Sub_metering_3, col="blue", type = "l")

# add the legend to this plot
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red", "blue"), , cex=0.7, pt.cex = 1)

