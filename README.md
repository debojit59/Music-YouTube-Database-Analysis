#Music YouTube Database Analysis.

This project involves querying a hypothetical "Music YouTube" database to extract meaningful insights and answer
various questions about the music industry, customers, and artists. The database schema includes tables such as
employee, invoice, customer, track, genre, and more.

#SQL Queries and Analysis:
Senior Most Employee Based on Job Title:

Identifying the most senior employee based on job title by ordering the records by levels in descending order.
Countries with the Most Invoices:

Determining the countries with the highest number of invoices by grouping data based on billing_country.
Top 3 Values of Total Invoices:

Retrieving the top 3 values of total invoices by ordering the records by total in descending order.
City with the Best Customers (Largest Total Invoice Value):

Identifying the city with the best customers based on the largest total invoice value.
Best Customer (Most Spent):

Determining the best customer who has spent the most by joining the customer and invoice tables.
Customers Listening to Rock Music:

Retrieving customer names and IDs for those who listen to rock music, based on the genre table.
Top 10 Rock Bands by Track Count:

Inviting the artists who have written the most number of rock songs by analyzing track and genre data.
Tracks Longer Than Average Song Length:

Listing track names with song lengths longer than the average song length.
Amount Spent by Each Customer on Artists:

Calculating the amount spent by each customer on artists by joining multiple tables.
Countries and Top Genre:

Analyzing the dataset to find the top genre for each country based on the maximum number of purchases.
#Techniques Used:
SQL Joins: Combining data from multiple tables to retrieve meaningful information.
Grouping and Aggregation: Utilizing GROUP BY and aggregate functions to summarize data.
Sorting Data: Using ORDER BY to sort query results.
Subqueries and Common Table Expressions (CTEs): Employing subqueries and CTEs for complex analyses.
Window Functions: Leveraging the ROW_NUMBER() window function to rank records.
Feel free to explore the SQL queries and adapt them to your own database or use them as a reference for similar analyses
.The project aims to provide insights into customer behavior, popular genres, and artist performance within the music industry.
