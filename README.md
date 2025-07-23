# 💼 Layoffs Data Analysis Using MySQL

## 🧩 Problem Statement
We are analyzing layoffs data to identify which companies, industries, and countries experienced the most layoffs after the COVID-19 pandemic. The dataset used for this project was sourced from the Kaggle Layoffs Dataset.

## 🎯 Purpose of the Project
The primary objective of this project is to uncover patterns and insights from the layoffs dataset, focusing on industries and timeframes that influenced global workforce reductions.

## 📊 About the Data
The dataset provides information on layoffs across various companies around the world post-pandemic. It includes:
- **Rows:** 3,300  
- **Columns:** 9  

| Column              | Description                                     | Data Type   |
|---------------------|--------------------------------------------------|-------------|
| Company             | Name of the company                              | VARCHAR     |
| Location            | Headquarters location                            | VARCHAR     |
| Industry            | Sector of operation                              | VARCHAR     |
| Total Laid Off      | Number of employees laid off                     | INT         |
| Percentage Laid Off | Proportion of employees laid off                 | FLOAT       |
| Date                | Layoff occurrence date                           | DATETIME    |
| Stage               | Funding stage of the company                     | VARCHAR     |
| Country             | Country where the company is based               | VARCHAR     |
| Funds Raised        | Company’s raised capital (in Millions $)         | FLOAT       |

## 📌 Analysis List

### 🏭 Industry Analysis  
Identify which industries experienced the highest number of layoffs post-pandemic.

### 🏢 Company Analysis  
Discover which companies laid off the most employees.

### 🌍 Country Analysis  
Analyze layoff patterns across different countries to identify those most affected.

### 🚀 Stage Analysis  
Explore which company stages (e.g., startup, late-stage) were impacted most by layoffs.

## 🧹 Approach Used

### 1. Data Wrangling  
- Checked for duplicates and removed them  
- Standardized data formats  
- Identified and handled null or missing values using appropriate techniques  
- Removed irrelevant columns and rows for a cleaner dataset

> *Note: Some fields in the table contain null values. These were addressed as part of the data cleaning process.*

### 2. Exploratory Data Analysis (EDA)  
- Used SQL queries to explore key questions  
- Applied aggregate and window functions to discover patterns and trends over time
