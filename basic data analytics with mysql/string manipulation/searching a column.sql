select instr('mysql is awesome','is')
select instr('mysql is awesome','awe')
select instr('mysql is awesome','some')

select instr(title, 'ACE') from film
select instr(title, BINARY 'ace') from film
select * from film 