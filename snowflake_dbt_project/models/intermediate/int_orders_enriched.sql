select
    o.order_id,
    o.order_date,
    o.customer_id,
    c.customer_name,
    c.country,
    o.product_id,
    p.product_name,
    p.category,
    o.quantity,
    o.unit_price,
    o.quantity * o.unit_price as order_total

from {{ ref('stg_orders') }} as o

left join {{ ref('stg_customers') }} as c
    on o.customer_id = c.customer_id

left join {{ ref('stg_products') }} as p
    on o.product_id = p.product_id