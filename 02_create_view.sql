-- ============================================================
-- Dutch Supermarket Price Analysis
-- Step 2: Combine both stores into one view
-- ============================================================
-- UNION ALL stacks rows from two structurally identical tables
-- (same columns, same meaning) into one combined result.
-- A literal label is added to each half so rows can be traced
-- back to their source store after combining.
--
-- NOTE: UNION ALL matches columns by POSITION, not by name, so
-- both tables must have their columns in the same order for this
-- to combine correctly.
-- ============================================================

CREATE VIEW combined_prices AS
SELECT *, 'Albert Heijn' AS store_name
FROM prices_albert_heijn
UNION ALL
SELECT *, 'Lidl' AS store_name
FROM prices_lidl;

-- Sanity checks --------------------------------------------------

-- Total combined row count (expect ~ sum of both tables' row counts)
SELECT COUNT(*) FROM combined_prices;

-- Row count broken out per store (confirms the view combined correctly)
SELECT store_name, COUNT(*) AS row_count
FROM combined_prices
GROUP BY store_name;
