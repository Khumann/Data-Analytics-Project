select * from df_orders


/* find top 10 highest revenue products*/
select product_id, sum(sale_price) as sales
from df_orders
group by product_id
order by sales Desc;


/* find top 5 highest selling products in each region */
select region, sum(sale_price) as sales
from df_orders
group by region, product_id
order by region ,sales Desc;


/* write */
/***/
select region, sum(sale_price) as sales
from df_orders
group by region, product_id
order by region ,sales Desc;

/* top 5 highest selling products in each region*/
select region, product_id, sum(sale_price) as sales
from df_orders
group by region, product_id
order by region ,sales Desc;



/* highest selling products in each region with rank*/

with cte as (select region, sum(sale_price) as sales
from df_orders
group by region, product_id)
select *, rank() over (partition by region order by sales desc) as rn  
from cte 
where rn <= 5

/* find  growth comparison for 2022 and 2023 sales*/
 with cte as (select year(order_date) as order_year ,  sum(sale_price) as sales 
from df_orders
group by year(order_date), month(order_date)
order by year(order_date), month(order_date) ) 
select order_year
, case when order_year=2022 then sales else 0 end
, case when order_year=2023 then sales else 0 end
from cte 

/* for wach category which had highest salary*/
select category .  format (order_date, 'yyyyMM') AS order_year_match, sum(sale_price) as sales
from df_orders
group by category, format(order_date, 'yyyyMM')
order by category, format(order_date, 'yyyyMM')