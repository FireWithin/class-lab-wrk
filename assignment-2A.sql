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
/*Write a query to find how many items have been sold in total?*/
select sum(OrderQuantity) from sales;
/*Write a query to find the average number of items per order?*/
select avg(OrderQuantity) from sales;
/*Write a query to return the average OrderQuantity for all orders with OrderPrice greater than 200?*/
select avg(OrderQuantity) from sales where OrderPrice>200;
/*Write a query to find out what was the minimum price paid for any of the orders in the Sales table?*/
select min(OrderPrice) from sales;
/*Write a query to return the highest OrderPrice from the Sales table?*/
select max(OrderPrice) from sales;
/*Write a query to retrieve a list with unique customers from Sales table, and to get the total amount 
each customer has spent in store?*/
select CustomerName,sum(OrderPrice*OrderQuantity) from sales group by CustomerName;
/*Write a query to select all unique customers, who have spent more than 1200 in store*/
select distinct(ii.cn) from (select CustomerName as cn,sum(OrderPrice*OrderQuantity) as ss from sales group by CustomerName) as ii where ii.ss>1200;
