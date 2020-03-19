select s.* from stadium s
left join stadium s1 on s.id-1 = s1.id
left join stadium s2 on s.id-2 = s2.id
left join stadium s3 on s.id+1 = s3.id
left join stadium s4 on s.id+2 = s4.id

where (s.people>=100 and s1.people>=100 and s2.people>=100) 
      or (s.people>=100 and s1.people>=100 and s3.people>=100) 
      or (s.people>=100 and s3.people>=100 and s4.people>=100)

order by id