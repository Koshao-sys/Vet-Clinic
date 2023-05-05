CREATE DATABASE vet_clinic;

CREATE TABLE animals (
	id SERIAL PRIMARY KEY,
	name VARCHAR(250),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL(10,2)
);

ALTER TABLE animals ADD species VARCHAR(250);

CREATE TABLE owners(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	full_name VARCHAR(250),
	age INT
);

CREATE TABLE species(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(250)
);

/* Remove column species */
ALTER TABLE animals DROP COLUMN species;

/* Add column species_id which is a foreign key referencing species table */
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

/* Add column owner_id which is a foreign key referencing the owners table */
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

CREATE TABLE vets(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(250),
	age INT,
	date_of_graduation date
);

CREATE TABLE specializations(
	vet_id INT REFERENCES vets(id),
	species_id INT REFERENCES species(id),
	PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits(
	animal_id INT REFERENCES animals(id),
	vet_id INT REFERENCES vets(id),
	date_of_visit date,
	PRIMARY KEY (animal_id, vet_id, date_of_visit)
);