select * from {{source("Ankur's source", "USERS")}}

{%- set list_of_countries=dbt_utils.get_column_values(source("Ankur's source", "USERS"), 'COUNTRY') -%}
-- {{list_of_countries}}
{% for country in list_of_countries -%}
{{country+" is fun"}}
{% endfor %}

{%- set list_of_columns=adapter.get_columns_in_relation(source("Ankur's source", "USERS")) -%}
{% for cols in list_of_columns -%}
{{cols.column, cols.dtype}}
{% endfor %}