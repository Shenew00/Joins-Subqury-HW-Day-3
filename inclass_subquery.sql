--MULTIJOIN
--CONNECT INFORMATION FROM 
--FILM => FILM ACTOR=> SCTOR TABLES

SELECT first_name, last_name, title
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
ORDER BY first_name;

--sub query
--you can make sub queries in 3 spots
-- SELECT, FROM, AD WHER STATEMENTS

--SELECT HEADERS_YOU_WANT_TO_SEE
--FROM TABLE_YOU_WANT_TO_PULL_FROL
--WHERE CONDITIONS_G0_HERE


--WHERE IS THE MOST COMMIN
--TURN 2 QUERIES INTO 1
--QUERY 1: FIND ALL PAYMENTS OVER $175 AND LOCATE THAT CUSTOMER

SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount)DESC
LIMIT 5;

--QUERY 2: GET CUSTOMER INFO
SELECT first_name, last_name, email
FROM customer;

--FINALLY, LETS PUT THESE 2 QUERIES TOGETHER
SELECT first_name, last_name, email
FROM customer
 WHERE customer_id in(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount)DESC
LIMIT 5
    );
    
   -- ANOTHER QUERY IN THE WHERE CLAUSE (USING JOINS) 
 
    
    

-- FROM CLAUSE SUB QUERY

FROM(   -- ANOTHER QUERY IN THE WHERE CLAUSE (USING JOINS) 
 SELECT first_name, last_name
FROM ( 
    SELECT first_name, last_name, title
    FROM actor
    INNER JOIN film_actor
    ON actor.actor_id = film_actor.actor_id
    INNER JOIN film
    ON film.film_id = film_actor.film_id
) AS actors_and_movie_title
WHERE title = 'Mulan Moon';


-- stored function and store procedure-- TWO PARAMATERS
SELECT *
FROM payment;




CREATE PROCEDURE late_fee_shoha(
    customer INTEGER,
    latefeeAmount NUMERIC (5,2)
 )  
 LANGUAGE plpgsql 
 AS 
 $$
 BEGIN
    -- ADD LATE FEE TO CUSTOMER
    UPDATE payment
    SET amunt = amount + lateFeeAmount
    WHERE customer_id =customer;
    LIMIT 1
    -- commit the above statement inside of a transaction
    COMMIT;
 END
 $$
;
-- CALL A STORED PROCEDURE
CALL late_fee_shoha (341,0.20)



SELECT*
FROM payment
WHERE customer_id = 341 LIMIT 1;


--stored functiions

SELECT*FROM actor ORDER BY actor_id DESC;


CREATE FUNCTION add_an_actor_shoha(
    actor INTEGER
    f_name VARCHAR(45),
    l_name VARCHAR(45),
    update TIMESTAMP WITHOUT TIME ZONE

)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAINS
BEGIN
-- insert into our actor table
INSERT INTO actor(actor_id, first_name,last_name,last_update)
VALUES (actor, f_name, l_name, updated);

END
$MAINS

--CALLING A FUNCTION IS DIFF FROM A PROCEDURE
-- DO NOT USE THE KEYWORD CALL
--INSTEAD USE SELECT

SELECT add_an_actor_shoha(902, 'Michael, 'Cera', NOW ():: TIMESTAMP

    