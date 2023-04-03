-- Get the id values of the first 5 clients from district_id with a value equal to 1. --
use bank;
SELECT client_id FROM bank.client
WHERE district_id = 1
Limit 5;

-- In the client table, get an id value of the last client --
-- where the district_id is equal to 72. --
SELECT client_id FROM bank.client
WHERE district_id = 72
ORDER BY client_id DESC
LIMIT 1;

-- Get the 3 lowest amounts in the loan table. --
SELECT amount FROM bank.loan
ORDER BY amount 
LIMIT 3;

-- What are the possible values for status, ordered alphabetically in ascending order in 
-- the loan table? -- 
SELECT DISTINCT status FROM bank.loan
ORDER BY status;

-- What is the loan_id of the highest payment received in the loan table?--
SELECT loan_id FROM bank.loan
ORDER BY payments desc
LIMIT 1;

-- What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id --
-- and the corresponding amount --
SELECT account_id, amount FROM bank.loan
ORDER BY account_id
LIMIT 5;

-- What are the top 5 account_ids with the lowest loan amount that have a loan --
-- duration of 60 in the loan table? --
-- SELECT * FROM bank.loan;

SELECT account_id FROM bank.loan
WHERE duration = 60
ORDER BY amount 
LIMIT 5;

-- What are the unique values of k_symbol in the order table? --

SELECT DISTINCT k_symbol FROM bank.order;

-- In the order table, what are the order_ids of the client with the account_id 34? 
SELECT order_id FROM bank.order
WHERE account_id = 34;

-- In the order table, which account_ids were responsible for orders between order_id 
-- 29540 and order_id 29560 (inclusive)?
SELECT DISTINCT account_id FROM bank.order
WHERE order_id BETWEEN 29540 and 29560;

-- In the order table, what are the individual amounts that were sent to 
-- (account_to) id 30067122?
-- SELECT * FROM bank.order

SELECT amount FROM bank.order
WHERE account_to = 30067122;

-- In the trans table, show the trans_id, date, type and amount of the 10 first 
-- transactions from account_id 793 in chronological order, from newest to oldest.

SELECT trans_id, date, type, amount FROM bank.trans
WHERE account_id = 793
ORDER BY date desc
LIMIT 10;

-- OPTIONAL --
-- In the client table, of all districts with a district_id lower than 10, 
-- how many clients are from each district_id? Show the results sorted by the district_id 
-- in ascending order.

SELECT COUNT(client_id) FROM bank.client 
WHERE district_id < 10 
GROUP BY district_id 
ORDER BY district_id;

-- In the card table, how many cards exist for each type? Rank the result starting with the 
-- most frequent type.
SELECT type, COUNT(type) FROM bank.card 
GROUP BY type 
ORDER BY COUNT(type) DESC;

