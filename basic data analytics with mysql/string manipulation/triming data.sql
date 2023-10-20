select rtrim('  MYSQL   ')
select ltrim('  MYSQL   ')
select trim(Leading 'x' from 'xxxMYSQLxxx')
select trim(Trailing 'x' from 'xxxMYSQLxxx')
select trim(Both 'x' from 'xxxMYSQLxxx')

select * from film

select trim(title) as title from film

select trim(Trailing 'R' from title) as title from film
