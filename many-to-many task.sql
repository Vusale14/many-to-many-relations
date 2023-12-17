create database task_many_to_many

use task_many_to_many

create table Students
(
Id int primary key identity,
[Name] varchar(20),
Age tinyint,
Grade tinyint
)

create table Courses
(
Id int primary key identity,
[Name] varchar(20),
Credits tinyint
)

create table Enrollments
(
id int primary key identity,
StudentId int foreign key references Students(Id),
CourseId int foreign key references Courses(Id)
)

insert into Students values
('Tural',30,100),
('Vusale',23,100),
('Elsen',25,55),
('Hesen',26,83),
('Lale',28,75),
('Leyla',21,64),
('Seymur',28,88)

insert into Courses values
('Group14', 20),
('Group24', 40),
('Group26',60)

insert into Enrollments values
(1,1),
(2,1),
(3,2),
(4,2),
(5,3),
(6,3)

select * from Students

select s.Name, s.age , s.grade, e.StudentId, e.CourseId from Enrollments as e
join Students as s
on e.StudentId = s.Id

select c.name, AVG(s.age) as 'average age' from Enrollments as e
join Courses as c
on e.CourseId = c.Id
join Students as s
on e.StudentId = s.Id
group by c.name

select c.name, AVG(s.age) as 'average age' from Enrollments as e
join Courses as c
on e.CourseId = c.Id
join Students as s
on e.StudentId = s.Id
group by c.name
having AVG(s.age) < 25
