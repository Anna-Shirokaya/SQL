create table employees(
	id_serial SERIAL primary key,
	employee_name Varchar(50) not null
)

insert into employees(employee_name) values 
('Андрей'),
('Аникий'),
('Аникита'),
('Антон'),
('Антонин'),
('Анфим'),
('Аристарх'),
('Аркадий'),
('Арсений'),
('Артём'),
('Артемий'),
('Артур'),
('Архипп'),
('Афанасий'),
('Вавила'),
('Вадим'),
('Валентин'),
('Валерий'),
('Валерьян'),
('Варлам'),
('Варсонофий'),
('Варфоломей'),
('Василий'),
('Венедикт'),
('Вениамин'),
('Викентий'),
('Виктор'),
('Виссарион'),
('Виталий'),
('Владимир'),
('Владислав'),
('Владлен'),
('Влас'),
('Всеволод'),
('Вячеслав'),
('Капитон'),
('Ким'),
('Кир'),
('Кирилл'),
('Климент'),
('Кондрат'),
('Конон'),
('Константин'),
('Корнилий'),
('Кузьма'),
('Куприян');



insert into employees(employee_name) values
('Каштанка'),
('Роберт');

select * from employees;

drop table employees;

create table salary(
	id serial primary key,
	monthly_salary int not null
);
insert into salary(monthly_salary) values
(1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

select * from salary;
create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

insert into employee_salary(employee_id, salary_id) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,1),
(18,2),
(19,3),
(20,4),
(21,5),
(22,6),
(23,7),
(24,8),
(25,9),
(26,10),
(27,11),
(28,12),
(29,13),
(30,14),
(51,1),
(52,2),
(53,3),
(54,4),
(55,5),
(56,6),
(57,7),
(58,8),
(59,9),
(60,10);

create table roles
(
	id serial primary key,
	role_name int not null unique
);

alter table roles
alter column role_name type varchar(30);

insert into roles(role_name) values
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

create table roles_employee(
	id serial primary key,
	employee_id int not null unique references employees(id_serial),
	role_id int not null references roles(id)
);
alter table employees 
rename id_serial to id;
insert into roles_employee(employee_id,role_id) values
(7,2),
(20,4),
(3,9),
(5,13),
(23,4),
(11,2),
(10,9),
(22,13),
(21,3),
(34,4),
(6,7),
(1,1),
(2,3),
(4,4),
(9,5),
(12,7),
(8,8);
select * from roles_employee;
insert into roles_employee(employee_id,role_id) values
(24,2),
(25,4),
(26,9),
(27,13),
(28,4),
(29,2),
(30,9),
(31,13),
(32,3),
(33,4),
(35,7),
(36,1),
(37,3),
(38,4),
(39,5),
(40,7),
(41,8);