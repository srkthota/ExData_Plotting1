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
png("plot3.png", width=480, height=480)
# plot DateTime on x-axis and Sub_metering_1 on y-axis 
plot(powerDT$DateTime, powerDT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
# add lines with DateTime on x-axis and Sub_metering_2 on y-axis
lines(powerDT$DateTime, powerDT$Sub_metering_2,col="red")
# add lines with DateTime on x-axis and Sub_metering_3 on y-axis
lines(powerDT$DateTime, powerDT$Sub_metering_3,col="blue")
# add legend to the plot
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
# close the graphics output device
dev.off()