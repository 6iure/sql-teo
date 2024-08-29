--Ex2. Faça uma query que apresente o tamanho médio, 
--máximo e mínimo do nome do objeto por categoria

SELECT product_category_name,
    avg(product_name_lenght) as media_nome,
    max(product_name_lenght) as max_nome,
    min(product_name_lenght) as min_nome

FROM tb_products

GROUP BY product_category_name