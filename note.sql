drop database if exists note;
create database note;
use note;


drop table if exists category ;
create table category(
id int primary key not null auto_increment,
name varchar(25) not null 
);

insert into category(name)
values("Economia"),
("Literatura"),
("Ingles"),
("Historia"),
("Informatica"),
("Matematica"),
("Taller"),
("Civica"),
("Plastica"),
("Fisica");

drop table if exists userr;
create table userr(
id int primary key not null auto_increment,
name varchar(100) not null,
lastName varchar(100) not null,
email varchar(60) not null unique
);

insert into userr (name, lastName, email)
values ("Jimena","Valenciano","Jimena123gmail.com"),
("Pascuala","Mosquera","Pascuala123gmail.com"),
("Rosendo","Belmonte","Rosendo123gmail.com"),
("Miguel","Rosa","Miguel123gmail.com"),
("Eugenia","Amorós","Eugenia123gmail.com"),
("Zaira","Bello","Zaira123gmail.com"),
("Milagros","Barragán","Milagros123gmail.com"),
("Mirta","Galvez","Mirta123gmail.com"),
("Nazaret","Blanes","Nazaret123gmail.com"),
("Gonzalo","Berenguer","Gonzalo123gmail.com");


drop table if exists note;
create table note(
id int primary key not null auto_increment,
title varchar(100) not null,
created_at date default current_date(),
updated_at date default current_date(),
descripcion  text not null,
IdUser int,
IdCategory int,
constraint FK_IdUser_userr foreign key (IdUser) references userr(id),
constraint FK_IdCategory_category foreign key (IdCategory) references category(id)
);

insert into note(title, created_at, updated_at, descripcion, IdUser, IdCategory) 
values("title 1", default, default, "descrip 1", 1, 10),
("title 2", default, default, "descrip 2", 2, 9),
("title 3", default, default, "descrip 3", 3, 8),
("title 4", default, default, "descrip 4", 4, 7),
("title 5", default, default, "descrip 5", 5, 6),
("title 6", default, default, "descrip 6", 6, 5),
("title 7", default, default, "descrip 7", 7, 4),
("title 8", default, default, "descrip 8", 8, 3),
("title 9", default, default, "descrip 9", 9, 2),
("title 10", default, default, "descrip 10", 10, 1);

drop table if exists category_note;
create table category_note(
id int primary key not null auto_increment,
IdCategoryy int,
IdNote int,
constraint FK_IdCategoryy_category foreign key(IdCategoryy) references category(id),
constraint FK_IdNotee_note foreign key(IdNote) references note(id)
);

insert into category_note(IdCategoryy, IdNote) 
values (1, 10),
(2, 9),
(3, 8),
(4, 7),
(5, 6),
(6, 5),
(7, 4),
(8, 3),
(9, 2),
(10, 1);