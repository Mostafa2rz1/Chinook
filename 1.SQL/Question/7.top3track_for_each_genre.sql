WITH sale_table AS (
    SELECT invl.TrackId, SUM(invl.Quantity*invl.UnitPrice) as  total_sale
    FROM invoiceline invl
    GROUP BY invl.TrackId 
) ,
	ranked_sales as (
	SELECT g.Name as genre_name , g.GenreId, invl.total_sale
		, row_number() over (partition by g.GenreId order by total_sale desc) as row_id
	FROM track t
	JOIN sale_table invl ON t.TrackId = invl.TrackId
	join genre g on t.GenreId = g.GenreId  
)
SELECT genre_name , GenreId, total_sale
FROM ranked_sales
WHERE row_id <= 3;



