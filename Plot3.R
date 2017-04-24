librarty(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.Balt<-subset(NEI, fips == "24510")
data<-aggregate(Emissions ~ year + type, NEI.Balt, sum)

png("plot3.png", width=480, height = 480)
g<-ggplot(data, aes(year, Emissions,color=type))
g +geom_line()+
    xlab("Year")+
    ylab("Total Emission")+
    ggtitle("Total Emissions per type in Baltimore")
          
dev.off()