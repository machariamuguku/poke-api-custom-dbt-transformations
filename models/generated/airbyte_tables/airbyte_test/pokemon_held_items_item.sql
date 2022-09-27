{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    schema = "airbyte_test",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('pokemon_held_items_item_ab3') }}
select
    _airbyte_held_items_hashid,
    url,
    {{ adapter.quote('name') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_item_hashid
from {{ ref('pokemon_held_items_item_ab3') }}
-- item at pokemon/held_items/item from {{ ref('pokemon_held_items') }}
where 1 = 1

