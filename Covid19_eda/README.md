#COVID-19 Global Data Exploration & Visualization
by Keesha Ngombo

---

## Overview
This project examines global COVID-19 data to uncover patterns in infection rates, mortality trends, and vaccination distribution across countries and continents. Using SQL for data analysis and Tableau for visualization, the study addresses critical questions about pandemic impact: Which countries experienced the highest infection rates relative to their population? How did mortality rates evolve over time? What was the pace of vaccine distribution globally?

## Questions

- What is the case fatality rate by country and over time?
- Which countries had the highest infection rates relative to population size?
- How do death counts compare across continents?
- What are the global trends in cases, deaths, and mortality rates?
- What percentage of each country's population received at least one vaccine dose, and at what rate?

## Data Source
**Source:** Our World in Data - COVID-19 Dataset
**URL:** https://ourworldindata.org/covid-deaths
**Last Updated:** November 29, 2025
**Coverage:** Multi-year pandemic tracking across global regions

## Technical Approach
## Tools Used

- SQL (Microsoft SQL Server): Data extraction, transformation, and statistical analysis
- Tableau: Interactive dashboard development and geographic visualization

# SQL Skills Demonstrated

**Joins:** Merging death and vaccination datasets for comprehensive analysis
**CTEs (Common Table Expressions)**: Calculating rolling vaccination totals efficiently
**Temporary Tables:** Storing intermediate results for complex multi-step calculations
**Window Functions:** Computing rolling sums using PARTITION BY and ORDER BY clauses
**Aggregate Functions:** Employing SUM(), MAX(), and COUNT() for summary statistics
**Views:** Creating reusable queries optimized for visualization tools
**Data Type Conversion:** Using CAST() and CONVERT() for precise calculations
**Null Handling:** Implementing NULLIF() to prevent division errors

## Analysis Framework
1. Data Validation
Performed initial quality checks on date ranges and data completeness. Filtered records to ensure country-level granularity, excluding aggregated continental data that could skew results.
2. Mortality Analysis
Calculated death percentages as the ratio of total deaths to total cases by country and date. Identified countries with the highest absolute death counts and compared mortality burden across continents.
3. Infection Rate Analysis
Determined the percentage of population infected for each country by dividing maximum total cases by population size. This metric revealed which nations experienced the highest relative infection burden, regardless of absolute population.
4. Global Trends
Aggregated daily new cases and deaths to track global patterns over time. Calculated rolling death percentages to understand how case fatality rates changed as medical knowledge and treatments improved.
5. Vaccination Progress
Used window functions to compute cumulative vaccination counts per country over time. Calculated the percentage of population vaccinated using rolling totals. Implemented this analysis using three different SQL methods (CTE, temporary table, and view) to demonstrate technical versatility.

## Key Findings
**Global Impact**

**Total Cases:** 778,859,874
**Total Deaths:** 7,108,937
**Global Death Percentage:** Approximately 1%

## Continental Distribution
South America recorded the highest total death count (600K+), followed by Asia (550K+). Europe, Africa, and Oceania showed progressively lower mortality figures, reflecting differences in population density, healthcare infrastructure, and public health interventions.
Country-Level Insights
Infection rates varied significantly across nations, with some countries reporting over 70% population infection rates at peak periods. Death percentages were notably higher during early pandemic phases, declining as treatment protocols improved. The United States, China, India, Mexico, and United Kingdom exhibited distinct infection trajectory patterns, likely influenced by policy responses, healthcare capacity, and timing of viral waves.
Vaccination Rollout
Rolling vaccination data revealed substantial variation in adoption rates across countries. Major population centers demonstrated different rollout curves, with acceleration occurring primarily in 2021-2022 and sustained coverage extending through 2025. The data shows clear temporal patterns in vaccine distribution efficiency.

## Visualization Dashboard
The Tableau dashboard comprises four integrated components:

Global Numbers Summary: High-level metrics displaying total cases, deaths, and death percentage
Total Death per Continent: Bar chart comparing mortality burden across continents
Total Infection by Country: Choropleth map with color-coded intensity showing percentage of population infected
Percent Population Infected Over Time: Multi-country line chart with forecast indicators tracking infection trends

## Interactive Capabilities:

Geographic heat mapping for spatial pattern identification
Time-series analysis with forecasting functionality
Country-level filtering for comparative analysis

## Technical Implementation
**Database Structure**

COVID-19-Data-Exploration/
│
├── SQL/
│   └── covid_data_exploration.sql          # Comprehensive SQL analysis script
│
├── Data/
│   ├── covid_19_death.csv                  # Death and case dataset
│   └── covid_19_vaccination.csv            # Vaccination dataset
│
├── Visualizations/
│   ├── tableau_dashboard.twbx              # Packaged Tableau workbook
│   └── dashboard_screenshot.png            # Dashboard preview image
│
└── README.md                                # Project documentation


## Conclusion
This exploratory analysis quantifies the substantial global impact of COVID-19, revealing significant geographic variation in infection rates, mortality, and vaccination adoption. South America experienced the highest continental mortality burden, while country-level infection rates varied dramatically based on population density, healthcare infrastructure, and public health interventions. The integration of SQL's analytical capabilities with Tableau's visualization tools enables comprehensive examination of pandemic dynamics across temporal and geographic dimensions.

## Future Research Directions:

Incorporate socioeconomic indicators (GDP, healthcare expenditure per capita) to examine correlates of mortality
Integrate booster vaccination data to assess long-term immunization trends

## References

Ritchie, H., et al. (2025). Coronavirus Pandemic (COVID-19). Our World in Data. Retrieved from https://ourworldindata.org/covid-deaths

Add viral variant data to analyze how mutations influenced infection waves
Develop predictive models for pandemic scenario forecasting

Technical Skills Applied: Advanced SQL querying, window functions, data cleaning and validation, multi-table joins, common table expressions, database view creation, geographic data visualization, time-series forecasting, and interactive dashboard design.
