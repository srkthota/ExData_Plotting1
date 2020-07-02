# Downloading Project data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./household_power_consumption.zip")

# Unzip the dataSet
unzip(zipfile="./household_power_consumption.zip",exdir=".")