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

tb_seller_sort as (

    SELECT *,
        row_number() OVER ( PARTITION BY seller_id
                            order BY qtde_produto DESC, receita DESC ) as order_qtde

    FROM tb_seller_product
)

SELECT 
    seller_id,
    product_id,
    qtde_produto

FROM tb_seller_sort

WHERE order_qtde <= 5

