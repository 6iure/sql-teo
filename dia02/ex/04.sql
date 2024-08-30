--Ex4. Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria.
--Considere apenas os objetos que tenham a descrição maior que 100.
--Exiba apenas as categorias com tamanho médio de descrição

SELECT product_category_name,
    avg(product_name_lenght) as media_nome,
    min(product_name_lenght) as min_nome,
    max(product_name_lenght) as max_nome

FROM tb_products

WHERE product_description_lenght > 100

GROUP BY product_category_name

HAVING avg(product_description_lenght) > 500

-- ordenando do maior para o maior
ORDER BY media_nome