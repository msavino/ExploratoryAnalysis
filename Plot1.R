
createPlot1 <- function (WorkingDirectory, filename) { 
# createPlot1 ("/Users/tzhsami6/Downloads", "household_power_consumption.txt")
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

# Let's subset the data in a new dataframe
twoDays <- subset (d,  Date1 >= Feb1 & Date1 <=Feb2 ) 
## The y variable of the grapgh is need as numeric 
twoDays$Global_active_power_NUM <- as.numeric(twoDays$Global_active_power)
# Let's do the plot
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(twoDays$Global_active_power_NUM, col="red", xlab = "Global Active Power (kilowatts)", main= "Global Active Power" )
dev.off()

  
   }