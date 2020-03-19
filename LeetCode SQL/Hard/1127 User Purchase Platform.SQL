select T1.spend_date,T1.platform,ifnull(sum(total_amount),0) as total_amount,count(user_id) as total_users

from

(select distinct spend_date, 'desktop' as platform from Spending
union
select distinct spend_date, 'mobile' as platform from Spending
union
select distinct spend_date, 'both' as platform from Spending) as T1

left join 

(select user_id,spend_date, if(mobile_amount>0,if(desktop_amount>0,'both','mobile'),'desktop') as platform, (mobile_amount+desktop_amount) as total_amount
from 
(select user_id,spend_date, 
sum(case when platform = 'mobile' then amount else 0 end) as mobile_amount,
sum(case when platform = 'desktop' then amount else 0 end) as desktop_amount
from Spending
group by user_id,spend_date) as temp) as T2

on T1.spend_date =T2.spend_date and T1.platform = T2.platform
group by T1.spend_date,T1.platform
 