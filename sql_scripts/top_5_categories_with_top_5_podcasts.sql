/*
Title: Top Podcasts in the USA Analysis
Author: Justas Mundeikis
Date: 2024-02-19
Version: 1.0

Purpose/Usage:
This query identifies the top 5 podcasts within the top 5 categories based on the total number of reviews. It's intended to provide insights for content strategy and marketing decisions.

Input Data:
- `podcast_reviews.categories`: Contains podcast categories and IDs.
- `podcast_reviews.reviews`: Stores reviews for each podcast.
- `podcast_reviews.podcasts`: Lists podcast titles and IDs.

Output:
A list of top 5 categories and, within each, the top 5 podcasts by review count.

Dependencies:
None

Execution Instructions:
Execute the query during off-peak hours to minimize load on the database server.

Modification History:
- 2024-02-19: Initial version
*/

WITH cat_reviews_count AS (
 SELECT
   categories.category,
   COUNT(*) AS cnt_category_reviews 
 FROM
   `podcast_reviews.categories` AS categories
 JOIN
   `podcast_reviews.reviews` AS reviews ON categories.podcast_id = reviews.podcast_id
 GROUP BY
   categories.category
 ORDER BY
   cnt_category_reviews DESC
 LIMIT 5
),

top_podcasts_within_cat AS (
 SELECT
   cat_reviews_count.category,
   cat_reviews_count.cnt_category_reviews,
   categories.podcast_id,
   COUNT(*) AS cnt_reviews,
   RANK() OVER (PARTITION BY cat_reviews_count.category ORDER BY COUNT(*) DESC) AS rank
 FROM
   `podcast_reviews.categories` AS categories
 JOIN
   `podcast_reviews.reviews` AS reviews ON categories.podcast_id = reviews.podcast_id
 INNER JOIN
   cat_reviews_count AS cat_reviews_count ON categories.category = cat_reviews_count.category
 GROUP BY
   cat_reviews_count.category, cat_reviews_count.cnt_category_reviews, categories.podcast_id
)

SELECT
 top_podcasts_within_cat.category,
 top_podcasts_within_cat.cnt_category_reviews,
 -- top_podcasts_within_cat.podcast_id,
 podcasts.title,
 top_podcasts_within_cat.cnt_reviews AS review_count
FROM
 top_podcasts_within_cat
LEFT JOIN
 `podcast_reviews.podcasts` AS podcasts ON top_podcasts_within_cat.podcast_id = podcasts.podcast_id
WHERE
 top_podcasts_within_cat.rank <= 5
ORDER BY
 top_podcasts_within_cat.cnt_category_reviews DESC, review_count DESC;