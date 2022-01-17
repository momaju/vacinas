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

# another way to filter location

owid_selected <- owid %>% select(location, date,
                                 all_vax = people_vaccinated_per_hundred,
                                 fully_vax = people_fully_vaccinated_per_hundred,
                                 boosted = total_boosters_per_hundred) %>%
  
  # people_vaccinated_per_hundred = Total number of people who received at least one vaccine dose per 100 people in the total population
  # people_fully_vaccinated_per_hundred = Total number of people who received all doses prescribed by the vaccination protocol per 100 people in the total population
  # total_boosters_per_hundred = Total number of COVID-19 vaccination booster doses administered per 100 people in the total population
  
  # filter(location == "Brazil") %>%
  # drop_na(fully_vax) %>% slice_max(date)
  
  filter((location %in% c("Portugal", "Brazil", "Netherlands", "China", "France", "Germany",
                          "India", "Italy", "Japan", "Mexico", "South Africa", "South Korea",
                          "Spain", "United Kingdom", "United States", "Argentina"))) %>%
  drop_na(fully_vax) %>% 
  group_by(location) %>%
  slice_max(date, n=1) %>%
  ungroup() %>%
  select(-date)

owid_selected

# south america countries

owid_south_america <- owid %>% select(location, date,
                                                       all_vax = people_vaccinated_per_hundred,
                                                       fully_vax = people_fully_vaccinated_per_hundred,
                                                       boosted = total_boosters_per_hundred,
                                                      deaths = total_deaths_per_million) %>%
  
  filter((location %in% c("Colombia", "Brazil", "Peru", "Chile", "Ecuador", "Bolivia",
                          "Uruguay", "Guyana", "Paraguay", "Suriname", "French Guiana","Argentina"))) %>%
  drop_na(fully_vax) %>% 
  group_by(location) %>%
  slice_max(date, n=1) %>%
  ungroup()
  #select(-date)

owid_south_america





