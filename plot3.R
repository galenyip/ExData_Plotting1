rm(list=ls())
setwd("~/Google Drive/Coursera/Git/exdata-035/project1/ExData_Plotting1")

# Load Data
data_raw <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Extract 1/Feb/2007 and 2/Feb/2007 data only
data_df <- data_raw[which(data_raw$Date =='1/2/2007'|data_raw$Date =='2/2/2007'),]

# Convert Date Time
data_df$datetime <- strptime(paste(data_df$Date, data_df$Time, sep = ' '), format = '%e/%m/%Y %T')

# Plot Line Chart with Color, Legend, and Y-Axis Label
par(mfrow = c(1, 1))
plot(y = data_df$Sub_metering_1, x = data_df$datetime,type = 'l', 
     ylab = 'Energy sub metering', xlab ='')
lines(y = data_df$Sub_metering_2, x = data_df$datetime, col = 'red')
lines(y = data_df$Sub_metering_3, x = data_df$datetime, col = 'blue')
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1),cex = 0.8)

## Copy my plot to a PNG file
dev.copy(png, width=480, height=480, file = "plot3.png") 
## Close the PNG device
dev.off()
