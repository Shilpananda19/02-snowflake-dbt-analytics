select
    product_id,
    product_name,
    category,
    count(distinct order_id) as total_orders,
    sum(quantity) as total_quantity,
    sum(order_total) as total_sales
from {{ ref('int_orders_enriched') }}
group by
    product_id,
    product_name,
    category