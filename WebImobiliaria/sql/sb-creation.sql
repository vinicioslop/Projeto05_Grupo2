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
    disponibilidade varchar(100) not null default 'Compra',
    bairro varchar(200) not null,
    avenida varchar(200) not null,
    estado varchar(200) not null,
    pessoa varchar(200) not null,
    tipo varchar(100) not null,
    quarto varchar(255) default '0',
    banheiro varchar(255) default '0',
    suite varchar(255) default '0',
    garagem varchar(255) default '0',
    tamanho varchar(255) default '0',
    preco BIGINT not null
    );

insert into imovel values
    (default, default, 'Jardins', 'Avenida Paulista', 'São Paulo - SP',
    'Ciclano', 'Cobertura', '5', '3', '2', '2', '150', 20000);

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