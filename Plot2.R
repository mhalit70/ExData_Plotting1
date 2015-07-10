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
png("plot2.png", width=480, height=480)

#create the Plot
plot(dtime, elecData$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")

#close the PNG file
dev.off()