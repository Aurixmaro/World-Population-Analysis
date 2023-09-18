import cx_Oracle
import pandas as pd

### ORACLE QUERIES FOR PYTHON IN JUPYTER

#QUERY 1

cursor = connection.cursor()
cursor.execute(
    "SELECT "
    "    cols.column_name, "
    "    cols.data_type, "
    "    cols.data_length, "
    "    cols.nullable, "
    "    cons.constraint_name, "
    "    cons.constraint_type "
    "FROM all_tab_columns cols "
    "LEFT JOIN all_cons_columns col_cons ON cols.owner = col_cons.owner "
    "    AND cols.table_name = col_cons.table_name "
    "    AND cols.column_name = col_cons.column_name "
    "LEFT JOIN all_constraints cons ON col_cons.owner = cons.owner "
    "    AND col_cons.constraint_name = cons.constraint_name "
    "WHERE cols.table_name = 'COUNTRIES_DATA' "
    "    AND cols.owner = 'POPULATION' "
    "ORDER BY cols.column_id"
)
result = cursor.fetchall()
columns = [
    'COLUMN_NAME',
    'DATA_TYPE',
    'DATA_LENGTH',
    'NULLABLE',
    'CONSTRAINT_NAME',
    'CONSTRAINT_TYPE'
]
df = pd.DataFrame(result, columns=columns)

# QUERY 2

cursor = connection.cursor()
cursor.execute("SELECT * FROM Countries_data")
result = cursor.fetchall()
df = pd.DataFrame(result, columns=[desc[0] for desc in cursor.description])
df.to_string(index=False)

# QUERY 3

cursor = connection.cursor()
cursor.execute(
"""
    SELECT CONTINENT, COUNT(COUNTRY) AS Number_of_Countries
    FROM countries_data
    GROUP BY CONTINENT
"""
)
result = cursor.fetchall()
columns = ["CONTINENT", "Number_of_Countries"]
df = pd.DataFrame(result, columns=columns)

# QUERY 4

cursor = connection.cursor()
cursor.execute(
    "SELECT "
    "    (SELECT country FROM countries_data WHERE population = (SELECT MIN(population) FROM countries_data WHERE country <> 'American Samoa')) AS country_min_pop, "
    "    (SELECT country FROM countries_data WHERE population = (SELECT MAX(population) FROM countries_data WHERE country <> 'American Samoa')) AS country_max_pop, "
    "    (SELECT country FROM countries_data WHERE population_growth_rate = (SELECT MIN(population_growth_rate) FROM countries_data WHERE country <> 'American Samoa')) AS country_min_pop_growth, "
    "    (SELECT country FROM countries_data WHERE population_growth_rate = (SELECT MAX(population_growth_rate) FROM countries_data WHERE country <> 'American Samoa')) AS country_max_pop_growth, "
    "    (SELECT MIN(population) FROM countries_data WHERE country <> 'American Samoa') AS min_pop, "
    "    (SELECT MAX(population) FROM countries_data WHERE country <> 'American Samoa') AS max_pop, "
    "    (SELECT MIN(population_growth_rate) FROM countries_data WHERE country <> 'American Samoa') AS min_pop_growth, "
    "    (SELECT MAX(population_growth_rate) FROM countries_data WHERE country <> 'American Samoa') AS max_pop_growth "
    "FROM dual"
)
result = cursor.fetchall()
columns = [desc[0] for desc in cursor.description]
df = pd.DataFrame(result, columns=columns)

# QUERY 5

cursor1 = connection.cursor()
cursor1.execute("""
SELECT *
FROM countries_data
WHERE population = (SELECT MIN(population)
                    FROM countries_data)
"""
)
columns1 = [desc[0] for desc in cursor1.description]
data1 = cursor1.fetchall()
df1 = pd.DataFrame(data1, columns=columns1)

# QUERY 6

cursor2 = connection.cursor()
cursor2.execute("""
    SELECT *
    FROM countries_data
    WHERE population = (SELECT MAX(population)
                        FROM countries_data
                        WHERE country <> 'American Samoa')
""")
columns2 = [desc[0] for desc in cursor2.description]
data2 = cursor2.fetchall()

df2 = pd.DataFrame(data2, columns=columns2)
df2

# QUERY 7

cursor3 = connection.cursor()
cursor3.execute("""
SELECT SUM(population) AS total_population
FROM countries_data
""")
columns3 = [desc[0] for desc in cursor3.description]
data3 = cursor3.fetchall()
df3 = pd.DataFrame(data3, columns=columns3)

# QUERY 8

cursor = connection.cursor()
cursor.execute("""
    SELECT a.population AS population_best, 
           a.country AS The_best,
           b.population AS population_worst,
           b.country AS Worst
    FROM (
        SELECT population, country, ROWNUM AS rownum_best
        FROM (
            SELECT population, country
            FROM countries_data
            WHERE country <> 'American Samoa' 
            ORDER BY population DESC
        )
        WHERE ROWNUM <= 10
    ) a
    JOIN (
        SELECT population, country, ROWNUM AS rownum_worst
        FROM (
            SELECT population, country
            FROM countries_data
            WHERE country <> 'American Samoa' 
            ORDER BY population ASC
        )
        WHERE ROWNUM <= 10
    ) b
    ON a.rownum_best = b.rownum_worst
""")
result = cursor.fetchall()
columns = ["population_best", "The_best", "population_worst", "Worst"]
df = pd.DataFrame(result, columns=columns)
 

 # QUERY 9

