-- Which city has the best customers? 
-- We would like to throw a promotional Music Festival in the city we made the most money.
SELECT  BILLING_COUNTRY, billing_city ,round(sum(total),2) as total_billing  FROM music_store_project.invoice
group by billing_city, billing_country
order by total_billing desc;

-- BEYONG PROJECT
SELECT  BILLING_COUNTRY, billing_city ,
		COUNT(customer_id) AS customers,
        count(*) as invoices,
        round(sum(total),2) as total_billing, 
        round(sum(total) / count(customer_id),2) as revernue_by_customer
        FROM music_store_project.invoice
group by billing_city, billing_country
order by total_billing desc limit 5;
