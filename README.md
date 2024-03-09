Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test

#### Types of tests
- singular - a specific test for a specific model
- generic tests - scalable tests where you write a few lines of yml code and then testing a model or a column

- unique - every value in a column of a model is unique
- not null - every value in a column of a model is not null
- accepted value - every value in a column exists in a given lists
- relationships - each value in a column exists in a column of another table

Examples: 

dbt test -s source:globalmart  -- singular test

dbt test -s test_raw_orders_selling_price_is_positive  -- generic test

dbt docs generate -- to generate documentation in dbt project

### Jinja syntax

```
-- jinja syntax
-- declare a variable
{%- set category = ["Furniture", "Office", "Technology"] -%}

select orderid,
    {% for category in category %}  -- une boucle for ... endfor
        sum(case when category = '{{category}}' then orderprofit end) as {{category}}_orderprofit -- display sum of order profit by category
    {% if not loop.last %} , {% endif %}  -- if ... endif
    {% endfor %}
    from {{ ref('stg_orders') }}
    group by 1
```

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
