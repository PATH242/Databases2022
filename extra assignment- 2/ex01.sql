EXPLAIN SELECT DISTINCT Name FROM customer ORDER BY Name;

/*
                                                                QUERY PLAN
-----------------------------------------------------------------------------
 Sort  (cost=9268.22..9408.45 rows=56091 width=14)
   Sort Key: name
   ->  HashAggregate  (cost=4283.00..4843.91 rows=56091 width=14)
         Group Key: name
         ->  Seq Scan on customer  (cost=0.00..4033.00 rows=100000 width=14)
*/

EXPLAIN SELECT Name FROM customer WHERE LENGTH(Name) < 6;

/*
                                    QUERY PLAN
----------------------------------------------------------------
 Seq Scan on customer  (cost=0.00..4533.00 rows=33333 width=14)
   Filter: (length(name) < 6)
*/

EXPLAIN SELECT review FROM customer WHERE LENGTH(review) < 150;

/*
                             QUERY PLAN
-----------------------------------------------------------------
 Seq Scan on customer  (cost=0.00..4533.00 rows=33333 width=149)
   Filter: (length(review) < 150)
*/

EXPLAIN ANALYZE  SELECT MAX( LENGTH(Name) ) FROM customer;
/*
                                  QUERY PLAN
----------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=4533.00..4533.01 rows=1 width=4) (actual time=18.720..18.720 rows=1 loops=1)
   ->  Seq Scan on customer  (cost=0.00..4033.00 rows=100000 width=14) (actual time=0.013..5.413 rows=100000 loops=1)
 Planning Time: 0.137 ms
 Execution Time: 18.744 ms
*/



CREATE INDEX idx_name ON customer
(
Name
);
CREATE INDEX idx_review ON customer (
 LENGTH(review)
);
CREATE INDEX idx_length ON customer
(
LENGTH(Name)
);





 EXPLAIN SELECT DISTINCT Name FROM customer ORDER BY Name;
/*
                                         QUERY PLAN
---------------------------------------------------------------------------------------------
 Unique  (cost=0.42..3086.42 rows=56091 width=14)
   ->  Index Only Scan using idx_name on customer  (cost=0.42..2836.42 rows=100000 width=14)
*/

 EXPLAIN SELECT Name FROM customer WHERE LENGTH(Name) < 6;
/*                                       QUERY PLAN
--------------------------------------------------------------------------------------
 Index Only Scan using idx_name on customer  (cost=0.42..3336.42 rows=33333 width=14)
   Filter: (length(name) < 6)
*/


EXPLAIN SELECT review FROM customer WHERE LENGTH(review) < 150;
/*                           QUERY PLAN
-------------------------------------------------------------------------------
 Bitmap Heap Scan on customer  (cost=382.62..3915.62 rows=33333 width=149)
   Recheck Cond: (length(review) < 150)
   ->  Bitmap Index Scan on idx_review  (cost=0.00..374.29 rows=33333 width=0)
         Index Cond: (length(review) < 150)
*/
EXPLAIN ANALYZE  SELECT MAX( LENGTH(Name) ) FROM customer;
/*
   QUERY PLAN                                         
----------------------------------------------------------------------------------------------------------------------------------------------------
 Result  (cost=0.44..0.45 rows=1 width=4) (actual time=0.053..0.054 rows=1 loops=1)
   InitPlan 1 (returns $0)
     ->  Limit  (cost=0.29..0.44 rows=1 width=4) (actual time=0.051..0.051 rows=1 loops=1)
           ->  Index Scan Backward using idx_length on customer  (cost=0.29..14470.29 rows=99500 width=4) (actual time=0.050..0.050 rows=1 loops=1)
                 Index Cond: (length(name) IS NOT NULL)
 Planning Time: 0.185 ms
 Execution Time: 0.085 ms
*/
--we can clearly see how using indexes helps us sometimes when chosen correctly

