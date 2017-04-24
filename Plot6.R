NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.Balt<-subset(NEI, fips == "24510")
NEI.LAX<-subset(NEI, fips == "06037")

Vehiclelist<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
Vehicleset<-SCC[Vehiclelist,]

NEISCC.Balt<-merge(NEI.Balt,Vehicleset, by="SCC")
NEISCC.Balt$City<-"Balitmore"
NEISCC.LAX<-merge(NEI.LAX,Vehicleset, by="SCC")
NEISCC.LAX$City<-"Loa Angeles"
NEISCC<-rbind(NEISCC.Balt,NEISCC.LAX)

data <- aggregate(Emissions ~ year + city, NEISCC, sum)

png("plot6.png", width=480, height = 480)
g <- ggplot(data, aes(year, Emissions, color = city))
g + geom_line() +
    xlab("Year") +
    ylab(expression("Total PM"[2.5]*" Emissions")) +
    ggtitle("Total Emissions from motor sources in Baltimore and Los Angeles")
dev.off()