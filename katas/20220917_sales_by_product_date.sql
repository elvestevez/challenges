-- SELECT * FROM sales_details;
-- SELECT * FROM sales;
-- SELECT pr.name FROM products pr;


-- GROUPING SETS
SELECT pr.name as product_name, 
  extract(year from s.date)::smallint as year,
  extract(month from s.date)::smallint as month,
  extract(day from s.date)::smallint as day,
  sum(pr.price * sd.count) as total
FROM sales_details sd
  INNER JOIN sales s ON sd.sale_id = s.id
  INNER JOIN products pr ON sd.product_id = pr.id
GROUP BY
    GROUPING SETS (
        (pr.name,
         extract(year from s.date),
         extract(month from s.date),
         extract(day from s.date)),
        (pr.name,
         extract(year from s.date),
         extract(month from s.date)),
        (pr.name,
         extract(year from s.date)),
        (pr.name)
)
order by product_name, year, month, day;


-- ROLLUP
/*
SELECT pr.name as product_name, 
  extract(year from s.date)::smallint as year,
  extract(month from s.date)::smallint as month,
  extract(day from s.date)::smallint as day,
  sum(pr.price * sd.count) as total
FROM sales_details sd
  INNER JOIN sales s ON sd.sale_id = s.id
  INNER JOIN products pr ON sd.product_id = pr.id
GROUP BY pr.name,
    rollup(year, month, day)
ORDER BY product_name, year, month, day;
*/
