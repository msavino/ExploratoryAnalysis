createPlot2 <- function (WorkingDirectory, filename) { 
  # createPlot2 ("/Users/tzhsami6/Downloads", "household_power_consumption.txt")
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
  
  #Plot2
  ## transform a value into numeric 
  twoDays$Global_active_power_NUM <- as.numeric(twoDays$Global_active_power)
  
  # We need a second date concatenating date and time  
  twoDays$Date2 <- strptime (paste (twoDays$Date, twoDays$Time, sep=" ") , "%d/%m/%Y %H:%M:%S") 
  
  png(filename = "plot2.png",width = 480, height = 480, units = "px")
  plot(twoDays$Date2, twoDays$Global_active_power_NUM, type="n", main="",xlab="", ylab = "Global Active Power (kilowatts)")
  lines (twoDays$Date2, twoDays$Global_active_power_NUM, type="l"  )
  dev.off()
   }