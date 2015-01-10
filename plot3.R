file_name <- "household_power_consumption.txt"
if (!file.exists(file_name)){
  message("Downloading data")
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", file_name, method="wget")
  unzip(filename)
}

DT <- fread(paste("grep ^[12]/2/2007", file_name), na.strings = c("?", ""))
setnames(DT, colnames(fread(file_name, nrows=0)))
DT$DateTime <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png",width=480,height=480)
plot(DT$DateTime, DT$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(DT$DateTime, DT$Sub_metering_2, col="red")
lines(DT$DateTime, DT$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'))
dev.off()