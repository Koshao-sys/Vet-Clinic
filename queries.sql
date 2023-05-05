select * from animals where name like '%mon';
select * from animals where date_of_birth > '2016-12-30' and date_of_birth < '2019-01-01';
select * from animals where neutered is true and escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered is true;
select * from animals where name <> 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;

begin;
update animals set species = 'unspecified';
select * from animals;
rollback;
select * from animals;

begin;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where species is null;
commit;
select * from animals;

begin;
delete from animals;
rollback;
select * from animals;

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint first_savepoint;
update animals set weight_kg = weight_kg * -1;
rollback to savepoint first_savepoint;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, sum(escape_attempts) from animals group by neutered;
select species, min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;

/* Who was the last animal seen by William Tatcher? */
select a.name as animal_name, v.name as vet_name, max(s.date_of_visit) as last_visit from animals a
join visits s on a.id = s.animal_id
join vets v on v.id = s.vet_id
where v.name = 'William Tatcher' 
group by a.name, v.name
order by last_visit desc
LIMIT 1;

/* How many different animals did Stephanie Mendez see? */
select count(v.animal_id) as number_of_animals from visits v
join vets s on v.vet_id = s.id
where s.name = 'Stephanie Mendez';

/* List all vets and their specialties, including vets with no specialties. */
select v.name as vet_name, sp.name as speciality from vets v
left join specializations s on v.id = s.vet_id
left join species sp on s.species_id = sp.id
order by v.name

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020 */
select a.* from animals a
join visits v on a.id = v.animal_id
join vets vt on v.vet_id = vt.id
where vt.name = 'Stephanie Mendez' and v.date_of_visit between '2020-04-01' and '2020-08-30';

/* What animal has the most visits to vets */
select count(a.*) as visit_count, a.* from animals a
join visits v on a.id = v.animal_id
group by a.id
order by visit_count desc
LIMIT 1;

/* Who was Maisy Smith's first visit */
select a.name, v.date_of_visit from animals a
join visits v on a.id = v.animal_id
join vets vt on v.vet_id = vt.id
where vt.name = 'Maisy Smith'
order by v.date_of_visit asc
LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit */
select a.name as animal_name, vt.name as vet_name, v.date_of_visit from visits v
jojoin animals a on v.animal_id = a.id
join vets vt on v.vet_id = vt.id
order by v.date_of_visit desc
limit 1;

/* How many visits were with a vet that did not specialize in that animal's species */
select count(v.*) Number_Of_Visits from visits v
inner join animals a on v.animal_id = a.id
inner join vets vt on v.vet_id = vt.id
inner join specializations s on vt.id = s.vet_id and a.species_id = s.species_id

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most */
select count(s.species_id), sp.name from visits v
join animals a on v.animal_id = a.id
join specializations s on a.species_id = s.species_id
join species sp on s.species_id = sp.id
join vets vt on v.vet_id = vt.id
where vt.name = 'Maisy Smith'
group by s.species_id, sp.name
limit 1;