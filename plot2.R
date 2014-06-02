#plot 2 code

#read in the data

HPC<-read.table('household_power_consumption.txt', sep=';', na.strings=c("?"), header=TRUE)

#format the dates, you can manipulate them a little better

library(lubridate)
HPC$Date<-dmy(as.character(HPC$Date))
HPC$Time<-hms(as.character(HPC$Time))

#subset, based on dates
new_data <- HPC[HPC$Date == as.POSIXct("2007-02-01", tz="UTC") | HPC$Date == as.POSIXct("2007-02-02", tz="UTC"), ]


## now make plot 2

png(filename="plot2.png", width=480, height=480)

plot(new_data$Global_active_power, type='l', xlab = '', xaxt='n', ylab="Global Active Power (Kilowatts)")
axis(1, at=c(1, nrow(new_data)/2, nrow(new_data)), labels=c("Thu", "Fri", "Sat"))

dev.off()
