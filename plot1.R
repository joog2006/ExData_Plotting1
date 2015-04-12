plot1 <- function() {
  ## Produce Plot 1 for Course Project1
  ## Assume file has been downloaded

## Read from downloaded dataset
myDat <- read.table("household_power_consumption.txt", sep = ";", 
                                                    header= TRUE, 
                                                    stringsAsFactors = FALSE, 
                                                    na.strings="?")
## Subset based on two days of interest
FebDat <- myDat[myDat$Date=="1/2/2007" | myDat$Date=="2/2/2007",]


##Open graphical device
png(filename = "plot1.png", 
       width = 480, 
      height = 480, 
       units = "px",
      pointsize = 12)

##Produce histogram
hist(FebDat$Global_active_power, main = "Global Active Power", 
                                ylab = "Frequency", 
                                xlab = "Global Active Power (kilowatts)", 
                                col  ="Red")
##Close graphical device
dev.off()
}