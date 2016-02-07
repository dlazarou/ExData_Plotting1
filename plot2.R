rm(list=ls())

#please copy the file with the name "household_power_consumption.txt" in a directory of your choice.
#everything else runs automatically.


#initialize:
setwd("C:/Users/Dimitrios/Documents/R")
HouseholdData <- as.data.frame(read.csv("household_power_consumption.txt", sep=";", header = TRUE))
head(HouseholdData)

#the date format is: DD/MM/YYYY:
HouseholdDataToUse <- subset(HouseholdData, HouseholdData$Date=="1/2/2007" | HouseholdData$Date=="2/2/2007")

#making sure that we do not have any missing values denoted by "?":
HouseholdDataToUse <- subset(HouseholdDataToUse, HouseholdDataToUse$Global_active_power!="?" & HouseholdDataToUse$Date!="?" & HouseholdDataToUse$Time!="?")

#create datetime column just by pasting two columns:
HouseholdDataToUse$datetime<- paste(HouseholdDataToUse$Date,HouseholdDataToUse$Time)

#opening file:
png(filename = "plot2.png", width = 480, height = 480)

#plot: everything controlled by myself, the x-axis range and what will be shown on it.
plot(type="l", as.integer(as.factor(paste(HouseholdDataToUse$Date, HouseholdDataToUse$Time))), as.numeric(HouseholdDataToUse$Global_active_power)/1000 , xaxt="n", xlab = "", ylab = "Global Active Power (kilowatts)")
#putting the dates in 0 seconds, 1440 seconds (1 day) and 2880 seconds (2 days):
axis(1, at=(c(0,1440,2880)), labels=c("Thu","Fri", "Sat"))

dev.off()
