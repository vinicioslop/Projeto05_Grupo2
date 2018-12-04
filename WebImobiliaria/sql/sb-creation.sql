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

drop table imovel;
create table imovel (
    id BIGINT not null primary key
        generated ALWAYS as identity
        (start with 1, INCREMENT by 1),
    bairro varchar(200) not null,
    avenida varchar(200) not null,
    estado varchar(200) not null,
    pessoa varchar(200) not null,
    tipo varchar(100) not null,
    quarto varchar(20),
    banheiro varchar(20),
    suite varchar(20),
    garagem varchar(20),
    tamanho varchar(20)
    );

insert into imovel values
    (default, 'Jardins', 'Avenida Paulista', 'São Paulo - SP',
    'Ciclano', 'Cobertura', '5', '3', '2', '2', '150 m²');

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