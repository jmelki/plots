library(dplyr)
powerConsume <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
power <- tbl_df(powerConsume)
power_dates <- filter(power, Date == "2/2/2007" | Date == "1/2/2007")
png(file="plot4.png", width = 480, height = 480)
par(mfcol= c(2,2))
plot(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n")
lines(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Global_active_power)

plot(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Sub_metering_1, ylab="Energy Sub metering", xlab="", type="n")
lines(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Sub_metering_1)
lines(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Sub_metering_2, col="red")
lines(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Sub_metering_3, col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

plot(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Voltage, ylab="Voltage", xlab="datetime", type="n")
lines(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Voltage)

plot(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Global_reactive_power, ylab="Global reactive power", xlab="datetime", type="n")
lines(strptime(paste(power_dates$Date, power_dates$Time), "%d/%m/%Y %H:%M:%S"), power_dates$Global_reactive_power)

dev.off()
