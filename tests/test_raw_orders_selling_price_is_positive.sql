with orders as (
    select * from {{ ref("raw_orders") }}
    )

select 
    orderid, 
    sum(ordersellingprice) as total_sp,
from orders
group by orderid
having total_sp < 0  -- condition: total of selling price is negative ; output : there are 2 orderid having negative selling price
