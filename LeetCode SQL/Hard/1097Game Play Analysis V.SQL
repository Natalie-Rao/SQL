select install_dt,count(distinct install_player_id) as installs, 
round(sum(case when datediff(log_back_date,install_dt)=1 then 1 else 0 end)/count(distinct install_player_id),2) as Day1_retention

from 
(
select install_dt, a2.player_id as install_player_id, a2.event_date as log_back_date
from    
(select player_id, min(event_date) as install_dt from Activity group by player_id) as a1
left join Activity a2 on a1.player_id=a2.player_id  
) as a

group by install_dt