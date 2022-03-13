select
    a.brand_name,
    b.brand_id
from {{ ref('custom_test1') }} a
left join {{ ref('custom_test2') }} b
on a.brand_id = b.brand_di