{{ config(materialized="table") }} select * from {{ source("globalmart", "orders") }}  -- raw.globalmart.orders
