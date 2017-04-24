
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.Balt<-subset(NEI, fips == "24510")

Vehiclelist<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
Vehicleset<-SCC[Vehiclelist,]

NEISCC<-merge(NEI.Balt,Vehicleset, by="SCC")
byyear<-tapply(NEISCC$Emissions,NEISCC$year,sum)

png("plot5.png", width=480, height = 480)
barplot(byyear, xlab = "Year", ylab = "Total Emission (ton)", main = "Total Emission from Vehicle in Baltimore")
dev.off()