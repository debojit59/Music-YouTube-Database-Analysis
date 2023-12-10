use music_youtube
# 1. who is the senior most employee based on the job title?

select*from employee order by levels desc limit 1;

#2. Which countries have the most invoices?

select billing_country, count(billing_country) as no_of_invoices 
from invoice 
group by billing_country 
order by no_of_invoices desc
limit 1;

#3. What are the top 3 values of total invoices?

select invoice_id, total as 'values' 
from invoice
order by total desc 
limit 3;  

#4. which city has the best customers? largest total invoice value.

select billing_city as city, sum(total) as total_value
from invoice
group by city
order by total_value desc
limit 1;

# who is the best customer? The most spent customer

select cr.customer_id, cr.first_name, cr.last_name, sum(inv.total) as total_purchase 
from customer as cr
join invoice as inv on cr.customer_id=inv.customer_id
group by cr.customer_id, cr.first_name, cr.last_name
order by total_purchase desc limit 1;

# Retrieve all the customer names and customer ids who listen to rock music.

select cr.first_name, cr.last_name, cr.email, gr.name from customer cr 
join invoice inv on cr.customer_id=inv.customer_id
join invoice_line invl on inv.invoice_id=invl.invoice_id
join track tr on invl.track_id=tr.track_id
join genre gr on gr.genre_id=tr.genre_id
group by cr.first_name, cr.last_name, cr.email, gr.name
having gr.name='rock'
order by cr.email;




#7.lets invite the artists who have written the most number of rock songs in our dataset. 
#write a query that returns the artist name and total track count of the top 10 rock bands.

select ar.name as artist_name, count(tr.track_id) as no_of_tracks from artist ar
join album al on ar.artist_id=al.artist_id
join track tr on al.album_id=tr.album_id
join genre gr on gr.genre_id=tr.genre_id
where gr.name='rock'
group by artist_name
order by no_of_tracks desc 
limit 10;

#8. return all the track names that have a song length longer than the average song length.
#return the name and miliseconds of all the tracks
#order by song length from greater to smaller

select tr.name as track_name, tr.milliseconds as time_in_milliseconds 
from track tr
where tr.milliseconds>(select avg(milliseconds) from track)
order by time_in_milliseconds desc;


#find how much amount spent by each customer on artists? 
#write a query to return customer name, artist name and total spent
SELECT
    CONCAT(cr.first_name, ' ', cr.last_name) AS customer_name,
    ar.name AS artist_name,
    SUM(invl.unit_price * invl.quantity) AS total_spent
FROM
    customer cr
JOIN
    invoice inv ON cr.customer_id = inv.customer_id
JOIN
    invoice_line invl ON inv.invoice_id = invl.invoice_id
JOIN
    track tr ON invl.track_id = tr.track_id
JOIN
    album al ON tr.album_id = al.album_id
JOIN
    artist ar ON al.artist_id = ar.artist_id
GROUP BY
    artist_name, customer_name
ORDER BY
    total_spent DESC;



#write a query that returns each country along with top genre. for countries 

#where the maximum number of purchases is shared return all genre
WITH popular_genre AS (
    SELECT
        COUNT(invoice_line.quantity) AS purchase,
        customer.country,
        genre.genre_id,
        ROW_NUMBER() OVER (PARTITION BY customer.country, genre.genre_id ORDER BY COUNT(invoice_line.quantity) DESC) AS row_no
    FROM
        invoice_line
    JOIN
        invoice ON invoice.invoice_id = invoice_line.invoice_id
    JOIN
        customer ON customer.customer_id = invoice.customer_id
    JOIN
        track ON track.track_id = invoice_line.track_id
    JOIN
        genre ON genre.genre_id = track.genre_id
    GROUP BY
        customer.country, genre.genre_id
    ORDER BY
        customer.country ASC, COUNT(invoice_line.quantity) DESC
)

SELECT * FROM popular_genre;

