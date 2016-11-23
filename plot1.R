setwd("C:/13.coursera/exploratory data analysis/")

electrical <- read.delim("household_power_consumption.txt",sep = ";", stringsAsFactors = F, na.strings = "?")

electrical$Date <- as.Date(electrical$Date, "%d/%m/%Y")

electrical <- electrical["2007-02-01" <= electrical$Date & electrical$Date <= "2007-02-02",]

hist(electrical$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,'plot1.png')

dev.off()