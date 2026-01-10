# COVID-19 Global Data Exploration & Visualization

**by Keesha Ngombo** 👩🏽‍💻

---

## Overview
This project examines global COVID-19 data to uncover patterns in infection rates, mortality trends, and vaccination distribution across countries and continents. Using SQL for data analysis and Tableau for visualization, the study addresses critical questions about pandemic impact: Which countries experienced the highest infection rates relative to their population? How did mortality rates evolve? What was the pace of vaccine distribution globally?

![image alt](https://github.com/salt4data/eda-data-exploration/blob/f9b317b8d8485be150e1ec33d937b20e38ada379/Covid19_eda/Covid-19.png)

## Questions

- What is the case fatality rate by country and over time?
- Which countries had the highest infection rates relative to population size?
- How do death counts compare across continents?
- What are the global trends in cases, deaths, and mortality rates?
- What percentage of each country's population received at least one vaccine dose, and at what rate?


## Technical Approach
## Tools Used

- SQL (Microsoft SQL Server): Data extraction, transformation, and analysis
- Tableau: Interactive dashboard development and geographic visualization
- Technical Skills Applied: Joins, CTEs, temporary tables, window functions, aggregate functions, views, data type conversion, null handling

## Key Findings
**Global Impact**

**Total Cases:** 778,859,874
**Total Deaths:** 7,108,937
**Global Death Percentage:** Approximately 1%

## Continental Distribution
South America recorded the highest total death count (600K+), followed by Asia (550K+). Europe, Africa, and Oceania showed progressively lower mortality figures.

**Country-Level Insights**
- Infection rates varied significantly, with some countries reporting over 70% population infection at peak periods
- Death percentages were higher during early pandemic phases, declining as treatments improved
- The United States, China, India, Mexico, and United Kingdom exhibited distinct infection trajectory patterns

## Visualization Dashboard
The Tableau dashboard comprises four integrated components:

Global Numbers Summary: High-level metrics displaying total cases, deaths, and death percentage
Total Death per Continent: Bar chart comparing mortality burden across continents
Total Infection by Country: Choropleth map with color-coded intensity showing percentage of population infected
Percent Population Infected Over Time: Multi-country line chart with forecast indicators tracking infection trends

## Vaccination Analysis (SQL Only)

- Rolling vaccination data revealed substantial variation in adoption rates across countries
- Major population centers demonstrated different rollout curves, with acceleration occurring primarily in 2021-2022

## Dashboard Components

Global Numbers Summary: Total cases, deaths, and death percentage
Total Death per Continent: Bar chart comparing mortality burden
Total Infection by Country: Choropleth map showing percentage of population infected
Percent Population Infected Over Time: Multi-country line chart with forecast indicators

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
This analysis quantifies the substantial global impact of COVID-19, revealing significant geographic variation in infection rates, mortality, and vaccination adoption. The integration of SQL's analytical capabilities with Tableau's visualization tools enables comprehensive examination of pandemic dynamics across temporal and geographic dimensions.

## Future Research Directions:
Incorporate socioeconomic indicators, integrate booster vaccination data into visualizations, add viral variant analysis, and develop predictive models for pandemic forecasting.

## Data Source
**Source:** Our World in Data - COVID-19 Dataset
**URL:** https://ourworldindata.org/covid-deaths
**Last Updated:** November 29, 2025
**Coverage:** Multi-year pandemic tracking across global regions

