{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    schema = "_airbyte_airbyte_test",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('pokemon_moves_versio__details_version_group_ab1') }}
select
    _airbyte_version_group_details_hashid,
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('pokemon_moves_versio__details_version_group_ab1') }}
-- version_group at pokemon/moves/version_group_details/version_group
where 1 = 1

