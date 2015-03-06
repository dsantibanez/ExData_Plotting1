data<-read.csv("household_power_consumption.txt",colClasses = c("character", "character", rep("numeric",7)), sep=";",na.strings="?")
dataTest<-subset(data, as.Date(Date,"%d/%m/%Y")=="2007-02-01" | as.Date(Date,"%d/%m/%Y")=="2007-02-02")
dataTest$dateTime<-as.POSIXct(paste(dataTest$Date,dataTest$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
par(mar=c(5,4,3,2))
par(mfrow=c(2,2))
##plot1
plot(dataTest$dateTime,dataTest$Global_active_power,xlab="",ylab="Global Active Power",cex.axis =.78,cex.lab =.655, main=NULL,type="l")
##plot2
plot(dataTest$dateTime,dataTest$Voltage,xlab="datetime", ylab="Voltage",cex.axis =.78,cex.lab =.655, main=NULL,type="l")
##plot3
with(dataTest,plot(dateTime,Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering",cex.axis =.78,cex.lab =.655,col="black"))
with(subset(dataTest),points(dateTime,Sub_metering_2,type="l",col="red"))
with(subset(dataTest),points(dateTime,Sub_metering_3,type="l",col="blue")) 
legend("topright",cex=.75,y.intersp=.6,bty = "n",col=c("black","red","blue"),legend=c("Sub_metering_1    ","Sub_metering_2    ","Sub_metering_3    "),lwd="1")
##plot4
plot(dataTest$dateTime,dataTest$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power",cex.axis =.78,cex.lab =.655, main=NULL,type="l")
dev.copy(png, file = "plot4.png",width=480, height=480,bg = "transparent")
dev.off()