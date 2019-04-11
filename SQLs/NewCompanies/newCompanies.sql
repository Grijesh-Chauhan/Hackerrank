

select
    C.company_code as code,
    C.founder as founder,
    count(distinct LM.lead_manager_code) as nleadmanagers,
    count(distinct SM.senior_manager_code) as nseniormanagers,
    count(distinct M.manager_code) as nmanagers,
    count(distinct E.employee_code) as nemployees
from
    company as C
join
    lead_manager as LM
    on C.company_code = LM.company_code
join
    senior_manager as SM
    on C.company_code = SM.company_code
join
    manager as M
    on C.company_code = M.company_code
join
    employee as E
    on C.company_code = E.company_code
group by
    code,
    founder
;
