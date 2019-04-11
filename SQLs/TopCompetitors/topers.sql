select
    id,
    name
from (
    select
        H.hacker_id as id,
        H.name as name,
        count(S.challenge_id) as nchallanges
    from
        Hackers as H
    join
        Submissions as S
      on H.hacker_id = S.hacker_id
    join
        Challenges as C
      on C.challenge_id = S.challenge_id
    join 
        Difficulty as D
      on C.difficulty_level = D.difficulty_level
    where 
        D.score = S.score
    group by 
        id, 
        name
    having 
        nchallanges > 1
    order by 
        nchallanges desc, 
        id    
) as _
;

