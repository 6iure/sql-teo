-- qual o produto mais caro 
-- q o seller ja vendeu
-- considere pedidos entregues

--* tabela q calcula o quanto de cada produto cada seller vendeu e sua receita
WITH tb_seller_product as (

    SELECT 
        seller_id,
        product_id,
        count(*) as qtde_produto,
        sum(price) as receita

    from tb_orders as t1

    LEFT JOIN tb_order_items as t2
    ON t1.order_id = t2.order_id

    WHERE order_status = 'delivered'

    GROUP BY 
        seller_id,
        product_id

    order BY seller_id
),

--* maximo de venda da tabela anterior por produto
tb_seller_max as (

    SELECT 
        seller_id,
        max(qtde_produto) as max_qtde

    from tb_seller_product

    GROUP BY seller_id
)

--* join entre as duas
SELECT 
    t1.*,
    t2.*

from tb_seller_max as t1

LEFT JOIN tb_seller_product as t2
on t1.seller_id = t2.seller_id
AND t1.max_qtde = t2.qtde_produto

