-- analyze the cumulative revenue generated over time

select order_date,
sum(revenue) over (order by order_date) as cumulative 
from 
(select orders.order_date,
sum(pizzas.price * orders_details.quantity) as revenue 
from orders_details join pizzas
on pizzas.pizza_id = orders_details.pizza_id
join orders
on orders.order_id = orders_details.order_id
group by orders.order_date)as sales ;