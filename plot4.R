## create object with file name
power.file <- "household_power_consumption.txt"

## read file into R, only reading first 100000 rows as the necessary dates are within those rows
power <- read.csv(power.file, header = TRUE, sep = ";", na.strings = "?", nrows = 100000)

## subset to the two days of interest. 1st and 2nd Feb 2007
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## create new column containing both date and time and convert to Time class
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")


png("plot4.png", height = 480, width = 480)

par(mfrow = c(2,2))

##1st plot
plot(y = power$Global_active_power, x = power$DateTime, type = "l", ylab = "Global Active Power", xlab = "")

#### 2nd plot
plot(x = power$DateTime, y = power$Voltage, ylab = "Voltage", xlab = "datetime", type = "l", lwd = 0.2)

###3rd plot

plot(type = "l", x = power$DateTime, y = power$Sub_metering_1, ylab = "Energy sub metering", xlab = "")
lines(x = power$DateTime, y = power$Sub_metering_2, col = "red")
lines(x = power$DateTime, y = power$Sub_metering_3, col = "blue")
legend(legend = colnames(power[7:9]), "topright", col = c("black", "red", "blue"), lty = 1)


## 4th plot
plot(x = power$DateTime, y = power$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l", lwd = 0.2)


dev.off()