csvClasses <- c("character","character", "character", "character", "character", "character", "character", "character", "character")
table = read.csv(file="household_power_consumption.txt", sep=";", dec=".", colClasses=csvClasses)
table$Date <- as.Date(table$Date, "%d/%m/%Y")
shortTable <- table[table$Date>="2007-02-01" & table$Date<="2007-02-02",]

actPow <- as.double(shortTable$Global_active_power)
strDateTime <- paste(shortTable$Date, shortTable$Time, sep = " ")
dateTime <- strptime(strDateTime, format="%Y-%m-%d %H:%M:%S")
png(file="plot2.png", width = 400, height = 400)
plot(y = actPow, dateTime, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
#dev.copy(png, "plot2.png")
dev.off()
