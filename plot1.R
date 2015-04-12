csvClasses <- c("character","character", "character", "character", "character", "character", "character", "character", "character")
table = read.csv(file="household_power_consumption.txt", sep=";", dec=".", colClasses=csvClasses)
table$Date <- as.Date(table$Date, "%d/%m/%Y")
shortTable <- table[table$Date>="2007-02-01" & table$Date<="2007-02-02",]
png(file="plot1.png", width = 400, height = 400)
hist(as.double(shortTable$Global_active_power), ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red", main="Global Active Power")
#dev.copy(png, "plot1.png")
dev.off()
