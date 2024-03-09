select
    -- from raw orders
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
    {{ markup_with_arg('ordersellingprice', 'ordercostprice')}} as markup_with_argument
from {{ ref("raw_orders") }} as o  -- raw.globalmart.orders
left join {{ ref("raw_customer") }} as c on o.customerid = c.customerid
left join {{ ref("raw_product") }} as p on o.productid = p.productid

-- {{ limit_data_in_dev('orderdate') }} -- to run a macro function to display only the orderid rows with order date under 30 days