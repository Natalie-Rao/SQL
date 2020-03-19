select T1.pay_month, T1.department_id, 
case when dept_avg>comp_avg then 'higher'
     when dept_avg<comp_avg then 'lower'
     else 'same' end as comparison
from    
(select left(S.pay_date,7) as pay_month,E.department_id,
sum(S.amount)/count(distinct S.employee_id) as dept_avg
from salary S join employee E on S.employee_id = E.employee_id
group by pay_month,department_id) as T1

left join 

(select left(S.pay_date,7) as pay_month,sum(S.amount)/count(distinct S.employee_id) as comp_avg
from salary S 
group by pay_month) as T2

on T1.pay_month = T2.pay_month