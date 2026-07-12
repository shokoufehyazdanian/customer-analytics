with customer_orders as (

    select

        o.customer_id,

        o.order_id,

        o.purchase_date

    from {{ ref('stg_orders') }} o

    where o.order_status = 'delivered'

),

customer_value as (

    select

        oi.order_id,

        sum(oi.price) as order_value

    from {{ ref('stg_order_items') }} oi

    group by 1

)


select

    co.customer_id,


    -- Frequency

    count(distinct co.order_id)
        as frequency,


    -- Monetary

    sum(cv.order_value)
        as monetary,


    -- Last purchase

    max(co.purchase_date)
        as last_purchase_date


from customer_orders co


left join customer_value cv

using(order_id)


group by

    co.customer_id