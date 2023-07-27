/*1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/
select employees.employee_name , salary.monthly_salary  
	from employee_salary
join employees 
	on employees.id = employee_salary.employee_id 
join salary 
	on salary.id = employee_salary.salary_id 

/*Вывести всех работников у которых ЗП меньше 2000.*/
select employees.employee_name , salary.monthly_salary  
	from employee_salary
join employees 
	on employees.id = employee_salary.employee_id 
join salary 
	on salary.id = employee_salary.salary_id and salary.monthly_salary < 2000

/*Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/
select salary.monthly_salary 
	from salary
left join employee_salary
	on employee_salary .salary_id = salary.id
where employee_id is null;

/*4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.) */
select salary.monthly_salary 
	from salary
left join employee_salary
	on employee_salary .salary_id = salary.id 
where employee_id is null and monthly_salary<2000;

/*5. Найти всех работников кому не начислена ЗП.*/
select employees.employee_name 
	from employees
left join employee_salary 
	on employees.id  = employee_salary.employee_id 
where employee_salary.salary_id is null;

/*6Вывести всех работников с названиями их должности.*/
select employees.employee_name, roles.role_name 
	from employees
join roles_employee
	on employees.id = roles_employee.employee_id 
join roles
	on roles.id = roles_employee.role_id;
/*7. Вывести имена и должность только Java разработчиков.*/
select employees.employee_name, roles.role_name 
	from employees
join roles_employee
	on employees.id = roles_employee.employee_id 
join roles
	on roles.id = roles_employee.role_id
where roles.role_name like '%Java developer%';
/* 8. Вывести имена и должность только Python разработчиков.*/
select employees.employee_name, roles.role_name 
	from employees
join roles_employee
	on employees.id = roles_employee.employee_id 
join roles
	on roles.id = roles_employee.role_id
where roles.role_name like '%Python developer%';
/*9. Вывести имена и должность всех QA инженеров. */
select employees.employee_name, roles.role_name 
	from employees
join roles_employee
	on employees.id = roles_employee.employee_id 
join roles
	on roles.id = roles_employee.role_id
where roles.role_name like '%QA engineer%';
/*10. Вывести имена и должность ручных QA инженеров. */
select employees.employee_name, roles.role_name 
	from employees
join roles_employee
	on employees.id = roles_employee.employee_id 
join roles
	on roles.id = roles_employee.role_id
where roles.role_name like '%Manual QA engineer%';
/*11. Вывести имена и должность автоматизаторов QA*/
select employees.employee_name, roles.role_name 
	from employees
join roles_employee
	on employees.id = roles_employee.employee_id 
join roles
	on roles.id = roles_employee.role_id
where roles.role_name like '%Automation QA engineer%';
/*12. Вывести имена и зарплаты Junior специалистов*/
select employees.employee_name, salary.monthly_salary
	from employees
inner join roles_employee on employees.id = roles_employee.employee_id 
inner join employee_salary on employee_salary.employee_id = employees.id 
inner join salary on salary.id = employee_salary.salary_id 
where roles_employee.role_id IN 
	(select roles.id from roles where roles.role_name like '%Junior%');
/*13Вывести имена и зарплаты Middle специалистов*/
select employees.employee_name, salary.monthly_salary
	from employees
inner join roles_employee on employees.id = roles_employee.employee_id 
inner join employee_salary on employee_salary.employee_id = employees.id 
inner join salary on salary.id = employee_salary.salary_id 
where roles_employee.role_id IN 
	(select roles.id from roles where roles.role_name like '%Middle%');
/*14Вывести имена и зарплаты Senior специалистов*/
select employees.employee_name, salary.monthly_salary
	from employees
inner join roles_employee on employees.id = roles_employee.employee_id 
inner join employee_salary on employee_salary.employee_id = employees.id 
inner join salary on salary.id = employee_salary.salary_id 
where roles_employee.role_id IN 
	(select roles.id from roles where roles.role_name like '%Senior%');
/*15Вывести зарплаты Java разработчиков*/
select employees.employee_name, salary.monthly_salary
	from employees
inner join roles_employee on employees.id = roles_employee.employee_id 
inner join employee_salary on employee_salary.employee_id = employees.id 
inner join salary on salary.id = employee_salary.salary_id 
where roles_employee.role_id IN 
	(select roles.id from roles where roles.role_name like '%Java%');
/*16Вывести зарплаты Python разработчиков*/
select employees.employee_name, salary.monthly_salary
	from employees
inner join roles_employee on employees.id = roles_employee.employee_id 
inner join employee_salary on employee_salary.employee_id = employees.id 
inner join salary on salary.id = employee_salary.salary_id 
where roles_employee.role_id IN 
	(select roles.id from roles where roles.role_name like '%Python%');
/*17Вывести имена и зарплаты Junior Python разработчиков*/
select employees.employee_name, salary.monthly_salary
	from employees
inner join roles_employee on employees.id = roles_employee.employee_id 
inner join employee_salary on employee_salary.employee_id = employees.id 
inner join salary on salary.id = employee_salary.salary_id 
where roles_employee.role_id IN 
	(select roles.id from roles where roles.role_name like '%Junior Python%');
