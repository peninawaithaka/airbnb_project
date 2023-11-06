-- macros - pieces of jinja code that can be reused multiple times
--macro name: no_nulls_in_columns


{% macro no_nulls_in_columns(model) %}
    select * from {{ model }} where
    {% for col in adapter.get_columns_in_relation(model) -%} --iterates through every column in the model  --hyphen deletes the white spaces
        {{ col.column }} is null or --check for nulls, or checks the other column in the loop
    {% endfor %}
    false --terminates the or

{% endmacro %}