--*fazendo um join entra as tabelas de venda e produtos,
--*tendo como referencia a tabela de vendas
--*trazendo apenas as colunas selecionadas abaixo
--*somando o preco dos itens
--*e contando o total de itens vendidos
--*e contando os pedidos considerando os repetidos
--*agrupando pelo nome da categoria 
--*ordenando pelas mais vendidas 

SELECT 
        produtos.product_category_name,
        sum(vendas.price) as receita,
        count(*) as total_itens_vendidos,
        count(DISTINCT vendas.order_id) as qtde_pedidos

FROM tb_order_items as vendas

LEFT JOIN tb_products as produtos
ON vendas.product_id = produtos.product_id

GROUP BY produtos.product_category_name
ORDER BY sum(vendas.price) DESC
