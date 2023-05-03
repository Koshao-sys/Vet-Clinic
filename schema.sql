CREATE DATABASE vet_clinic;

CREATE TABLE animals (
	id SERIAL PRIMARY KEY,
	name VARCHAR(250),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL(10,2)
);