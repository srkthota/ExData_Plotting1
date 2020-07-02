#Read data from household_power_consumption.txt file(download the data before reading file using download.R)

inFile <- "household_power_consumption.txt"
data <- read.table(inFile,sep=";", header=T, stringsAsFactors=F,check.names=F, dec=".", na.strings="?")
# Filter Dates from 1/2/2007 and to 2/2/2007
powerDT <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Save graphics hist output as png
png("plot1.png", width=480, height=480)
# hist will render histogram
hist(powerDT$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")
# close the graphics output device
dev.off()
