--quantos vendedores tem em cada estado


SELECT * 

FROM (

    SELECT seller_state,
        count(*) as qtde_vendedores

    FROM tb_sellers

    --* para pegar de cada estado pedido na aula
    --WHERE seller_state = 'SP'
    --OR seller_state = 'RJ'
    --OR seller_state = 'PR'

    GROUP BY seller_state
)

WHERE qtde_vendedores > 10
