create table Airport(
  IATACode INTEGER PRIMARY KEY
);
create table FlightLeg(
  flightLegId INTEGER PRIMARY KEY
);
create table Flight(
  flightNum INTEGER PRIMARY KEY,
  flightLegId INTEGER,
  foreign key(flightLegId) REFERENCES FlightLeg(flightLegId)
);
create table AircraftType(
  typeId INTEGER PRIMARY KEY
);
create table DailyFlightLegCombination(
  DFLegId INTEGER PRIMARY KEY
);
create table DailyFlightLeg(
  DFLegId INTEGER,
  flightLegId INTEGER,
  foreign key(DFLegId) REFERENCES DailyFlightLegCombination(DFLegId),
  foreign key(flightLegId) REFERENCES FlightLeg(flightLegId)
);
create table CanLand(
  IATACode INTEGER,
  typeId INTEGER,
  foreign key(IATACode) REFERENCES Airport(IATACode),
  foreign key(typeId) REFERENCES AircraftType(typeId)
);
create table startsAt(
  flightLegId INTEGER,
  IATACode INTEGER,
  foreign key(IATACode) REFERENCES Airport(IATACode),
  foreign key(flightLegId) REFERENCES FlightLeg(flightLegId)
);
create table endsAt(
  flightLegId INTEGER,
  IATACode INTEGER,
  foreign key(IATACode) REFERENCES Airport(IATACode),
  foreign key(flightLegId) REFERENCES FlightLeg(flightLegId)
);