library(ggplot2)

#CHART 1

data <- data.frame(
  CONTINENT = c('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America'),
  Number_of_Countries = c(46, 44, 16, 53, 12, 23)
)

ggplot(data, aes(x = Number_of_Countries, y = CONTINENT, fill = CONTINENT)) +
  geom_bar(stat = "identity", color = "black", width = 0.7) +  
  geom_text(aes(label = Number_of_Countries), hjust = -0.2, size = 4) +  
  labs(x = "Number of Countries", y = "Continent") +
  ggtitle("Number of countries on continents") +
  theme_minimal() +
  theme(legend.position = "none")  

#CHART 2
 
data <- data.frame(
  Population = c(1413142846, 1399179585, 339665118, 279476346, 247653551, 230842743, 218689757, 167184465, 141698923, 129875529),
  Country = c("China", "India", "United States", "Indonesia", "Pakistan", "Nigeria", "Brazil", "Bangladesh", "Russia", "Mexico")
)
ggplot(data, aes(x = reorder(Country, -Population), y = Population, fill = Country)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Population), vjust = -0.5, size = 2) + 
  labs(x = "Kraj", y = "Population", fill = "Country") +
  ggtitle("Top 10 Population") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 3

data <- data.frame(
  Population = c(1000, 9852, 11639, 21779, 31597, 34892, 39993, 54817, 74656, 80966),
   Country = c("Holy See (Vatican City)", "Nauru", "Tuvalu", "Palau", "Monaco", "San Marino", "Liechtenstein", "Saint Kitts and Nevis", "Dominica", "Marshall Islands")
)
result <- ggplot(data, aes(x = reorder(Country, Population), y = Population)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = Population), vjust = -0.3, size = 3) +
  labs(x = "Country", y = "Population", fill = "Country") +
  ggtitle("Top 10 worst population") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 4

data <- data.frame(
  Area = c(17098242, 9984670, 9833517, 9596960, 8515770, 7741220, 3287263, 2780400, 2724900, 2381740),
  Country = c("Russia", "Canada", "United States", "China", "Brazil", "Australia", "India", "Argentina", "Kazakhstan", "Algeria")
)

data <- data[order(-data$Area), ]
data <- data[data$Area > 0, ]
chart <- ggplot(data, aes(x = reorder(Country, -Area), y = Area)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = Area), vjust = -0.3, size = 3) +
  labs(x = "Country", y = "Area", fill = "Country") +
  ggtitle("Country Area") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 5

data <- data.frame(
  Area = c(0.49, 2, 21, 26, 61, 160, 181, 261, 316),
  Country = c("Holy See (Vatican City)", "Monaco", "Nauru", "Tuvalu", "San Marino", "Liechtenstein", "Marshall Islands", "Saint Kitts and Nevis", "Malta")
)

chart <- ggplot(data, aes(x = reorder(Country, Area), y = Area)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = Area ), vjust = -0.3, size = 3) +
  labs(x = "Country", y = "Area", fill = "Country") +
  ggtitle("Country Area)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 6

data <- data.frame(
  GrowthRate = c(6.39, 4.78, 3.66, 3.59, 3.36, 3.34, 3.31, 3.22, 3.13, 3.05),
  Country = c("Syria", "South Sudan", "Niger", "Burundi", "Equatorial Guinea", "Angola", "Benin", "Uganda", "Congo, Democratic Republic", "Chad")
)

chart <- ggplot(data, aes(x = reorder(Country, GrowthRate), y = GrowthRate)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = sprintf("%.2f", GrowthRate)), vjust = -0.3, size = 3) +
  labs(x = "Country", y = "Growth_rate", fill = "Country") +
  ggtitle("Top 10 population growth rate") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

  #CHART 7

data <- data.frame(
  GrowthRate = c(-1.14, -1.13, -1.04, -1.01, -0.74, -0.70, -0.66, -0.63, -0.52, -0.47),
  Country = c("Moldova", "Latvia", "Lithuania", "Romania", "Estonia", "Micronesia, Federated States of", "Bulgaria", "Serbia", "Ukraine", "Croatia")
)

chart <- ggplot(data, aes(x = reorder(Country, GrowthRate), y = GrowthRate)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = sprintf("%.2f", GrowthRate)), vjust = 0.3, size = 3) +
  labs(x = "Country", y = "Growth_rate", fill = "Kraj") +
  ggtitle("Top 10 worst population growth rate") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 8

data <- data.frame(
  Country = c("Niger", "Angola", "Benin", "Mali", "Uganda", "Chad", "Congo DR", "Somalia", "South Sudan", "Mozambique"),
  BirthRate = c(46.86, 41.42, 40.72, 40.54, 40.27, 39.85, 39.64, 37.71, 37.07, 36.94)
)

chart <- ggplot(data, aes(x = reorder(Country, -BirthRate), y = BirthRate)) +
  geom_bar(stat = "identity", fill = "purple", color = "black", size = 1) +
  geom_text(aes(label = sprintf("%.2f", BirthRate)), vjust = -0.5, size = 3, fontface = "bold") +
  labs(x = "Country", y = "Birth_rate") +
  ggtitle("TOP 10 population birth rate") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10, face = "bold"),
    axis.text.y = element_text(size = 10),
    axis.title = element_text(size = 12, face = "bold"),
    plot.title = element_text(size = 14, face = "bold")
  )

