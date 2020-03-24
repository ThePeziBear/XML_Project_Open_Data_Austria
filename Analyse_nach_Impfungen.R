# R script 
# File: Analyse_nach_Impfungen.R
# Author: Christian Brandstätter 
# Contact: bran.chri@gmail.com
# Date: 24.03.2020
# Copyright (C) 2020
# Description: Kurze Analyse des Datasets 

library(ggplot2)
library(dplyr)
library(viridis)

impfs <- read.csv("./Impfung_Recode.csv")

plotdat <- impfs %>%
  group_by(Impfungen, variable) %>%
  summarize(wert = sum(value))

ggplot(plotdat, aes(x = variable, y = wert, group = Impfungen, fill = Impfungen)) +
  geom_col() +
#  scale_fill_viridis(discrete = TRUE) +
  theme_minimal() +
  labs(x = "Jahr", y = "Anzahl [#]", title = "Impfungen in Linz",
       subtitle = "von 1995 bis 2016")

ggsave("./Zeitreihe.png")
