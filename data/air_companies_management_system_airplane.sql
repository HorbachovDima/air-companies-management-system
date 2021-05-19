create table airplane
(
    id                    int auto_increment
        primary key,
    name                  varchar(255) not null,
    factory_serial_number int          not null,
    air_company_id        int          null,
    number_of_flights     int          null,
    flight_distance       double       null,
    fuel_capacity         double       not null,
    type                  varchar(255) not null,
    created_at            int          not null,
    constraint factory_serial_number_UNIQUE
        unique (factory_serial_number),
    constraint airplane_air_company_FK
        foreign key (air_company_id) references air_company (id)
);

create index airplane_air_company_FK_idx
    on airplane (air_company_id);

INSERT INTO airplane (id, name, factory_serial_number, air_company_id, number_of_flights, flight_distance, fuel_capacity, type, created_at) VALUES (1, 'Boeing 737', 11111, 1, 98, 17000, 125.5, 'Passenger plane', 1967);
INSERT INTO airplane (id, name, factory_serial_number, air_company_id, number_of_flights, flight_distance, fuel_capacity, type, created_at) VALUES (2, 'Boeing 787 Dreamliner', 22222, 1, 23, 18000, 233.5, 'Passenger plane', 2009);
INSERT INTO airplane (id, name, factory_serial_number, air_company_id, number_of_flights, flight_distance, fuel_capacity, type, created_at) VALUES (3, 'Boeing 737', 33333, 2, 123, 40000, 124.5, 'Passenger plane', 1967);
INSERT INTO airplane (id, name, factory_serial_number, air_company_id, number_of_flights, flight_distance, fuel_capacity, type, created_at) VALUES (4, 'Boeing 787 Dreamliner', 44444, 2, 323, 100000, 123, 'Passenger plane', 2009);
INSERT INTO airplane (id, name, factory_serial_number, air_company_id, number_of_flights, flight_distance, fuel_capacity, type, created_at) VALUES (5, 'Boeing 737', 55555, 3, 12, 10000, 100, 'Passenger plane', 1967);
INSERT INTO airplane (id, name, factory_serial_number, air_company_id, number_of_flights, flight_distance, fuel_capacity, type, created_at) VALUES (6, 'Boeing 787 Dreamliner', 66666, 3, 500, 500000, 250, 'Passenger plane', 2009);
INSERT INTO airplane (id, name, factory_serial_number, air_company_id, number_of_flights, flight_distance, fuel_capacity, type, created_at) VALUES (7, 'Boeing 737', 77777, 4, 700, 900000, 342.5, 'Passenger plane', 1967);
INSERT INTO airplane (id, name, factory_serial_number, air_company_id, number_of_flights, flight_distance, fuel_capacity, type, created_at) VALUES (8, 'Boeing 787 Dreamliner', 88888, 4, 1000, 300000, 321.5, 'Passenger plane', 2009);