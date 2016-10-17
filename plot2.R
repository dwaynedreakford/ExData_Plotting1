
makePlot2 <- function() {
    
    # Read the dataset
    powerData <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = "character")
    
    # Filter the observations for the dates "2007-02-01" and "2007-02-02"
    powerData["DateTime"] <- strptime(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S")
    powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
    powerData <- subset(powerData, powerData$Date==as.Date("2007-02-01") | powerData$Date==as.Date("2007-02-02"))
    
    # Convert the numeric variables
    powerData$Global_active_power <- as.numeric(powerData$Global_active_power)
    powerData$Global_reactive_power <- as.numeric(powerData$Global_reactive_power)
    powerData$Voltage <- as.numeric(powerData$Voltage)
    powerData$Global_intensity <- as.numeric(powerData$Global_intensity)
    powerData$Sub_metering_1 <- as.numeric(powerData$Sub_metering_1)
    powerData$Sub_metering_2 <- as.numeric(powerData$Sub_metering_2)
    powerData$Sub_metering_3 <- as.numeric(powerData$Sub_metering_3)
    
    # Create a date-time (POSIXlt) vector from the Date and Time variables
    dateTime <- strptime(paste(as.character.Date(powerData$Date), powerData$Time), format="%Y-%m-%d %H:%M:%S")
    
    # Create the plot
    png(filename = "plot2.png")
    plot(dateTime, powerData$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
    dev.off()
}
