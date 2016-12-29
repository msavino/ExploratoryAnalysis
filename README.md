# ExploratoryAnalysis
This is my repository for the Coursera's course "Exploratory Data Analysis". Currently there are 8 files for the Course Project 1: 4 png pictures and 4 scripts to generate each.
Where do the data come from? 
----------------------------
Download the data from here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip;
Extract the data in any working directory (WD) 
the unzip file name is by default household_power_consumption.txt (file) 

Download and Run R Scripts
---------------------------
Download the scripts (plot1.R, plot2.R, plot3.R, plot4.R) to some directory;
Run the scripts so that 4 functions were created.
every function uses the "d" dataframe to load all data and the "TwoDays" to load only the data of the 1st and 2nd of February

Call the 4 functions
---------------------
call the functions by using your working directroy (WD) and your file name (file).
See example
createPlot1 ("/Users/tzhsami6/Downloads", "household_power_consumption.txt")
createPlot2 ("/Users/tzhsami6/Downloads", "household_power_consumption.txt")
createPlot3 ("/Users/tzhsami6/Downloads", "household_power_consumption.txt")
createPlot4 ("/Users/tzhsami6/Downloads", "household_power_consumption.txt")


P.S: I used german date format:  DO instead of THU in the plot. it's the german initial of Thursday
