NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.Balt<-subset(NEI, fips == "24510")
Pollutant.Year<-tapply(NEI.Balt$Emissions, NEI.Balt$year,sum)

png("plot2.png", width=480, height = 480)
barplot(Pollutant.Year, xlab = "Year", ylab = "Total Emission (ton)", main = "Total Emission per year in Baltimore City")
dev.off()