select

    o.order_id,

    o.customer_id,

    o.order_status,

    o.purchase_date,

    c.customer_state


from {{ ref('stg_orders') }} o

left join {{ ref('stg_customers') }} c

on o.customer_id = c.customer_id