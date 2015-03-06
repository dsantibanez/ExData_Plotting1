##Read the data into R
data<-read.csv("household_power_consumption.txt",colClasses = c("character", "character", rep("numeric",7)), sep=";",na.strings="?")
##Subset the Data under the instructions
dataTest<-subset(data, as.Date(Date,"%d/%m/%Y")=="2007-02-01" | as.Date(Date,"%d/%m/%Y")=="2007-02-02")
##Create a new column with Date and Time
dataTest$dateTime<-as.POSIXct(paste(dataTest$Date,dataTest$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
##Select the dimensions of the plot
par(mar=c(4,4,1,1))
##Set language
Sys.setlocale("LC_TIME", "English")
##Draw the plot
plot(dataTest$dateTime,dataTest$Global_active_power,xlab="",cex.axis =.78,cex.lab =.75, ylab="Global Active Power (kilowatts)", main=NULL,type="l")
##Copy the plot into a PNG file with custom properties
dev.copy(png, file = "plot2.png",width=480, height=480,bg = "transparent")
dev.off()