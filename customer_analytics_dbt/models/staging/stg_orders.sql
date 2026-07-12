select

    order_id,

    customer_id,

    order_status,

    order_purchase_timestamp::timestamp as purchase_date,

    order_delivered_customer_date::timestamp as delivery_date

from public.olist_orders_dataset