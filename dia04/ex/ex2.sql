-- Qual o valor total de receita gerada por sellers de cada estado? 
-- Considere a base completa, com apenas pedidos entregues

-- tbsellers, orders, order_items
-- order_id

SELECT 
    t1.order_id,
    t1.order_status,
    sum(t2.price) as receita,
    t3.seller_state

from tb_orders as t1

LEFT JOIN tb_order_items as t2
on t1.order_id = t2.order_id

LEFT JOIN tb_sellers as t3
on t2.seller_id = t3.seller_id

WHERE order_status = 'delivered'

GROUP BY seller_state
