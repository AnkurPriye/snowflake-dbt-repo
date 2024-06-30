{{
    config(
        materialized= 'incremental'
    )

}}

select * from {{source("Ankur's source", "dim_sales")}} t1
{% if is_incremental() -%}
where
t1.date > (select max(date) from {{this}})
{% endif %}
