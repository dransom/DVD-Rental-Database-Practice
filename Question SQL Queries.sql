-- Slide 1
WITH quart_rental_duration AS (
                SELECT	f.title title,
                        c.name category,
                        fc.category_id cat_id,
                        f.rental_duration rental_duration,
                        NTILE (4) OVER (ORDER BY f.rental_duration) standard_quartile
                FROM film f
                JOIN film_category fc ON fc.film_id = f.film_id
                JOIN category c ON c.category_id = fc.category_id
                WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
)
SELECT  category,
        standard_quartile,
        COUNT(rental_duration) film_count
FROM quart_rental_duration
GROUP BY 1, 2
ORDER BY 1, 2;

-- Slide 2
SELECT  s.store_id store_id,
        DATE_PART('year', r.rental_date) rental_year,
        DATE_PART('month', r.rental_date) rental_month,
        COUNT(r.*) rental_count
FROM store s
JOIN staff st ON st.store_id = s.store_id
JOIN rental r ON r.staff_id = st.staff_id
GROUP BY 1, 2, 3
ORDER BY 1 ;


-- Slide 3
SELECT  c.name category,
        COUNT(r.*) rental_count
FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
GROUP BY 1
HAVING c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
ORDER BY 2 DESC;

-- Slide 4
WITH quart_rental_duration AS (
                SELECT	f.title title,
                        c.name category,
                        fc.category_id cat_id,
                        f.rental_duration rental_duration,
                        NTILE (4) OVER (ORDER BY f.rental_duration) standard_quartile
                FROM film f
                JOIN film_category fc ON fc.film_id = f.film_id
                JOIN category c ON c.category_id = fc.category_id
                WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
)
SELECT  category,
        standard_quartile,
        COUNT(rental_duration) film_count
FROM quart_rental_duration
GROUP BY 1, 2
ORDER BY 1, 2;