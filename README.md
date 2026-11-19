# Bank Loan & Credit Risk Analysis

Analysis of loan applicants to find which borrowers are more likely to default,
using Excel, Python, MySQL and Power BI.

## Dataset
Home Credit Default Risk (Kaggle): 307,507 loan applicants.
Download: https://www.kaggle.com/competitions/home-credit-default-risk
(The raw data is not uploaded because of its large size.)

## Tools Used
- Excel: data exploration, pivot tables
- Python (Google Colab): Pandas, NumPy, Matplotlib, Seaborn, SciPy,
  Scikit-learn, LightGBM, SHAP
- MySQL: database, joins, CTEs, window functions
- Power BI: 4-page interactive dashboard

## Project Workflow
Excel (explore) -> Python (clean, features, model) -> MySQL (analyze) -> Power BI (dashboard)

## Key Results
- Overall default rate: 8.07% (24,825 defaulters)
- Low-skill Laborers have the highest default rate (17.16%); Accountants the lowest (4.83%)
- Young borrowers default more (11.74%) than seniors (3.37%)
- LightGBM model: AUC 0.779, Gini 0.559, KS 0.420
- Risk Grades: default rate rises from 1.18% (Grade A) to 25.51% (Grade G)

## Dashboard Pages
1. Executive Dashboard
2. Risk Grade Analysis
3. Customer Segments
4. Financial Risk

## Folder Structure
- 03_Python: notebooks (cleaning, EDA, features, modeling, SQL prep)
- 04_SQL: database and query scripts
- 05_PowerBI: dashboard screenshots
- 06_Reports: charts and final insights report

## Notes
- Risk Grades are equal-sized groups of the model score (relative ranking).
- The 40% recovery rate in the dashboard is an assumption, not from data.
