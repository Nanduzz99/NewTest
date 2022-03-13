{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "test",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('custom_test1_ab3') }}
select
    brand_id,
    brand_name,
    created_on,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_custom_test1_hashid
from {{ ref('custom_test1_ab3') }}
-- custom_test1 from {{ source('test', '_airbyte_raw_custom_test1') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at') }}

