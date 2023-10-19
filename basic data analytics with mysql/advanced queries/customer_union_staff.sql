select c.first_name, c.last_name,'Customer' as category from sakila.customer c
union
select e.first_name, e.last_name,'Staff' as category from sakila.staff e
