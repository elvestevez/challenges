-- GROCERY STORE: Support Local Products
select count(id) as products, country
from products
where country in('Canada', 'United States of America')
group by country
order by products desc;
