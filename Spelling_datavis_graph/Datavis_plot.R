devtools::install_github("heike/gglogo", build_vignettes = F)
library(ggplot2)
library(gglogo)
library(sf)

data(alphabet)



D <- alphabet[which(alphabet$group=="D"),][(1:2)]
A <- alphabet[which(alphabet$group=="A"),][(1:2)]
Ts <- alphabet[which(alphabet$group=="T"),][(1:2)]
V <- alphabet[which(alphabet$group=="V"),][(1:2)]
I <- alphabet[which(alphabet$group=="I"),][(1:2)]
S <- alphabet[which(alphabet$group=="S"),][(1:2)]

polD = st_polygon(list(cbind(D$x,D$y)))
polA = st_polygon(list(cbind(A$x,A$y)))
polT = st_polygon(list(cbind(Ts$x,Ts$y)))
polV = st_polygon(list(cbind(V$x,V$y)))
polI = st_polygon(list(cbind(I$x,I$y)))
polS = st_polygon(list(cbind(S$x,S$y)))

pointsD = sf::st_sample(polD, size=500)
pointsA = sf::st_sample(polA, size=500)
pointsT = sf::st_sample(polT, size=500)
pointsV = sf::st_sample(polV, size=500)
pointsI = sf::st_sample(polI, size=500)
pointsS = sf::st_sample(polS, size=500)



plotd <- ggplot() + 
  #  geom_sf(aes(), data=pol) + 
  geom_sf(aes(), data=pointsD)+
  theme_minimal()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

plota <- ggplot() + 
  #  geom_sf(aes(), data=pol) + 
  geom_sf(aes(), data=pointsA)+
  theme_minimal()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

plott <- ggplot() + 
  #  geom_sf(aes(), data=pol) + 
  geom_sf(aes(), data=pointsT)+
  theme_minimal()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

plotv <- ggplot() + 
  #  geom_sf(aes(), data=pol) + 
  geom_sf(aes(), data=pointsV)+
  theme_minimal()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

ploti <- ggplot() + 
  #  geom_sf(aes(), data=pol) + 
  geom_sf(aes(), data=pointsI)+
  theme_minimal()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

plots <- ggplot() + 
  #  geom_sf(aes(), data=pol) + 
  geom_sf(aes(), data=pointsS)+
  theme_minimal()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


top <- cowplot::plot_grid(plotd, plota,plott, plota, ncol=4)
bottom <- cowplot::plot_grid(NULL, plotv,ploti, plots,NULL, ncol=6, rel_widths =c(0.2,0.3,0.3,0.3,0.1) )
plot <- cowplot::plot_grid(top, bottom, ncol=1)
ggsave(plot = plot, "plots/data_vis.png",width=12, height=8, dpi=600)
