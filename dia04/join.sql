--qual a receita de cada categoria de produto? 
--e o total de vendas
--em unidades e em pedidos

--*fazendo um join entra as tabelas de venda e produtos,
--*tendo como referencia a tabela de vendas
--*trazendo apenas as colunas selecionadas abaixo

SELECT 
        vendas.order_id	,
        vendas.order_item_id,	
        vendas.product_id,
        vendas.price,
        produtos.product_category_name

FROM tb_order_items as vendas --tabela de vendas

LEFT JOIN tb_products as produtos
ON vendas.product_id = produtos.product_id