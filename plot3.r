## Please view data_preparation.R when evaluating the source for each plot*.r
## file.  It contains the code used to read in and clean the data set used
## when generating these graphs
source("./data_preparation.R")

## Set up png graphics device?
png("plot3.png", width=480, height=480)

## Draw the line graph to the graphics device
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
       col=c("black","red","blue"))

## Write out the chart to the file
dev.off()