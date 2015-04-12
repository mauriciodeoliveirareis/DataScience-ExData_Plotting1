csvClasses <- c("character","character", "character", "character", "character", "character", "character", "character", "character")
table = read.csv(file="household_power_consumption.txt", sep=";", dec=".", colClasses=csvClasses)
table$Date <- as.Date(table$Date, "%d/%m/%Y")
shortTable <- table[table$Date>="2007-02-01" & table$Date<="2007-02-02",]

shortTable$Global_active_power <- as.double(shortTable$Global_active_power)

shortTable$Voltage <- as.double(shortTable$Voltage)

shortTable$Sub_metering_1 <- as.double(shortTable$Sub_metering_1)
shortTable$Sub_metering_2 <- as.double(shortTable$Sub_metering_2)
shortTable$Sub_metering_3 <- as.double(shortTable$Sub_metering_3)

shortTable$Global_reactive_power <- as.double(shortTable$Global_reactive_power)

strDateTime <- paste(shortTable$Date, shortTable$Time, sep = " ")
dateTime <- strptime(strDateTime, format="%Y-%m-%d %H:%M:%S")
png(file="plot4.png", width = 400, height = 400)
par(mfrow = c(2,2))
plot(y = shortTable$Global_active_power, dateTime, type="l", ylab = "Global Active Power", xlab = "")

plot(y = shortTable$Voltage, dateTime, type="l", ylab = "Voltage", xlab = "datetime")

plot(y = shortTable$Sub_metering_1, dateTime, type="l", ylab = "Energy sub metering", xlab = "", col="black")
lines(y = shortTable$Sub_metering_2, dateTime, type="l", col="red")
lines(y = shortTable$Sub_metering_3, dateTime, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, cex=0.5)

plot(y = shortTable$Global_reactive_power, dateTime, type="l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
