## Open data file stored locally
zipfile <- "exdata_data_household_power_consumption.zip"
dfile <- "household_power_consumption.txt"

# read data
elecData <- read.table(unz(zipfile,dfile),header=T, sep=";", na.strings = "?", as.is = TRUE)                  
elecData <- subset(elecData, elecData$Date == "1/2/2007" | elecData$Date == "2/2/2007")

#Change Data format for plotting
dtime <- paste(elecData$Date, elecData$Time, sep = " ")
Sys.setlocale(category = "LC_ALL", locale = "us") # set to US instead of local (French)
dtime <- strptime(dtime, format="%d/%m/%Y %H:%M:%S")

#CREATE PNG FILE
png("plot3.png", width=480, height=480)

## DRAW THE PLOT
plot(dtime, elecData$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(dtime, elecData$Sub_metering_2, type="l", col="red")
lines(dtime, elecData$Sub_metering_3, type="l", col="blue")

#add legend
legend("topright", legend = leg_txt, col = c("black","red", "blue"), lty=c(1,1,1))

#close the PNG file
dev.off()