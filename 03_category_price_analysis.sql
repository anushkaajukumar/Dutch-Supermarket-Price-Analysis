SELECT
    store_name,
    CASE
        WHEN category_clean = 'Vlees' THEN 'Meat'
        WHEN category_clean IN ('Bakkerij', 'Brood & bakker') THEN 'Bakery'
        WHEN category_clean IN ('Koffie, thee', 'Koffie') THEN 'Coffee & Tea'
        WHEN category_clean IN ('Groente, aardappelen', 'Fruit, verse sappen', 'Fruit & groenten') THEN 'Produce'
        WHEN category_clean IN ('Kaas', 'Assortiment kaas') THEN 'Cheese'
    END AS category_group,
    ROUND(AVG(price), 2) AS avg_price,
    COUNT(*) AS price-records
FROM combined_prices
WHERE price_date BETWEEN '2025-11-14' AND '2026-03-12'
GROUP BY
    store_name,
    CASE
        WHEN category_clean = 'Vlees' THEN 'Meat'
        WHEN category_clean IN ('Bakkerij', 'Brood & bakker') THEN 'Bakery'
        WHEN category_clean IN ('Koffie, thee', 'Koffie') THEN 'Coffee & Tea'
        WHEN category_clean IN ('Groente, aardappelen', 'Fruit, verse sappen', 'Fruit & groenten') THEN 'Produce'
        WHEN category_clean IN ('Kaas', 'Assortiment kaas') THEN 'Cheese'
    END
HAVING
    CASE
        WHEN category_clean = 'Vlees' THEN 'Meat'
        WHEN category_clean IN ('Bakkerij', 'Brood & bakker') THEN 'Bakery'
        WHEN category_clean IN ('Koffie, thee', 'Koffie') THEN 'Coffee & Tea'
        WHEN category_clean IN ('Groente, aardappelen', 'Fruit, verse sappen', 'Fruit & groenten') THEN 'Produce'
        WHEN category_clean IN ('Kaas', 'Assortiment kaas') THEN 'Cheese'
    END IS NOT NULL
ORDER BY category_group, store_name;

-- Findings (from actual run):
-- Category       | Albert Heijn | Lidl  | AH premium
-- Produce        | 3.22         | 1.83  | +76%
-- Coffee & Tea   | 5.96         | 3.81  | +56%
-- Meat           | 5.63         | 3.27  | +72%
-- Cheese         | 4.31         | 2.02  | +113%   (Lidl n=36, smaller sample)
-- Bakery         | 2.50         | 1.87  | +34%
--
-- Albert Heijn priced higher than Lidl in every category examined.
