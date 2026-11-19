USE credit_risk;
SELECT @@local_infile;

LOAD DATA LOCAL INFILE 'C:/Users/HP/Desktop/Bank_Loan_Credit_Risk_Analysis/01_Dataset/Processed_Data/clients.csv'
INTO TABLE clients
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM clients;

USE credit_risk;

LOAD DATA LOCAL INFILE 'C:/Users/HP/Desktop/Bank_Loan_Credit_Risk_Analysis/01_Dataset/Processed_Data/bureau_summary.csv'
INTO TABLE bureau_summary
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM bureau_summary;


LOAD DATA LOCAL INFILE 'C:/Users/HP/Desktop/Bank_Loan_Credit_Risk_Analysis/01_Dataset/Processed_Data/prev_summary.csv'
INTO TABLE prev_summary
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM prev_summary;

SELECT Risk_Grade, COUNT(*) AS clients, ROUND(AVG(TARGET)*100,2) AS default_rate_pct
FROM clients
GROUP BY Risk_Grade
ORDER BY Risk_Grade;
