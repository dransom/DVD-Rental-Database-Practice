# Sakila Movie Data - SQL 
## by Dane


## Overview

This project is some SQL query practice on the Sakila DVD Rental database; the Sakila Database holds information about a company that rents movie DVDs.  For this project, I queried the database to gain an understanding of the customer base, such as what the patterns in movie watching are across different customer groups, how they compare on payment earnings, and how the stores compare in their performance.  The database has the following schema:

![Sakila DVD ERD](Docs/dvd-rental-erd.png)

More information and the sample database can be found here: [https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)

This project answer two questions.

## Question 1

We want to understand more about the movies that families are watching. The following categories are considered family movies: Animation, Children, Classics, Comedy, Family and Music.

**Create a query that lists each movie, the film category it is classified in, and the number of times it has been rented out.**

## Question 2

Now we need to know how the length of rental duration of these family-friendly movies compares to the duration that all movies are rented for. **Can you provide a table with the movie titles and divide them into 4 levels (first_quarter, second_quarter, third_quarter, and final_quarter) based on the quartiles (25%, 50%, 75%) of the rental duration for movies across all categories?** Make sure to also indicate the category that these family-friendly movies fall into.

## Summary

The project is broken down into the following parts:

- A presentation summary, [Sakila DVD Rental Presentation](Docs/Sakila%20DVD%20Rental%20Presentation.pdf).  
- [Question SQL Queries](/Question%20SQL%20Queries.sql) that contains all the relevant SQL queries for the above presentation.
- [Question Set 1](/Docs/Question%20Set%201.sql) and [Question Set 2](/Docs/Question%20Set%202.sql) for any additional queries for the questions to help guide my thought process.
- Finally, a quick Excel file to help in building some simple visualizations for the project.
