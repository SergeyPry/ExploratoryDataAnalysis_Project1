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
powerdata_2days <- powerdata_2days[powerdata_2days$Global_active_power != "?",]

powerdata_2days <- powerdata_2days[powerdata_2days$Sub_metering_1 != "?",]
powerdata_2days <- powerdata_2days[powerdata_2days$Sub_metering_2 != "?",]
powerdata_2days <- powerdata_2days[powerdata_2days$Sub_metering_3 != "?",]

# convert the global active power to kilowatts
powerdata_2days$Global_active_power <- as.numeric.factor(powerdata_2days$Global_active_power)

# convert the Sub_metering to numbers
#powerdata_2days$Sub_metering_1 <- as.numeric.factor(powerdata_2days$Sub_metering_1)
#powerdata_2days$Sub_metering_2 <- as.numeric.factor(powerdata_2days$Sub_metering_2)
#powerdata_2days$Sub_metering_3 <- as.numeric.factor(powerdata_2days$Sub_metering_3)

# generate a composite Date variable
powerdata_2days$Date <- as.POSIXct(paste(powerdata_2days$Date,powerdata_2days$Time), "%d/%m/%Y %H:%M:%S")

# set up the plotting area
par(mfrow = c(2,2))

######################
# Plot at 1,1 position
######################
# Plot 2

# generate the plot
plot(powerdata_2days$Date, powerdata_2days$Global_active_power, xlab="", ylab="Global Active Power", type = "l")

######################
# Plot at 1,2 position
######################
plot(powerdata_2days$Date, powerdata_2days$Voltage, xlab="datetime", ylab="Voltage", type = "l")


######################
# Plot at 2,1 position
######################
# Plot 3

# generate the plot
plot(powerdata_2days$Date, powerdata_2days$Sub_metering_1, xlab="", ylab="Energy sum metering", type = "l")
lines(powerdata_2days$Date, powerdata_2days$Sub_metering_2, col="red", type = "l")
lines(powerdata_2days$Date, powerdata_2days$Sub_metering_3, col="blue", type = "l")

# add the legend to this plot
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red", "blue"), , cex=0.7, pt.cex = 1)

######################
# Plot at 2,2 position
######################

# prepare the data

# convert the global reactive power to kilowatts
powerdata_2days$Global_reactive_power <- as.numeric.factor(powerdata_2days$Global_reactive_power)

# clean up the dataset from NAs
powerdata_2days <- powerdata_2days[powerdata_2days$Global_reactive_power != "?",]

# plot
plot(powerdata_2days$Date, powerdata_2days$Global_reactive_power, ylab = "Global_reactive_power", xlab="datetime", type = "l")


