--Visualization on Tableau--

--1st Table for Visualization

Select
	SUM(new_cases) as total_cases,
	SUM(cast (new_deaths as decimal)) as total_deaths,
	(SUM(cast (new_deaths as decimal)))/(SUM(new_cases))*100 as DeathPercentage
From [Portfolio Project]..CovidDeaths
--Where location like '%Bangladesh%'
where continent is not null
order by 1,2


--2nd Table for visualizaion
Select
	Location,
	Sum(cast (new_deaths as decimal)) as TotalDeathCount
From [Portfolio Project]..CovidDeaths
where continent is null
and location not in ('World', 'High income','Upper middle income', 
'Lower middle income', 'European Union','Low income','International')
Group by Location
order by TotalDeathCount desc


--3rd Table for Visualization
Select
	Location,
	population,
	MAX(cast (total_cases as decimal)) as HighestInfectionCount,
	Max(cast (total_cases as decimal)/population)*100 as PercentPopulationInfected
From [Portfolio Project]..CovidDeaths
Group by Location, population
order by PercentPopulationInfected desc


--4th Table for Visualization
Select
	Location,
	population,
	date,
	MAX(cast (total_cases as decimal)) as HighestInfectionCount,
	Max(cast (total_cases as decimal)/population)*100 as PercentPopulationInfected
From [Portfolio Project]..CovidDeaths
Group by Location, population, date
order by PercentPopulationInfected desc
