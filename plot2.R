x<-read.table("household_power_consumption.txt",sep=";",
              colClasses="character")

##setting the column names of the data frame using the values of it's first
##row
names(x)<-x[1,]

##deleting the first row as it contains the column names
x<-x[-1,]

##subsetting the data frame based on the given requirement
y<-x[x$Date=='1/2/2007'|x$Date=='2/2/2007',]
y[["Global_active_power"]]<-as.numeric(y[["Global_active_power"]])

##creating a new column "Date_time" containing values from the "Date" and
##"Time" columns and converting the column to datetime format
y["Date_time"]<-NA
y$Date_time<-as.POSIXct(paste(y$Date, y$Time), format="%d/%m/%Y %H:%M:%S")

##creating a png of the required plot
png("plot2.png",width=480,height=480)
plot(y$Date_time,y$Global_active_power,type="l",xlab="",
     ylab="Global Active Power(kilowatts)")
dev.off()