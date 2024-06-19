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