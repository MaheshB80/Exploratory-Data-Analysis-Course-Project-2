#Read data

NEI <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/Source_Classification_Code.rds")


library("dplyr")
library("ggplot2")


SCC_coal_comb <- SCC[grep("Coal", SCC$EI.Sector, ignore.case = TRUE),]
NEI_coal_comb <- subset(NEI, NEI$SCC %in% SCC_coal_comb$SCC)  

NEI_SCC <- merge(x=NEI_coal_comb, y=SCC, by.x = "SCC", by.y = "SCC")
NEI_SCC_TOT <- aggregate(NEI_SCC$Emissions, by=list(year=NEI_SCC$year), FUN=sum)


#plotting
png("plot4.png", width = 480, height = 480)
NEI_SCC_TOT_PLOT <- ggplot(data=NEI_SCC_TOT, aes(year, x))
NEI_SCC_TOT_PLOT <- NEI_SCC_TOT_PLOT + geom_point(color = "red", size=3) + xlab("Year") + ylab("Total Emissions (tons)") + ggtitle("Total Coal Combustion Emissions in the US by Year")
NEI_SCC_TOT_PLOT
dev.off()
                     
                     