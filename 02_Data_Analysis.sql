USE credit_risk;

WITH seg AS (
  SELECT NAME_INCOME_TYPE, COUNT(*) AS clients, AVG(TARGET) AS dr
  FROM clients GROUP BY NAME_INCOME_TYPE
)
SELECT NAME_INCOME_TYPE, clients, ROUND(dr*100,2) AS default_rate_pct
FROM seg
WHERE dr > (SELECT AVG(TARGET) FROM clients) AND clients >= 100
ORDER BY dr DESC;


SELECT OCCUPATION_TYPE, COUNT(*) AS clients,
       ROUND(AVG(TARGET)*100,2) AS default_rate_pct,
       RANK() OVER (ORDER BY AVG(TARGET) DESC) AS risk_rank
FROM clients GROUP BY OCCUPATION_TYPE;


WITH d AS (
  SELECT TARGET, NTILE(10) OVER (ORDER BY AMT_INCOME_TOTAL) AS income_decile
  FROM clients
)
SELECT income_decile, COUNT(*) AS clients, ROUND(AVG(TARGET)*100,2) AS default_rate_pct
FROM d GROUP BY income_decile ORDER BY income_decile;