drop database if exists My_proj;
create database if not exists My_proj;
use My_proj;

create table if not exists Electrisety_company
(ID int primary key auto_increment,
name varchar(100) not null,
phone varchar(20) not null,
working_hours varchar(50) not null,
adres varchar(200) null);
insert into Electrisety_company values (1, 'ElComp1', '35-37-789', '07:00-21:00', 'г. Первый, ул. Первая, дом 111, офис 11');
insert into Electrisety_company values (2, 'ElComp2', '37-55-788', '07:30-20:00', 'г. Первый, ул. Вторая, дом 222, офис 22');
insert into Electrisety_company values (3, 'ElComp3', '37-56-787', '08:00-19:00', 'г. Первый, ул. Третья, дом 333, офис 33');
insert into Electrisety_company values (4, 'ElComp4', '38-57-786', '09:00-19:00', 'г. Первый, ул. Четвертая, дом 444, офис 44');
insert into Electrisety_company values (5, 'ElComp5', '39-58-585', '07:00-20:30', 'г. Первый, ул. Пятая, дом 555, офис 55');

select name, phone, adres from Electrisety_company where name like 'El%' limit 3; # указала поля для выборки сортировать по условию если поле начинается на и лимит
select name, phone, adres from Electrisety_company where ID >= 2 limit 2; # сортировать по условию если поле больше или равно значению и лимит
select ID, phone, adres from Electrisety_company limit 3; 


create table if not exists Potrebitel_electrisety
(ID int primary key auto_increment,
name varchar(50) not null,
ferstname varchar(50) not null,
lastname varchar(50) null,
email varchar(50) not null,
-- data_reg datetime not null default now(),
adres varchar(200) null);
insert into Potrebitel_electrisety values (1, 'Иван', 'Иванов', 'Иванович', 'ivi123@mail.com', 'г. Первый, ул Веселая, д. 20, кв 1');
insert into Potrebitel_electrisety values (2, 'Петр', 'Петров', 'Петрович', 'pivi23@mail.com', 'г. Первый, ул Веселая, д. 20, кв 3');
insert into Potrebitel_electrisety values (4, 'Сергей', 'Сергеев', 'Сергеевич', 'sivi123@mail.com', 'г. Первый, ул Веселая, д. 20, кв 5');
insert into Potrebitel_electrisety values (9, 'Ольга', 'Добрая', 'Ивановна', 'oivi123@mail.com', 'г. Первый, ул Веселая, д. 20, кв 6');
insert into Potrebitel_electrisety values (3, 'Наталья', 'Славная', 'Максимовна', 'natali123@mail.com', 'г. Первый, ул Добрая, д. 11, кв 1');
insert into Potrebitel_electrisety values (5, 'Сергей', 'Красный', 'Петров', 'sergeo123@mail.com', 'г. Первый, ул Добрая, д. 11, кв 2');
insert into Potrebitel_electrisety values (6, 'Максим', 'Золотой', 'Иванов', 'maxi123@mail.com', 'г. Первый, ул Добрая, д. 11, кв 3');
insert into Potrebitel_electrisety values (7, 'Игорь', 'Деревянко', 'Федорович', 'igr123@mail.com', 'г. Первый, ул Добрая, д. 20');
insert into Potrebitel_electrisety values (8, 'АбделрахманАли', 'Магомедов', '', 'abdel123@mail.com', 'г. Первый, ул Добрая, д. 15');

-- UPDATE Potrebitel_electrisety SET adres = replace(adres1, ул , Улица );

select * from Potrebitel_electrisety;

create table if not exists My_Elec_Comp
(El_comp_id int,
ID_potrebitel int,
foreign key (El_comp_id) references Electrisety_company(ID),
foreign key (ID_potrebitel) references Potrebitel_electrisety(ID));

insert into My_Elec_Comp values (1, 1);
insert into My_Elec_Comp values (1, 2);
insert into My_Elec_Comp values (1, 4);
insert into My_Elec_Comp values (1, 9);
insert into My_Elec_Comp values (1, 3);
insert into My_Elec_Comp values (1, 5);
insert into My_Elec_Comp values (1, 6);
insert into My_Elec_Comp values (4, 7);
insert into My_Elec_Comp values (5, 8);

create table if not exists My_data_el
(ID_potrebitel int,
previous_data float (30, 2) not null,
new_data int not null,
foreign key (ID_potrebitel) references Potrebitel_electrisety(ID));

