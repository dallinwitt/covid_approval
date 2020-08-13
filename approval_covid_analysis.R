library(dplyr)
library(ggplot2)
library(plotly)
gov_approval <- read.csv('gov_covid_outbreak.csv')
gov_approval%>%
  plot_ly(x = ~inf_change, y = ~nama_change, color = ~party, colors = c("#081EC4","#DB0D0D"))%>%
  add_markers(alpha = 0.2)

#The plot seems to show a much higher degree of variability in approval when the change in cases is 
#close to zero. However, this could just be an artifact of the fact that there are more values in that
#region, and thus - by necessity - more extreme values. 

#I'm going to check the actual distribution by creating binned box plots for several regions

ggplot(data = gov_approval, aes(x = cut(inf_change, breaks = 8), y = nama_change))+geom_boxplot()

#the box plots seem to support the theory that variance in approval is not actually
#a function of change in case count. Let's see if the same phenomenon appears when death
#is plotted on the x-axis

ggplot(data = gov_approval, aes(x = cut(death_change, breaks = 8), y = nama_change))+geom_boxplot()

#it seems that the variability is similarly unaffected by deaths. We've seen this hold
#true for governors, let's see if the same is the case for senators.

sen_approval <- read.csv('sen_covid_outbreak.csv')
sen_approval%>%
  plot_ly(x = ~inf_change, y = ~nama_change, color = ~party, colors = c("#081EC4","#DB0D0D"))%>%
  add_markers(alpha = 0.2)

#even though the same overall shape occurs with senators as we saw with governors, 
#the tail on the variability curve does seem to be much longer. Again, though, that could
#large be explained by the fact that there are simply more senators than there are governors.
#Again, Let's plot the box plots to see what the inter-quartile range actually looks like.

ggplot(data = sen_approval, aes(x = cut(inf_change, breaks = 8), y = nama_change))+geom_boxplot()

#just as with governors, the IQR and (to a slightly lesser degree) the total range seem relatively
#unaffected by changes in infection rate. Just as with governors, let's look at death rate

ggplot(data = sen_approval, aes(x = cut(death_change, breaks = 8), y = nama_change))+geom_boxplot()











