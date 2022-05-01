SELECT name FROM Products, Sales, Purchases_products_list
WHERE Products.type = Sales.type AND products_id = products.id;

SELECT customer(name), SUM(price * discount) FROM customer, purchases, purchases_products_list, products, sales
WHERE customers(id) = customer_id AND purchase_id = purchases(id) AND products(id) = product_id 
AND products(type) = sales(type) GROUP BY customer(name);

CREATE INDEX idx_typeS ON Sales USING HASH (type);
CREATE INDEX idx_typeP ON Products USING HASH(type);
