SELECT c.customer_id, c.email, 
  COUNT(*) payments_count, 
  --COUNT(p.payment_id) payments_count, -- mejor realizar el conteo por id
  --SUM(p.amount) total_amount -- falla por el tipo de datos, requiere que sea float
  --SUM(p.amount::float) total_amount -- otra manera de convertir a float
  CAST(SUM(p.amount) AS FLOAT) total_amount -- convertir a float
FROM CUSTOMER c
  INNER JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.email
ORDER BY total_amount DESC
LIMIT 10

