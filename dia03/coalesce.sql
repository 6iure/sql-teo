--coalesce substitiu o que ele encontra de nulos pelo nome que vc passar
SELECT DISTINCT coalesce(product_category_name, 'outros') as categoria_fillna

FROM tb_products

ORDER BY product_category_name