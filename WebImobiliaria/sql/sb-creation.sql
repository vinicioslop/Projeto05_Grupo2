drop table users;
create table users (
    id BIGINT not null primary key
        generated ALWAYS as identity
        (start with 1, INCREMENT by 1),
    role varchar(200) not null default 'USUARIO',
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
    quarto varchar(255) default 'Não possui',
    banheiro varchar(255) default 'Não possui',
    suite varchar(255) default 'Não possui',
    garagem varchar(255) default 'Não possui',
    tamanho varchar(255) default 'Não possui',
    preco BIGINT not null
    );

drop table historico;
create table historico (
    id BIGINT not null primary key,
    disponibilidade varchar(100) not null default 'Compra',
    bairro varchar(200) not null,
    avenida varchar(200) not null,
    estado varchar(200) not null,
    pessoa varchar(200) not null,
    tipo varchar(100) not null,
    quarto varchar(255) default 'Não possui',
    banheiro varchar(255) default 'Não possui',
    suite varchar(255) default 'Não possui',
    garagem varchar(255) default 'Não possui',
    tamanho varchar(255) default 'Não possui',
    preco BIGINT not null
    );

insert into imovel values
    (default, default, 'Buritis', 'Rua Rubens Caporali Ribeiro', 'Minas Gerais - MG',
    'MIP', 'Apartamento', '4', '1', '1', '4', '211 m²', 699000);
insert into imovel values
    (default, 'Aluguel', 'Santana', 'Rua Antonio Pedro Figueiredo', 'São Paulo - SP',
    'Excellence Imóveis', 'Casa', '3', '3', '3', '4', '233 m²', 780000);
insert into imovel values
    (default, default, 'Londrina', 'Matheus Leme', 'Minas Gerais - MG',
    'SALIS IMOVEIS BH', 'Chácara', '2', '1', default, '2', '2.500 m²', 170000);
insert into imovel values
    (default, default, 'Jardins', 'Avenida Paulista', 'São Paulo - SP',
    'Ciclano', 'Cobertura', '5', '3', '2', '2', '150 m²', 20000);
insert into imovel values
    (default, 'Aluguel', 'Granja', 'Avenida Paulista', 'Ceará - CE',
    'Nelson', 'Fazenda', '4', '3', '2', '10', '25830000 m²', 3000000);
insert into imovel values
    (default, default, 'Parque Industrial Lagoinha', 'Rua Doutor Hugo Fortes', 'São Paulo - SP',
    'Galeria Imobiliária', 'Galpão', default, '5', default, '10', '1790 m²', 7200000);
insert into imovel values
    (default, 'Aluguel', 'Moema', 'Avenida Moema', 'São Paulo - SP',
    'Beltrano', 'Loja', default, '1', default, default, '202 m²', 2300000);

insert into users values
    (default, 'ADMIN', 'Ana Paula', 'anapaula', 1509442);
insert into users values
    (default, 'ADMIN', 'Nicolle Medina', 'nicolle', 1509442);
insert into users values
    (default, 'ADMIN', 'Vinícius Lopes Lima', 'vinicioslop', 1509442);
insert into users values
    (default, 'FUNCIONARIO', 'FUNCIONARIO', 'funcionario', 1509442);
insert into users values
    (default, 'USUARIO', 'USUARIO', 'usuario', 1509442);