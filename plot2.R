data<- read.table("/users/nicolemurphy012/desktop/coursera/exploratory/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

datasubset<- rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])

datasubset$Date <- as.Date(datasubset$Date,"%d/%m/%Y")

datasubset<- cbind(datasubset,"DateTime"=as.POSIXct(paste(datasubset$Date,datasubset$Time)))

png("plot2.png",width=480,height=480)

plot(datasubset$Global_active_power ~ datasubset$DateTime, type="l", xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
