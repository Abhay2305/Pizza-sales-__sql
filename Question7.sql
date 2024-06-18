-- Join relavant tables to find the category wise ditribution of pizzas

select category , count(name) from pizza_types
group by category;