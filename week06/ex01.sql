CREATE TABLE Suppliers
(
    sid     INTEGER NOT NULL PRIMARY KEY,
    sname   TEXT    NOT NULL,
    address TEXT    NOT NULL
);

CREATE TABLE Parts
(
    pid   INTEGER NOT NULL PRIMARY KEY,
    pname TEXT    NOT NULL,
    color TEXT    NOT NULL
);

CREATE TABLE Catalog
(
    sid  INTEGER NOT NULL,
    pid  INTEGER NOT NULL,
    cost REAL    NOT NULL,
    PRIMARY KEY (sid, pid),
    FOREIGN KEY (sid) REFERENCES Suppliers (sid),
    FOREIGN KEY (pid) REFERENCES Parts (pid)
);

INSERT INTO Suppliers(sid, sname, address)
VALUES (1, 'Yosemite Sham', 'Devil’s canyon, AZ'),
       (2, 'Wiley E. Coyote RR Asylum', 'NV'),
       (3, 'Elmer Fudd Carrot Patch', 'MN');

INSERT INTO Parts(pid, pname, color)
VALUES (1, 'Red1', 'Red'),
       (2, 'Red2', 'Red'),
       (3, 'Green1', 'Green'),
       (4, 'Blue1', 'Blue'),
       (5, 'Red3', 'Red');

INSERT INTO Catalog(sid, pid, cost)
VALUES (1, 1, 10.00),
       (1, 2, 20.00),
       (1, 3, 30.00),
       (1, 4, 40.00),
       (1, 5, 50.00),
       (2, 1, 9.00),
       (2, 3, 34.00),
       (2, 5, 48.00);



SELECT DISTINCT Sup.sname
FROM Suppliers Sup,
     Parts Prt,
     Catalog Ctg
WHERE Prt.color = 'Red'
  AND Ctg.pid = Prt.pid
  AND Ctg.sid = Sup.sid;



SELECT DISTINCT Ctg.sid
FROM Parts Prt,
     Catalog Ctg
WHERE (Prt.color = 'Red' OR Prt.color = 'Green')
  AND Ctg.pid = Prt.pid;



SELECT DISTINCT Sup.sid
FROM Suppliers Sup
WHERE Sup.address = '221 Packer Street'
   OR Sup.sid IN (
    SELECT Ctg.sid
    FROM Parts Prt,
         Catalog Ctg
    WHERE Prt.color = 'Red'
      AND Prt.pid = Ctg.pid
);



SELECT DISTINCT Ctg.sid
FROM Catalog Ctg
WHERE NOT EXISTS(
        SELECT Prt.pid
        FROM Parts prt
        WHERE (Prt.color = 'Red' OR Prt.color = 'Green')
          AND (NOT EXISTS(
                SELECT Ctg1.sid
                FROM Catalog Ctg1
                WHERE Ctg1.sid = Ctg.sid
                  AND Ctg1.pid = Prt.pid
            ))
    );



SELECT DISTINCT Ctg.sid
FROM Catalog Ctg
WHERE (NOT EXISTS(
        SELECT Prt.pid
        FROM Parts Prt
        WHERE Prt.color = 'Red'
          And (NOT EXISTS(
                SELECT Ctg1.sid
                FROM Catalog Ctg1
                WHERE Ctg1.sid = Ctg.sid
                  and Ctg1.pid = Prt.pid
            ))
    ))
   OR (NOT EXISTS(
        SELECT Prt1.pid
        FROM Parts Prt1
        WHERE Prt1.color = 'Green'
          AND (NOT EXISTS(
                SELECT Ctg2.sid
                FROM Catalog Ctg2
                WHERE Ctg2.sid = Ctg.sid
                  AND Ctg2.pid = Prt1.pid
            ))
    ));



SELECT DISTINCT Ctg.sid, Ctg1.sid
FROM Catalog Ctg1,
     Catalog Ctg1
WHERE Ctg1.pid = Ctg.pid
  AND Ctg1.sid != Ctg.sid
  And Ctg1.cost > Ctg.cost;

SELECT DISTINCT Ctg.pid
FROM Catalog Ctg
WHERE EXISTS(
              SELECT Ctg1.sid
              FROM Catalog Ctg1
              WHERE Ctg1.pid = Ctg.pid
                And Ctg1.sid != Ctg.sid
          );



SELECT Ctg.sid, AVG(Ctg.cost)
FROM Catalog Ctg,
     Parts Prt,
     Suppliers Sup
WHERE Ctg.sid = Sup.sid
  AND Ctg.pid = Prt.pid
  AND (Prt.color = 'Red' OR Prt.color = 'Green')
GROUP BY Ctg.sid;



SELECT DISTINCT Ctg.sid
FROM Catalog Ctg
WHERE Ctg.cost >= 50;