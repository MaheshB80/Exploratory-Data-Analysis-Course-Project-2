#Read data

NEI <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/Source_Classification_Code.rds")


library("dplyr")
library("ggplot2")


SCC_vehicle <- SCC[grep("Veh", SCC$Short.Name, ignore.case = TRUE),]
NEI_vehicle <- subset(NEI, NEI$SCC %in% SCC_vehicle$SCC)
NEI_Vehicle_BL_LA <- filter(NEI_vehicle, fips %in% c("24510", "06037")) %>% group_by(year, fips) %>% summarise(Total_Emissions = sum(Emissions), .groups='drop')

NEI_Vehicle_BL_LA$fips[NEI_Vehicle_BL_LA$fips=="24510"] <- "Baltimore City"
NEI_Vehicle_BL_LA$fips[NEI_Vehicle_BL_LA$fips=="06037"] <- "Los Angeles County"
colnames(NEI_Vehicle_BL_LA) <- c("Year","City","TTL_Emissions")


#plotting
png("plot6.png", width = 480, height = 480)
g <- ggplot(NEI_Vehicle_BL_LA, aes(Year, TTL_Emissions, col = City))+ geom_point(size=3) + xlab("Year") + ylab("Total Emissions (tons)") + ggtitle("Total Vehicle Emissions Comparison Baltimore & LA by year")
g
dev.off()



