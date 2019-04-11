select
    IF(G.grade >= 8, S.name, NULL),
    G.grade,
    S.marks
from students S
join grades G
    on S.marks >= G.min_mark and S.marks <= G.max_mark
order by
    grade desc,
    name,
    marks asc    
;

