select
    customer_id,
    customer_name,
    country,
    count(distinct order_id) as total_orders,
    sum(quantity) as total_quantity,
    sum(order_total) as total_spend,
    avg(order_total) as average_order_value

from {{ ref('int_orders_enriched') }}

group by
    customer_id,
    customer_name,
    country