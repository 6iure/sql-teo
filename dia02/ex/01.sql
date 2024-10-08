--Ex1. Faça uma query que apresente o tamanho médio, 
--máximo e mínimo da descrição do objeto por categoria

SELECT product_category_name,

    avg(product_description_lenght) as avg_desc, 
    max(product_description_lenght) as max_desc,
    min(product_description_lenght) as min_desc

FROM tb_products

GROUP BY product_category_name