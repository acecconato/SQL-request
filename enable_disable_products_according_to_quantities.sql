/* We use them with a cronjob to enable/disable products according to the quantity */

// If product quantity < 1 then disable it
UPDATE ps_product_shop as p
LEFT JOIN ps_stock_available as s ON p.id_product = s.id_product
SET p.active = 0
WHERE s.quantity < 1;

// If product quantity > 0 then enable it
UPDATE ps_product_shop as p
LEFT JOIN ps_stock_available as s ON p.id_product = s.id_product
SET p.active = 1
WHERE s.quantity > 0;
