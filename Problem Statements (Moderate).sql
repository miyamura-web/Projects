-----Q1: Write query to return email, first name, last name and genre of all rock music listeners. Return your list ordered alphabetically by email starting with A.

select distinct email,first_name,last_name from customer as c
join invoice as i on c.customer_id=i.customer_id
join invoice_line as l on i.invoice_id=l.invoice_id
where track_id in(
     select track_id from track
     join genre on track.genre_id=genre.genre_id
     where genre.name like 'Rock'
)
order by email;


-----Q2: Lets's invite the artists who have written the most rock music in our dataset.Find artist name and total track count of top 10 rock bands.

select artist.artist_id, artist.name,count(artist.artist_id) as number_of_songs 
from track
    join album on album.album_id = track.album_id
    join artist on artist.artist_id = album.artist_id
    join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10;


-----Q3:Return all track names that have a song length longer than the avg song length. Return name & milliseconds for each track. Put longer songs first.

select track.name, track.milliseconds from track
where milliseconds > (
select avg(milliseconds) as avg_track_length from track
)
order by milliseconds desc;











