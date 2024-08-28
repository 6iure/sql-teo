-- count (*) vai contar quantas linhas foram retornadas

SELECT 
    count(*) as qtdeLinhas,
    count(product_id) as qtdeProdutos,
    count(DISTINCT product_id) as qtdeProdutosDistintos,
    count(DISTINCT product_category_name) as qtdeProdutosCategoriasDistintas

FROM tb_products

where product_category_name = 'artes'

