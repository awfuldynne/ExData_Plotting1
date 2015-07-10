## Please view data_preparation.R when evaluating the source for each plot*.r
## file.  It contains the code used to read in and clean the data set used
## when generating these graphs
source("./data_preparation.R")

## Set up png graphics device?
png("plot4.png", width=480, height=480)

## Split plot into four sections
par(mfrow = c(2,2))

## Draw global active power line graph
plot(power_data$DateTime, power_data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

## Draw voltage line graph
plot(power_data$DateTime, power_data$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

## Draw sub metering line graph
plot(power_data$DateTime, power_data$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")

lines(power_data$DateTime, power_data$Sub_metering_1, col = "black")
lines(power_data$DateTime, power_data$Sub_metering_2, col = "red")
lines(power_data$DateTime, power_data$Sub_metering_3, col = "blue")

## Draw the legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1),
       bty="n",
       col=c("black","red","blue"))

## Draw global reactive power line graph
plot(power_data$DateTime, power_data$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

## Write out the chart to the file
dev.off()