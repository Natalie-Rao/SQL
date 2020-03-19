select username,activity,startDate,endDate   
from
(select *, rank() over (partition by username order by startDate desc) rank 
from UserActivity) t1
where rank = 2

union

select username,activity,startDate,endDate 
from UserActivity
where username in (select username from UserActivity group by username having count(*)=1)