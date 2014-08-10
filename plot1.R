
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

# convert the global active power to kilowatts
powerdata_2days$Global_active_power <- as.numeric.factor(powerdata_2days$Global_active_power)

# clean up the dataset from NAs
powerdata_2days[powerdata_2days$Global_active_power != "?",]

# generate the plot
hist(powerdata_2days$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "orange", main="Global Active Power")


