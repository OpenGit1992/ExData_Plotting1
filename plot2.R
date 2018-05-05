if(!file.exists("./Exploratory Data Analysis")){dir.create("./Exploratory Data Analysis")}
fileUrl = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = "electric_power_consumption.zip")
unzip(zipfile = "./Exploratory Data Analysis/electric_power_consumption.zip", exdir = "./Exploratory Data Analysis")
epc <- read.table("./Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
subsetepc <- epc[epc$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subsetepc$Date, subsetepc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(datetime, as.numeric(subsetepc$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()