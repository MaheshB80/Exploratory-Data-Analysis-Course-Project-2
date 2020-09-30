#Read data

NEI <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/Source_Classification_Code.rds")


library("dplyr")
library("ggplot2")


SCC_vehicle <- SCC[grep("Veh", SCC$Short.Name, ignore.case = TRUE),]
NEI_vehicle <- subset(NEI, NEI$SCC %in% SCC_vehicle$SCC)
NEI_vehicle <- filter(NEI_vehicle, fips=="24510")

NEI_SCC_vehicle <- merge(x=NEI_vehicle, y=SCC_vehicle, by.x = "SCC", by.y = "SCC")
NEI_SCC_BAL_vehicle <- aggregate(NEI_SCC_vehicle$Emissions, by=list(year=NEI_SCC_vehicle$year), FUN=sum)

#plotting
png("plot5.png", width = 480, height = 480)
NEI_SCC_BAL_vehicle_plot <- ggplot(NEI_SCC_BAL_vehicle, aes(year, x))
NEI_SCC_BAL_vehicle_plot <- NEI_SCC_BAL_vehicle_plot + geom_point(color="red", size=3) + xlab("Year") + ylab("Total Emissions (tons)") + ggtitle("Total Vehicle Emissions in Baltomore city by year")
NEI_SCC_BAL_vehicle_plot
dev.off()
