--odovzdanie-1
create table channel
(
    id_channel          serial not null unique primary key,
    name_channel        varchar(50) not null,
    description         varchar(255) not null,
    broadcast_language  varchar(100) not null
);

create table film
(
    id_film      serial not null unique primary key,
    name_film    varchar(50) not null,
    description  varchar(255) not null
);

create table channel_film
(
    date_time       timestamp not null,
    id_channel_fk   int not null,
    id_film_fk      int not null,
    foreign key (id_channel_fk) references channel(id_channel),
    foreign key (id_film_fk) references film(id_film)
);

create table serial
(
    id_serial    serial not null unique primary key,
    name_serial  varchar(50) not null,
    description  varchar(255) not null
);

create table series
(
    id_series      serial not null unique primary key,
    name_series    varchar(50) not null,
    id_serial_fk   int not null,
    foreign key (id_serial_fk) references serial(id_serial)
);

create table channel_series
(
    date_time       timestamp not null,
    id_channel_fk   int not null,
    id_series_fk    int not null,
    foreign key (id_channel_fk) references channel(id_channel),
    foreign key (id_series_fk) references series(id_series)
);


create table TV_show
(
    id_tv_show      serial not null unique primary key,
    name_tv_show    varchar(50) not null,
    description     varchar(255) not null
);

create table channel_TV_show
(
    date_time       timestamp not null,
    id_channel_fk   int not null,
    id_tv_show_fk   int not null,
    foreign key (id_channel_fk) references channel(id_channel),
    foreign key (id_tv_show_fk) references TV_show(id_tv_show)
);
--odovzdanie-2

insert into channel (name_channel, description, broadcast_language)
values  ('Plus','JOJ Plus vysiela v primetime najmä akvizičné seriály a reality šou. ','Slovenčina, Angličtina'),
        ('Doma','prvý televízny kanál zameraný na mladých, aktívnych ľudí na Slovensku. ','Slovenčina'),
        ('JOJ','Kanál vysiela seriály a televízne programy. ','Slovenčina, Angličtina'),
        ('TV 1000 World Kino','Denné stretnutia s hercami minulosti a hviezdami obrazovky našich dní. ','Slovenčina'),
        ('TV 1000 Comedy','Všetky filmy komediálnych žánrov: sitcomy, komediálne melodramy a akčné filmy. ','Slovenčina, Angličtina'),
        ('TV 1000 Premium','Premiérové filmy, nové položky v televízii, filmy nie staršie ako tri roky od vydania filmovej distribúcie a prémiové série každý deň s celosvetovými vydaniami. ','Slovenčina, Angličtina');

insert into film (name_film, description)
values ('Zápisník jednej lásky','Dvaja mladí ľudia Allie a Noah sa zblížia už počas dospievania. Spočiatku búrlivá romanca sa postupne zmení na hlboký vzťah'),
       ('Šikanovaná','Mandy je nová maminka ve městě a zpočátku je vítána v kruhu elitních matek, ale když její dcera překoná mocnou matku Olivii, zjistí, že je vyloučena.'),
       ('Ford vs. Ferrari','Divoká jazda za americkým snom.'),
       ('Gringo: Zelená pilulka','Čierna krimikomédia sleduje príbeh poctivého podnikateľa Harolda Soyinka, ktorý je poslaný do Mexika s experimentálnou tabletkou marihuany'),
       ('Mafiánovci','Čierna komédia z dielne Luca Bessona o bývalom gangsterovi'),
       ('Noc v múzeu','Nočný strážnik Larry sa v rámci svojej práce prechádza po múzeu a kontroluje, či sú všetky exponáty na svojich miestach'),
       ('Spider-man3','Tretí a posledný superhrdinský film v trilógii Sama Raimiho'),
       ('Lego Movie','Postapokalyptický svet LEGO zažíva novú katastrofu-inváziu cudzincov z planéty DUPLO'),
       ('Rush hour','americký televízny seriál v žánri policajnej situačnej komédie, ktorý je založený na rovnomennej filmovej sérii'),
       ('Vyrobené v Amerike','Bol najmladším pilotom Boeingu 747 v Spojených štátoch a za pár rokov sa stal jedným z najbohatších ľudí v Amerike.'),
       ('Otec','Anthony je ďaleko od mladých. Žije sám v Londýne, čo je pre jeho dcéru veľmi znepokojujúce');

insert into channel_film(date_time, id_channel_fk, id_film_fk)
values ('2022-04-01 08:10:00',1,3),
       ('2022-04-01 10:20:00',1,5),
       ('2022-04-01 12:30:00',1,6),
       ('2022-04-01 09:00:00',3,4),
       ('2022-04-01 10:30:00',3,3),
       ('2022-04-02 07:10:00',2,1),
       ('2022-04-02 08:40:00',2,2),
       ('2022-04-02 08:10:00',3,1),
       ('2022-04-02 13:10:00',4,7),
       ('2022-04-02 15:40:00',4,8),
       ('2022-04-03 11:11:00',5,9),
       ('2022-04-03 13:30:00',5,10),
       ('2022-04-03 08:10:00',5,7),
       ('2022-04-03 10:10:00',6,7),
       ('2022-04-03 15:20:00',6,11);

