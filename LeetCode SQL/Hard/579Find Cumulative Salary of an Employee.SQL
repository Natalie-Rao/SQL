select e2.Id,e2.Month, sum(e1.Salary) as Salary
from Employee e2 join Employee e1 on e1.Id = e2.Id and (e2.month-e1.month) between 0 and 2
where (e2.Id, e2.Month) not in (select Id, max(month) from Employee group by ID)
group by e2.Id,e2.Month
order by e2.Id,e2.Month desc