#CHART 9 

data <- data.frame(
  Country = c("Monaco", "Andorra", "Japan", "Korea South", "Italy", "Spain", "Greece", "Bulgaria", "Portugal", "Slovenia"),
  BirthRate = c(6.61, 6.87, 6.90, 6.95, 7.00, 7.12, 7.52, 7.97, 7.99, 8.12)
)

chart <- ggplot(data, aes(x = reorder(Country, -BirthRate), y = BirthRate)) +
  geom_bar(stat = "identity", fill = "purple", color = "black", size = 1) +
  geom_text(aes(label = sprintf("%.2f", BirthRate)), vjust = -0.5, size = 3, fontface = "bold") +
  labs(x = "Country", y = "Birth Rate") +
  ggtitle("Top 10 worst birth rate") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10, face = "bold"),
    axis.text.y = element_text(size = 10),
    axis.title = element_text(size = 12, face = "bold"),
    plot.title = element_text(size = 14, face = "bold")
  )

#CHART 10

death_rate_high <- data.frame(
  Country = c("Lithuania", "Serbia", "Romania", "Latvia", "Bulgaria", "Ukraine", "Russia", "Estonia", "Croatia", "Hungary"),
  DeathRate = c(15.17, 15.12, 14.92, 14.69, 14.31, 13.70, 13.27, 13.13, 12.98, 12.89)
)

chart_death_rate_high <- ggplot(death_rate_high, aes(x = reorder(Country, -DeathRate), y = DeathRate)) +
  geom_bar(stat = "identity", position = position_dodge(), fill = "purple", color = "black", size = 1) +
  geom_text(aes(label = sprintf("%.2f", DeathRate)), position = position_dodge(width = 0.9), vjust = -0.2, size = 3, fontface = "bold") +
  labs(x = "Country", y = "death rate") +
  ggtitle("Highest Mortality Rate - Worst") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10, face = "bold"),
    axis.text.y = element_text(size = 10),
    axis.title = element_text(size = 12, face = "bold"),
    plot.title = element_text(size = 14, face = "bold")
  )

#CHART 11

death_rate_low <- data.frame(
  Country = c("Qatar", "UAE", "Kuwait", "Bahrain", "Oman", "Libya", "Saudi Arabia", "Jordan", "Brunei", "Iraq"),
  DeathRate = c(1.42, 1.62, 2.27, 2.83, 3.21, 3.45, 3.45, 3.47, 3.85, 3.88)
)

chart_death_rate_low <- ggplot(death_rate_low, aes(x = reorder(Country, DeathRate), y = DeathRate)) +
  geom_bar(stat = "identity", position = position_dodge(), fill = "purple", color = "black", size = 1) +
  geom_text(aes(label = sprintf("%.2f", DeathRate)), position = position_dodge(width = 0.9), vjust = -0.2, size = 4, fontface = "bold") +
  labs(x = "Country", y = "death_rate") +
  ggtitle("Lowest Mortality Rate - Best") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10, face = "bold"),
    axis.text.y = element_text(size = 10),
    axis.title = element_text(size = 12, face = "bold"),
    plot.title = element_text(size = 14, face = "bold")
  )

# CHART 12

if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

data <- data.frame(
  Country = c("Syria", "Micronesia", "South Sudan", "Tonga", "Venezuela", "Maldives", "Equatorial Guinea", "Jordan", "Luxembourg", "Guam", "Monaco", "Nauru", "Burundi", "Eritrea", "Cyprus", "Moldova", "Australia", "Jamaica", "Saudi Arabia", "Samoa"),
  Net_Migration_Rate = c(45.78, -20.92, 19.98, -18.06, 13.55, -12.80, 13.01, -10.99, 11.39, -10.94, 10.89, -10.15, 6.84, -9.38, 6.65, -8.80, 6.39, -7.42, 6.07, -7.19)
)

ggplot(data, aes(x = reorder(Country, Net_Migration_Rate), y = Net_Migration_Rate)) +
  geom_bar(stat = "identity", fill = "purple", color = "black", size = 1) +  
  geom_text(aes(label = Net_Migration_Rate), vjust = 0.5, size = 3, color = "black") +  
  coord_flip() +
  labs(x = "Country", y = "Net Migration Rate", title = "Net Migration Rate by Country") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8)) 

# CHART 13

result <- data.frame(
  Country = c(
    "Bangladesh", "Japan", "Philippines", "Vietnam", "Germany", "Thailand",
    "France", "United Kingdom", "Italy", "Kenya", "Korea, South", "Uganda",
    "Spain", "Ukraine", "Iraq"
  ),
  Population = c(
    167184465, 123719238, 116434200, 104799174, 84220184, 69794997,
    68521974, 68138484, 61021855, 57052004, 51966948, 47729952, 47222613,
    43306477, 41266109
  )
)

colors <- rainbow(nrow(results))

ggplot(results, aes(x = reorder(Country, -Population), y = Population, fill = Country)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = kolory) +
  labs(title = "Countries with above average population and below average area",
       x = "Countries", y = "Population") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(size = 12),  
        axis.title.y = element_text(size = 10),  
        axis.title.x = element_text(size = 10)) +  
  scale_y_continuous(labels = scales::comma, limits = c(0, 2e8), breaks = seq(0, 2e8, by = 2e7))
