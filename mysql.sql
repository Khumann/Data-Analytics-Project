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

