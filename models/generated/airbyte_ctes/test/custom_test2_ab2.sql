{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_test",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('custom_test2_ab1') }}
select
    cast(brand_di as {{ dbt_utils.type_string() }}) as brand_di,
    cast(created_on as {{ dbt_utils.type_string() }}) as created_on,
    cast(category_id as {{ dbt_utils.type_float() }}) as category_id,
    cast(display_name as {{ dbt_utils.type_string() }}) as display_name,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('custom_test2_ab1') }}
-- custom_test2
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at') }}

