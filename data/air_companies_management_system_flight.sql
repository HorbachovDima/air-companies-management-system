
create table flight
(
    id                    int auto_increment
        primary key,
    flight_status         enum ('ACTIVE', 'COMPLETED', 'DELAYED', 'PENDING') not null,
    air_company_id        int                                                null,
    airplane_id           int                                                null,
    departure_country     varchar(255)                                       not null,
    destination_country   varchar(255)                                       not null,
    distance              double                                             not null,
    estimated_flight_time time                                               not null,
    ended_at              time                                               null,
    delay_started_at      time                                               null,
    created_at            datetime                                           null,
    constraint flight_air_company_FK
        foreign key (air_company_id) references air_company (id),
    constraint flight_airplane_FK
        foreign key (airplane_id) references airplane (id)
);

create index flight_air_company_FK_idx
    on flight (air_company_id);

create index flight_airplane_FK_idx
    on flight (airplane_id);

INSERT INTO flight (id, flight_status, air_company_id, airplane_id, departure_country, destination_country, distance, estimated_flight_time, ended_at, delay_started_at, created_at) VALUES (1, 'ACTIVE', 1, 1, 'Italy', 'Ukraine', 1677, '02:15:00', null, null, '2021-05-19 18:03:00');
INSERT INTO flight (id, flight_status, air_company_id, airplane_id, departure_country, destination_country, distance, estimated_flight_time, ended_at, delay_started_at, created_at) VALUES (2, 'COMPLETED', 1, 2, 'Ukraine', 'Germany', 1354.4, '02:13:00', '19:30:00', null, '2021-05-19 17:41:00');
INSERT INTO flight (id, flight_status, air_company_id, airplane_id, departure_country, destination_country, distance, estimated_flight_time, ended_at, delay_started_at, created_at) VALUES (3, 'ACTIVE', 2, 3, 'Italy', 'Ukraine', 1677, '02:15:00', null, null, '2021-05-19 13:30:00');
INSERT INTO flight (id, flight_status, air_company_id, airplane_id, departure_country, destination_country, distance, estimated_flight_time, ended_at, delay_started_at, created_at) VALUES (4, 'COMPLETED', 2, 4, 'Ukraine', 'Germany', 1354.4, '02:13:00', '20:30:00', null, '2021-05-19 18:41:00');
INSERT INTO flight (id, flight_status, air_company_id, airplane_id, departure_country, destination_country, distance, estimated_flight_time, ended_at, delay_started_at, created_at) VALUES (5, 'ACTIVE', 3, 5, 'Italy', 'Ukraine', 1677, '02:15:00', null, null, '2021-05-19 10:30:00');
INSERT INTO flight (id, flight_status, air_company_id, airplane_id, departure_country, destination_country, distance, estimated_flight_time, ended_at, delay_started_at, created_at) VALUES (6, 'COMPLETED', 3, 6, 'Ukraine', 'Germany', 1354.4, '02:13:00', '21:30:00', null, '2021-05-19 19:41:00');
INSERT INTO flight (id, flight_status, air_company_id, airplane_id, departure_country, destination_country, distance, estimated_flight_time, ended_at, delay_started_at, created_at) VALUES (7, 'ACTIVE', 4, 7, 'Italy', 'Ukraine', 1677, '02:15:00', null, null, '2021-05-19 22:30:00');
INSERT INTO flight (id, flight_status, air_company_id, airplane_id, departure_country, destination_country, distance, estimated_flight_time, ended_at, delay_started_at, created_at) VALUES (8, 'COMPLETED', 4, 8, 'Ukraine', 'Germany', 1354.4, '02:13:00', '22:30:00', null, '2021-05-19 20:41:00');