#plot 1 code

#read in the data

HPC<-read.table('household_power_consumption.txt', sep=';', na.strings=c("?"), header=TRUE)

#format the dates, you can manipulate them a little better

library(lubridate)
HPC$Date<-dmy(as.character(HPC$Date))
HPC$Time<-hms(as.character(HPC$Time))

#subset, based on dates
new_data <- HPC[HPC$Date == as.POSIXct("2007-02-01", tz="UTC") | HPC$Date == as.POSIXct("2007-02-02", tz="UTC"), ]

# now make the plot
png(filename="plot1.png", width=480, height=480)
hist(new_data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
