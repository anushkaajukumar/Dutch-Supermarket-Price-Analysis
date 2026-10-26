
CREATE VIEW combined_prices AS
SELECT *, 'Albert Heijn' AS store_name
FROM prices_albert_heijn
UNION ALL
SELECT *, 'Lidl' AS store_name
FROM prices_lidl;

-- Sanity checks ---------------------------------

-- Total combined row count 
SELECT COUNT(*) FROM combined_prices;

-- Row count broken out per store (
SELECT store_name, COUNT(*) AS row_count
FROM combined_prices
GROUP BY store_name;
