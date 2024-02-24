# Top Podcasts in the USA Analysis

## Introduction

This project delves into the `podcast_reviews` dataset from iTunes to identify the most prominent podcasts and categories, initiated by the "World of Science" journal's interest in potential podcast sponsorship opportunities.

## Dataset

The analysis utilizes the iTunes Podcast Reviews data, collected sporadically between May 2021 and February 2023, and accessible through Kaggle and BigQuery.

Metadata:

- **Author**: Stuart Axelbrooke
- **Sources**: iTunes Podcast Reviews
- **Collection Methodology**: Scraped from iTunes podcast review RSS feeds.
- **Data Source**: [Kaggle](https://www.kaggle.com/datasets/thoughtvector/podcastreviews)
- **DOI Citation**: 10.34740/kaggle/dsv/5138952
- **Data Licence**: CC BY-NC-SA 4.0

Accessed via BigQuery for in-depth analysis.

## File Descriptions

- **`report/`**: Contains the analytical outcomes, including the "Interim Findings" document, which provides preliminary insights into the most popular podcasts and categories.

- **`sql_scripts/`**: Houses the SQL queries crafted for data extraction and analysis:
  - `top_5_categories_with_top_5_podcasts.sql`: Extracts the top 5 podcasts within the top 5 categories based on review counts, aimed at uncovering popular content niches.
  - `top_25_podcasts.sql`: Lists the top 25 podcasts overall, ranked by the number of reviews, to highlight the most engaged-with content.

## Conclusion

Our analysis yields two distinct insights: one focusing on category-based popularity, albeit with some categorization overlaps, and another providing a straightforward count of reviews across all podcasts. Each perspective offers unique value depending on the specific interests and goals of the analysis.

## Contact

Should you have any questions, comments, or wish to engage in further discussion, feel free to reach out at justas.mundeikis@turing.com.
