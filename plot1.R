##Read the data into R
data<-read.csv("household_power_consumption.txt",colClasses = c("character", "character", rep("numeric",7)), sep=";",na.strings="?")
##Subset the Data under the instructions
dataTest<-subset(data, as.Date(Date,"%d/%m/%Y")=="2007-02-01" | as.Date(Date,"%d/%m/%Y")=="2007-02-02")
##Create a new column with Date and Time
dataTest$dateTime<-as.POSIXct(paste(dataTest$Date,dataTest$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
##Select the dimensions of the plot
par(mar=c(4,4,2,1))
##Draw the plot
hist(dataTest$Global_active_power,cex.lab =.75,cex.axis =.78, col="red", xlab="Global Active Power (kilowatts)", main=NULL)
title("Global Active Power",cex.main=.9)
##Copy the plot into a PNG file with custom properties
dev.copy(png, file = "plot1.png",width=480, height=480,bg = "transparent")
dev.off()
