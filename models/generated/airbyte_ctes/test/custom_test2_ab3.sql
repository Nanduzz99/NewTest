{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_test",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('custom_test2_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'brand_di',
        'created_on',
        'category_id',
        'display_name',
    ]) }} as _airbyte_custom_test2_hashid,
    tmp.*
from {{ ref('custom_test2_ab2') }} tmp
-- custom_test2
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at') }}

