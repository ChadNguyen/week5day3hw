DROP TABLE theatre cascade;
CREATE TABLE theatre(
	theatre_id SERIAL PRIMARY KEY,
	staff_id integer,
	movie_id integer,
	FOREIGN KEY(staff_id) REFERENCES staff(staff_id),
	FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);

DROP TABLE IF EXISTS staff;
CREATE TABLE staff(
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45),
	last_name VARCHAR(45),
	address VARCHAR(255),
	phone_number VARCHAR(45),
	email VARCHAR(45),
	job_position varchar(45)	
);

INSERT INTO staff(
		first_name,
		last_name, 
		address,
		phone_number,
		email,
		job_position
	)values(
		'Chad',
		'Nguyen',
		'1337 boston ma',
		'131-131-1311',
		'chadn@gmail.com',
		'popcorn guy'
);

SELECT *
FROM staff; 

DROP TABLE IF EXISTS movies;
CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(45),
	genre VARCHAR(45),
	rated VARCHAR(45),
	release_date VARCHAR(45),
	actors VARCHAR(255),
	director varchar(45),
	description text
);

INSERT INTO movies(
	title,
	genre,
	rated,
	release_date,
	actors,
	director,
	description
)values(
	'Coding Impossible',
	'Sci-Fi comedy',
	'E',
	'2/24/2023',
	'cdn109',
	'TBD',
	'descriptions here'
),(
	'The Coding Temple',
	'comedy',
	'pg-13',
	'2/23/2023',
	'cdn109',
	'TBD',
	'descriptions here'
);

SELECT *
FROM movies;

DROP TABLE IF EXISTS showtime ;
CREATE TABLE showtime(
	showtime_id SERIAL PRIMARY KEY,
	movie_id integer,
	start_time integer,
	end_time integer,
	theatre_id integer,
	FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
	FOREIGN KEY(theatre_id) REFERENCES theatre(theatre_id)
);

INSERT INTO showtime(
	start_time,
	end_time
)values(
	'10',
	'6 '
),(
	'10',
	'6'
);

SELECT *
FROM showtime;

DROP TABLE IF EXISTS ticket;
CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	customer_id integer,
	showtime_id integer,
	quantity integer,
	price float,
	date_ timestamp,
	FOREIGN KEY(showtime_id) REFERENCES showtime(showtime_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

INSERT INTO ticket(
	customer_id,
	showtime_id,
	quantity,
	price,
)values(
	'10',
	'6 '
),(
	'10',
	'6'
);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45),
	last_name VARCHAR(45),
	phone_number VARCHAR(255),
	email varchar(255),
	billing_info VARCHAR(255) 
);


SELECT *
FROM concession_product;

DROP TABLE IF EXISTS concession_product;
CREATE TABLE concession_product(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(255),
	price FLOAT
);

DROP TABLE IF EXISTS concession_purchases;
CREATE TABLE concession_purchases(
	purchase_id SERIAL PRIMARY KEY,
	product_id integer,
	total_amount float, 
	quantity integer,
	staff_id integer NOT NULL,
	FOREIGN KEY(product_id) REFERENCES concession_product(product_id),
	FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);