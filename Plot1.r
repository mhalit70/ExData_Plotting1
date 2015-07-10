## Open data file stored locally
zipfile <- "exdata_data_household_power_consumption.zip"
dfile <- "household_power_consumption.txt"

# read data
elecData <- read.table(unz(zipfile,dfile),header=T, sep=";", na.strings = "?", as.is = TRUE)                  
elecData <- subset(elecData, elecData$Date == "1/2/2007" | elecData$Date == "2/2/2007")

#CREATE PNG FILE
png("plot1.png", width=480, height=480)

#Draw the Plot
hist(elecData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close the PNG file
dev.off()