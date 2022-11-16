{{
    config(
        materialized='table'
    )
}}

WITH seed_full_moon_dates AS(
    SELECT TO_DATE(FULL_MOON_DATE,'DD-MM-YYYY') AS FULL_MOON_DATE FROM {{ ref('seed_full_moon_dates') }}
)
select *  from seed_full_moon_dates