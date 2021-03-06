allData = read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
febData = allData[allData$Date=='1/2/2007' | allData$Date=='2/2/2007',]
datetime = strptime(paste(febData[,1],  febData[,2]), '%d/%m/%Y %H:%M:%S')
plotData  = cbind(datetime, febData[,3:9])
png(file = 'Plot3.png', width = 480, height = 480)
plot(plotData$datetime, plotData[,6], type = 'l', col = 'black', ylab = 'Energy sub metering', xlab = '')
points(plotData$datetime, plotData[,7], type = 'l', col = 'red')
points(plotData$datetime, plotData[,8], type = 'l', col = 'blue')
legend('topright', col = c('black','red','blue'),  lty = 1, legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
