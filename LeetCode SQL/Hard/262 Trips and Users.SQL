select Request_at as Day, round(sum(Cancelled)/count(*),2) as 'Cancellation Rate'
from
(select Request_at, case when T.Status = 'completed' then 0 else 1 end as Cancelled
from Trips T
where Client_Id not in (select Users_Id from Users where Banned = 'Yes') and
      Driver_Id not in (select Users_Id from Users where Banned = 'Yes') and
      Request_at between '2013-10-01' and '2013-10-03'
 )as temp
group by day