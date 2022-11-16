{{
    config(
        materialized='table'
    )
}}

WITH fct_reviews AS(
    SELECT * FROM {{ ref('fct_reviews') }}
),
full_moon_dates AS(
    SELECT * FROM {{ ref('modified_full_moon_dates') }}
)

SELECT
 fct.*,
 CASE 
  WHEN fm.full_moon_date IS NULL THEN 'No full moon'
  ELSE 'full moon'
 END AS is_full_moon
FROM
 fct_reviews fct
LEFT JOIN
 full_moon_dates fm
ON (TO_DATE(fct.review_date) = DATEADD(DAY, 1, fm.full_moon_date))