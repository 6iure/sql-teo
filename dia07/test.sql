-- * cria uma tablea de vendas q olha apenas para os dias depois do 'disparo'
WITH tb_venda as (

    SELECT *
    from tb_orders as t1

    left JOIN tb_order_items as t2
    ON t1.order_id = t2.order_id

    -- * span de 10 dias
    WHERE order_approved_at >= '2018-07-01'
    and order_approved_at <= '2018-07-10'
)

SELECT 
    t1.flag_controle,
    avg(t2.price) as avg_venda, 
    count(*) as tamanho_amostra,
    count(DISTINCT t2.seller_id) as convertidos,
    count(DISTINCT t2.seller_id) / count(*) as taxa_conversao

FROM tb_audiencia_venda as t1

LEFT JOIN tb_venda as t2
ON t2.seller_id = t1.seller_id

GROUP BY t1.flag_controle