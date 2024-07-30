select c.CustomerId , count(distinct g.GenreId) genre_count from customer c
left join invoice inv on  c.CustomerId = inv.CustomerId
join  invoiceline invl on inv.InvoiceId = invl.InvoiceId
join  track t on t.TrackId = invl.TrackId
join genre g on  g.GenreId = t.GenreId
group by c.CustomerId
HAVING COUNT(DISTINCT g.GenreId) > 1;

