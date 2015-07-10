## Please view data_preparation.R when evaluating the source for each plot*.r
## file.  It contains the code used to read in and clean the data set used
## when generating these graphs
source("./data_preparation.R")

## Set up png graphics device?
png("plot1.png", width=480, height=480)

## Draw the histogram to the graphics device
hist(power_data$Global_active_power, 
     main = "Global Active Power", 
     col = "orangered3", 
     xlab = "Global Active Power (kilowatts)")

## Write out the chart to the file
dev.off()