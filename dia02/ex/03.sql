--Ex3. Faça uma query que apresente o tamanho médio, máximo e mínimo do nome 
--do objeto por categoria. 
--Considere apenas os objetos que tenham a descrição maior que 100.

SELECT product_category_name,
    avg(product_name_lenght) as media_nome,
    max(product_name_lenght) as max_nome,
    min(product_name_lenght) as min_nome

FROM tb_products

GROUP BY product_category_name

HAVING count(*) > 100