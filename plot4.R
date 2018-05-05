if(!file.exists("./Exploratory Data Analysis")){dir.create("./Exploratory Data Analysis")}
fileUrl = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = "electric_power_consumption.zip")
unzip(zipfile = "./Exploratory Data Analysis/electric_power_consumption.zip", exdir = "./Exploratory Data Analysis")
epc <- read.table("./Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
subsetepc <- epc[epc$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subsetepc$Date, subsetepc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(subsetepc, {
  plot(datetime, as.numeric(Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")
  plot(datetime, as.numeric(Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
  plot(datetime, as.numeric(Sub_metering_1), type = "l", xlab = " ", ylab = "Energy sub metering")
  lines(datetime, as.numeric(Sub_metering_2), type = "l", col = "red")
  lines(datetime, as.numeric(Sub_metering_3), type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))
  plot(datetime, as.numeric(Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()