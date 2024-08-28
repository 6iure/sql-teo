--quantos vendedores tem em cada estado (sp, rj e pr)

SELECT seller_state,
    count(*) as qtde_vendedores

FROM tb_sellers

--filtro pre agregacao
WHERE seller_state in ('SP', 'RJ', 'PR')

--agregação
GROUP BY seller_state

----filtro pos agregacao, que aqui esta removendo estaddos com menos de 10 sellers
HAVING count(*) > 10