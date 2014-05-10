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

# Plot 2

png("plot2.png",width=480,height=480)

        with(df1,plot(Day.Time,Global_active_power,type="l",
                      ylab="Global Active Power (kilowatts)",
                      xlab="")
        )

dev.off()

