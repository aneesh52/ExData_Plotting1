x<-read.table("household_power_consumption.txt",sep=";",
              colClasses="character")

##setting the column names of the data frame using the values of it's first
##row
names(x)<-x[1,]

##deleting the first row as it contains the column names
x<-x[-1,]

##subsetting the data frame based on the given requirement
y<-x[x$Date=='1/2/2007'|x$Date=='2/2/2007',]
y[[3]]<-as.numeric(y[[3]])

##creating a png of the required histogram
png("plot1.png",width=480,height=480)
hist(y$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
dev.off()