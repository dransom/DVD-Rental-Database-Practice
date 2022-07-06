-- Question 1
SELECT  s.store_id store_id,
        DATE_PART('year', r.rental_date) rental_year,
        DATE_PART('month', r.rental_date) rental_month,
        COUNT(r.*) rental_count
FROM store s
JOIN staff st ON st.store_id = s.store_id
JOIN rental r ON r.staff_id = st.staff_id
GROUP BY 1, 2, 3
ORDER BY 4 DESC;

-- Question 2

-- Steps 1) compile table of top 10 customers 2) agregagte their spending
WITH top_10 AS (
        SELECT  p.customer_id customer_id,
                c.first_name first_name,
                c.last_name last_name,
                SUM(p.amount) spent
        FROM payment p 
        JOIN customer c ON c.customer_id = p.customer_id
        GROUP BY 1, 2, 3
        ORDER BY 4 DESC
        LIMIT 10
)


SELECT  DATE_TRUNC('month', p.payment_date) pay_mon,
        tt.first_name || ' ' || tt.last_name fullname,
        COUNT(p.*) pay_countpermon,
        SUM(p.amount) pay_amountpermon
FROM payment p
JOIN top_10 tt ON tt.customer_id = p.customer_id
GROUP BY 1, 2
ORDER BY 2, 1;

-- Question 3
WITH top_10 AS (
        SELECT  p.customer_id customer_id,
                c.first_name first_name,
                c.last_name last_name,
                SUM(p.amount) spent
        FROM payment p 
        JOIN customer c ON c.customer_id = p.customer_id
        GROUP BY 1, 2, 3
        ORDER BY 4 DESC
        LIMIT 10
    ),

    monthly_payment_10 AS (
        SELECT  DATE_TRUNC('month', p.payment_date) pay_mon,
                tt.first_name || ' ' || tt.last_name fullname,
                COUNT(p.*) pay_countpermon,
                SUM(p.amount) pay_amountpermon
        FROM payment p
        JOIN top_10 tt ON tt.customer_id = p.customer_id
        GROUP BY 1, 2
        ORDER BY 2, 1
    )
SELECT  pay_mon,
        fullname,
        pay_amountpermon,
        pay_amountpermon - LAG(pay_amountpermon) OVER (PARTITION BY fullname) lag_diff
FROM monthly_payment_10
ORDER BY 2, 1;
