rm(list=ls())
setwd("~/Google Drive/Coursera/Git/exdata-035/project1/ExData_Plotting1")

# Load Data
data_raw <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Extract 1/Feb/2007 and 2/Feb/2007 data only
data_df <- data_raw[which(data_raw$Date =='1/2/2007'|data_raw$Date =='2/2/2007'),]

# Plot Histogram with Title, Color, and X-Axis Label
par(mfrow = c(1, 1))
hist(data_df$Global_active_power,main = "Global Active Power", col = 'red', 
     xlab = 'Global Acive Power (kilowatts)')

## Copy my plot to a PNG file
dev.copy(png, width=480, height=480, file = "plot1.png") 
## Close the PNG device
dev.off()