insert into serial(name_serial, description)
values ('Chicago Fire','Chicago Fire nás zavádí na 51. hasičskou stanici k elitní požární, záchranné a zdravotnické jednotce'),
       ('Monk','Monkovi sa zdá sen o dni, kedy pri explózií auta zahynula jeho žena Trudy.'),
       ('Sila ženy','Romantický seriál Turecko (2017-2018).'),
       ('Mentalista','Tím vyšetruje vraždu mladej servírky z miestneho motela.'),
       ('Láska na prenájom','Romantický seriál Turecko (2020-2021).');

insert into series(name_series, id_serial_fk)
values ('Two Families',1),
       ('Leaving the Station',1),
       ('Pan Monk a pes',2),
       ('Pan Monk svědkem na svatbě ',2),
       ('séria 105',5),
       ('séria 106',5);

insert into channel_series(date_time, id_channel_fk, id_series_fk)
values ('2022-04-01 12:30:00',1,1),
       ('2022-04-01 13:20:00',1,2),
       ('2022-04-01 14:30:00',1,3),
       ('2022-04-01 10:40:00',3,3),
       ('2022-04-01 12:30:00',3,4),
       ('2022-04-02 09:10:00',2,5),
       ('2022-04-02 10:40:00',2,6),
       ('2022-04-02 14:10:00',3,5);

insert into tv_show(name_tv_show, description)
values ('novinky','novinky na televíznom kanáli'),
       ('Výstavba domov','návrh a výstavba domov rôznej zložitosti'),
       ('ako sa to robí','ukážeme, ako sa to robí v továrni'),
       ('údržba záhrady','Záhradníctvo vo vašej domácnosti'),
       ('nové technológie','nové technológie z celého sveta');

insert into channel_tv_show (date_time, id_channel_fk, id_tv_show_fk)
values ('2022-04-01 14:30:00',1,1),
       ('2022-04-01 15:20:00',1,3),
       ('2022-04-01 16:30:00',1,5),
       ('2022-04-01 14:20:00',3,4),
       ('2022-04-01 15:30:00',3,5),
       ('2022-04-02 12:10:00',2,1),
       ('2022-04-02 13:40:00',2,2),
       ('2022-04-02 16:10:00',3,3);


--zobraziť všetky kanály vysielané v angličtine
select c.name_channel, c.broadcast_language
from channel c
where c.broadcast_language LIKE '%Angličtina%';

--zobraziť film a jeho popis názov filmu 'Spider-man3'
select f.name_film, f.description
from film f
where f.name_film = 'Spider-man3';

--zobraziť všetky filmy, ktoré sú na kanáli 'TV 1000 Comedy'
select f.name_film
from channel c
join channel_film cf on c.id_channel = cf.id_channel_fk
join film f on f.id_film = cf.id_film_fk
where c.name_channel = 'TV 1000 Comedy';

--zobraziť všetky tv_shows, ktoré budú v programe na 1 cislo a name_channel 'Plus'
select ts.name_tv_show as name
from channel c
join channel_tv_show cts on c.id_channel = cts.id_channel_fk
join tv_show ts on ts.id_tv_show = cts.id_tv_show_fk
where extract(day from cts.date_time) =  1 and c.name_channel = 'Plus';

--zobrazenie názvu kanála a všetkých sérií, ktoré sú na kanáli JOJ
select c.name_channel, s2.name_serial
from channel c
right join channel_series cs on c.id_channel = cs.id_channel_fk
right join series s on s.id_series = cs.id_series_fk
right join serial s2 on s2.id_serial = s.id_serial_fk
where c.name_channel = 'JOJ'
group by s2.name_serial, c.name_channel;

--zobrazenie kanála a počtu filmov, ktoré sa zobrazujú každý deň
select c.name_channel, extract(year from cf.date_time) ||'-'|| extract(month from cf.date_time) ||'-'||
       extract(day from cf.date_time) as date, count(f.name_film) as count_film
from channel c
full join channel_film cf on c.id_channel = cf.id_channel_fk
full join film f on f.id_film = cf.id_film_fk
group by c.name_channel, date
order by date;

--zobrazenie počtu filmov, ktoré sú na kanáloch 'TV 1000'
select DISTINCT  f.name_film, count(f.name_film)
from channel c
right join channel_film cf on c.id_channel = cf.id_channel_fk
right join film f on cf.id_film_fk = f.id_film
where c.name_channel like '%TV 1000%'
group by f.name_film;

--zobraziť názvy kanálov, na ktorých sú vysielania 'ako sa to robí' a 'novinky'
select c.name_channel
from channel c
join channel_tv_show cts on c.id_channel = cts.id_channel_fk
join tv_show ts on ts.id_tv_show = cts.id_tv_show_fk
where ts.name_tv_show = 'ako sa to robí'
union
select c.name_channel
from channel c
join channel_tv_show cts on c.id_channel = cts.id_channel_fk
join tv_show ts on ts.id_tv_show = cts.id_tv_show_fk
where ts.name_tv_show = 'novinky'