select a.AlbumId , a.Title , avg(t.Milliseconds) as track_time from track t
join album a on t.AlbumId = a.AlbumId 
group by a.AlbumId , a.Title
order by track_time desc;