WITH total_sale AS (
    SELECT invl.TrackId, SUM(invl.Quantity * invl.UnitPrice) AS total_sale
    FROM invoiceline invl
    GROUP BY invl.TrackId
    ORDER BY total_sale DESC
)
select c.CustomerId , sum(total_sale) C_sale from customer c
left join invoice inv on  c.CustomerId = inv.CustomerId
join  invoiceline invl on inv.InvoiceId = invl.InvoiceId
join total_sale ts on ts.TrackId = invl.TrackId
GROUP BY c.CustomerId
having C_sale > ( 
					select avg(TotalPurchase) from (  
													select c.CustomerId ,
														sum(total_sale) as TotalPurchase from customer c
													left join invoice inv on  c.CustomerId = inv.CustomerId
													join  invoiceline invl on inv.InvoiceId = invl.InvoiceId
													join total_sale ts on ts.TrackId = invl.TrackId
													GROUP BY c.CustomerId)
					as Subquery
				) ;

