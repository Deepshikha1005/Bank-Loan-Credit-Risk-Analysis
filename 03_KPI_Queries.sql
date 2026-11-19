SELECT COUNT(*) AS total_clients, SUM(TARGET) AS defaulters,
       ROUND(AVG(TARGET)*100,2) AS default_rate_pct,
       ROUND(AVG(AMT_CREDIT),0) AS avg_credit,
       ROUND(AVG(ANNUITY_INCOME_RATIO)*100,1) AS avg_dti_pct
FROM clients;


SELECT Risk_Grade, COUNT(*) AS clients,
       ROUND(AVG(TARGET)*100,2) AS default_rate_pct,
       ROUND(SUM(CASE WHEN TARGET=1 THEN AMT_CREDIT ELSE 0 END)/1e6,1) AS default_credit_mn
FROM clients GROUP BY Risk_Grade ORDER BY Risk_Grade;





SELECT c.Risk_Grade,
       ROUND(AVG(b.bureau_loans),1) AS avg_bureau_loans,
       ROUND(AVG(b.bureau_active),1) AS avg_active_loans,
       ROUND(AVG(p.prev_refused/p.prev_apps)*100,1) AS avg_refusal_pct
FROM clients c
LEFT JOIN bureau_summary b ON c.SK_ID_CURR = b.SK_ID_CURR
LEFT JOIN prev_summary p ON c.SK_ID_CURR = p.SK_ID_CURR
GROUP BY c.Risk_Grade ORDER BY c.Risk_Grade;

CREATE OR REPLACE VIEW v_grade_summary AS
SELECT Risk_Grade, COUNT(*) AS clients,
       ROUND(AVG(TARGET)*100,2) AS default_rate_pct,
       ROUND(SUM(AMT_CREDIT)/1e6,1) AS total_credit_mn
FROM clients GROUP BY Risk_Grade;

SELECT * FROM v_grade_summary;