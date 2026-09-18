# Dutch-Supermarket-Price-Analysis
A comprehensive data analysis project utilizing SQL and Power Query to clean, standardize, and analyze premium and discount Dutch supermarket datasets (Lidl and Albert Heijn). 

#Data Dictionary 
*product_id: Unique identifier for the product
*product_description: Product name as listed by the store
*unit: Package size/quanitity
*category_clean: Standardized product category extracted from the original nested category path. 
*price_date: Date the price was recorded; sampled monthly for Albert Heijn and weekly for Lidl.
*price: Price in euros on the given date. NULL if no price was recorded that day.

# How do the prices between Albert Heijn (premium) and Lidl (discount) differ across common grocery store categories?

#Database & Schema: 
*Collected from Zenodo, initially in wide format with one column per date. 
*Albert Heijn Product/Row Count: 16,000 products & 501,364 rows
*Lidl Product/Row Count: 19,451 products & 333,616 rows

The Lidl dataset covered a significantly shorter date range of about 4 months, while Albert Heijn's dataset spanned 4+ years. To perform a proper analysis, Lidl was sampled weekly (5-9 days), while Albert Heijn was sampled monthly on the 1st of each month. The WHERE function was utilized to limit Albert Heijn's dataset.

Cleaning process: 
*The original data was in wide format, containing thousands of date columns. Power Query utilized the Unpivot feature to convert the format to long, resulting in a single column with dates.

*The SSMS import wizard has an import limit, resulting in a fillweight error if exceeded. The dataset had to be cleaned and minimized in Power Query before importing. 

