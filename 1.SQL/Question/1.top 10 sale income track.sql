WITH top10_table AS (
    SELECT invl.TrackId, SUM(invl.Quantity * invl.UnitPrice) AS total_sale
    FROM invoiceline invl
    GROUP BY invl.TrackId
    ORDER BY total_sale DESC
    LIMIT 10
)
SELECT t.TrackId, t.Name , invl.total_sale
FROM track t
RIGHT JOIN top10_table invl ON t.TrackId = invl.TrackId;
