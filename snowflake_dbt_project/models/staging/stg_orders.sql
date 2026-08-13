select
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    unit_price
from {{ source('raw', 'orders') }}