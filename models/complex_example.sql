select * from {{source("Ankur's source", "PAYMENT_MODES")}}

select 
sum(case when PAYMENT_MODE='UPI' then sales end) as upi_sales,
sum(case when PAYMENT_MODE='CASH' then sales end) as cash_sales,
sum(case when PAYMENT_MODE='CC' then sales end) as cc_sales,
sum(case when PAYMENT_MODE='DC' then sales end) as dc_sales,
sum(case when PAYMENT_MODE='VOUCHER' then sales end) as VOUCHER_sales
from {{source("Ankur's source", "PAYMENT_MODES")}}

{%- set list_of_payments=dbt_utils.get_column_values(source("Ankur's source", "PAYMENT_MODES"), 'PAYMENT_MODE') -%}
select
{%- for pay_mode in list_of_payments %}
sum(case when PAYMENT_MODE='{{pay_mode}}' then sales end) as {{pay_mode | lower}}_sales
{%- if not loop.last -%},{%- endif -%}
{% endfor %}
from {{source("Ankur's source", "PAYMENT_MODES")}}

-- with index
{%- set list_of_payments=dbt_utils.get_column_values(source("Ankur's source", "PAYMENT_MODES"), 'PAYMENT_MODE') -%}
select
{%- for pay_mode in list_of_payments %}
sum(case when PAYMENT_MODE='{{pay_mode}}' then sales end) as {{pay_mode | lower}}_sales
{%- if loop.index!=list_of_payments | length -%},{%- endif -%}
{% endfor %}
from {{source("Ankur's source", "PAYMENT_MODES")}}

-- with loop.end
{%- set list_of_payments=dbt_utils.get_column_values(source("Ankur's source", "PAYMENT_MODES"), 'PAYMENT_MODE') -%}
select
{%- for pay_mode in list_of_payments %}
sum(case when PAYMENT_MODE='{{pay_mode}}' then sales end) as {{pay_mode | lower}}_sales
{%- if loop.index != loop.length -%},{%- endif -%}
{% endfor %}
from {{source("Ankur's source", "PAYMENT_MODES")}}