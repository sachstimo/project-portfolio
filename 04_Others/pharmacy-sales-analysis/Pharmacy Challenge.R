library(tidyverse)
library(dplyr)

load('./DATA/sales_pharmacy.RData')
load('./DATA/adress_pharmacy.RData')

setwd("C:/Users/tsach/OneDrive/Dokumente/04_ESADE/02_Classes/00_Intro to R/Assignments/Pharmacy")

sales_info <- sales_pharmacy %>% 
  left_join(adress_pharmacy, by = 'pharmacy_id') %>% 
  mutate(province = toupper(province))

head(sales_info)

# Using the provided datasets, find the top 20% pharmacies (pediatric sales) for each catalan province. 
# Can you create a dataset with those pharmacies? 
# How many pharmacies per province are eligible for the promotion?
# Detect pediatric sales (consider only classification_id '8*' related)

# Dataset with all top 20% pharmacies per region:

top_20_pct <- sales_info %>%
  select(pharmacy_id, province, units, classification_id) %>% 
  filter(str_detect(classification_id, '^85') & 
           province %in% c('BARCELONA', 'GIRONA', 'LLEIDA', 'TARRAGONA')) %>% 
  group_by(province, pharmacy_id) %>%
  summarize(total_units = sum(units)) %>% 
  group_by(province) %>% 
  mutate(pctl_80 = quantile(total_units, 0.8, na.rm = TRUE)) %>% 
  filter(total_units >= pctl_80) %>% 
  arrange(desc(total_units), .by_group = TRUE)

view(top_20_pct)

# Calculate numbers of pharmacies eligible for promotion:

num_eligible <- top_20_pct %>% 
  select(province, pharmacy_id) %>% 
  group_by(province) %>% 
  summarise(pharmacy_count = n()) %>% 
  arrange(desc(pharmacy_count))

view(num_eligible)

