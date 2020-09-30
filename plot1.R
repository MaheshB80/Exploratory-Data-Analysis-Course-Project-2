#Read data

NEI <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/Source_Classification_Code.rds")

library("dplyr")

#Susetting
tot.emissions <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)
colnames(tot.emissions)[2] <- "total_emissions"

#Ploting
png("plot1.png", width = 480, height = 480)
with(tot.emissions, plot(year, total_emissions, xlab = "Year", ylab = "Total Emission (tons)", main = " Total Emission PM25 by yeay in the US", pch=16, col="blue"))
dev.off()
