INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Charmander', '2020-02-08', 0, false, 11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Squirtle', '1993-04-02', 2, false, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Ditto', '2022-05-14', 4, true, 22);

/* insert into the owners table */
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);

/* insert into species */
INSERT INTO SPECIES(name) VALUES('Pokemon');
INSERT INTO SPECIES(name) VALUES('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id is null;

/* add owners to animals table */
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon','Boarmon');

/* insert data for vets */
INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher',45,'2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Maisy Smith',26,'2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Stephanie Mendez',64,'1981-05-04');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Jack Harkness',38,'2008-06-08');

/* data for specialities */
INSERT INTO specializations(vet_id, species_id) VALUES(1, 1);
INSERT INTO specializations(vet_id, species_id) VALUES(3, 1);
INSERT INTO specializations(vet_id, species_id) VALUES(3, 2);
INSERT INTO specializations(vet_id, species_id) VALUES(4, 2);

/* insert into visits table */
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(5,2,'2020-03-08');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(5,2,'2020-05-14');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(6,3,'2021-05-04');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(7,4,'2021-02-24');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(8,2,'2019-12-21');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(8,1,'2020-08-10');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(8,2,'2021-04-07');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(9,3,'2019-09-29');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(10,4,'2020-10-03');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(10,4,'2020-11-04');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(11,2,'2019-01-24');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(11,2,'2019-05-15');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(11,2,'2020-02-27');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(11,2,'2020-08-03');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(12,3,'2020-05-24');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES(12,1,'2021-01-11');
