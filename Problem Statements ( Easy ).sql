----Q1:
SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1

-----Q2:
SELECT COUNT(*) AS c,billing_country FROM invoice
GROUP BY billing_country
ORDER BY c DESC

-----Q3:
SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3

-----Q4:
select sum(total) as invoice_total,billing_city from invoice
group by billing_city
order by invoice_total desc
limit 5


------Q5: 
Select c.customer_id,c.first_name,c.last_name, sum(i.total) as total from customer as c
join invoice as i
on c.customer_id=i.customer_id
group by c.customer_id
order by total desc
limit 1

