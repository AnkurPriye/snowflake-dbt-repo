{% snapshot scd_table %}

-- check strategy
{{
    config(
        target_schema='Snapshot',
        strategy='check',
        unique_key='ID',
        check_cols=['FIRSTNAME', 'LASTNAME']
)}}

-- updated_at strategy
{{
    config(
        target_schema='snapshots',
        strategy='timestamp',
        unique_key='id',
        updated_at='updated_at',
    )
}}

select * from {{source("Ankur's source", "SCD_EG")}}
{% endsnapshot %}