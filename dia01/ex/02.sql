-- pordutos que tem mais de 5 litros

SELECT *,
    product_length_cm * product_height_cm * product_width_cm / 1000 as product_volume

from tb_products 

where product_volume > 5
