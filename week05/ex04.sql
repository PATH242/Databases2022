create table SalesPerson(
  spId INTEGER PRIMARY KEY
);
create table Customer( 
  customerId INTEGER PRIMARY KEY
);
create table Mechanic( 
  mechanicId INTEGER PRIMARY KEY
);

create table Car(
  carId INTEGER PRIMARY KEY,
  customerId INTEGER,
  spId INTEGER,
  foreign key(spId) REFERENCES SalesPerson(spId),
  foreign key(customerId) REFERENCES Customer(customerId)
);

create table Invoice(
  invoiceId INTEGER PRIMARY KEY,
  carId INTEGER,
  invoiceDate date,
  foreign key(carId) REFERENCES Car(carId)
);
create table ServiceTicket(
  serviceId INTEGER PRIMARY KEY,
  customerId INTEGER,
  carSerialNumber VARCHAR(10),
  mechanicId INTEGER,
  serviceDate date,
  description VARCHAR(300),
  foreign key (customerId) REFERENCES Customer(customerId),
  foreign key (mechanicId) REFERENCES Mechanic(mechanicId)
);

create table CarDealerShip(
  carSerialNumber INTEGER,
  serviceId INTEGER,
  foreign key(serviceId) references ServiceTicket(serviceId)
);