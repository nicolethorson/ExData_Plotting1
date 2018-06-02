data<- read.table("/users/nicolemurphy012/desktop/coursera/exploratory/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

datasubset<- rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])

datasubset$Date <- as.Date(datasubset$Date,"%d/%m/%Y")

datasubset<- cbind(datasubset,"DateTime"=as.POSIXct(paste(datasubset$Date,datasubset$Time)))

png("plot3.png",width=480,height=480)

with(datasubset, { plot(Sub_metering_1 ~ DateTime, type="l", xlab="", ylab="Energy sub metering")})
lines(datasubset$Sub_metering_2 ~ datasubset$DateTime,col="Red")
lines(datasubset$Sub_metering_3 ~ datasubset$DateTime, col="Blue")
legend("topright", lty=1, lwd=3, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
