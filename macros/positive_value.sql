-- name of the macro: positive_value


{% test positive_value(model, column_name) %} --model and column_name are defined in the schema

select
    *
from 
    {{ model }}
    
where
    {{ column_name }} < 1

{% endtest %}