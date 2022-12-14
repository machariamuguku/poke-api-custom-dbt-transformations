{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    schema = "airbyte_test",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('pokemon_stats_ab3') }}
select
    _airbyte_pokemon_hashid,
    stat,
    effort,
    base_stat,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_stats_hashid
from {{ ref('pokemon_stats_ab3') }}
-- stats at pokemon/stats from {{ ref('pokemon') }}
where 1 = 1