cursor = connection.cursor()
cursor.execute("""
    SELECT a.area AS area_best, 
           a.country AS The_best,
           b.area AS area_worst,
           b.country AS Worst
    FROM (
        SELECT area, country, ROWNUM AS rownum_best
        FROM (
            SELECT area, country
            FROM countries_data
            WHERE country <> 'American Samoa' 
            ORDER BY area DESC
        )
        WHERE ROWNUM <= 10
    ) a
    JOIN (
        SELECT area, country, ROWNUM AS rownum_worst
        FROM (
            SELECT area, country
            FROM countries_data
            WHERE country <> 'American Samoa' 
            ORDER BY area ASC
        )
        WHERE ROWNUM <= 10
    ) b
    ON a.rownum_best = b.rownum_worst
""")
result = cursor.fetchall()
columns = ["area_best", "The_best", "area_worst", "Worst"]
df = pd.DataFrame(result, columns=columns)

# QUERY 10

cursor = connection.cursor()
cursor.execute("""
    SELECT a.population_growth_rate AS population_growth_rate_best, 
           a.country AS The_best,
           b.population_growth_rate AS population_growth_rate_worst,
           b.country AS Worst
    FROM (
        SELECT population_growth_rate, country, ROWNUM AS rownum_best
        FROM (
            SELECT population_growth_rate, country
            FROM countries_data
            WHERE country <> 'American Samoa'
            ORDER BY population_growth_rate DESC
        )
        WHERE ROWNUM <= 10
    ) a
    JOIN (
        SELECT population_growth_rate, country, ROWNUM AS rownum_worst
        FROM (
            SELECT population_growth_rate, country
            FROM countries_data
            WHERE country <> 'American Samoa' 
            ORDER BY population_growth_rate ASC
        )
        WHERE ROWNUM <= 10
    ) b
    ON a.rownum_best = b.rownum_worst
""")
result = cursor.fetchall()
columns = ["population_growth_rate_best", "The_best", "population_growth_rate_worst", "Worst"]
df = pd.DataFrame(result, columns=columns)


# QUERY 11

cursor = connection.cursor()
cursor.execute("""
    SELECT a.death_rate AS death_rate, 
           a.country AS The_best,
           a.continent AS continent,
           b.death_rate AS death_rate,
           b.country AS Worst,
           b.continent AS continent
    FROM (
        SELECT death_rate, country, continent, ROWNUM AS rownum_best
        FROM (
            SELECT death_rate, country, continent
            FROM countries_data
            WHERE country <> 'Holy See (Vatican City)'
            ORDER BY death_rate DESC
        )
        WHERE ROWNUM <= 10
    ) a
    JOIN (
        SELECT death_rate, country, continent, ROWNUM AS rownum_worst
        FROM (
            SELECT death_rate, country, continent
            FROM countries_data
            WHERE country <> 'American Samoa'
            ORDER BY death_rate 
        )
        WHERE ROWNUM <= 10
    ) b
    ON a.rownum_best = b.rownum_worst
""")
result = cursor.fetchall()
columns = ["death_rate", "High", "Continent", "death_rate", "Low", "Continent"]
df = pd.DataFrame(result, columns=columns)

# QUERY 12

cursor = connection.cursor()
cursor.execute("""
    SELECT a.net_migration_rate AS net_migration_rate_best, 
           a.country AS The_best,
           a.continent AS continent,
           b.net_migration_rate AS net_migration_rate_worst,
           b.country AS Worst,
           b.continent AS continent
    FROM (
        SELECT net_migration_rate, country, continent, ROWNUM AS rownum_best
        FROM (
            SELECT net_migration_rate, country, continent
            FROM countries_data
            WHERE country <> 'American Samoa' AND country <> 'Holy See (Vatican City)'
            ORDER BY net_migration_rate DESC
        )
        WHERE ROWNUM <= 10
    ) a
    JOIN (
        SELECT net_migration_rate, country, continent, ROWNUM AS rownum_worst
        FROM (
            SELECT net_migration_rate, country, continent
            FROM countries_data
            WHERE country <> 'American Samoa' AND country <> 'Holy See (Vatican City)'
            ORDER BY net_migration_rate ASC
        )
        WHERE ROWNUM <= 10
    ) b
    ON a.rownum_best = b.rownum_worst
""")
result = cursor.fetchall()
columns = ["net_migration_rate_best", "The_best", "Continent", "net_migration_rate_worst", "Worst", "Continent"]

df = pd.DataFrame(result, columns=columns)

# QUERY 13

cursor = connection.cursor()
cursor.execute("""
SELECT ROUND(AVG(population), 1) AS avg_population, ROUND(AVG(area), 1) AS avg_area
  FROM countries_data
""")

columns = [desc[0] for desc in cursor.description]
data = cursor.fetchall()
df = pd.DataFrame(data, columns=columns)

# QUERY 14

cursor = connection.cursor()
cursor.execute("""
    SELECT country,continent, population, area
    FROM countries_data
    WHERE population > (SELECT AVG(population) FROM countries_data)
      AND area < (SELECT AVG(area) FROM countries_data)
    ORDER BY population DESC
""")
result = cursor.fetchall()
columns = [desc[0] for desc in cursor.description]
df = pd.DataFrame(result, columns=columns)
