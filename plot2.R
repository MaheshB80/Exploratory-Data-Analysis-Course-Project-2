#Read data

NEI <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Mahesh/Desktop/R Programming/exdata_data_NEI_data/Source_Classification_Code.rds")


library("dplyr")



tot.emissions <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarise(Tot_Emission_Baltimore=sum(Emissions), .groups='drop')


#plotting
png("plot2.png", width = 480, height = 480)
with(tot.emissions, plot(x=year, y=Tot_Emission_Baltimore, pch=16, xlab = "Year", main = "Baltimore City pm25 Emission by year", ylab = "Total pm25 Emission", col="red" ))
dev.off()