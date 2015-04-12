plot4 <- function() {
  ## Produce Plot 1 for Course Project1
  ## Assume file has been downloaded and unzipped
  
  ## Read from downloaded dataset
  myDat <- read.table("household_power_consumption.txt", sep = ";", 
                      header= TRUE, 
                      stringsAsFactors = FALSE, 
                      na.strings="?")
  ## Subset based on two days of interest
  FebDat <- myDat[myDat$Date=="1/2/2007" | myDat$Date=="2/2/2007",]
  
  ## Create a variable with both date and time
  n <- as.character(FebDat$Time)
  w <- FebDat$Date
  x <- paste(w, n)
  z <- strptime(x,format="%d/%m/%Y %H:%M:%S")
  
  FebDat$DateTime <- z
  
  ##Open graphical device
  png(filename = "plot4.png", 
      width = 480, 
      height = 480, 
      units = "px",
      pointsize = 12)
  ##Set par to create charts in 2 x 2 format
  par(mfrow = c(2,2))
  
  ##Plot 1
  plot(FebDat$DateTime,FebDat$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  ##Plot 2
  plot(FebDat$DateTime, FebDat$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##Plot 3: Produce multi-line plot
  plot(FebDat$DateTime,FebDat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(FebDat$DateTime,FebDat$Sub_metering_2, col="Red")
  lines(FebDat$DateTime,FebDat$Sub_metering_3, col="Blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = 1, col = c("black", "red", "blue"), cex = .95, bty="n")
  
  ##Plot 4
  plot(FebDat$DateTime, FebDat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  ##Close graphical device
  dev.off()
}