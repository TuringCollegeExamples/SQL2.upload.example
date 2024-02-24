/*
Title: Top Podcasts in the USA Analysis
Author: Justas Mundeikis
Date: 2024-02-19
Version: 1.0

Purpose/Usage:
This query ranks the top 25 podcasts based on the total number of reviews they have received, providing insights into the most popular podcasts within the dataset. It's useful for identifying standout content in terms of listener engagement.

Input Data:
- `podcast_reviews.reviews`: Contains reviews for each podcast, including `podcast_id`.
- `podcast_reviews.podcasts`: Lists podcast titles and IDs.

Output:
A list of the top 25 podcasts with their respective review counts, ordered by popularity.

Dependencies:
None

Modification History:
- 2024-02-19: Initial version
*/

WITH top_25_podcasts AS (
  SELECT
    podcast_id,
    COUNT(*) AS cnt_reviews
  FROM
    `podcast_reviews.reviews`
  GROUP BY
    podcast_id
  ORDER BY
    cnt_reviews DESC
  LIMIT 25
)

SELECT
  podcasts.title,
  top_25_podcasts.cnt_reviews
FROM
  top_25_podcasts
LEFT JOIN
  `podcast_reviews.podcasts` AS podcasts ON top_25_podcasts.podcast_id = podcasts.podcast_id;