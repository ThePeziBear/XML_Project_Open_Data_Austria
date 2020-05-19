# R script 
# File: impf_recode.R
# Author: Christian Brandstätter 
# Contact: bran.chri@gmail.com
# Date:  3.03.2020
# Copyright (C) 2020
# Description: R-Script zum Einlesen und transformieren der Impfdaten

library(reshape2)

# Einlesen 
impfdat <- read.csv2("./Impf.csv", fileEncoding = "Windows-1252")
# von wide auf long 
impfdat_long <- melt(impfdat)

# entfernen von X 
impfdat_long$variable <- as.character(impfdat_long$variable)
impfdat_long$variable <- gsub("X", "", impfdat_long$variable)

# Schreiben ohne Index 
write.csv(impfdat_long, "./Impfung_Recode.csv", row.names = FALSE)


