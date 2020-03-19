select Id,Company,Salary from

(select *, row_number () over (partition by Company order by Salary desc, Id desc) as rank_desc,
          row_number () over (partition by Company order by Salary asc, Id asc) as rank_asc
from Employee) as E
where rank_asc between rank_desc-1 and rank_desc+1
order by Company,Salary