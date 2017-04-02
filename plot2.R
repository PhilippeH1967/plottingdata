# Reading, naming and subsetting power consumption data
pdata1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# change date 1. et 2. Februar 2007

data2 <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")

# Ddate gestion

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

## plot 2

png(filename = "plot2.png", height = 480, width = 480)
plot(data3$timestamp, data3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
