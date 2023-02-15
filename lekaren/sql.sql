create table Sick
(
    id_sick     serial not null unique  primary key,
    fio         varchar(100) not null,
    street      varchar(50)  not null,
    city        varchar(50)  not null,
    passport_id varchar(25)  not null
);

create table WorkTime
(
    id_workTime serial not null unique primary key,
    work_date     date not null,
    time_arrival  time not null,
    time_leave    time not null
);

create table Doctor_type
(
    id_doctor_type serial not null unique primary key,
    type_doctor    varchar(50) not null,
    office         varchar(15) not null
);
create table Doctor
(
    id_doctor      serial not null unique primary key,
    fio            varchar(100) not null,
    id_doctor_type integer not null,
    foreign key (id_doctor_type) references Doctor_type(id_doctor_type)
);

create table Doctor_WorkType
(
    id_doctor int not null,
    id_workTime  int not null,
    foreign key (id_workTime) references WorkTime(id_workTime),
    foreign key (id_doctor) references Doctor(id_doctor)
);

create table Medications
(
    id_medications serial not null unique primary key,
    medicine       varchar(50) not null,
    description    varchar(255)
);

create table Diagnos
(
    id_diagnos serial not null unique primary key,
    diagnos    varchar(100) not null,
    symptoms   varchar(255) not null
);

create table Diagnos_Medicationse
(
    id_diagnos     int not null,
    id_medications int not null,
    foreign key (id_diagnos) references Diagnos(id_diagnos),
    foreign key (id_medications) references Medications(id_medications)

);

create table Certificate
(
    id_certificate   serial not null unique primary key,
    date_certificate date    not null,
    id_sick          int not null,
    id_doctor        int not null,
    id_diagnos       int not null,
    foreign key (id_sick) references Sick(id_sick),
    foreign key (id_doctor) references Doctor(id_doctor),
    foreign key (id_diagnos) references Diagnos(id_diagnos)
);

--odovzdanie-2
INSERT INTO sick (fio, street, city, passport_id)
VALUES ('Layan Haynes','Skladna 208','Kosice','FP120344'),
       ('Rajan Waters','Rastislavova 752','Kosice','FP127171'),
       ('Tyron Avery','Zborovska 1534','Kosice','FP120656'),
       ('Tony Love','Nesporova 276','Kosice','FP187890'),
       ('Ned Keenan','Slobody 225','Kosice','FP121234');

INSERT INTO doctor_type(type_doctor, office)
VALUES ('Head doctor','110b'),
       ('Doctor therapist','112'),
       ('Doctor surgeonr','114c'),
       ('Traumatologist','114a'),
       ('Cardiologist','118');

INSERT INTO doctor(fio, id_doctor_type)
VALUES ('Matej Koči',1),
       ('Michal Medved',2),
       ('Dávid Koleno',3),
       ('Andrej Láska',4),
       ('Branko Maliar',5);

INSERT INTO worktime(work_date, time_arrival, time_leave)
VALUES ('2022-03-30', '08:30:00', '15:00:00'),
       ('2022-03-30', '09:30:00', '16:30:00'),
       ('2022-03-30', '10:00:00', '17:00:00'),
       ('2022-03-31', '08:30:00', '15:00:00'),
       ('2022-04-01', '09:00:00', '16:00:00'),
       ('2022-04-04', '09:00:00', '16:00:00'),
       ('2022-04-05', '08:00:00', '14:00:00'),
       ('2022-04-06', '08:30:00', '15:00:00'),
       ('2022-04-07', '09:30:00', '16:30:00'),
       ('2022-04-08', '07:30:00', '12:00:00'),
       ('2022-04-09', '08:30:00', '15:00:00'),
       ('2022-04-10', '08:30:00', '15:00:00');

INSERT INTO doctor_worktype(id_doctor, id_worktime)
VALUES (1,1), (2,2), (3,3),(1,4),(2,4),(3,4),(4,5),(4,6),(4,7),(5,1),(5,8), (1,10);

INSERT INTO medications(medicine, description)
VALUES ('Nexium','Nexium is one of the drugs that lowers the secretion of aggressive gastric glands in gastritis and peptic ulcer disease.'),
       ('Panzinorm','Capsules contain Pancreatin, which is why digestion is stabilized against the background of its use.'),
       ('Mikrazim','The capsule dissolves, and the microgranules are mixed with food, after which they leave the stomach together with it'),
       ('Revit','Revit is designed to strengthen the body, improve the state of immunity. The complex includes vitamins A, B1 and B2, and vitamin C'),
       ('Paracetamol','200 mg tablets. Take with a large amount of liquid, 1-2 hours after meals (reception immediately after meals'),
       ('Ibuprofen','Adults and children with a body weight of more than 30 kg: 200-400 mg (1-2 tablets) per reception'),
       ('diclofenac ointment','Ointment - 2-4 g is applied in a thin layer, lightly rubbing into the skin, over the focus of inflammation 2-3 times a day');

