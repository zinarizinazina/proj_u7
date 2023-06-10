drop database if exists my_service;
create database if not exists my_service;
use my_service;

create table if not exists users
(id int primary key auto_increment,
email varchar(50) not null,
phone varchar(15) not null,
pasword_hash varchar(30) not null,
registration_date datetime not null default now(),
first_name varchar(50) not null,
Last_namt varchar(50) null);

create table if not exists favourite_shops
(User_id int,
Shop_id int,
primary key (User_id, Shop_id));

create table if not exists favourite_prodacts
(User_id int,
Product_id int,
primary key (User_id, Product_id));

create table if not exists shops
(id int primary key auto_increment,
title varchar(50) not null,
address varchar(70) not null,
working_hours varchar(10) not null);

create table if not exists products
(id int primary key auto_increment,
title varchar(50) not null,
pice int unsigned not null,
discount tinyint unsigned not null default 0,
factory_id int);

create table if not exists factories
(id int primary key auto_increment,
title varchar(100) not null,
address varchar(70) not null,
registration_date datetime not null default now());

create table if not exists buckets
(User_id int,
Product_id int,
primary key(User_id, Product_id));

create table if not exists orders
(id int primary key auto_increment,
total_without_discount int unsigned not null,
discount tinyint unsigned not null,
order_datetime datetime not null default now(),
user_id int);

create table if not exists shops_products
(Shop_id int,
Product_id int,
primary key(Shop_id, Product_id));

create table if not exists orders_products
(Product_id int,
Order_id int,
primary key(Product_id, Order_id));
