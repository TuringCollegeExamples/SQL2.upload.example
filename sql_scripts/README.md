# SQL Scripts Summary

This folder contains SQL scripts for analyzing top podcasts in the USA, dated 2024-02-19. Below is a brief overview of each script:

### `top_5_categories_with_top_5_podcasts.sql`
- **Objective**: Identifies top 5 categories and their top 5 podcasts by review count.
- **Data Sources**: `podcast_reviews.categories`, `podcast_reviews.reviews`, `podcast_reviews.podcasts`.
- **Output**: List of top 5 categories with top 5 podcasts in each.
- **Run Recommendation**: Off-peak hours to reduce server load.

### `top_25_podcasts.sql`
- **Objective**: Ranks the top 25 podcasts by total review count.
- **Data Sources**: `podcast_reviews.reviews`, `podcast_reviews.podcasts`.
- **Output**: Top 25 podcasts ordered by popularity.

**Note**: Ensure database access permissions before execution. Refer to the main `README.md` for any issues or detailed instructions.