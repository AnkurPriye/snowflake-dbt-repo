-- select *,
-- ((sales_1-sales_2)/sales_2)*100 as change_1,
-- ((sales_2-sales_3)/sales_3)*100 as change_2,
-- ((sales_1-cost)/cost)*100 as change_3
--  from {{source("Ankur's source", "PERSON_SALES")}}

select *,
{{perc_change('sales_1', 'sales_2')}} as change_1,
{{perc_change('sales_1', 'sales_3')}} as change_2,
{{perc_change('sales_1', 'cost')}} as change_3
 from {{source("Ankur's source", "PERSON_SALES")}}