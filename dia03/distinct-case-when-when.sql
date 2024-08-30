SELECT
    DISTINCT CASE WHEN product_category_name IS NULL THEN 'outros'

                    --pegando alimentos e alimentos e bebidas e colocando apenas em *alimentos*  
                    WHEN product_category_name = 'alimentos' 
                        or product_category_name = 'alimentos_bebidas' THEN 'alimentos'

                    --fazendo a mesma coisa, porem com IN 
                    WHEN product_category_name in ('artes', 'artes_e_artesanato') then 'artes'

                    -- mesma coisa porem com like
                    WHEN product_category_name LIKE "%artigos%" then 'artigos'

                ELSE product_category_name 
            END AS categoria_fillna

FROM tb_products

ORDER BY categoria_fillna