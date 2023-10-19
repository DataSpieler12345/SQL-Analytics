select * from payment

select sum(amount) as 'total_amount' from payment;
select sum(amount) as 'total_amount', sum(distinct amount) as 'distinct_total_values' from payment;
select distinct amount from payment;

select staff_id, customer_id, sum(amount) as 'total_amount' from payment group by staff_id, customer_id;