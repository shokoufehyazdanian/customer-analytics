with product_sales as (

    select

        product_id,

        count(distinct order_id)
            as total_orders,

        sum(price)
            as total_revenue,

        avg(price)
            as average_price


    from {{ ref('stg_order_items') }}

    group by product_id

),


product_info as (

    select

        product_id,

        product_category_name


    from {{ ref('stg_products') }}

),


reviews as (

    select

        order_id,

        avg(review_score)
            as average_review_score


    from {{ ref('stg_reviews') }}

    group by order_id

)


select


    ps.product_id,


    pi.product_category_name,


    ps.total_orders,


    ps.total_revenue,


    ps.average_price,


    avg(r.average_review_score)
        as average_review_score


from product_sales ps


left join product_info pi

using(product_id)


left join {{ ref('stg_order_items') }} oi

using(product_id)


left join reviews r

using(order_id)


group by

    ps.product_id,

    pi.product_category_name,

    ps.total_orders,

    ps.total_revenue,

    ps.average_price