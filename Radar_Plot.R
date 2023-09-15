# Create data: Immunization data:
library(ggplot2)
library(colormap)
library(radarchart)
set.seed(1)
data <-as.data.frame(matrix( sample( 2:20 , 60 , replace=T) , ncol=10, byrow=TRUE))
colnames(data) <- c("HepB" , "BCG" , "Penta1" , "Penta2" , "Penta3", "RVV1" , "RVV2" , "RVV3", "FIC", "MR" )

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data <-rbind(rep(20,10) , rep(0,10) , data)

# Prepare color
colors_border=colormap(colormap=colormaps$viridis, nshades=6, alpha=1)
colors_in=colormap(colormap=colormaps$viridis, nshades=6, alpha=0.3)

# Prepare title
mytitle <- c("2018-19", "2019-20", "2020-21", "2021-22", "2022-23","2023-24")

# Split the screen in 6 parts
par(mar=rep(0.8,4))
par(mfrow=c(2,3))

# Loop for each plot
for(i in 1:6){
  
  # Custom the radarChart !
  radarchart( data[c(1,2,i+2),], axistype=1, 
              
              #custom polygon
              pcol=colors_border[i] , pfcol=colors_in[i] , plwd=4, plty=1 , 
              
              #custom the grid
              cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
              
              #custom labels
              vlcex=0.8,
              
              #title
              title=mytitle[i]
  )
}
