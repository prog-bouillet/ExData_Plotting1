
lines <- grep("^[12]{1}/2/2007",readLines("household_power_consumption.txt"),fixed=FALSE)

dat <- read.table("household_power_consumption.txt", header=FALSE, sep=";", na = "?", nrows=length(lines), skip=lines[1]-1)
a<-strsplit(readLines("household_power_consumption.txt",1),";")
names(dat) <- a[[1]]


png(filename = "plot4.png", width = 480, height = 480)

xtime<-strptime(paste(as.character(dat$Date),dat$Time),format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(xtime,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(xtime,dat$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(xtime,dat$Sub_metering_1,xlab="",ylab="Energy Sub Metering",type="n")
lines(xtime,dat$Sub_metering_1,type="l",col="black")
lines(xtime,dat$Sub_metering_2,type="l",col="red")
lines(xtime,dat$Sub_metering_3,type="l",col="blue")
legend("topright",legend=names(dat)[7:9], lty=1, col=c("black","red","blue"))

plot(xtime,dat$Global_reactive_power, type="l",xlab="datetime",ylab="Global Reactive Power")

dev.off()