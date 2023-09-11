# World-population-analysis
![R_chart_1](https://github.com/Aurixmaro/World-population-analysis/assets/143027570/76423acf-08fe-46fe-9384-ee188e9e6e40)

This project uses data from the CIA World Factbook, which is a collection of statistics for all countries on Earth. Demographic data for the project comes from 2023
The original dataset from the CIA World Factbook consisted of 261 rows, but I chose not to include data for territories such as:
<br> - " Taiwan - the United Nations considers it represented by the People's Republic of China
<br> - The Cook Islands and Niue, both states in free association with New Zealand which are members of several UN specialized agencies and have been recognized "full treaty-making capacity", but are neither member states nor non-member observer states.
<br> - Dependencies (or dependent territories, dependent areas, dependencies) and Areas of Special Sovereignty (autonomous territories)
<br> - Other countries recognized by the United Nations as not being self-governing" [2]

The final data set consists of 12 columns and 195 rows.

**Database:**

id - identification number assigned to the country.

data_codes - ISO country code, consisting of three letters.

country - country name

continent - the continent on which the country is located

area - total area of the country (area_land + area_water).

area_land - country land surface

area_water - country water surface

population - total population of the country

population_increase - population growth rate in 2023 in %

birth_rate - births/1,000 population

death_rate - death/1,000 population

net_migration_rate - the ratio of people who left the country for another country.

### Bibliography
<br>[1] https://www.cia.gov/
<br>[2] https://www.worldometers.info/
