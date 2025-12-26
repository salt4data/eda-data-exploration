/*
================================================================================
COVID-19 DATA EXPLORATION
================================================================================
Data Source: Our World in Data - COVID-19 Dataset
             https://ourworldindata.org/covid-deaths
             Downloaded:November 29, 2025

Skills Used: Joins, CTEs, Temp Tables, Window Functions, Aggregate Functions, 
             Creating Views, Converting Data Types

This project analyzes global COVID-19 data from Our World in Data to identify 
trends in infection rates, mortality, and vaccination rollout across countries 
and continents. Through SQL, I answer questions like: Which countries were hit 
hardest relative to their population? How did death rates change over time? 
What was the pace of vaccine distribution globally?
================================================================================
*/

-- ============================================================================
-- Quick look at the data we're working with
-- ============================================================================
SELECT MIN(date) AS data_start_date, MAX(date) AS data_end_date, DATEDIFF(DAY, MIN(date), MAX(date)) AS total_days_covered
FROM [Covid-19 EDA]..[Covid 19 Death]
WHERE date IS NOT NULL;

SELECT country,date,total_cases,new_cases, total_deaths,population
FROM [Covid-19 EDA]..[Covid 19 Death]
WHERE continent IS NOT NULL
ORDER BY country, date;


-- ============================================================================
-- Looking at Total Cases vs Total Deaths
-- Shows the likelihood of dying if you contract COVID in your country
-- ============================================================================
SELECT country,date,total_cases,total_deaths,ROUND((CAST(total_deaths AS FLOAT) / NULLIF(total_cases, 0)) * 100, 2) AS death_percentage
FROM [Covid-19 EDA]..[Covid 19 Death]
WHERE continent IS NOT NULL
    AND total_cases > 0 AND country like '%states'
ORDER BY death_percentage desc;


-- ============================================================================
-- Looking at Countries with Highest Infection Rate compared to Population
-- Which countries got hit the hardest relative to their population size?
-- ============================================================================
SELECT country,population,MAX(total_cases) AS highest_infection_count, ROUND(MAX(CAST(total_cases AS FLOAT) / NULLIF(population, 0)) * 100, 2) AS percent_population_infected
FROM [Covid-19 EDA]..[Covid 19 Death]
WHERE continent IS NOT NULL
GROUP BY country, population
ORDER BY percent_population_infected DESC;


-- ============================================================================
-- Countries with Highest Death Count per Population
-- ============================================================================
SELECT country, MAX(CAST(total_deaths AS INT)) AS total_death_count
FROM [Covid-19 EDA]..[Covid 19 Death]
WHERE continent IS NOT NULL
GROUP BY country
ORDER BY total_death_count DESC;


-- ============================================================================
-- Breaking things down by Continent
-- ============================================================================
SELECT continent, MAX(CAST(total_deaths AS INT)) AS total_death_count
FROM [Covid-19 EDA]..[Covid 19 Death]
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count DESC;


-- ============================================================================
-- Global Numbers
-- ============================================================================

-- Looking at total cases and deaths by date
SELECT date,SUM(new_cases) AS global_cases,SUM(CAST(new_deaths AS INT)) AS global_deaths,ROUND((SUM(CAST(new_deaths AS FLOAT)) / NULLIF(SUM(new_cases), 0)) * 100, 2) AS death_percentage
FROM [Covid-19 EDA]..[Covid 19 Death]
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date;

-- Overall global numbers across the entire dataset
SELECT SUM(new_cases) AS total_global_cases, SUM(CAST(new_deaths AS INT)) AS total_global_deaths,
    ROUND((SUM(CAST(new_deaths AS FLOAT)) / NULLIF(SUM(new_cases), 0)) * 100, 2) AS global_death_percentage
FROM [Covid-19 EDA]..[Covid 19 Death]
WHERE continent IS NOT NULL;


-- ============================================================================
-- Total Population vs Vaccinations
-- Shows percentage of population that has received at least one vaccine
-- ============================================================================

-- Using CTE to perform calculation on partition by in previous query
WITH PopulationVaccinated AS (
    SELECT d.continent, d.country, d.date, d.population, v.new_vaccinations,
        SUM(CONVERT(BIGINT, v.new_vaccinations)) OVER (
            PARTITION BY d.country 
            ORDER BY d.date
        ) AS rolling_people_vaccinated
    FROM [Covid-19 EDA]..[Covid 19 Death] d
    JOIN [Covid-19 EDA]..[Covid 19 Vaccination] v
        ON d.country = v.country
        AND d.date = v.date
    WHERE d.continent IS NOT NULL
)
SELECT 
    *,
    ROUND((CAST(rolling_people_vaccinated AS FLOAT) / NULLIF(population, 0)) * 100, 2) AS percent_vaccinated
FROM PopulationVaccinated
ORDER BY country, date;


-- ============================================================================
-- Using Temp Table to perform calculation on partition by in previous query
-- ============================================================================
DROP TABLE IF EXISTS #PercentPopulationVaccinated;

CREATE TABLE #PercentPopulationVaccinated (
    continent NVARCHAR(255),
    country NVARCHAR(255),
    date DATETIME,
    population NUMERIC,
    new_vaccinations NUMERIC,
    rolling_people_vaccinated NUMERIC
);

INSERT INTO #PercentPopulationVaccinated
SELECT d.continent, d.country, d.date, d.population, v.new_vaccinations,
    SUM(CONVERT(BIGINT, v.new_vaccinations)) OVER (
        PARTITION BY d.country 
        ORDER BY d.date
    ) AS rolling_people_vaccinated
FROM [Covid-19 EDA]..[Covid 19 Death] d
JOIN [Covid-19 EDA]..[Covid 19 Vaccination] v
    ON d.country = v.country
    AND d.date = v.date
WHERE d.continent IS NOT NULL;

-- Query the temp table
SELECT *,
    ROUND((rolling_people_vaccinated * 100.0 / NULLIF(population, 0)), 2) AS percent_vaccinated
FROM #PercentPopulationVaccinated
ORDER BY country, date;


-- ============================================================================
-- Creating View to store data for later visualizations
-- ============================================================================
CREATE OR ALTER VIEW vw_PercentPopulationVaccinated AS
SELECT d.continent,d.country,d.date, d.population,v.new_vaccinations,
    SUM(CONVERT(BIGINT, v.new_vaccinations)) OVER (
        PARTITION BY d.country 
        ORDER BY d.date
    ) AS rolling_people_vaccinated
FROM [Covid-19 EDA]..[Covid 19 Death] d
JOIN [Covid-19 EDA]..[Covid 19 Vaccination] v
    ON d.country = v.country
    AND d.date = v.date
WHERE d.continent IS NOT NULL;

-- Query the view
SELECT *
FROM vw_PercentPopulationVaccinated
ORDER BY country, date;