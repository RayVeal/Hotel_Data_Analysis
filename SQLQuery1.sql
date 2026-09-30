with hotels as(
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])

-- select * from hotels (whole graph)


-- sum of revenue while grouping the data by year
/*
select 
arrival_date_year,
round(sum((stays_in_week_nights + stays_in_weekend_nights) * adr),2)
as revenue from hotels group by arrival_date_year
*/

-- revenue trend by hotel type by grouping the data by hotel too
-- as revenue from hotels group by arrival_date_year, hotel

-- using other table ($)
-- select * from dbo.market_segment$

select * from hotels


/*
Preprocess some columns for PowerBI

First Left Join: Combines the hotels table with the market_segment table 
by matching the market_segment column in the “hotels” table with 
the market_segment.market_segment column.

Second Left Join: Combines the hotels table with the meal_cost table by 
matching the meal column in the hotels table and the meal_cost.meal column.
*/

left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = hotels.meal