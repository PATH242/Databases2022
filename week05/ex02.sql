create table CGroup(
  groupId INTEGER PRIMARY KEY
);
create table Company(
  companyId INTEGER PRIMARY KEY
);
create table Item(
   itemId INTEGER PRIMARY KEY
);
create table Plant(
  plantId INTEGER PRIMARY KEY
);
create table production(
  itemId INTEGER,
  plantId INTEGER,
  foreign key(itemId) references Item(itemId),
  foreign key(plantId) references Plant(plantId)
);
create table companyPlants(
  companyId INTEGER,
  plantId INTEGER,
  foreign key(companyId) references Company(companyId),
  foreign key(plantId) references Plant(plantId)
 );
 create table groupCompanies(
   companyId INTEGER,
   groupId INTEGER,
   foreign key(companyId) references Company(companyId),
   foreign key(groupId) references CGroup(groupId)
 );
create table Structure(
   company1 INTEGER,
   company2 INTEGER,
   foreign key(company1) references Company(companyId),
   foreign key(company2) references Company(companyId)
);