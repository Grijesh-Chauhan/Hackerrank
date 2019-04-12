select
    case
        when (a + b > c) and (b + c > a) and (c + a > b) then
            case
                when (a = b) and (a = c) then
                    'Equilateral'
                when (a = b) or (b = c) or (c = a) then
                    'Isosceles'
                else
                    'Scalene'
            end
        else
            'Not A Triangle'
    end as type
from triangles
;
