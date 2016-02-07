rm(list=ls())

#please copy the file with the name "household_power_consumption.txt" in a directory of your choice.
#everything else runs automatically.

#initialize:
setwd("C:/Users/Dimitrios/Documents/R")
HouseholdData <- as.data.frame(read.csv("household_power_consumption.txt", sep=";", header = TRUE))
head(HouseholdData)

#the date format is: DD/MM/YYYY:
HouseholdDataToUse <- subset(HouseholdData, HouseholdData$Date=="1/2/2007" | HouseholdData$Date=="2/2/2007")

#write the small file:
#write.csv(HouseholdDataToUse, file = "HouseholdDataToUse.csv")
#read from the small file to avoid loading the large data file:
#HouseholdDataToUse <- as.data.frame(read.csv("HouseholdDataToUse.csv", sep=",", header = TRUE))

#making sure that we do not have any missing values denoted by "?":
HouseholdDataToUse <- subset(HouseholdDataToUse, Global_active_power!="?")

#opening file:
png(filename = "plot1.png", width = 480, height = 480)
#making the histogram: dividing by 1000 to get KW and making data numeric to recognize the column as number:
#fixing also the main title and the x-axis:
hist(as.numeric(HouseholdDataToUse$Global_active_power)/1000, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
