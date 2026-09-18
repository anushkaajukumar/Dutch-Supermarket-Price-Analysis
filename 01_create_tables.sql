-- ============================================================
-- Dutch Supermarket Price Analysis
-- Step 1: Table schema
-- ============================================================
-- Raw price data was originally in wide format (one column per
-- date) and was reshaped into long format using Power Query
-- (Unpivot) before being imported here via the SSMS Import Wizard.
-- These CREATE TABLE statements document the resulting schema.
-- ============================================================

CREATE TABLE prices_albert_heijn (
    product_id          NVARCHAR(100)   NULL,
    product_description NVARCHAR(200)   NULL,
    unit                 NVARCHAR(100)   NULL,
    category_clean       NVARCHAR(300)   NULL,
    price_date           DATE            NOT NULL,
    price                DECIMAL(10,2)   NULL
);

CREATE TABLE prices_lidl (
    product_id          NVARCHAR(100)   NULL,
    product_description NVARCHAR(200)   NULL,
    unit                 NVARCHAR(100)   NULL,
    category_clean       NVARCHAR(300)   NULL,
    price_date           DATE            NOT NULL,
    price                DECIMAL(10,2)   NULL
);

-- Notes:
-- * price is DECIMAL(10,2), not FLOAT, to avoid floating-point
--   rounding errors on currency values.
-- * category_clean holds a standardized top-level category
--   extracted from each store's original nested category path
--   (Albert Heijn used backslash-separated paths with the real
--   category at a fixed depth; Lidl used forward-slash-separated
--   paths with variable depth, requiring fallback logic during
--   cleaning in Power Query).
-- * price_date is NOT NULL since every row originates from a
--   confirmed date column in the source file; all other text
--   columns allow NULL since real gaps exist in the source data.