INSERT INTO diagnos(diagnos, symptoms)
VALUES ('Gastritis','Abdominal pain, heartburn, diarrhea, constipation'),
       ('Pancreatitis','Aching pain in the pancreas, steatorrhea, disorders of the endocrine system, mechanical jaundice may be added'),
       ('Mumps','decreased salivation, dry mouth, ear pain, which increases during conversation, during meals, as well as central nervous system damage'),
       ('Pneumonia','Cough, General weakness, Chest pain and shortness of breath, Fever'),
       ('Joint pain','Pain, Discomfort, Swelling and/or redness, The joint feels warmer to the touch than the rest of the body'),
       ('Bronchitis','Cough, Cold Symptoms, Muscle Pain');

INSERT INTO diagnos_medicationse(id_diagnos, id_medications)
VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(4,5),(4,6),(5,7),(6,4);

INSERT INTO certificate(date_certificate, id_sick, id_doctor, id_diagnos)
VALUES ('2022-03-06', 1, 2, 1),
       ('2022-03-12', 1, 4, 5),
       ('2022-03-13', 2, 1, 2),
       ('2022-03-16', 3, 2, 4),
       ('2022-03-26', 4, 3, 3),
       ('2022-03-28', 5, 5, 6),
       ('2022-03-28', 2, 3, 1),
       ('2022-04-01', 3, 2, 2),
       ('2022-04-01', 3, 4, 5);

---2 pohľady s jednoduchým netriviálnym selectom nad jednou tabuľkou,

--nájdite všetky lieky, v popise ktorých sú(vitamin)
select m.medicine, m.description
from medications m
where m.description LIKE '%vitamin%';

--nájdite diagnózu a jej príznaky kde je názov diagnózy(Pneumonia)
select d.diagnos, d.symptoms
from diagnos d
where diagnos = 'Pneumonia';

---3 pohľady so spájaním tabuliek (1x spojenie aspoň 2 tabuliek, 1x spojenie aspoň 3 tabuliek, 1x outer join),

--Nájdite všetkých lekárov, ktorí pracujú (2022-03-31)
select d.fio as doctor, w.work_date ||' '||w.time_arrival||' '||w.time_leave as date
from doctor d
join doctor_worktype dw on d.id_doctor = dw.id_doctor
join worktime w on w.id_worktime = dw.id_worktime
where w.work_date = '2022-03-31'
order by doctor;

--nájdite lieky, ktoré sú spojené s diagnózou podľa jej názvu (Pneumonia)
select d.diagnos, m.medicine, m.description
from diagnos d
join diagnos_medicationse dm on d.id_diagnos = dm.id_diagnos
join medications m on m.id_medications = dm.id_medications
where diagnos = 'Pneumonia';

--zobraziť úplné informácie o pacientovi podľa jeho pasu (FP120344)
select s.fio, s.city ||' '|| s.street as addres, c.date_certificate,
       d.fio as doctor, d2.diagnos ||' - '|| d2.symptoms as diagnos,
       m.medicine||' - '||m.description as medicine
from sick s
left join certificate c on s.id_sick = c.id_sick
left join doctor d on d.id_doctor = c.id_doctor
left join diagnos d2 on d2.id_diagnos = c.id_diagnos
left outer join diagnos_medicationse dm on d2.id_diagnos = dm.id_diagnos
left join medications m on m.id_medications = dm.id_medications
where s.passport_id =  'FP120344';

---2 pohľady s použitím agregačných funkcií a/alebo zoskupenia.

--zobrazenie počtu pracovných dní podľa mena a priezviska lekára (Andrej Láska)
select d.fio as doctor, count(*) as count_work_day
from doctor d
join doctor_worktype dw on d.id_doctor = dw.id_doctor
join worktime w on w.id_worktime = dw.id_worktime
where d.fio = 'Andrej Láska'
group by doctor;

--nájdite pacientov, ktorí boli v nemocnici 2 krát
select s.fio, count(*) as number_sessions
from sick s
natural join certificate
group by s.fio
having count(*) = 2;