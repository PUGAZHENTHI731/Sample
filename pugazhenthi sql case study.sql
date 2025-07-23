------------create the employees table 
create table employees (emp_id int primary key identity(101,1)  ,name varchar(50) not null,email varchar(100) unique,department varchar(30) default 'GENERAL' , age int check (age >=18), city varchar(30),salary int )

insert into employees values ('pugazhenthi','pugal731@gmail.com','production ',20,'alangudi',50000)
insert into employees values ('dinesh kumar','dinesh2005@gmail.com','marketing ',19,'pudukkottai',45000)
insert into employees values ('mani','mani243@gmail.com','sales',21,'arandangi',30000)
insert into employees values ('manikcam','manickam6435@gmail.com','it',20,'ponnamaravathi',40000)
insert into employees values ('ram','ram@gmail.com','seles',20,'alangudi',50000)
insert into employees values ('sam','sam@gmail.com','it',18,'tiruchy',40000)
insert into employees values ('arun','arun@gmail.com','it',19,'chennai',20000)

select * from employees


-------------- create the bonus table 
create table bonus (emp_id int, bonus_amount int)
insert into bonus values (101,5000)
insert into bonus values (102,4500)
insert into bonus values (104,4000)
insert into bonus values (105,5000)
select * from bonus



------------3. SQL Operations

-- i. SQL Operations
select * from employees
update employees set salary = 35000 where name = 'arun'


--ii. SQL Constraintsii. 
insert into employees values ('ravi','ravi@gmail.com','it',17,'tiruchy',40000)

-- iii. SQL Operators
select * from employees where department='sales'

select * from employees where salary >30000


-- iv. SQL Joins

select * from employees e left outer join bonus b on e.emp_id = b.emp_id 


-- v. SQL GROUP BY and HAVING

select upper(department),sum(salary) as total_salary from employees group by department

select  city ,avg(salary) as avg_salary from employees group by city having avg(salary) > 30000

-- 4. Aggregate Functions & DISTINCT

select count(*) as total_number_of_employees from employees

select count(distinct (department)) as unique_departments  from employees

--5. ORDER BY and LIMIT (TOP)

select top 3* from employees order by salary desc

-- 6.  Sub-Query --- 41428
select * from employees where salary > (select AVG(salary) from employees)

-- 7. UNION

select name from employees
union 
select city from employees 

--8. Views

create view emp_view  as (select * from employees)

select * from emp_view where department='sales'

select * from emp_view


-- 9. Stored Procedure

create procedure GetHighSalary  
as
begin
select emp_id,name,salary from employees where salary > 30000
end;

exec GetHighSalary ;

-- 10. Trigger

create table emp_tri (name varchar(20), action_type varchar(20),[time] datetime)

select * from emp_tri

create trigger tri_delete 
on employees
after delete
as
begin
insert into emp_tri select name,'DELETED',GETDATE() from deleted
end;


delete from employees where emp_id =106