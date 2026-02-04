{% macro multiply(x,y,p) %}
    round({{ x }} * {{ y }},{{ p }})
{% endmacro %}

/*

{% macro name_of_macro(variables) %}
    {{ x * y}}
{% endmacro %}

*/