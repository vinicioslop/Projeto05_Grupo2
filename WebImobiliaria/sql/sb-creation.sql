drop table users;
create table users (
    id BIGINT not null primary key
        generated ALWAYS as identity
        (start with 1, INCREMENT by 1),
    role varchar(200) not null,
    name varchar (200) not null,
    login varchar (20) not null,
    passwordHash BIGINT not null
);

insert into users values
    (default, 'ADMIN', 'Ana Paula', 'anapaula', 1509442);
insert into users values
    (default, 'ADMIN', 'Nicolle Medina', 'nicolle', 1509442);
insert into users values
    (default, 'ADMIN', 'Vinícius Lopes Lima', 'vinicioslop', 1509442);
insert into users values
    (default, 'FUNCIONARIO', 'FUNCIONARIO', 'funcionario', 1509442);
insert into users values
    (default, 'VISITANTE', 'VISITANTE', 'visitante', 1509442);