select
    H.hacker_id,
    H.name,
    sum(S.score) as total_score
from
    Hackers H
join (
    select
        hacker_id,
        challenge_id,
        max(score) as score
    from (
        select
            *
        from
            Submissions
        order by
            score desc
    ) as T
    group by
        hacker_id,
        challenge_id
) as S on S.hacker_id = H.hacker_id
group by
    H.hacker_id,
    H.name
having
    total_score > 0
order by
    total_score desc,
    hacker_id asc
