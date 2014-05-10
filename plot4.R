# Peer Assignment #1

setwd("C:\\Users\\HFDSS103\\Documents\\Coursera\\Data Science Certification\\Exploratory.Data.Analysis\\PeerAssign1")

# Get Data
colClasses<-c("character","character",rep("numeric",7))
df1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=colClasses,na.strings="?")

# Create Date Time Variable
df1$Day.Time<-paste(df1$Date,df1$Time) 

# Subset Data by Dates
df1<-transform(df1,Date=as.Date(df1$Date,"%d/%m/%Y"))
df1<-subset(df1,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Format Day.Time and Sort Data Frame
df1<-transform(df1,Day.Time=strptime(df1$Day.Time,"%d/%m/%Y %H:%M:%S"))
df1<-df1[order(df1$Day.Time), ]

# Plot 4



png("plot4.png",width=480,height=480)

        par(mfcol=c(2,2))

        with(df1,plot(Day.Time,Global_active_power,type="l",
                      ylab="Global Active Power (kilowatts)",
                      xlab="")
        )
        
        with(df1,plot(Day.Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
        lines(df1$Day.Time, y=df1$Sub_metering_2,type="l",col="red")
        lines(df1$Day.Time, y=df1$Sub_metering_3,type="l",col="blue")
        legend("topright",lty=1,col=c("black","blue","red"),bty="n",
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        )
        
        with(df1,plot(Day.Time,Voltage,type="l",xlab="datetime"))
        
        with(df1,plot(Day.Time,Global_reactive_power,type="l",xlab="datetime"))

dev.off()

par(mfrow=c(1,1))



