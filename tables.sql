
-- create database(music_datbase)

use music_database;


-- create employee table

CREATE TABLE employee(
employee_id VARCHAR(50) PRIMARY KEY,
last_name CHAR(50),
first_name CHAR(50),
title VARCHAR(50),
reports_to VARCHAR(30),
levels VARCHAR(10),
birthdate datetime,
hire_date datetime,
address VARCHAR(120),
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(30),
postal_code VARCHAR(30),
phone VARCHAR(30),
fax VARCHAR(30),
email VARCHAR(30));

desc employee;

-- Customer table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    company VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(20),
    phone VARCHAR(30),
    fax VARCHAR(30),
    email VARCHAR(100),
    support_rep_id VARCHAR(30),
    FOREIGN KEY (support_rep_id) REFERENCES employee(employee_id)
);

desc customers;


-- Invoice table

CREATE TABLE invoice(
invoice_id INT primary key,
customer_id int,
invoice_date TIMESTAMP,
billing_address VARCHAR(120),
billing_city VARCHAR(30),
billing_state VARCHAR(30),
billing_country VARCHAR(30),
billing_postal VARCHAR(30),
total FLOAT8,
foreign key (customer_id)  references customers(customer_id));

desc Invoice;


-- album table

CREATE TABLE album(
album_id int PRIMARY KEY,
title  VARCHAR(50),
artist_id  int,
foreign key (artist_id) references artist(artist_id)
);

-- artist table

CREATE TABLE artist(
artist_id int PRIMARY KEY,
name  VARCHAR(100));


-- media-type tables

CREATE TABLE media_type(
media_type_id int PRIMARY KEY,
name VARCHAR(30));


-- Genre table

CREATE TABLE genre(
genre_id int PRIMARY KEY,
name VARCHAR(30));


-- track table

CREATE TABLE track(
track_id int PRIMARY KEY,
name VARCHAR(255) not null,
album_id int,
media_type_id int,
genre_id int,
composer VARCHAR(255),
milliseconds BIGINT  not null,
bytes BIGINT  not null,
unit_price DECIMAL(5,2) not null,
foreign key (album_id) references album(album_id),
foreign key (media_type_id) references media_type(media_type_id),
foreign key (genre_id) references genre(genre_id)
);






CREATE TABLE track (
    track_id INT PRIMARY KEY,
    name VARCHAR(255) ,
    album_id INT,
    media_type_id INT,
    genre_id INT,
    composer VARCHAR(255),
    milliseconds INT ,
    bytes INT ,
    unit_price DECIMAL(5,2) ,
    FOREIGN KEY (album_id) REFERENCES album(album_id),
    FOREIGN KEY (media_type_id) REFERENCES media_type(media_type_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);


-- Invoice_line table

CREATE TABLE invoice_line(
invoice_line_id INT PRIMARY KEY,
invoice_id int,
track_id int,
unit_price bigint,
quantity decimal(5,2),
foreign key(invoice_id) references Invoice(invoice_id),
foreign key(track_id) references track(track_id));


-- Playlist table

CREATE TABLE playlist(
playlist_id VARCHAR(50) PRIMARY KEY,
name  VARCHAR(50));


-- playlist_track


CREATE TABLE playlist_track(
playlist_id VARCHAR(50),
track_id int,
 foreign key(playlist_id) references playlist(playlist_id),
 foreign key(track_id) references track(track_id)
 );










