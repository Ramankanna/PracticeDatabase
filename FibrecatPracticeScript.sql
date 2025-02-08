use data;
create table Students(id int primary key auto_increment,StudentName varchar(20));
alter table Students add column Department varchar(20);
alter table Students change column id ID int auto_increment;
insert into Students values(101,'Ramesh','computer');
insert into Students (StudentName,Department) values ('Jamal','Physics');
insert into Students values(201,'Kaviya','ECE');
insert into Students values(109,'Donald Trump','Mech');
insert into Students values(111,'Ravi','Physical');
insert into Students values(104,'Harish','computer');
select StudentName,Department from Students where Department in (select Department from Students group by Department having count(*)>1);
select count(ID) from Students
SELECT Department 
FROM Students 
GROUP BY Department 
HAVING COUNT(*) > 1;
create table StudAddress(ID int primary key,Address varchar(40),Pincode int,phonenumber int,foreign key(ID) references Students(ID));
insert into StudAddress values(101,'14 Avenue Street Chennai',600044,'9260789090');
alter table StudAddress change column phonenumber phonenumber varchar(20);
insert into StudAddress values(102,'17/2 Cross Street Coimbatore',608044,'8260789090');
insert into StudAddress values(104,'10 Baskar Street Tirunelveli',627006,'9260786090');
insert into StudAddress values(109,'13 Loyal Street Vilupuram',605044,'5660789090');
insert into StudAddress values(201,'78 RockStreet Chennai',600044,'9260789090');
insert into StudAddress values(151,'89/3 Jawahar Street Tenkasi',656044,'9740789080');
select a.ID,a.StudentName,b.Address from Students a inner join StudAddress b on a.ID=b.ID;
alter table Studentmark add column Toatal int;
alter table Studentmark add column CGPA decimal(5,2);
alter table Studentmark change column Toatal Total int;
alter table Studentmark change column CGPA percentage decimal(5,2);
delimiter $$
create trigger beforetotalmarkinsertion
before insert 
on studentmark
for each row
begin
	set new.Total=new.tam+new.eng+new.maths;
end$$;
delimiter $$
create trigger beforeinsertpercentage
before insert 
on
studentmark
for each row
begin
set new.percentage=new.Total/300*100;
end$$;
alter table studentmark 
add column ID int,
add constraint stdmark_pk primary key (ID),
add constraint fk_ID foreign key(ID) references Students(ID);
insert into studentmark (tam,eng,maths,ID) values (89,90,98,101);
insert into studentmark (tam,eng,maths,ID) values (93,87,98,102);
insert into studentmark (tam,eng,maths,ID) values (79,60,58,104);
insert into studentmark (tam,eng,maths,ID) values (59,60,98,109);
insert into studentmark (tam,eng,maths,ID) values (99,87,78,111);
insert into studentmark (tam,eng,maths,ID) values (99,90,88,201);
alter table studentmark add constraint check_marks check(tam<=100 and eng<=100 and maths<=100);
create view HighestMarkStudent as
select a.Id,a.StudentName,a.Department,b.Total from students a inner join studentmark b on a.Id=b.ID order by b.Total desc limit 1 offset 0;
select a.Id,a.StudentName,a.Department,b.percentage from students a 
inner join studentmark b on a.ID=b.ID 
where b.percentage in(select percentage from studentmark  group by percentage having count(*)>80)

SELECT a.ID, a.StudentName, a.Department, b.percentage
FROM students a
INNER JOIN studentmark b ON a.ID = b.ID
WHERE b.percentage > 80;

select a.ID,a.StudentName,a.Department,b.address,b.pincode from students a right join 
studaddress b on a.ID=b.ID;

select a.ID,a.StudentName,a.Department,b.address,b.pincode from students a left join 
studaddress b on a.ID=b.ID;

select a.ID,a.StudentName,a.Department,b.address,b.pincode from students a left join 
studaddress b on a.ID=b.ID
union
select a.ID,a.StudentName,a.Department,b.address,b.pincode from students a right join 
studaddress b on a.ID=b.ID;

select a.StudentName,b.pincode from Students a cross join studaddress b

below shows the self join example 

SELECT A.StudentName AS Student, B.Department 
FROM students A
JOIN students B 
ON 1=1
ORDER BY A.StudentName, B.Department;

select * from students natural join studmark natural join studaddress;

select curdate() as todaydate
select day(curdate()) as date,monthname(curdate()) as month,year(curdate())
select concat(dayname(curdate()),day(curdate())) as todaydate
select date_format(curdate(), '%d-%m')
select concat(StudentName,Department) from students


delimiter $$
create procedure Todaydate()
begin
select 
concat(dayname(curdate()),' ',day(curdate())) as date,
concat(monthname(curdate()),' ',month(curdate())) as month,
year(curdate())as year;
end$$

use practicefibrecat
create table practicefibrecat.Students AS 
select * from data.Students;

create table practicefibrecat.studaddress as
select * from data.studaddress

create table practicefibrecat.studentmark as
select * from data.studentmark
use practicefibrecat;
insert into Students values(204,'leo dass','computer');
insert into Students values(301,'rajesh','EEE');
insert into Students values(701,'dinesh','EEE');
select Department,count(ID) from students group by Department having count(ID) > 2
select StudentName,Department from students where Department in(select Department from students group by Department having count(ID)>2)
select a.Department from students a inner join studentmark b on a.ID=b.ID group by a.Department having avg(b.percentage) > 85.0 
select a.StudentName from students a inner join studentmark b on a.ID=b.ID group by a.StudentName having max(b.tam) > 80
select a.StudentName,b.tam,b.eng,b.maths from students a inner join studentmark b on a.ID=b.ID group by a.StudentName,b.tam,b.eng,b.maths having max(b.tam) and max(b.eng) and max(b.maths)> 80
select StudentName from students where StudentName like 'r%';
select StudentName from students where StudentName like '%h';