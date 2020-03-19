select D.name as Department ,E.Name as Employee, E.Salary as Salary
from
(select *, dense_rank() over (partition by DepartmentId order by Salary desc ) as rank
from Employee) E join Department D
on E.DepartmentId = D.Id
where rank<=3