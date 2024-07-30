select c.CustomerId , inv.InvoiceId from customer  c 
LEFT OUTER JOIN invoice  inv on  c.CustomerId = inv.CustomerId 
where inv.InvoiceId is null ;