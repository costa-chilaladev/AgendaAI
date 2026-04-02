create database if not exists agendaidb;
use agendaidb;
create table if not exists users (
    id int auto_increment primary key,
    name varchar(255) not null,
    email varchar(255) not null unique,
    password_hash varchar(255) not null
); 

create table if not exists services (
    id int auto_increment primary key,
    name varchar(255) not null,
    duration int not null,
    description text
);

create table if not exists appointments (
    id int auto_increment primary key,
    user_id int not null,
    service_id int not null,
    start_time time not NULL,
    end_time time not NULL,
    status ENUM('pending', 'confirmed', 'completed', 'cancelled') DEFAULT 'pending',
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (user_id) references users(id),
    foreign key (service_id) references services(id)
);