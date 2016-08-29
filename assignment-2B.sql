use assignment;
create table Persons(
	P_Id int not null auto_increment,
    LastName text,
    FirstName text,
    Address text,
    City text,
    primary key(P_Id)
);
insert into Persons (LastName, FirstName, Address, City) values (
	"Hansen", "Ola", "Timoteivn 10", "Sandnes"
);
insert into Persons (LastName, FirstName, Address, City) values (
	"Svendson", "Tove", "Borgvn 23", "Sandnes"
);
insert into Persons (LastName, FirstName, Address, City) values (
	"Pettersen", "Kari", "Storgt 20", "Stavanger"
);
select * from Persons;
create table Orders(
	O_Id int not null auto_increment,
    OrderNo int,
    P_Id int,
    primary key(O_Id)
);
insert into Orders (OrderNo, P_Id) values(
	77895,3
);
insert into Orders (OrderNo, P_Id) values(
	44678,3
);
insert into Orders (OrderNo, P_Id) values(
	22456,1
);
insert into Orders (OrderNo, P_Id) values(
	22562,1
);
insert into Orders (OrderNo, P_Id) values(
	34764,15
);
select * from Orders;
/*Write a query to return rows where there is at least one match in both tables?*/
select * from Persons inner join orders where Persons.P_Id = Orders.P_Id;
/*Write a query to list all the persons and their orders - if any?*/
select Persons.FirstName, Persons.LastName, Orders.OrderNo from Persons left join Orders on Persons.P_Id = Orders.P_Id ;
/*Write a query to list all the orders with containing persons - if any?*/
select Orders.OrderNo, Persons.FirstName, Persons.LastName from Persons right join Orders on Persons.P_Id = Orders.P_Id;
/*Write a query to list all the persons and their orders, and all the orders with their persons?*/
select Persons.FirstName, Persons.LastName, Orders.OrderNo from Persons left join Orders on Persons.P_Id = Orders.P_Id union select Orders.OrderNo, Persons.FirstName, Persons.LastName from Persons right join Orders on Persons.P_Id = Orders.P_Id;
/*Write a query to convert the "LastName" column to uppercase?*/
update Persons set LastName = upper(LastName);
/*Write a query to select the content of the "LastName" and "FirstName" columns and
convert the "LastName" column to lowercase?*/
select lower(LastName), FirstName from Persons;
/*Write a query to extract the first four characters of the "City" column?*/
