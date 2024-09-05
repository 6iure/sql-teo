-- receita por estado do seller, por produto da categoria mais vendida
-- use apenas vendas entregues 

--* o WITH cria uma nova tabela atraves dessa query
WITH tb_best_category as (

    SELECT 
        t2.product_category_name

    FROM tb_order_items as t1

    LEFT JOIN tb_products as t2
    ON t1.product_id = t2.product_id

    GROUP BY t2.product_category_name
    order BY count(*) DESC

    limit 3
), 

tb_receita_estado_produto as (

    SELECT 
        t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price) as receita

    FROM tb_order_items as t1

    LEFT JOIN tb_sellers as t2
    ON t1.seller_id = t2.seller_id

    LEFT JOIN tb_products as t3
    ON t1.product_id = t3.product_id

    INNER JOIN tb_venda as t4
    on t1.order_id = t4.order_id

    GROUP BY 
        t2.seller_state,
        t1.product_id,
        t3.product_category_name
),

tb_venda as (
    SELECT * 
    FROM tb_orders as t1

    WHERE t1.order_status = 'delivered'
)

SELECT * 
from tb_receita_estado_produto as t1

INNER JOIN tb_best_category as t2
ON t1.product_category_name = t2.product_category_name