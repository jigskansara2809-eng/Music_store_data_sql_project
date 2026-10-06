-- 7. Let's invite the artists who have written the most rock music in our dataset. 
-- Write a query that returns the Artist name and total track count of the top 10 rock bands.

SELECT ar.artist_id, g.name as Genre , ar.name as Artist_name, count(*) as number_of_songs 
FROM music_store_project.genre g
join music_store_project.track t
on g.genre_id = t.genre_id
join music_store_project.album a
on t.album_id = a.album_id
join music_store_project.artist ar
on a.artist_id = ar.artist_id
where g.name = "Rock"
group by ar.artist_id, ar.name
order by number_of_songs desc limit 10 ;