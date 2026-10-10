create database ecommerce_db;
use ecommerce_db;
#create table to product information
create table product(
productid int primary key auto_increment,
productname varchar(100),
description text,
price decimal(10,2),
stockquantity int not null,
category varchar(100),
dateadded date
);
#to show schema
desc product;

#insert data
insert into product(productname,description,price,stockquanity,category)
values
('smartphone','latest model of smartphone with latest model',699.99,50,'electronic'),
('runningshoe','comfortable shoe for all trainner',89.99,100,'sportsswear'),
('bluetoothspeaker','portable speaker with excellent sound',45.00,200,'electronic');
select * from product; 

#phase 2
#creating and populating user table
#create user table to  information
create table user(
userid int primary key auto_increment,
username varchar(100),
email varchar(100),
password varchar(100),
address varchar(100),
dateregistered date not null default (curdate()) #user registered user date default date todays
);
desc user;

insert into user(username,email,password,address)
values
('John Doe', 'john.doe@example.com', 'hashedpassword123', '123 Main St'),
('Jane Smith', 'jane.smith@example.com', 'hashedpassword456', '456 Elm St');
select * from user;


# creating and populating the order table
# create table order to store transaction details
create table orders(
ordersid int primary key auto_increment,
userid int, #id of the user who placed order
orderdate date not null,
totalamount decimal(10,2) not null,
foreign key (
userid) references user (userid)
);
desc orders;
insert into orders(userid,orderdate,totalamount)
values
(1, '2024-08-01', 789.99),
(2, '2024-08-02', 120.50);
select * from orders;

#creating and populating review table to store user feedback
create table review(
reviewid int primary key auto_increment,
productid int,
userid int,
rating int,
review text,
foreign key (productid) references product(productid),
foreign key (userid) references user(userid)
);
desc review;

insert into review(productid,userid,rating,review)
values
(1, 1, 5, 'Amazing smartphone, very satisfied!'),
(2, 2, 4, 'Great shoes, very comfortable.');
select * from review;

# Phase 5: Creating and Populating the Payments Table
-- Create the Payments table to store payment transaction details
create table payments(
paymentid int primary key auto_increment,
ordersid int,
paymentmethod varchar(100),
paymentdate date not null,
foreign key (ordersid) references orders(ordersid) #link to the order table
);
desc payments;

insert into payments(ordersid,paymentmethod,paymentdate)
values
(1, 'Credit Card', '2024-08-01'),
(2, 'PayPal', '2024-08-02');
select * from payments;
alter table payments add column amount decimal(10,2);
update payments set amount='789.99' where paymentid = 1;
update payments set amount='120.50' where paymentid = 2;
select * from payments;

#count how many product have productlauncheddate that is not null
select productid,productname,productlauncheddate from product
where productlauncheddate is not null;

#retrive products where productlauncheddate is null
select productid,productname,productlauncheddate from product
where productlauncheddate is null;

#add check constraint to ensure that productlauncheddate is not null and also it check that it is not before 1 jan 2020
alter table product add constraint chk_launcheddate 
check
 (productlauncheddate >= '2020-01-01');

select * from product;



















