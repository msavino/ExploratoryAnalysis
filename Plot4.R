
createPlot4 <- function (WorkingDirectory, filename) { 
  # createPlot4 ("/Users/tzhsami6/Downloads", "household_power_consumption.txt")
  # Set the working directory in which you saved the files downloaded from 
  # https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  setwd(WorkingDirectory)
  # Load the data in to a dataframe d
  # the unzip file name is by default household_power_consumption.txt
  # a header exist and we don't want to aumtaically transform characters in factors 
  # during the load
  d = read.table(filename, sep=";", header=TRUE, stringsAsFactors=FALSE) 

  # we need a valid date format (date1) and date ranges (Feb1, Feb2)
  # to subset the data from february 1st. 2nd
  d$Date1 <- as.Date(d$Date, "%d/%m/%Y") #"%d/%m/%Y" 
  # date ranges
  Feb1 <- as.Date("2007-02-01")
  Feb2 <- as.Date("2007-02-02")
  twoDays <- subset (d,  Date1 >= Feb1 & Date1 <=Feb2 ) 
  
  # Plot4 numeric and date values needed
  twoDays$Date2 <- strptime (paste (twoDays$Date, twoDays$Time, sep=" ") , "%d/%m/%Y %H:%M:%S") 
  twoDays$Voltage_NUM <- as.numeric(twoDays$Voltage ) 
  twoDays$Sub_metering_1_NUM <- as.numeric(twoDays$Sub_metering_1)
  twoDays$Sub_metering_2_NUM <- as.numeric(twoDays$Sub_metering_2)
  twoDays$Sub_metering_3_NUM <- as.numeric(twoDays$Sub_metering_3) 
  twoDays$Global_reactive_power_NUM <- as.numeric(twoDays$Global_reactive_power ) 
  twoDays$Global_active_power_NUM <- as.numeric(twoDays$Global_active_power)
  
  # set parameter for the plot and for the dashboard 2x2 (mfrow)
  png(filename = "plot4.png",width = 480, height = 480, units = "px")
  par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 0, 0))

  # do the plot

  plot(twoDays$Date2, twoDays$Global_active_power_NUM, type="n", main="",xlab="", ylab = "Global Active Power")
  lines (twoDays$Date2, twoDays$Global_active_power_NUM, type="l"  )

  plot(twoDays$Date2, twoDays$Voltage_NUM, type="n", main="",xlab="datetime", ylab = "Voltage")
  lines (twoDays$Date2, twoDays$Voltage_NUM, type="l"  )

  plot(twoDays$Date2, twoDays$Sub_metering_1_NUM, type="n", main="",xlab="", ylab = "Energy sub metering")
  lines (twoDays$Date2, twoDays$Sub_metering_1_NUM, type="l"  )
  lines (twoDays$Date2, twoDays$Sub_metering_2_NUM, type="l", col="red"  )
  lines (twoDays$Date2, twoDays$Sub_metering_3_NUM, type="l", col="blue"  )
  legend ("topright", bty="n" ,  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))

  plot(twoDays$Date2, twoDays$Global_reactive_power, type="n", main="",xlab="datetime", ylab = "Global_reactive_power")
  lines (twoDays$Date2, twoDays$Global_reactive_power, type="l"  )
  dev.off()
 }