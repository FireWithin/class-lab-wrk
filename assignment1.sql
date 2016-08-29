create database assignment;
use assignment;
create table sales(
	OrderID int not null auto_increment,
    OrderDate date,
    OrderPrice int,
    OrderQuantity int,
    CustomerName text,
    primary key(OrderID)
);

select * from sales;
insert into sales (OrderDate, OrderPrice, OrderQuantity, CustomerName) values(
	20051222,
	160,
	2,
    "Smith"
);
insert into sales (OrderDate, OrderPrice, OrderQuantity, CustomerName) values(
	20050810,
	190,
	2,
    "Johnson"
);
insert into sales (OrderDate, OrderPrice, OrderQuantity, CustomerName) values(
	20050713,
	500,
	5,
    "Baldwin"
);
insert into sales (OrderDate, OrderPrice, OrderQuantity, CustomerName) values(
	20050715,
	420,
	2,
    "Smith"
);
insert into sales (OrderDate, OrderPrice, OrderQuantity, CustomerName) values(
	20051222,
	1000,
	4,
    "Wood"
);
insert into sales (OrderDate, OrderPrice, OrderQuantity, CustomerName) values(
	20051002,
	820,
	4,
    "Smith"
);
insert into sales (OrderDate, OrderPrice, OrderQuantity, CustomerName) values(
	20051103,
	2000,
	2,
    "Baldwin"
);

/*Write a query to count how many orders has made a customer with CustomerName of Smith?*/
select count(OrderID) from sales where CustomerName = "Smith"; 
/*Write a query to display total number of rows in the table?*/
select count(OrderID) from sales;
/*Write a query to the number of unique customers that have ordered from store?*/
select count(distinct(CustomerName)) from sales;
/*Write a query to find the sum of all orders?*/
select sum(OrderPrice) from sales;
