CREATE TABLE Book
(
    bookId    INTEGER NOT NULL PRIMARY KEY,
    bookTitle TEXT,
    month     TEXT,
    year      INTEGER,
    editor    INTEGER

);

CREATE TABLE Pub
(
    pubId  INTEGER NOT NULL,
    title  TEXT,
    bookId INTEGER NOT NULL,
    PRIMARY KEY (pubId, bookId),
    FOREIGN KEY (bookId) REFERENCES Book (bookId),
    UNIQUE (pubId)
);

CREATE TABLE Author
(
    authorId  INTEGER NOT NULL PRIMARY KEY,
    firstName TEXT,
    lastName  TEXT
);

CREATE TABLE AuthorPub
(
    authorId       INTEGER NOT NULL,
    pubId          INTEGER NOT NULL,
    authorPosition INTEGER NOT NULL,
    PRIMARY KEY (authorId, pubId),
    FOREIGN KEY (authorId) REFERENCES Author (authorId),
    FOREIGN KEY (pubId) REFERENCES Pub (pubId)
);

INSERT INTO Book(bookId, bookTitle, month, year, editor)
VALUES (1, 'CACM', 'April', 1960, 8),
       (2, 'CACM', 'July', 1974, 8),
       (3, 'BTS', 'July', 1948, 2),
       (4, 'MLS', 'November', 1936, 7),
       (5, 'Mind', 'October', 1950, NULL),
       (6, 'AMS', 'Month', 1941, NULL),
       (7, 'AAAI', 'July', 2012, 9),
       (8, 'NIPS', 'July', 2012, 9);

INSERT INTO Pub(pubId, title, bookId)
VALUES (1, 'LISP', 1),
       (2, 'Unix', 2),
       (3, 'Info Theory', 3),
       (4, 'Turing Machines', 4),
       (5, 'Turing Test', 5),
       (6, 'Lambda Calculus', 6);

INSERT INTO Author(authorId, firstName, lastName)
VALUES (1, 'John', 'McCarthy'),
       (2, 'Dennis', 'Ritchie'),
       (3, 'Ken', 'Thompson'),
       (4, 'Claude', 'Shannon'),
       (5, 'Alan', 'Turing'),
       (6, 'Alonzo', 'Church'),
       (7, 'Perry', 'White'),
       (8, 'Moshe', 'Vardi'),
       (9, 'Roy', 'Batty');

INSERT INTO AuthorPub(authorId, pubId, authorPosition)
VALUES (1, 1, 1),
       (2, 2, 1),
       (3, 2, 2),
       (4, 3, 1),
       (5, 4, 1),
       (5, 5, 1),
       (6, 6, 1);



SELECT *
FROM Author auth,
     Book bk
WHERE auth.authorId = bk.editor;



SELECT author.firstName, author.lastName
FROM Author auth
WHERE NOT EXISTS(
        SELECT 1
        FROM Book bk
        WHERE auth.authorId = bk.editor
    );



SELECT author.authorId
FROM Author auth
WHERE NOT EXISTS(
        SELECT 1
        FROM Book bk
        WHERE auth.authorId = bk.editor
    );