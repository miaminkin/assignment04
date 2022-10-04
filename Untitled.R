#Loading packages
library(tidyverse)
library(gridExtra)

#Loading data
ANES_2020<-read_csv("2020_ANES.csv")

#Feeling thermometer of Democrats
democrats_ANES_2020<-filter(ANES_2020,V201018==1)
democrats_ANES_2020<-filter(democrats_ANES_2020,V201156>0&V201156<998)

#Feeling thermometer of Republicans
republicans_ANES_2020<-filter(ANES_2020,V201018==2)
republicans_ANES_2020<-filter(republicans_ANES_2020,V201157>0&V201157<998)



#Visualization 1: Democrat feelings towards Democrats
feeling_thermometer_democrats<-
  ggplot(data=democrats_ANES_2020,
         aes(x=V201018,y=V201156))+
  geom_point(color="blue")+
  scale_x_continuous(breaks=seq(1,1,by=1),
                     labels=c("1"="Democrat"))+
  scale_y_continuous(breaks=seq(0,100,by=10))+
  xlab("Party Affiliation")+
  ylab("Feeling Thermometer")+
  ggtitle("Democrat Feeling Thermometer",
          "How Democrats Feel About Their Party")+
  theme_classic()


#Visualization 2: Republican feelings towards Republicans
feeling_thermometer_republicans<-
  ggplot(data=republicans_ANES_2020,
         aes(x=V201018,y=V201157))+
  geom_point(color="red")+
  scale_x_continuous(breaks=seq(2,2,by=1),
                     labels=c("2"="Republican"))+
  scale_y_continuous(breaks=seq(0,100,by=10))+
  xlab("Party Affiliation")+
  ylab("Feeling Thermometer")+
  ggtitle("Republican Feeling Thermometer",
          "How Republicans Feel About Their Party")+
  theme_classic()

grid.arrange(feeling_thermometer_democrats,feeling_thermometer_republicans,ncol=2, nrow=1)

#Summary of Visualizations
#The visualization created shows how respondents who identify as Democrats feel
#towards other Democrats as well as how respondents who identify as Republicans
#feel towards Republicans. As seen in the visualization, it is clear that Democrats
#think more highly of Democrats than Republicans do of Republicans. This can be seen through
#the clustering towards the more positive feelings, around the mid 70s and higher
#on the feeling thermometer as opposed to the Republican graph which indicates less clustering in general.