/*18Вывести имена и зарплаты Middle JS разработчиков*/
select employees.employee_name, salary.monthly_salary
	from employees
inner join roles_employee on employees.id = roles_employee.employee_id 
inner join employee_salary on employee_salary.employee_id = employees.id 
inner join salary on salary.id = employee_salary.salary_id 
where roles_employee.role_id IN 
	(select roles.id from roles where roles.role_name like '%Middle JavaScript%');
/*19Вывести имена и зарплаты Senior Java разработчиков*/
select employees.employee_name, salary.monthly_salary
	from employees
inner join roles_employee on employees.id = roles_employee.employee_id 
inner join employee_salary on employee_salary.employee_id = employees.id 
inner join salary on salary.id = employee_salary.salary_id 
where roles_employee.role_id IN 
	(select roles.id from roles where roles.role_name like '%Senior Java%');

/*20Вывести зарплаты Junior QA инженеров*/
select employees.employee_name, salary.monthly_salary, roles_employee.role_id 
	from employees
left join roles_employee on roles_employee.employee_id = employees.id
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on salary.id = employee_salary.salary_id
where roles_employee.role_id IN
	(select roles.id from roles where (roles.role_name like '%Junior%' and roles.role_name like '%QA%'));

/* 21. Вывести среднюю зарплату всех Junior специалистов*/
select ROUND(avg(salary.monthly_salary),2)
	from salary
join employee_salary on employee_salary.salary_id = salary.id  
join roles_employee on roles_employee.employee_id = employee_salary.employee_id 
where roles_employee.role_id in 
	(select roles.id from roles where roles.role_name like '%Junior%');

/*22. Вывести сумму зарплат JS разработчиков*/
select ROUND(sum(salary.monthly_salary),2)
	from salary
join employee_salary on employee_salary.salary_id = salary.id  
join roles_employee on roles_employee.employee_id = employee_salary.employee_id 
where roles_employee.role_id in 
	(select roles.id from roles where roles.role_name like '%JavaScript developer%');

/*23. Вывести минимальную ЗП QA инженеров*/
select min(salary.monthly_salary)
	from salary
join employee_salary on employee_salary.salary_id = salary.id  
join roles_employee on roles_employee.employee_id = employee_salary.employee_id 
where roles_employee.role_id in 
	(select roles.id from roles where roles.role_name like '%QA engineer%');

/*24. Вывести максимальную ЗП QA инженеров*/
select max(salary.monthly_salary)
	from salary
join employee_salary on employee_salary.salary_id = salary.id  
join roles_employee on roles_employee.employee_id = employee_salary.employee_id 
where roles_employee.role_id in 
	(select roles.id from roles where roles.role_name like '%QA engineer%'); 

/*25. Вывести количество QA инженеров*/
select count(employee_salary.id)
	from employee_salary
join roles_employee on roles_employee.employee_id = employee_salary.employee_id 
where roles_employee.role_id in 
	(select roles.id from roles where roles.role_name like '%QA engineer%');

/*26. Вывести количество Middle специалистов.*/
select count(employee_salary.id)
	from employee_salary
join roles_employee on roles_employee.employee_id = employee_salary.employee_id 
where roles_employee.role_id in 
	(select roles.id from roles where roles.role_name like '%Middle%');

/*27Вывести количество разработчиков*/
select count(employee_salary.id)
	from employee_salary
join roles_employee on roles_employee.employee_id = employee_salary.employee_id 
where roles_employee.role_id in 
	(select roles.id from roles where roles.role_name like '%developer%');

/*28Вывести фонд (сумму) зарплаты разработчиков.*/
select sum(salary.monthly_salary)
	from salary
join employee_salary on employee_salary.salary_id = salary.id 
join roles_employee on roles_employee.employee_id = employee_salary.employee_id 
where roles_employee.role_id in 
	(select roles.id from roles where roles.role_name like '%developer%');
/*29Вывести имена, должности и ЗП всех специалистов по возрастанию*/
select employees.employee_name, roles.role_name , salary.monthly_salary  
	from employees
left join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id
order by salary.monthly_salary;

/*30 Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300*/
select employees.employee_name, roles.role_name , salary.monthly_salary  
	from employees
left join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id
where salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary;

/* 31 Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300*/
select employees.employee_name, roles.role_name , salary.monthly_salary  
	from employees
left join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id
where salary.monthly_salary < 2300
order by salary.monthly_salary;

/*32Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000*/
select employees.employee_name, roles.role_name , salary.monthly_salary  
	from employees
left join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id
where salary.monthly_salary in (1100, 1500, 2000)
order by salary.monthly_salary;



select roles.id from roles where (roles.role_name like '%Junior%' and roles.role_name like '%QA%');	
select * from employee_salary;
select * from salary;
select * from employees;
select * from roles; 
select * from roles_employee where role_id in (1,4,7,10,18) ;

insert into roles_employee (employee_id,role_id) values(43,18);
insert into employee_salary (employee_id,salary_id) values(42,5);
