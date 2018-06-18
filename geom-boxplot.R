#geom boxplot
geom_boxplot() #will produce:
geom_boxplot: outlier.colour = NULL, outlier.fill = NULL, outlier.shape = 19, outlier.size = 1.5, outlier.stroke = 0.5, outlier.alpha = NULL, notch = FALSE, notchwidth = 0.5, varwidth = FALSE, na.rm = FALSE
stat_boxplot: na.rm = FALSE
position_dodge 

#outlier.colour, outlier.shape, outlier.size : The color, the shape and 
#the size for outlying points
#notch : logical value. If TRUE, make a notched box plot. 
#The notch displays a confidence interval around the median which is normally 
#based on the median +/- 1.58*IQR/sqrt(n). Notches are used to compare groups; 
#if the notches of two boxes do not overlap, this is a strong evidence that the
#medians differ.

#toothgrowth object
str(ToothGrowth)
#convert dose to factor
ToothGrowth$dose<-as.factor(ToothGrowth$dose);str(ToothGrowth)
#plot boxplot
p<-ToothGrowth %>% ggplot(aes(dose,len))+
  geom_boxplot();p
#rotate the boxplot
p+coord_flip()
#notched boxplot
ToothGrowth %>% ggplot(aes(dose,len))+
  geom_boxplot(notch = TRUE)
#change oultier, colour,shape and size
ToothGrowth %>% ggplot(aes(dose,len))+
  geom_boxplot(outlier.colour = "red",outlier.shape = 8,outlier.size = 5)
##add mean points to a boxplot using stat_summary() fn
p+stat_summary(fun.y = mean, geom = "point", shape=23,size=4)
##choose which items to display
p+scale_x_discrete(limits=c("0.5","2"))
#adding dots or points to boxplot using geom_dotplot
p+geom_dotplot(binaxis = "y",stackdir = "center",dotsize = 1)
#adding dots using geom_jitter
#0.2=degree of jitter in x direction
p+geom_jitter(shape=8, position = position_jitter(0.2))
d=ToothGrowth %>% ggplot(aes(dose,len,fill=dose))+
  geom_boxplot(outlier.colour = "red",outlier.shape = 8,outlier.size = 5);d
#chnage fill color manually
d+scale_fill_brewer(palette = "Dark2")
d+scale_fill_manual(values = c("#999999", "#E69F00", "#56B4E9"))
d+scale_fill_manual(values = c("0.5"="green","1"="red","2"="blue"))+
  theme_classic()
#chnage background with theme()
d+theme_dark()
#chnage the legend position and legend direction
d+theme(legend.direction = "horizontal", legend.position = "top")
#chnage the order of items in the legend
d+scale_x_discrete(limits=c("2","0.5","1"))
#chnage name of legend title
d+scale_x_discrete(limits=c("2","0.5","1"))+
  labs(fill="Dose")
##mutliple group boxplot
ToothGrowth %>% ggplot(aes(dose,len,fill=supp))+
  geom_boxplot(outlier.colour = "red",outlier.shape = 8,outlier.size = 5,
               position = position_dodge(1))+
  geom_dotplot(binaxis = "y",stackdir = "center",dotsize = 1,
               position = position_dodge(1))+
  theme_classic()
##customized boxplot
ToothGrowth %>% ggplot(aes(dose,len,fill=dose))+
  geom_boxplot(outlier.colour = "red",outlier.shape = 8,outlier.size = 9,
               notch = TRUE)+
  geom_dotplot(binaxis = "y",stackdir = "center")+
  scale_fill_brewer(palette = "Dark2")+
  labs(title="Plot of Length by dose", x="Dose(mg)",y="Length",fill="Dose")+
  theme_classic()
