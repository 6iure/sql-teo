-- Qual o valor total de receita gerada por clientes de cada estado?
-- Considere a base completa, com apenas t1 entregues

--* agrupar por clinete e estado e somar receita
--* tbcustomers, orders, order_items

SELECT 
    t1.order_status,
    t2.customer_state,
    sum(t3.price) as receita

from tb_orders as t1

LEFT JOIN tb_customers as t2
ON t1.customer_id = t2.customer_id

LEFT JOIN tb_order_items as t3
ON t3.order_id = t1.order_id

WHERE order_status = 'delivered'

GROUP BY customer_state