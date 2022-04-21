EXPLAIN SELECT DISTINCT Name FROM customer ORDER BY Name;
/*
                                 QUERY PLAN
-----------------------------------------------------------------------------
 Sort  (cost=9109.37..9245.46 rows=54436 width=14)
   Sort Key: name
   ->  HashAggregate  (cost=4283.00..4827.36 rows=54436 width=14)
         Group Key: name
         ->  Seq Scan on customer  (cost=0.00..4033.00 rows=100000 width=14)
(5 rows)*/

EXPLAIN SELECT Name FROM customer WHERE LENGTH(Name) < 6;
/*
                           QUERY PLAN
----------------------------------------------------------------
 Seq Scan on customer  (cost=0.00..4533.00 rows=33333 width=14)
   Filter: (length(name) < 6)
(2 rows)*/

EXPLAIN SELECT review FROM customer WHERE LENGTH(review) < 150;
/*
                           QUERY PLAN
-----------------------------------------------------------------
 Seq Scan on customer  (cost=0.00..4533.00 rows=33333 width=149)
   Filter: (length(review) < 150)*/


CREATE INDEX index_name ON customer
(
Name
);
CREATE INDEX index_review ON customer USING hash
(
	review
);

 EXPLAIN SELECT DISTINCT Name FROM customer ORDER BY Name;
/*
                                          QUERY PLAN
-----------------------------------------------------------------------------------------------
 Unique  (cost=0.42..3082.42 rows=54436 width=14)
   ->  Index Only Scan using index_name on customer  (cost=0.42..2832.42 rows=100000 width=14)
(2 rows)
*/

 EXPLAIN SELECT Name FROM customer WHERE LENGTH(Name) < 6;
/*                                       QUERY PLAN
----------------------------------------------------------------------------------------
 Index Only Scan using index_name on customer  (cost=0.42..3332.42 rows=33333 width=14)
   Filter: (length(name) < 6)
(2 rows)*/


EXPLAIN SELECT review FROM customer WHERE LENGTH(review) < 150;
/*                           QUERY PLAN
-----------------------------------------------------------------
 Seq Scan on customer  (cost=0.00..4533.00 rows=33333 width=149)
   Filter: (length(review) < 150)
(2 rows)
*/
--we can clearly see how using indexes helps us sometimes when chosen correctly

