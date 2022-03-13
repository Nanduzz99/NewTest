select
    a.brand_name,
    b.brand_id
from {{ ref('custom_test1') }} a
left join {{ ref('custom_test2') }} b
on a._airbyte_custom_test1_hashid = b._airbyte_custom_test2_hashid