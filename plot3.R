#Read data

NEI <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/Source_Classification_Code.rds")


library("dplyr")
library("ggplot2")

tot.emissions <- NEI %>% filter(fips == "24510") %>% group_by(type,year) %>% summarise(Tot_Emission_Baltimore=sum(Emissions), .groups='drop')


#plotting
png("plot3.png", width = 480, height = 480)
emi.type <- ggplot(data=tot.emissions, aes(year, Tot_Emission_Baltimore))
emi.type <- emi.type + geom_point(color = "red", size=3) + facet_grid(.~type) + xlab("Year") + ylab("Total Emissions") + ggtitle("Total Emissions in Baltimore by Year")
emi.type
dev.off()