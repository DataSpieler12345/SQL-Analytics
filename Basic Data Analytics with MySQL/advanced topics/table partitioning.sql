create table film_details select film_id, title, description from film;

select * from film_details

alter table film_details partition by hash(film_id) partitions 3;

SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='film_details';