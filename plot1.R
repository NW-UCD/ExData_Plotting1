## create object with file name
power.file <- "household_power_consumption.txt"

## read file into R, only reading first 100000 rows as the necessary dates are within those rows
power <- read.csv(power.file, header = TRUE, sep = ";", na.strings = "?", nrows = 100000)

## subset to the two days of interest. 1st and 2nd Feb 2007
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")


# plot 1 histogram to png

png("plot1.png", width = 480, height = 480)

hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

dev.off()