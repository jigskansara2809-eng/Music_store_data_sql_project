-- 8. We want to find out the most popular music Genre for each country. 
-- We determine the most popular genre as the genre with the highest amount of purchases. 
-- Write a query that returns each country along with the top Genre. 
-- For countries where the maximum number of purchases is shared return all Genres

with popular_genre as (

SELECT i.billing_country, count(l.quantity) as QTY, g.name as Genre,
row_number() over (partition by i.billing_country order by count(l.quantity) desc) as row_nummer
FROM music_store_project.invoice_line l
	join
	music_store_project.invoice i
	on l.invoice_id = i.invoice_id
	join
	music_store_project.customer c
	on c.customer_id = i.customer_id
	join
	music_store_project.track t
	on t.track_id = l.track_id
	join
	music_store_project.genre g
	on t.genre_id = g.genre_id
group by i.billing_country, g.name
order by 1,3 desc
) 
select * from popular_genre 
where row_nummer =1 ;