select
    name
from 
    Students S
join (
    select 
        F.id, 
        P.salary,
        F.friend_id, 
        PF.salary as friend_salary
    from
        Friends F
    join
        Packages P
        on F.id = P.id
    join
        Packages PF
        on F.friend_id = PF.id
    where
        P.salary < PF.salary
) Q
on S.id = Q.id
order by
    Q.friend_salary
;
