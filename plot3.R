x<-read.table("household_power_consumption.txt",sep=";",
              colClasses="character")

##setting the column names of the data frame using the values of it's first
##row
names(x)<-x[1,]

##deleting the first row as it contains the column names
x<-x[-1,]

##subsetting the data frame based on the given requirement
y<-x[x$Date=='1/2/2007'|x$Date=='2/2/2007',]
y[,"Global_active_power"]<-as.numeric(y[,"Global_active_power"])
y[,"Sub_metering_1"]<-as.numeric(y[,"Sub_metering_1"])
y[,"Sub_metering_2"]<-as.numeric(y[,"Sub_metering_2"])
y[,"Sub_metering_3"]<-as.numeric(y[,"Sub_metering_3"])

##creating a new column "Date_time" containing values from the "Date" and
##"Time" columns and converting the column to datetime format
y["Date_time"]<-NA
y$Date_time<-as.POSIXct(paste(y$Date, y$Time), format="%d/%m/%Y %H:%M:%S")

##creating a png of the required plot
png("plot3.png",width=480,height=480)
plot(y$Date_time,y$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(y$Date_time,y$Sub_metering_2,type="l",col="red")
points(y$Date_time,y$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()