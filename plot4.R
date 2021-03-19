#read the data in
data <- read.table("Data/household_power_consumption.txt", sep = ";", header = TRUE)

#subset for the date range we want
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#make the date time columns into date time formats

date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)
subset_data$Voltage <- as.numeric(subset_data$Voltage)
subset_data$Global_reactive_power <- as.numeric(subset_data$Global_reactive_power)

#plot
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(date_time, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(date_time, subset_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(date_time, subset_data$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = " ")
lines(date_time, subset_data$Sub_metering_2, type = "l", col = "red")
lines(date_time, subset_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

plot(date_time, subset_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()