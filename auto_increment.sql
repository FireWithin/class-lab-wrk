/* auto increment */
use db;
create table stud(
	nam text,
    age int,
	id int not null auto_increment,
    primary key(id)
);
insert into stud values("aditya", 18, 1);
insert into stud values("dhruv", 18, 2);
insert into stud (nam, age) values ("Punit", 19);
select * from stud;
