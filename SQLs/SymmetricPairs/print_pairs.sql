/*

The orignal Functions table do not have `id`, So added synthetic unique ids to 
each row in the table FP1 and FP2 (both are same).

Now join symmetric condition is obvious. Added `FP1.id <> FP2.id` to prevent
join with same row

To pick on of the two symmetric rows, I used a trick from SO answer:
https://stackoverflow.com/a/6744815/1673391

*/

select distinct
    least(FP1.x, FP1.y) x,
    greatest(FP1.x, FP1.y) y
from (
    select
        @id1:=@id1+1 id, x, y
    from
        Functions,
        (select @id1:=0) _
    order by x, y
) FP1
join (
    select
        @id2:=@id2+1 id, x, y
    from
        Functions,
        (select @id2:=0) _
    order by x, y
) FP2
  on FP1.x = FP2.y and FP2.x = FP1.y and FP1.id <> FP2.id
order by
    x asc
;
