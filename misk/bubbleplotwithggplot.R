crime <-read.csv("http://datasets.flowingdata.com/crimeRatesByState2005.tsv", header=TRUE, sep="\t")
ggplot(crime, aes(x=murder, y=burglary, size=population, label=state),guide=FALSE)+
  geom_point(colour="white", fill="red", shape=21)+ scale_size_area(max_size = 15)+
  scale_x_continuous(name="Murders per 1,000 population", limits=c(0,12))+
  scale_y_continuous(name="Burglaries per 1,000 population", limits=c(0,1250))+
  geom_text(size=4)+theme_bw()
