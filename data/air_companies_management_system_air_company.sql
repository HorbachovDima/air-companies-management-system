create table air_company
(
    id           int auto_increment
        primary key,
    name         varchar(255) not null,
    company_type varchar(255) not null,
    founded_at   int          not null,
    constraint name_UNIQUE
        unique (name)
);

INSERT INTO air_companies_management_system.air_company (id, name, company_type, founded_at) VALUES (1, 'Emirates Airline', 'Air Company', 1985);
INSERT INTO air_companies_management_system.air_company (id, name, company_type, founded_at) VALUES (2, 'Qatar Airways', 'Air Company', 1993);
INSERT INTO air_companies_management_system.air_company (id, name, company_type, founded_at) VALUES (3, 'Saudia', 'Air Company', 1945);
INSERT INTO air_companies_management_system.air_company (id, name, company_type, founded_at) VALUES (4, 'SkyUp', 'Air Company', 2017);
INSERT INTO air_companies_management_system.air_company (id, name, company_type, founded_at) VALUES (5, 'Bravo Airways2', 'Air Company', 2012);