rm(list=ls())
library(SPEI)

prec <- read.csv("/eobs/prec_1950_2023.csv")
prec <- prec[,-1]

matrix_prec <- as.matrix(prec)

SPI-3
matrix_SPI_3<-matrix(rep(1,2900*888),2900,888)

     for(i in 1:2900){
       spi_3<-spi(matrix_prec[i,],3)
       spi_3<-as.vector(spi_3$fitted)
       matrix_SPI_3[i,]<-spi_3
     }

write.table(matrix_SPI_3, file = "/eobs/spi3.csv", col.names = TRUE, sep = ",", quote = FALSE, row.names = FALSE)