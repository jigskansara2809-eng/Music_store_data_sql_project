-- TOP 3 INVOICES BY ITS VALUES
SELECT ROUND(total, 2), billing_country FROM music_store_project.invoice
order by total desc limit 3;

-- ADVANCING QUERY WITH QUESTION 3
select invoice_id, billing_country, round(total,2) as total, value_rank
 from (
 SELECT invoice_id, billing_country, total, 
 dense_rank() over(order by round(total,2)desc) as value_rank
 from music_store_project.invoice
 )  ranked
 where value_rank<= 3
 order by value_rank, invoice_id;








