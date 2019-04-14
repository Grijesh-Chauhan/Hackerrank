select
    min(start_date) as start_date,
    max(end_date) as end_date
from (
    select
        start_date,
        end_date,
        IF(@last_date=end_date, @nproject, @nproject:=@nproject+1) as project_number,
        @last_date:=(end_date + INTERVAL 1 DAY)
    from
        Projects,
        (select @nproject := 0) as _,
        (select @last_date := (select min(end_date) from Projects)) as __
    order by
        start_date asc
) _
group by
    project_number
order by
    max(end_date) - min(start_date),
    min(start_date)
