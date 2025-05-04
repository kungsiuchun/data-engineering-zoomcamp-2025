{#
    This macro returns the occurrences of the audience_segment 
#}

{% macro count_greater_than(column_name) %}
  {{ return(sql_expression_count_greater_than(column_name)) }}
{% endmacro %}


{% macro sql_expression_count_greater_than(column_name) %}
  {% if target.type == 'snowflake' %}
    length(regexp_replace({{ column_name }}, '[^>]', ''))
  {% elif target.type == 'bigquery' %}
    LENGTH(REGEXP_REPLACE({{ column_name }}, '[^>]', ''))
  {% elif target.type == 'spark' %}
    length(regexp_replace({{ column_name }}, '[^>]', ''))
  {% elif target.type == 'postgres' %}
    length(regexp_replace({{ column_name }}, '[^>]', '', 'g'))
  {% else %}
    {{ exceptions.raise_compiler_error("Target database type " ~ target.type ~ " is not supported for this macro.") }}
  {% endif %}
{% endmacro %}