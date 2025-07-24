-- SQL PROJECT- MUSIC STORE DATA ANALYSIS
-- Question Set 1 - Easy

use music_database;
-- 1. Who is the senior most employee based on job title?

select *
from employee e
order by levels desc limit 1 ;


-- 2. Which countries have the most Invoices?

select count(invoice_id) as count_of_invoice_id, billing_country
from invoice
group by billing_country
order by count_of_invoice_id desc;

-- 3.What are top 3 values of total invoice?
 
 select invoice_id, total
 from invoice 
 order by total desc limit 3;

-- 4. Which city has the best customers?
--  We would like to throw a promotional Music Festival in 
--  the city we made the most money. Write a query that returns one
--  city that has the highest sum of invoice totals. Return both the city
--  name & sum of all invoice totals .

select  billing_city, sum(total) as sum_of_invoice_total
from invoice 
group by billing_city
order by sum_of_invoice_total desc limit 1 ;


-- 5. Who is the best customer? The customer who has spent 
-- the most money will be declared the best customer.
--  Write a query that returns the person who has spent the most money

select c.customer_id,c.first_name,c.last_name,c.city,
c.country,sum(i.total) as total_spend
from invoice i
join customers c 
on c.customer_id=i.customer_id
group by c.customer_id
order by total_spend desc limit 1;	


-- Question Set 2 – Moderate

-- 1. Write query to return the email, first name, last name, 
-- & Genre of all Rock Music listeners.
-- Return your list ordered alphabetically by email starting with A
				
    select  distinct c.email, c.first_name ,c.last_name,g.name AS genre_name
    from customers c 
    join invoice i  on c.customer_id= i.customer_id
    join invoice_line il on il.invoice_id=i.invoice_id
    join track t on il.track_id=t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    where g.name = 'Rock'
    order by c.email ASC;
    
    
    
-- 2.Let's invite the artists who have written the most rock music in our dataset.
--  Write a query that returns the
--  Artist name and total track count of the top 10 rock bands

select  a.name as artist_name,count(t.track_id) as total_track_id
from artist a 
join album ab on a.artist_id=ab.artist_id
join track t on t.album_id=ab.album_id
join genre g on t.genre_id= g.genre_id
where g.name='Rock'
group by a.name
order by total_track_id desc limit 10;


-- Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. 
-- Order by the song length with the longest songs listed first

-- 393733.3383

select name,milliseconds
from track
where milliseconds >(select avg(milliseconds) from track)
order by milliseconds desc;




