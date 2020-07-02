#Read data from household_power_consumption.txt file(download the data before reading file using download.R)

inFile <- "household_power_consumption.txt"
data <- read.table(inFile,sep=";", header=T, stringsAsFactors=F,check.names=F, dec=".", na.strings="?")
# Filter Dates from 1/2/2007 and to 2/2/2007
powerDT <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#converting the Date according to format in Date class
powerDT$Date <- as.Date(powerDT$Date, format="%d/%m/%Y")
#POSIXct date with time of day
powerDT$DateTime <- as.POSIXct(paste(as.Date(powerDT$Date),powerDT$Time))
# Save graphics plot output as png
png("plot2.png", width=480, height=480)
# plot DateTime on x-axis and Global_active_power on y-axis 
plot(x = powerDT$DateTime, y = powerDT$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# close the graphics output device
dev.off()