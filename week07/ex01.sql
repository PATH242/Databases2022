-- create a table
CREATE TABLE customer(
    customerId INTEGER PRIMARY KEY NOT NULL DEFAULT 0,
    customerName VARCHAR(50),
    city VARCHAR(30)
);
create table item(
    itemId INTEGER PRIMARY KEY NOT NULL DEFAULT 0,
    itemName VARCHAR(50),
    price NUMBER(11,2)
);
create table orderHistory(
    orderId INTEGER PRIMARY KEY NOT NULL DEFAULT 0, 
    customerId INTEGER,
    orderDate datetime,
    foreign key(customerId) REFERENCES customer(customerId)
);
create table orderDetails(
    orderId INTEGER,
    itemId INTEGER,
    quantity INTEGER,
    foreign key(itemId)  REFERENCES item(itemId),
    foreign key(orderId) REFERENCES orderHistory(orderId)
);

INSERT INTO customer(customerId, customerName, city) 
VALUES
    (101, 'Martin', 'Prague'),
    (107, 'Herman', 'Madrid'),
    (110, 'Pedro', 'Moscow');
    
INSERT INTO item (itemId, itemName, price)
VALUES
    (3786, 'Net', 35.00),
    (4011, 'Racket', 65.00),
    (9132, 'Pack3', 4.75),
    (5794, 'pack6', 5.00),
    (3141, 'Cover', 10.00);
insert into orderDetails (orderId, itemId, quantity) 
VALUES
    (2301,3876,3),
    (2301,4011,6),
    (2301,9132,8),
    (2302,5794,4),
    (2303,4011,2),
    (2303,3141,2);
    
insert into orderHistory (orderId, customerId, orderDate)
VALUES
    (2301, 101, '02-25-2011'),
    (2302, 107, '02-25-2011'),
    (2303, 110, '02-27-2011');
    
SELECT SUM(quantity), SUM(quantity * price)
    FROM orderDetails LEFT OUTER JOIN item
    on orderDetails.itemId = item.itemId
    GROUP by orderId;
Select customerName
    FROM ( (customer LEFT OUTER JOIN orderHistory
        on customer.customerId = orderHistory.customerId) LEFT OUTER JOIN item on
        orderHistory.itemId = item.itemId)
    where (SUM(quantity * price) >= (Select(SUM(quantity * price)
    FROM orderDetails LEFT OUTER JOIN item
    on orderDetails.itemId = item.itemId
    GROUP by orderId;)) )
    
    
