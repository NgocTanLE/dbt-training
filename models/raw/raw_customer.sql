{{ config(materialized="table") }} select * from {{ source("globalmart", "customers") }}  -- raw.globalmart.customers