insert into My_data_el values (1, 3520.07, 3610);
insert into My_data_el values (2, 7480.15, 7595);
insert into My_data_el values (3, 2000.00, 2050);
insert into My_data_el values (4, 9580.35, 10060);
insert into My_data_el values (5, 8790.89, 8930);
insert into My_data_el values (6, 4255.78, 5020);
insert into My_data_el values (7, 6975.65, 7095);
insert into My_data_el values (8, 0.00, 350);
insert into My_data_el values (9, 6585.50, 6880);

drop table My_data_el1;
create table My_data_el1 (ID int, pervious_data1 float (10, 2));
select CEILING(previous_data) as pervious_data1 from My_data_el;
select * from My_data_el1;
select * from My_data_el
join My_data_el1 on ID_potrebitel = ID;
select * from My_data_el;

-- ALTER TABLE My_data_el add pervious_data1 int;
select * from My_data_el;


create table if not exists Adres_potreb
(ID int primary key auto_increment,
rigen varchar(50) not null,
district varchar(50) null,
city varchar(50) not null,
strit varchar(50) not null,
home_number int not null,
index_home varchar(5) null,
appartment_number int null);
insert into Adres_potreb values (1, 'Первый край', '', 'Первый', 'Веселая', 20, '', 1);
insert into Adres_potreb values (2, 'Первый край', '', 'Первый', 'Веселая', 20, '', '2');
insert into Adres_potreb values (3, 'Первый край', '', 'Первый', 'Веселая', 20, '', '3');
insert into Adres_potreb values (4, 'Первый край', '', 'Первый', 'Веселая', 20, '', '4');
insert into Adres_potreb values (5, 'Первый край', '', 'Первый', 'Веселая', 20, '', '5');
insert into Adres_potreb values (6, 'Первый край', '', 'Первый', 'Веселая', 20, '', '6');
insert into Adres_potreb values (7, 'Первый край', '', 'Первый', 'Добрая', 11, '', '1');
insert into Adres_potreb values (8, 'Первый край', '', 'Первый', 'Добрая', 11, '', '2');
insert into Adres_potreb values (9, 'Первый край', '', 'Первый', 'Добрая', 11, '', '3');
insert into Adres_potreb values (10, 'Первый край', '', 'Первый', 'Добрая', 20, '', '0');
insert into Adres_potreb values (11, 'Первый край', '', 'Первый', 'Добрая', 15, '', '0');
insert into Adres_potreb values (12, 'Первый край', '', 'Первый', 'Одинокая', 1, '', '0');
insert into Adres_potreb values (13, 'Первый край', 'Второй', 'Второй', 'Славная', '10', '', '0');
insert into Adres_potreb values (14, 'Второй край', '', 'Первый', 'Добровольная', '12', '', '0');
insert into Adres_potreb values (15, 'Второй край', 'Второй', 'Второй', 'Славы', '14', '', '0');
insert into Adres_potreb values (30, 'Первая область', 'Третий', 'Третий', 'Красная', '1', '', '0');
insert into Adres_potreb values (31, 'Первая область', 'Третий', 'Пятый', 'Яблочная', '2', '', '0');
insert into Adres_potreb values (32, 'Третья область', '', 'Первый', 'Абрикосова', '5', '', '0');
insert into Adres_potreb values (33, 'Третья область', '', 'Первый', 'Строителей', '7', '', '0');

create table if not exists My_Adres_potreb
(ID_potrebitel int,
Adres_id int,
foreign key (Adres_id) references Adres_potreb(ID),
foreign key (ID_potrebitel) references Potrebitel_electrisety(ID));


insert into My_Adres_potreb values (1, 1);
insert into My_Adres_potreb values (2, 3);
insert into My_Adres_potreb values (3, 7);
insert into My_Adres_potreb values (4, 5);
insert into My_Adres_potreb values (5, 8);
insert into My_Adres_potreb values (6, 9);
insert into My_Adres_potreb values (7, 10);
insert into My_Adres_potreb values (8, 11);
insert into My_Adres_potreb values (9, 6);

show tables;
-- delete from My_Elec_Comp;
-- select * from Electrisety_company;
-- select * from Potrebitel_electrisety;
select * from My_data_el;
-- select * from Adres_potreb;
-- select * from My_Adres_potreb;

select * from Potrebitel_electrisety, My_data_el;

select name_pole1, name_pole2 from name_tab where name_pole = 'znach'; # по условию если поле равно значению

select Potrebitel_electrisety.ID, Potrebitel_electrisety.name, Potrebitel_electrisety.ferstname, My_data_el.new_data from Potrebitel_electrisety
join My_data_el on Potrebitel_electrisety.ID = My_data_el.ID_potrebitel where ID >= 4 limit 6;






