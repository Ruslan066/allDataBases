/*
--department
create table department
(
    id_department   serial not null unique primary key,
    name_department varchar(50) not null
);

--posts
create table posts
(
    id_posts  serial not null unique primary key,
    name_post varchar(50) not null,
    salary    integer     not null
);

--employee
create table employee
(
    id_employee      serial not null unique primary key,
    firstname        varchar(15) not null,
    lastname         varchar(15) not null,
    phone            varchar(15) not null,
    email            varchar(50) not null,
    birthday         date        not null,
    id_posts_fk      integer     not null,
    id_department_fk integer     not null,
    foreign key (id_posts_fk) references posts(id_posts),
    foreign key (id_department_fk) references department(id_department)

);

--session_log
create table session_log
(
    id_session     serial not null unique primary key,
    date_session   date    not null,
    arrival_time   time    not null,
    departure_time time    not null,
    break          time,
    note           varchar(100),
    id_employee_fk integer not null,
    foreign key (id_employee_fk) references employee(id_employee)
);

--meeting
create table meeting
(
    id_meeting     serial not null unique primary key,
    name_meeting   varchar(100)    not null,
    date_meeting   date    not null
);

--employee_meeting
create table employee_meeting
(
    id_meeting_fk    int not null,
    id_employee_fk   int not null,
    foreign key (id_meeting_fk) references meeting(id_meeting),
    foreign key (id_employee_fk) references employee(id_employee)

);
*/
/*
insert into department(id_department, name_department)
values (1, 'Directorate'),
       (2, 'Warehouse'),
       (3, 'Accounting'),
       (4, 'Personnel Department'),
       (5, 'IT Department');

insert into posts(id_posts, name_post, salary)
values (1, 'Administrator', 4100),
       (2, 'Director', 5000),
       (3, 'Analyst', 3200),
       (4, 'Secretary', 1900),
       (5, 'Manager', 2000),
       (6, 'Software engineer', 3200),
       (7, 'Sales', 1000);

insert into employee(id_employee, firstname, lastname, phone, email, birthday, id_posts_fk, id_department_fk)
values (1, 'Miroslan', 'Tan', '095995300', 'Miroslan@mail.com', '2000-02-01', 2 ,1),
       (2, 'Maximilián', 'Samson', '095995356', 'Maximilián@mail.com', '1999-05-06', 1 ,1),
       (3, 'Móric', 'Čaplovič', '095995365', 'Móric@mail.com', '2001-01-08', 3 ,1),
       (4, 'Koloman', 'Bielik', '095995874', 'Koloman@mail.com', '1997-09-02', 4 ,3),
       (5, 'Bruno', 'Bella', '095995436', 'Bruno@mail.com', '1994-11-19', 5 ,4),
       (6, 'Blahoslav', 'Mojžiš', '095995909', 'Blahoslav@mail.com', '1998-12-16', 6 ,5),
       (7, 'Ervín', 'Puškáš', '095995778', 'Ervín@mail.com', '1993-02-11', 7 ,2);

insert into meeting(id_meeting, name_meeting, date_meeting)
values (1,'Operational meeting', '2022-04-01'),
       (2,'Innovative Assembly', '2022-04-02'),
       (3,'Strategic Meeting', '2022-04-03'),
       (4,'Informal meeting', '2022-04-04'),
       (5,'Meeting with partners', '2022-04-05');

insert into employee_meeting(id_meeting_fk, id_employee_fk)
values (1,1),
       (1,2),
       (1,3),
       (1,4),
       (2,1),
       (2,2),
       (3,1),
       (3,6),
       (3,5),
       (4,5),
       (4,7),
       (4,4),
       (4,3),
       (5,1),
       (5,2);

insert into session_log(id_session, date_session, arrival_time, departure_time, break, note, id_employee_fk)
values (1, '2022-04-01', '12:00:00', '18:00:00', null, null, 1),
       (3, '2022-04-01', '08:00:00', '18:00:00', '00:30:00', null, 2),
       (4, '2022-04-01', '08:00:00', '17:00:00', '00:10:00', 'Meškal 13 minút', 3),
       (5, '2022-04-01', '10:00:00', '19:00:00', '00:10:00', null, 4),
       (6, '2022-04-02', '11:00:00', '19:00:00', null, 'Meškal 10 minút', 7),
       (7, '2022-04-02', '12:00:00', '19:00:00', '00:15:00', null, 5),
       (8, '2022-04-02', '09:00:00', '17:00:00', '00:30:00', null, 2),
       (9, '2022-04-03', '08:00:00', '17:00:00', '00:20:00', 'Prišiel som bez preukazu', 6);
*/

--zobraziť zamestnancov, ktorí sa narodili pred rokom 1999
create view name_birthday as
select e.firstname || ' ' || e.lastname as name, e.birthday
from employee e
where extract(year from e.birthday) <1999
order by e.birthday desc;

--zobrazenie názvu schôdze a dátumu schôdze, kde je názov schôdze 'Strategic'
create view name_date_meeting as
select m.name_meeting, m.date_meeting
from meeting m
where m.name_meeting like 'Strategic%';

--ukázať zamestnancom ich postavenie a plat, Zoradiť podľa platu
create view name_post_salary as
select e.firstname || ' ' || e.lastname as name, p.name_post, p.salary
from employee e
inner join posts p on e.id_posts_fk = p.id_posts
order by p.salary desc ;

--ukázať zamestnancom ich pozíciu oddelenia, kde pracujú, ako aj meno a dátum stretnutia
create view name_department_post_meeting as
select e.firstname || ' ' || e.lastname as name, d.name_department || ' ' || p.name_post as department_post,
       m.name_meeting || ' ' || m.date_meeting as meeting
from employee e
left outer join department d on d.id_department = e.id_department_fk
left outer join posts p on p.id_posts = e.id_posts_fk
right outer join employee_meeting em on e.id_employee = em.id_employee_fk
right outer join meeting m on m.id_meeting = em.id_meeting_fk
where m.name_meeting = 'Operational meeting';

--zobraziť úplné informácie o príchode do práce
create view name_department_post_session as
select e.firstname || ' ' || e.lastname as name, d.name_department || ' ' || p.name_post as department_post,
       sl.date_session, sl.note
from employee e
full outer join session_log sl on e.id_employee = sl.id_employee_fk
full outer join posts p on p.id_posts = e.id_posts_fk
full outer join department d on d.id_department = e.id_department_fk;

--zobraziť minimálny, maximálny a priemerný plat
create view salary_info as
select min(p.salary) as min_salary,
       max(p.salary) as max_salary,
       round(avg(p.salary), 2) as avg_salary
from posts p;

--zobraziť počet návštev zamestnancov úradu v '2022-04-01'
create view count_session as
select count(*)
from session_log sl
where sl.date_session = '2022-04-01';
