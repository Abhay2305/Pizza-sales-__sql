-- Calculate the percentage contribution of each pizza type to total revenue

SELECT 
    pizza_types.category,
    (SUM(pizzas.price * orders_details.quantity) / (SELECT 
            ROUND(SUM(orders_details.quantity * pizzas.price),
                        0) AS total_sales
        FROM
            orders_details
                JOIN
            pizzas ON pizzas.pizza_id = orders_details.pizza_id)) * 100 AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;