select *
from {{ ref('stg_products') }}
where category not in (
    'Books',
    'Electronics',
    'Stationery'
)