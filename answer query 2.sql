-- which countries have most invoices
SELECT  count(*) as no_of_invoices , billing_country
from music_store_project.invoice
group by billing_country 
order by no_of_invoices desc limit 1 ;

-- ADVANCING THE SAME QUERY
select billing_country, 
		count(*) as invoice_count,
        ROUND(sum(total), 2) as revenue,
        round(avg(total),2) as avg_invoices,
		round(100 * count(*) / sum(count(*)) over(), 1) as pct_of_invoices
        from music_store_project.invoice
        group by billing_country
        order by invoice_count desc;








