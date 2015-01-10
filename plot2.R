file_name <- "household_power_consumption.txt"
if (!file.exists(file_name)){
  message("Downloading data")
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", file_name, method="wget")
  unzip(filename)
}

DT <- fread(paste("grep ^[12]/2/2007", file_name), na.strings = c("?", ""))
setnames(DT, colnames(fread(file_name, nrows=0)))
DT$DateTime <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png",width=480,height=480)
plot(DT$DateTime, DT$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()