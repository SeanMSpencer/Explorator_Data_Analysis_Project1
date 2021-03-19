#read the data in
data <- read.table("Data/household_power_consumption.txt", sep = ";", header = TRUE)

#subset for the date range we want
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#make the date time columns into date time formats

date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)


#plotting

png("plot2.png", width = 480, height = 480)
plot(date_time, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
