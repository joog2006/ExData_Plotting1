plot3 <- function() {
  ## Produce Plot 1 for Course Project1
  ## Assume file has been downloaded
  
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
  png(filename = "plot3.png", 
      width = 480, 
      height = 480, 
      units = "px",
      pointsize = 12)
  
  ##Produce multi-line plot
  plot(FebDat$DateTime,FebDat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(FebDat$DateTime,FebDat$Sub_metering_2, col="Red")
  lines(FebDat$DateTime,FebDat$Sub_metering_3, col="Blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                 lty = 1, col = c("black", "red", "blue"), cex = 1)
  ##Close graphical device
  dev.off()
}