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
    (default, 'ADMIN', 'Administrador', 'admin', 1509442),
    (default, 'OPERADOR', 'Fulano da Silva', 'fulano', 1509442);
