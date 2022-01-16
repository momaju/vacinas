library(tidyverse)

owid <- read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")

  
owid_selected <- owid %>% select(location, date,
         all_vax = people_vaccinated_per_hundred,
         fully_vax = people_fully_vaccinated_per_hundred,
         boosted = total_boosters_per_hundred) %>%
  
  # people_vaccinated_per_hundred = Total number of people who received at least one vaccine dose per 100 people in the total population
  # people_fully_vaccinated_per_hundred = Total number of people who received all doses prescribed by the vaccination protocol per 100 people in the total population
  # total_boosters_per_hundred = Total number of COVID-19 vaccination booster doses administered per 100 people in the total population
  
  # filter(location == "Brazil") %>%
  # drop_na(fully_vax) %>% slice_max(date)

  filter((location == "Portugal" | location == "Brazil" |
          location == "Netherlands" | location == "China" |
          location == "France" | location == "Germany" |
          location == "India" | location == "Italy" |
          location == "Japan" | location == "Mexico" |
          location == "South Africa" | location == "South Korea" |
          location == "Spain" | location == "United Kingdom" |
          location == "United States" | location == "Argentina")) %>%
  drop_na(fully_vax) %>% 
  group_by(location) %>%
  slice_max(date, n=1) %>%
  ungroup() %>%
  select(-date)

owid_selected
