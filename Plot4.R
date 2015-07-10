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
png("plot4.png", width=480, height=480)

#DEFINE THE 2x2 PLOTTING REGION
op <- par(mfcol=c(2,2), cex=0.8) # 2 x 2 pictures on one plot

# DRAW THE PLOT 1/4 (SAME AS PLOT2 OF ASSIGNMENT)
plot(dtime, elecData$Global_active_power, type="l",xlab="", ylab="Global Active Power")

## DRAW THE PLOT 2/4 (SAME AS PLOT3 OF ASSIGNMENT)
plot(dtime, elecData$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(dtime, elecData$Sub_metering_2, type="l", col="red")
lines(dtime, elecData$Sub_metering_3, type="l", col="blue")

#add legend
legend("topright", legend = leg_txt, bty="n", col = c("black","red", "blue"), lty=c(1,1,1))

## DRAW THE PLOT 3/4
plot(dtime, elecData$Voltage, type="l", col="black",xlab="datetime", ylab="Voltage")

## DRAW THE PLOT 4/4
plot(dtime, elecData$Global_reactive_power, type="l", col="black",xlab="datetime", ylab="Global_reactive_power")

#close the PNG file
dev.off()

# At end of plotting, reset PAR to previous settings
par(op)