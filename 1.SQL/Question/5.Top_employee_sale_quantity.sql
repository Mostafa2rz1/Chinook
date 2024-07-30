select e.EmployeeId , e.FirstName , e.LastName , e.Title , e.Country , e.Phone
  , sum(invl.Quantity)  Quantity_sale from employee e
left join customer c on e.EmployeeId = c.SupportRepId
join invoice inv on  c.CustomerId = inv.CustomerId
join  invoiceline invl on inv.InvoiceId = invl.InvoiceId
group by e.EmployeeId
limit 1;