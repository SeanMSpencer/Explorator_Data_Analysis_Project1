
#read the data in
data <- read.table("Data/household_power_consumption.txt", sep = ";", header = TRUE)

#subset for the date range we want
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

#plot 

png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()