## Please view data_preparation.R when evaluating the source for each plot*.r
## file.  It contains the code used to read in and clean the data set used
## when generating these graphs
source("./data_preparation.R")

## Set up png graphics device?
png("plot2.png", width=480, height=480)

## Draw the line graph to the graphics device
plot(power_data$DateTime, power_data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Write out the chart to the file
dev.off()