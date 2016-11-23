setwd("C:/13.coursera/exploratory data analysis/")

electrical <- read.delim("household_power_consumption.txt",sep = ";", stringsAsFactors = F, na.strings = "?")

electrical$Date <- as.Date(electrical$Date, "%d/%m/%Y")

electrical <- electrical["2007-02-01" <= electrical$Date & electrical$Date <= "2007-02-02",]

electrical$date_time <- paste0(electrical$Date," ",electrical$Time)

electrical$date_time <- strptime(electrical$date_time, "%Y-%m-%d %H:%M:%S")

plot(electrical$date_time,electrical$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png,'plot2.png')
dev.off()