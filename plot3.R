##Read the data into R
data<-read.csv("household_power_consumption.txt",colClasses = c("character", "character", rep("numeric",7)), sep=";",na.strings="?")
##Subset the Data under the instructions
dataTest<-subset(data, as.Date(Date,"%d/%m/%Y")=="2007-02-01" | as.Date(Date,"%d/%m/%Y")=="2007-02-02")
##Create a new column with Date and Time
dataTest$dateTime<-as.POSIXct(paste(dataTest$Date,dataTest$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
##Set language
Sys.setlocale("LC_TIME", "English")
##Select the dimensions of the plot
par(mar=c(4,4,1,1))
##Draw the plot and set the properties of the PNG file
png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
with(dataTest,plot(dateTime,Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering",col="black"))
with(subset(dataTest),points(dateTime,Sub_metering_2,type="l",col="red"))
with(subset(dataTest),points(dateTime,Sub_metering_3,type="l",col="blue")) 
legend("topright",cex=.95,col=c("black","red","blue"),legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),lwd="1")
dev.off()
