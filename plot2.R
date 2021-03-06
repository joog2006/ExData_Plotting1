plot2 <- function() {
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
  png(filename = "plot2.png", 
      width = 480, 
      height = 480, 
      units = "px",
      pointsize = 12)
  
  ##Produce  plot
  plot(FebDat$DateTime,FebDat$Global_active_power, type="l", xlab="", ylab="Global active power (kilowatts)")

  ##Close graphical device  
  dev.off()
}