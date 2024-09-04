-- Qual o peso médio dos produtos vendidos por sellers de cada estado? 
-- Considere apenas o ano de 2017 e pedidos entregues nesta análise.

-- tbsellers, orders, order_items
-- t1.order_status, order_id
-- join na order items com order_id
-- join na tb_products com prd_id
-- join na tabela de sellers com seller_id da tabela de order items

select 
    t4.seller_state,
    avg(t3.product_weight_g) as peso_medio,
    strftime('%Y', t1.order_delivered_customer_date) as ano,
    t1.order_status

from tb_orders as t1

LEFT JOIN tb_order_items as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_products as t3
ON t2.product_id = t3.product_id

LEFT JOIN tb_sellers as t4
ON t2.seller_id = t4.seller_id

WHERE order_status = 'delivered'
AND strftime('%Y', order_delivered_customer_date) = '2017'

GROUP BY seller_state