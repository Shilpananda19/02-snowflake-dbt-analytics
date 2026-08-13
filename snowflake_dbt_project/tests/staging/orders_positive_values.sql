select *
from {{ ref('stg_orders') }}
where quantity <= 0
   or unit_price < 0