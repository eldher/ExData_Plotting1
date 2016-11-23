setwd("C:/13.coursera/exploratory data analysis/")

electrical <- read.delim("household_power_consumption.txt",sep = ";", stringsAsFactors = F, na.strings = "?")

electrical$Date <- as.Date(electrical$Date, "%d/%m/%Y")

electrical <- electrical["2007-02-01" <= electrical$Date & electrical$Date <= "2007-02-02",]

electrical$date_time <- paste0(electrical$Date," ",electrical$Time)

electrical$date_time <- strptime(electrical$date_time, "%Y-%m-%d %H:%M:%S")


plot(electrical$date_time,electrical$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="" )
lines(electrical$date_time,electrical$Sub_metering_2, type="l", col = "red")
lines(electrical$date_time,electrical$Sub_metering_3, type="l", col = "blue")
legend("topright", pch=c(NA,NA,NA), lwd = 1, col = c("black","red","blue"), legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"))

dev.copy(png,'plot3.png')
dev.off()