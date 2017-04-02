### Generating Plot 4
# gestio ndes dates

data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# subset für den 1. und 2. Februar 2007

data2 <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")

# 

data2$timestamp <- paste(data2$Date, data2$Time)
data2$timestamp <- strptime(data2$timestamp, "%d/%m/%Y %H:%M:%OS")

data2$timestamp <- as.POSIXlt(data2$timestamp)
data2$weekday <- weekdays(data2$timestamp)

# as.numeric...

data3 <- data2

data3$Global_active_power <- as.numeric(data3$Global_active_power)
data3$Sub_metering_1 <- as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2 <- as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3 <- as.numeric(data3$Sub_metering_3)
data3$Voltage <- as.numeric(data3$Voltage)
data3$Global_reactive_power <- as.numeric(data3$Global_reactive_power)

## plot 4

png(filename = "plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))

plot(data3$timestamp, data3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data3$timestamp, data3$Voltage, type = "l", xlab = "daytime", ylab = "Voltage")

plot(data3$timestamp, data3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data3$timestamp, data3$Sub_metering_2, type = "l", col = "red")
lines(data3$timestamp, data3$Sub_metering_3, type = "l", col = "blue")
legend("topright", fill = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data3$timestamp, data3$Global_reactive_power, type = "l", xlab = "daytime", ylab = "Global_reactive_power")

dev.off()
