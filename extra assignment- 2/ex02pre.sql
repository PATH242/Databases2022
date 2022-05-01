CREATE TABLE Purchases( 
	id BIGSERIAL PRIMARY KEY NOT NULL,	
	customer_id INTEGER NOT NULL
);
CREATE TABLE Products(
	id BIGSERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	details VARCHAR(150),
	price INTEGER NOT NULL,
	type VARCHAR(50) NOT NULL
);
CREATE TABLE Purchases_products_list(
	id BIGSERIAL PRIMARY KEY NOT NULL,
	purchase_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
 	foreign key(purchase_id) REFERENCES Purchases(id),
	foreign key(product_id) REFERENCES Products(id)

);
CREATE TABLE Sales(
	id BIGSERIAL PRIMARY KEY NOT NULL,
	type VARCHAR(50), 
	discount float
);