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