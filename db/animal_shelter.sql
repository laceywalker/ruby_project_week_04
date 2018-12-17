DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE owners (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 primary key,
  animal_name VARCHAR(255),
  type VARCHAR(255),
  owner_id INT8 REFERENCES owners(id),
  admission_date VARCHAR(255),
  available VARCHAR(255),
  image VARCHAR(255)
);
