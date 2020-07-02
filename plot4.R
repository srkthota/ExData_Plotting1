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
png("plot4.png", width=480, height=480)
#Divide image area into 4 parts having 2 rows and 2 columns
par(mfrow=c(2,2))
#sub plot1 top row left
plot(powerDT$DateTime, powerDT$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#sub plot2 top row right
plot(powerDT$DateTime,powerDT$Voltage, type="l", xlab="datetime", ylab="Voltage")
#sub plot3 bottom row left
plot(powerDT$DateTime, powerDT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(powerDT$DateTime, powerDT$Sub_metering_2, col="red")
lines(powerDT$DateTime, powerDT$Sub_metering_3,col="blue")
# add legend to the sub plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")
#sub plot4 bottom row right
plot(powerDT$DateTime, powerDT$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power")
# close the graphics output device
dev.off()






