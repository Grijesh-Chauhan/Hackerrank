-- Read inner most comment first!

-- @not_max_nchallanes is a comma seprated string of numbers (because MySQL do not have array) which are duplicate e.g. create by more than 1 students but not the max one
set @not_max_nchallanges := (
    select GROUP_CONCAT(nchallenges)
    from (
        -- This `_` acually list "number" of challanges which are created by more than 1 student
        select
            nchallenges
        from (
            -- Temp Query is simple:- Evaluates `hacker_id` and number of challenges created by each
            select
                H.hacker_id,
                count(C.challenge_id) as nchallenges
            from Hackers as H
            join Challenges as C
                on H.hacker_id = C.hacker_id
            group by
                H.hacker_id
        ) as Temp
        group by
            nchallenges
        having
            count(Temp.hacker_id) > 1 
        order by
            nchallenges desc
        limit 1,18446744073709551615
    ) as _
);

/*
As explained Query in question:-
select hacker id, name and number of challenges created by each.
order by clause is also mentioned in the question description.
Having is to check 'number of challanges' those should be exclude -- if two students have same number of challenges and that is not max_challange (this is what the variable not `not_max_challenges` but duplicate)
*/
select
    H.hacker_id,
    H.name,
    count(C.challenge_id) as nchallenges
from Hackers as H
join Challenges as C
    on H.hacker_id = C.hacker_id
group by
    H.hacker_id,
    H.name
having not FIND_IN_SET(nchallenges, @not_max_nchallanges)
order by
    nchallenges desc,
    H.hacker_id
;
