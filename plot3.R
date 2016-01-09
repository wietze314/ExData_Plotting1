#Load the data (in work directory)
dat <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";"
                  ,colClasses=c("character", "character", rep("numeric",7))
                  ,na.strings="?"
)

fil <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
fil$DT <- as.POSIXct(paste(fil$Date,fil$Time),format="%d/%m/%Y %T", tz="UTC")
rm(dat)


#make plot 3 (in work directory)

png("plot3.png")

plot(fil$DT,fil$Sub_metering_1
     , col=1 , type="l", main="", ylab= "Energy sub metering", xlab=NA)
lines(fil$DT, fil$Sub_metering_2, col=2)
lines(fil$DT, fil$Sub_metering_3, col=4)
legend("topright", legend=names(fil)[7:9], col = c(1,2,4), lty=c(1,1,1))

dev.off()
