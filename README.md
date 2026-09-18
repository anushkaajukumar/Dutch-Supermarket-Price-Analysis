# Dutch-Supermarket-Price-Analysis
A comprehensive data analysis project utilizing SQL and Power Query to clean, standardize, and analyze premium and discount Dutch supermarket datasets (Lidl and Albert Heijn). 

## How do the prices between Albert Heijn (premium) and Lidl (discount) differ across common grocery store categories?

## Database & Schema: 
* Collected from Zenodo, initially in wide format with one column per date. 
* Albert Heijn Product/Row Count: 16,000 products & 501,364 rows
* Lidl Product/Row Count: 19,451 products & 333,616 rows

The Lidl dataset covered a significantly shorter date range of about 4 months, while Albert Heijn's dataset spanned 4+ years. To perform a proper analysis, Lidl was sampled weekly (5-9 days), while Albert Heijn was sampled monthly on the 1st of each month. The WHERE function was utilized to limit Albert Heijn's dataset.

## Cleaning process: 
* The original data was in wide format, containing thousands of date columns. Power Query utilized the Unpivot feature to convert the format to long, resulting in a single column with dates.

* The SSMS import wizard has an import limit, resulting in a fillweight error if exceeded. The dataset had to be cleaned and minimized in Power Query before importing. 

* Metadata columns were included in the unpivot twice, resulting in mismatched data distributed throughout existing columns. The error was fixed once each column was selected and unpivoted manually.

* The product category fields used different structures and delimiters. Albert Heijn was backslash-separated with a fixed depth, while LIDL was forward slash-separated with a variable depth. The categories were extracted using a delimter based string-splitting. For Lidl, an if/then rule was implemented to use the more specific segment if it exists; otherwise, use the shallower one. 

* Categorization of products differed between the 2 stores. Manual verification was required to find categories that were fairly comparable between stores before merging data (EX: Albert Heijn separated 'Kaas' and 'Zuivel' while Lidl combines them into one category)

## SQL Techniques Used:
*UNION ALL: to combine two structurally identical tables.
*VIEW: saving the combined query for reuse.
*GROUP BY, AVG, COUNT, CASE: standardizing mismatched category names into groups.
*WHERE, BETWEEN: Restricting data to a fair window of time (~4 months).

## Findings
| Category | Albert Heijn | Lidl | AH Premium |
|---|---|---|---|
| Cheese | €4.31 | €2.02 | +113% |
| Meat | €5.63 | €3.27 | +72% |
| Produce | €3.22 | €1.83 | +76% |
| Coffee & Tea | €5.96 | €3.81 | +56% |
| Bakery | €2.50 | €1.87 | +34% |

* On average, Albert Heijn is significantly more expensive than Lidl, pricing higher in every category, ranging from about 34% to 113%.


## Data Dictionary 
* product_id: Unique identifier for the product
* product_description: Product name as listed by the store
* unit: Package size/quanitity
* category_clean: Standardized product category extracted from the original nested category path. 
* price_date: Date the price was recorded; sampled monthly for Albert Heijn and weekly for Lidl.
* price: Price in euros on the given date. NULL if no price was recorded that day.



## Limitations
* Lidl cheese had a marginal sample of only 36 products, so it should be trusted with less confidence than other categories.
* Limitations consist of the short date range for Lidl and manual category matching rather than direct. Only 5 categories were included in the analysis.

