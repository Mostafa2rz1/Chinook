select year(inv.InvoiceDate) as year , 
	sum(invl.Quantity) over ( partition by year(inv.InvoiceDate) order by inv.InvoiceId ) from invoice inv 
join invoiceline invl on invl.InvoiceId = inv.InvoiceId
