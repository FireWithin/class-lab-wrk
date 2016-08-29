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
