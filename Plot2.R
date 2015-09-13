allData = read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
febData = allData[allData$Date=='1/2/2007' | allData$Date=='2/2/2007',]
datetime = strptime(paste(febData[,1],  febData[,2]), '%d/%m/%Y %H:%M:%S')
plotData  = cbind(datetime, febData[,3:9])
png(file = 'Plot2.png', width = 480, height = 480)
plot(plotData$datetime, plotData$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()
