WITH tb_seller_order as (
    
    SELECT 
        t1.order_id,
        date(t1.order_approved_at) as data_venda,
        t2.seller_id

    from tb_orders as t1

    LEFT JOIN tb_order_items as t2
    ON t1.order_id = t2.order_id

    WHERE order_status = 'delivered'
),

--* usando a window function pra remover as linhas duplicadas de dias de vendas
tb_seller_order_sort as (

    SELECT 
        *,
        row_number() OVER (PARTITION BY seller_id, data_venda) as date_seller_order

    from tb_seller_order
),

--* usando window function pra pegar o lag de uma compra e sua proxima
tb_seller_lag_data as (

    SELECT 
        order_id,
        seller_id,
        data_venda,
        lag(data_venda) OVER(PARTITION BY seller_id order BY data_venda) as lag_data_venda

    FROM tb_seller_order_sort 

    WHERE date_seller_order = 1 

)

--* calculando a diferenca em dias de cada venda dos sellers
SELECT 
    *,
    julianday(data_venda) - julianday(lag_data_venda) as diff_dias

FROM tb_seller_lag_data 

WHERE lag_data_venda is not NULL