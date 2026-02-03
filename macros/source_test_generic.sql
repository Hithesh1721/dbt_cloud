/* 
1. This is Generic  
2. There is 4 default generic test offered by dbt {

not_null                : Ensures no columns have null values
unique                  : Ensures each row in table is unique
accepted_values         : Ensures the column values are within the specified values
relationships           : Ensures the relationship between tables are correct 

}
3. we can create tests in macros | tests folder
*/

{% test booking_amount_min(model, column_name) %}

SELECT {{column_name}}
FROM {{ model }}
WHERE {{ column_name }} < 2000
{% endtest %}


