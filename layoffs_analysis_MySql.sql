-- NOW let's start our analysis journey

-- First, let's explore max and min layoffs.

SELECT MIN(total_laid_off) AS min_laid_off, MAX(total_laid_off) AS max_laid_off
FROM layoffs_staging2;

-- Now let's explore the total layoff around the world.

SELECT SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2;

-- Okay, let's explore which company has the most total laid off!

SELECT company, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC;

-- That's pretty good information!

-- Now let's explore which industry has the most total laid off!

SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC;

-- Now let's explore which country has the most total laid off!

SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;

-- Now let's play with window functions and explore the min laid off for each country.

SELECT DISTINCT country, MIN(total_laid_off) OVER(PARTITION BY country) AS min_laid_off_each_country
FROM layoffs_staging2
ORDER BY min_laid_off_each_country DESC;

-- And the max too!

SELECT DISTINCT country, MAX(total_laid_off) OVER(PARTITION BY country) AS max_laid_off_each_country
FROM layoffs_staging2
ORDER BY max_laid_off_each_country DESC;

-- Okay, let's find out which year had the most layoffs!

SELECT DISTINCT `date`, MAX(total_laid_off) max_laid_off_by_date
FROM layoffs_staging2
GROUP BY `date`
ORDER BY max_laid_off_by_date DESC;

-- And the min too!

SELECT DISTINCT `date`, MIN(total_laid_off) min_laid_off_by_date
FROM layoffs_staging2 
GROUP BY `date`
HAVING MIN(total_laid_off) IS NOT NULL
ORDER BY min_laid_off_by_date;

-- Okay, maybe we also want to know the min and max layoffs for each industry.

SELECT DISTINCT industry, MIN(total_laid_off) OVER(PARTITION BY industry) AS min_laid_off_each_industry
FROM layoffs_staging2
WHERE industry IS NOT NULL
ORDER BY min_laid_off_each_industry DESC;

-- And for max:

SELECT DISTINCT industry, MAX(total_laid_off) OVER(PARTITION BY industry) AS max_laid_off_each_industry
FROM layoffs_staging2
WHERE industry IS NOT NULL
ORDER BY max_laid_off_each_industry DESC;

-- Let's explore which year and month had the most layoffs.

SELECT MONTH(`date`) AS month, MAX(total_laid_off) AS max_laid_off_by_month
FROM layoffs_staging2
WHERE MONTH(`date`) IS NOT NULL
GROUP BY month
ORDER BY max_laid_off_by_month DESC;

-- And for the year.

SELECT YEAR(`date`) AS year, MAX(total_laid_off) AS max_laid_off_by_year
FROM layoffs_staging2
WHERE YEAR(`date`) IS NOT NULL
GROUP BY year
ORDER BY max_laid_off_by_year DESC;

-- Let's explore which year and month had the lowest layoffs.

SELECT MONTH(`date`) AS month, MIN(total_laid_off) AS min_laid_off_by_month
FROM layoffs_staging2
WHERE MONTH(`date`) IS NOT NULL
GROUP BY month
ORDER BY min_laid_off_by_month;

-- And for the year.

SELECT YEAR(`date`) AS year, MIN(total_laid_off) AS min_laid_off_by_year
FROM layoffs_staging2
WHERE YEAR(`date`) IS NOT NULL
GROUP BY year
ORDER BY min_laid_off_by_year;

-- Let's explore the average layoffs by date.

-- For the month.

SELECT MONTH(`date`) AS month, ROUND(AVG(total_laid_off), 2) AS avg_laid_off_by_month 
FROM layoffs_staging2
WHERE MONTH(`date`) IS NOT NULL
GROUP BY month
ORDER BY avg_laid_off_by_month DESC;

-- For the year.

SELECT YEAR(`date`) AS year, ROUND(AVG(total_laid_off), 2) AS avg_laid_off_by_year 
FROM layoffs_staging2
WHERE YEAR(`date`) IS NOT NULL
GROUP BY year
ORDER BY avg_laid_off_by_year DESC;

select count(*) from layoffs_staging2;
