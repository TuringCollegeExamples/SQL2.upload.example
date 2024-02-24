# Interim findings

We explored the  podcast_reviews database that provides data on podcasts in the USA and is based on scraped iTunes data. The database provides 16 irregular scrapings from period  2021-05 to 2023-02. Data reveals the multifaceted nature of podcast categorization within the dataset, with some podcasts appearing in multiple categories (such as “arts” and “business”), including higher level and lower level category ones (“business” and “business-entrepreneurship”) at the same time.

This complexity needs to be considered when analyzing the data at the category level as this introduces double-counting (multiple-counting) of reviews in overlapping categories. Thus we suggest abstaining from using this approach.

Thus we provide two tables:

1. Identifying the top 5 categories based on review volume and, within those, the top podcasts by reviews. This method will include double-counting and will not be precise. However, given the data structure, there is not much we can do about it. And its closest to the initial request.

2. Focusing on the most reviewed podcasts irrespective of their categories, identifying the top 25 podcasts based solely on review counts - could be also a valuable information for the decision makers. This approach offers a straightforward view of the most popular podcasts without the complications of categorization and double counting of reviews.

## Top 5 categories and top 5 podcasts

This query identifies the top 5 categories with the most reviews from the podcast_reviews.categories table, and within those categories, it finds the top 5 podcasts based on the number of reviews. 

It uses two Common Table Expressions (CTEs): the first one (cat_reviews_count) to select the top categories, and the second one (top_podcasts_within_cat) to rank podcasts within these categories. The final SELECT statement then retrieves the category, the number of reviews for the category, podcast titles, and review counts for these top podcasts, ordering the results by category review count and individual podcast review count.

The table summarizes the top 5 podcasts within the top 5 categories based on the total number of reviews. The categories featured are "Society & Culture," "Comedy," "Education," "Business," and "News." Each category has an aggregate review count, with individual podcasts listed alongside their specific review counts. For instance, the "Society & Culture" category leads with 441,874 reviews across its top 5 podcasts, with "True Crime Obsessed" being the most reviewed podcast in this category with 7,310 reviews. Similarly, other categories follow this pattern, showcasing the diversity in content and audience engagement across different genres.

[Google Sheet: top_5_categories_with_top_5_podcasts](https://docs.google.com/spreadsheets/d/1IX_adfeEaSZjPxO-yo8rEE4H5bcUUAUs2Go7jSbJ8BI/edit?usp=sharing)

[SQL code for this query](../sql_scripts/top_5_categories_with_top_5_podcasts.sql)

## Top 25 podcasts across all categories

This query compiles a list of the top 25 podcasts based on the number of reviews in the podcast_reviews.reviews table. 

It creates a Common Table Expression (CTE) named top_25_podcasts that aggregates review counts for each podcast and selects the 25 with the highest counts. The final SELECT statement then joins this CTE with the podcast_reviews.podcasts table to retrieve the titles of these top podcasts along with their review counts.

The table provides a summary of the top 25 podcasts ranked by their review counts. "Crime Junkie" leads the list with 33,104 reviews, indicating its popularity. The genres vary widely, including true crime, comedy, education, and news, reflecting a diverse range of listener interests. Notably, "My Favorite Murder" and "Wow in the World" follow "Crime Junkie" with significant review counts, highlighting their strong listener engagement. The list also features well-known podcasts like "The Ben Shapiro Show," "The Joe Rogan Experience," and "Stuff You Should Know," showcasing their broad appeal. This summary underscores the wide appeal of these podcasts across different audience segments.

[Google Sheet: top_25_podcasts](https://docs.google.com/spreadsheets/d/1oLwfJSz78sYLPI1nvEHhNn_7NbYV9u_99qlhROj9jVc/edit?usp=sharing)

[SQL code for this query](../sql_scripts/top_25_podcasts.sql)

## Summary

Both strategies provide valuable insights but from different perspectives. The first method might overlook highly reviewed podcasts (such as “Crime Junkie”) in less popular categories (“True-Crimes”), while the second offers a direct measure of popularity, however omits the category labels being provided with it.
