-- Who is the best customer5. Who is the best customer? 
-- The customer who has spent the most money will be declared the best customer.  
-- Write a query that returns the person who has spent the most money
SELECT customer.customer_id, first_name, last_name, round(sum(invoice.total),2) as Total_inv 
FROM music_store_project.customer
join
music_store_project.invoice
on customer.customer_id = invoice.customer_id
group by customer.customer_id, customer.first_name, customer.last_name
order by Total_inv desc limit 1;

