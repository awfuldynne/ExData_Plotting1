## Script Overview:
## This script checks to see if "household_power_consumption.txt"
## is in your current working directory.  If not, it will download the 20MB zip
## file referenced and unppack it.
## Once the csv file is on your hard disk, this script will load the file into
## the variable power_data

file_path = "./household_power_consumption.txt"
to_download = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloaded_zip = "./power_consumption_archive.zip"

if (!exists("power_data"))
{
    if (!file.exists(file_path))
    {
        download.file(to_download, destfile = "./power_consumption_archive.zip")
        unzip(downloaded_zip)
    }
    
    raw_data = read.csv(file_path, header = TRUE, sep = ";", na.strings="?")
    dated_data = raw_data[which(raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007"),]
    power_data = cbind(strptime(paste(dated_data$Date,dated_data$Time, sep = " "), format="%d/%m/%Y %H:%M:%S"), dated_data)
    
    ## Adjust column data types and names
    colnames(power_data)[1] = "DateTime"
    
    power_data$Global_active_power = as.numeric(as.character(power_data$Global_active_power))
    power_data$Global_reactive_power = as.numeric(as.character(power_data$Global_reactive_power))
    power_data$Voltage = as.numeric(as.character(power_data$Voltage))
    power_data$Global_intensity = as.numeric(as.character(power_data$Global_intensity))
    power_data$Sub_metering_1 = as.numeric(as.character(power_data$Sub_metering_1))
    power_data$Sub_metering_2 = as.numeric(as.character(power_data$Sub_metering_2))                                                                                       
    power_data$Sub_metering_3 = as.integer(as.character(power_data$Sub_metering_3))
    
    remove(raw_data)
}