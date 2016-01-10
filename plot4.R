rm(list=ls())
setwd("~/Google Drive/Coursera/Git/exdata-035/project1/ExData_Plotting1")

# Load Data
data_raw <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Extract 1/Feb/2007 and 2/Feb/2007 data only
data_df <- data_raw[which(data_raw$Date =='1/2/2007'|data_raw$Date =='2/2/2007'),]

# Convert Date Time
data_df$datetime <- strptime(paste(data_df$Date, data_df$Time, sep = ' '), format = '%e/%m/%Y %T')

# Plot Multiple Chart
par(mfrow = c(2, 2))
# Chart 1 (upper left)
plot(y = data_df$Global_active_power, x = data_df$datetime, type = 'l', 
     ylab = 'Global Acive Power', xlab ='', cex.lab = 0.8, cex.axis = 0.8)

# Chart 2 (upper right)
plot(y = data_df$Voltage, x = data_df$datetime, type = 'l', 
     ylab = 'Voltage', xlab ='datetime', cex.lab = 0.8, cex.axis = 0.8)

# Chart 3 (lower left)
plot(y = data_df$Sub_metering_1, x = data_df$datetime,type = 'l', 
     ylab = 'Energy sub metering', xlab ='', cex.lab = 0.8, cex.axis = 0.8)
lines(y = data_df$Sub_metering_2, x = data_df$datetime, col = 'red')
lines(y = data_df$Sub_metering_3, x = data_df$datetime, col = 'blue')
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), cex = 0.8, box.lwd = 0)

# Chart 4 (upper right)
plot(y = data_df$Global_reactive_power, x = data_df$datetime, type = 'l', 
     ylab = 'Global_reactive_power', xlab ='datetime', cex.lab = 0.8, cex.axis = 0.8)

## Copy my plot to a PNG file
dev.copy(png, width=480, height=480, file = "plot4.png") 
## Close the PNG device
dev.off()
