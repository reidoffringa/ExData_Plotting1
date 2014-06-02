
#All the plots!

HPC<-read.table('household_power_consumption.txt', sep=';', na.strings=c("?"), header=TRUE)

library(lubridate)
HPC$Date<-dmy(as.character(HPC$Date))

HPC$Time<-hms(as.character(HPC$Time))

new_data <- HPC[HPC$Date == as.POSIXct("2007-02-01", tz="UTC") | HPC$Date == as.POSIXct("2007-02-02", tz="UTC"), ]

## plot 1

png(filename="plot1.png", width=480, height=480)
hist(new_data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()


## plot 2

png(filename="plot2.png", width=480, height=480)
plot(new_data$Global_active_power, type='l', xlab = '', xaxt='n', ylab="Global Active Power (Kilowatts)")
axis(1, at=c(1, nrow(new_data)/2, nrow(new_data)), labels=c("Thu", "Fri", "Sat"))
dev.off()



## plot 3

png(filename="plot3.png", width=480, height=480)
plot(new_data$Sub_metering_1, type='l', xlab = '', xaxt='n', ylab="Energy sub metering")
lines(new_data$Sub_metering_2, col="red")
lines(new_data$Sub_metering_3, col="blue")
axis(1, at=c(1, nrow(new_data)/2, nrow(new_data)), labels=c("Thu", "Fri", "Sat"))
vars <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col=c("black", "red", "blue"), legend=vars)
dev.off()

##plot 4


png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(new_data$Global_active_power, type='l', xlab = '', xaxt='n', ylab="Global Active Power (Kilowatts)")
  axis(1, at=c(1, nrow(new_data)/2, nrow(new_data)), labels=c("Thu", "Fri", "Sat"))

plot(new_data$Voltage, type='l', xlab = 'datetime', xaxt='n', ylab="Voltage")
axis(1, at=c(1, nrow(new_data)/2, nrow(new_data)), labels=c("Thu", "Fri", "Sat"))

plot(new_data$Sub_metering_1, type='l', xlab = '', xaxt='n', ylab="Energy sub metering")
  lines(new_data$Sub_metering_2, col="red")
  lines(new_data$Sub_metering_3, col="blue")
  axis(1, at=c(1, nrow(new_data)/2, nrow(new_data)), labels=c("Thu", "Fri", "Sat"))
  vars <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=vars)


plot(new_data$Global_reactive_power, type='l', xlab = 'datetime', xaxt='n', ylab="Global Reactive Power (Kilowatts)")
axis(1, at=c(1, nrow(new_data)/2, nrow(new_data)), labels=c("Thu", "Fri", "Sat"))
dev.off()

