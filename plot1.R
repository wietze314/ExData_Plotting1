#Load the data (in work directory)
dat <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";"
                  ,colClasses=c("character", "character", rep("numeric",7))
                  ,na.strings="?"
)

fil <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
fil$DT <- as.POSIXct(paste(fil$Date,fil$Time),format="%d/%m/%Y %T", tz="UTC")
rm(dat)

#make plot 1 (in work directory)

png("plot1.png")
hist(fil$Global_active_power
     , col=2
     , main="Global Active Power"
     , xlab= "Global Active Power (kilowatts)")
dev.off()
