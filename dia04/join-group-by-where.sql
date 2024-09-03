-- considerando as vendas de 207 agora

SELECT 
        produtos.product_category_name,
        sum(vendas.price) as receita,
        count(*) as total_itens_vendidos,
        count(DISTINCT vendas.order_id) as qtde_pedidos,
        round(count(*) / CAST(count(DISTINCT vendas.order_id) as float), 2) as avg_item_por_pedido

FROM tb_order_items as vendas

LEFT JOIN tb_products as produtos
ON vendas.product_id = produtos.product_id

LEFT JOIN tb_orders as t3
ON vendas.order_id = t3.order_id

WHERE t3.order_status = 'delivered'
AND CAST (strftime("%Y", order_approved_at) AS int) = 2017

GROUP BY produtos.product_category_name
ORDER BY count(*) / CAST(count(DISTINCT vendas.order_id) as float) DESC
