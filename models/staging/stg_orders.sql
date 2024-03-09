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
    o.ordersellingprice - o.ordercostprice as orderprofit
from {{ ref("raw_orders") }} as o  -- raw.globalmart.orders
left join {{ ref("raw_customer") }} as c on o.customerid = c.customerid
left join {{ ref("raw_product") }} as p on o.productid = p.productid
