EXPLAIN ANALYZE
SELECT *
FROM purchases_products_list 
JOIN products ON 
products.id = purchases_products_list.product_id
JOIN sales ON 
products.type = sales.type;

CREATE INDEX idx_products ON products USING HASH (type DESC);
CREATE INDEX idx_sales ON sales USING hash (type DESC);

EXPLAIN ANALYZE
SELECT *
FROM purchases_products_list
JOIN products ON
products.id = purchases_products_list.product_id
JOIN sales ON 
products.type = sales.type;
