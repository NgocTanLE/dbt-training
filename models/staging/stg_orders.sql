select
    -- from raw orders
    {{ dbt_utils.generate_surrogate_key(['o.orderid', 'o.customerid', 'o.productid']) }} as sk_orders, 
    -- This macro implements a cross-database way to generate a hashed surrogate key using the fields specified.
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    -- from raw customers
    c.customerid,
    c.customername,
    c.segment,
    c.country,
    -- from raw products
    p.productid,
    p.category,
    p.productname,
    p.subcategory,
    o.ordersellingprice - o.ordercostprice as orderprofit,
    {{ markup()}} as markup,
    {{ markup_with_arg('ordersellingprice', 'ordercostprice')}} as markup_with_argument,
    d.delivery_team
from {{ ref("raw_orders") }} as o  -- raw.globalmart.orders
left join {{ ref("raw_customer") }} as c on o.customerid = c.customerid
left join {{ ref("raw_product") }} as p on o.productid = p.productid
left join {{ ref('delivery_team') }} as d on d.shipmode = o.shipmode
-- {{ limit_data_in_dev('orderdate') }} -- to run a macro function to display only the orderid rows with order date under 30 days