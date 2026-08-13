select
    customer_id,
    customer_name,
    country,
    total_orders,
    total_quantity,
    total_spend,
    average_order_value
from {{ ref('int_customer_order_metrics') }}