WITH sale_table AS (
    SELECT invl.TrackId, SUM(invl.Quantity)  AS Quantity_sum , sum(invl.UnitPrice) as  total_sale
    FROM invoiceline invl
    GROUP BY invl.TrackId 
    order by Quantity_sum desc , total_sale desc
)

SELECT g.Name as genre_name , sum(Quantity_sum) as Quantity , sum(total_sale) as total_sale
FROM track t
JOIN sale_table invl ON t.TrackId = invl.TrackId
join genre g on t.GenreId = g.GenreId  
group by t.GenreId
order by Quantity desc , total_sale desc
limit 1
;

