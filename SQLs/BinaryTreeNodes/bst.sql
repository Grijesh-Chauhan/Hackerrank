/* TODO add readme.md

Hit:-

    select 
        parent.n as node,
        node.n as child,
        parent.p as parent
    from 
        bst node        -- main node table
    right outer join   
        bst parent      -- Parent table
        on node.p = parent.n
    ;

*/


select distinct
    parent.n as node,
    case
        when parent.p is null then
            'Root'
        when node.n is not null and parent.p is not null then
            'Inner'
        when node.n is null and parent.p is not null then
            'Leaf'
    end as type
from
    bst as node
right outer join
    bst as parent
    on node.p = parent.n
order by 
    node
;






