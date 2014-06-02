#plot 3 code

#read in the data

HPC<-read.table('household_power_consumption.txt', sep=';', na.strings=c("?"), header=TRUE)

#format the dates, you can manipulate them a little better

library(lubridate)
HPC$Date<-dmy(as.character(HPC$Date))
HPC$Time<-hms(as.character(HPC$Time))

#subset, based on dates
new_data <- HPC[HPC$Date == as.POSIXct("2007-02-01", tz="UTC") | HPC$Date == as.POSIXct("2007-02-02", tz="UTC"), ]



## now make plot 3

png(filename="plot3.png", width=480, height=480)
plot(new_data$Sub_metering_1, type='l', xlab = '', xaxt='n', ylab="Energy sub metering")
lines(new_data$Sub_metering_2, col="red")
lines(new_data$Sub_metering_3, col="blue")
axis(1, at=c(1, nrow(new_data)/2, nrow(new_data)), labels=c("Thu", "Fri", "Sat"))
vars <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=vars)
dev.off()
