create table addresses(
  addressId INTEGER PRIMARY KEY,
  city VARCHAR(100),
  district VARCHAR(100),
  street VARCHAR(100),
  houseN VARCHAR(50) 
 );
  
create table Customer(
  discount INTEGER,
  creditLimit decimal(9,3),
  balance decimal(9,3),
  customerId INTEGER PRIMARY KEY,
  addressId INTEGER,
  foreign key(addressId) REFERENCES addresses(addressId)
);
create table Item(
  itemId INTEGER PRIMARY KEY,
  description VARCHAR(300)
);
create table Manufacturer(
  manufacturerId INTEGER PRIMARY KEY,
  phonenumber INTEGER
);
create table Order_details(
   orderId INTEGER PRIMARY KEY,
   orderDate DATE,
   city VARCHAR(100),
   customerId INTEGER,
   foreign key(customerId) REFERENCES Customer(customerId),
   addressId INTEGER,
   foreign key(addressId) REFERENCES addresses(addressId)
 );
create table inclusion(
   orderId INTEGER,
   itemId INTEGER,
   foreign key(orderId) REFERENCES Order_details(orderId),
   foreign key (itemId) REFERENCES Item(itemId)
);
create table production(
  manufacturerId INTEGER,
  itemId INTEGER,
  foreign key (manufacturerId) REFERENCES Manufacturer(manufacturerId),
  foreign key (itemId) REFERENCES Item(itemId)
);
