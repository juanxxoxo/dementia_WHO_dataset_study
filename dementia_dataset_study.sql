-- INSIGHT NO. 1
SELECT *
FROM dementia_study.alcohol_use;

SELECT `Countries, territories and areas`, beverage_types, alcohol_per_capita_consumption_2009
FROM dementia_study.alcohol_use
WHERE alcohol_per_capita_consumption_2009 = (
    SELECT MAX(alcohol_per_capita_consumption_2009)
    FROM dementia_study.alcohol_use
    WHERE beverage_types NOT IN ('All types', 'Other alcoholic beverages')
);
-- Maximum alcohol per capita in the last year was Wine, 7.41 liters in France

SELECT 
    AVG(
        (alcohol_per_capita_consumption_2009 +
        alcohol_per_capita_consumption_2008 +
        alcohol_per_capita_consumption_2007 +
        alcohol_per_capita_consumption_2006 +
        alcohol_per_capita_consumption_2005) / 5
    ) AS average_last_5_years,
    
    AVG(
        (alcohol_per_capita_consumption_2004 +
        alcohol_per_capita_consumption_2003 +
        alcohol_per_capita_consumption_2002 +
        alcohol_per_capita_consumption_2001 +
        alcohol_per_capita_consumption_2000) / 5
    ) AS average_first_5_years
FROM dementia_study.alcohol_use
WHERE beverage_types = 'All types';
-- There is an increase of the 0.2 of Alcohol Consumption in the last 5 years compared to the first 5 years



-- INSIGHT NO. 2
SELECT *
FROM dementia_study.lack_physical_activity;

SELECT ROUND(AVG(Male), 2) AS avg_male_activity, ROUND(AVG(Female), 2) AS avg_female_activity
FROM dementia_study.lack_physical_activity
WHERE Year = 2016;
-- Women performed less physical activity in 2016

-- INSIGHT NO. 3

SELECT *
FROM dementia_study.dementia_awareness_campaing;

-- Let's compare only campaing but actually functioning 

SELECT COUNT(*) AS countries_awareness_campaign
FROM dementia_study.dementia_awareness_campaing
WHERE Existence_functioning_dementia_awareness_campaign_2017 LIKE '%Yes%';
-- 40 Campaings WW

SELECT COUNT(*) AS countries_prevention_campaign
FROM dementia_study.dementia_awareness_campaing
WHERE Existence_functioning_risk_reduction_campaign_2017 LIKE '%Yes%';
-- 27 Campaings WW

-- INSIGHT NO. 4

SELECT *
FROM dementia_study.published_research;

SELECT `Countries, territories and areas`, number_published_dementia_research_2017
FROM dementia_study.published_research
ORDER BY number_published_dementia_research_2017 DESC;

-- Top country with published researches is Australia with 70
-- 3 European countries in the top 5: France, Netherlands, Sweden
-- Japan second