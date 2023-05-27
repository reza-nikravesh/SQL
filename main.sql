-- ************************************************
CREATE TABLE City(
    name VARCHAR(25) NOT NULL,
    province_name VARCHAR(25) NOT NULL,
    PRIMARY KEY(name)
);
-- ************************************************
CREATE TABLE Province(
    name VARCHAR(25) NOT NULL UNIQUE,
    PRIMARY KEY(name)
);
-- ************************************************
ALTER TABLE City
ADD FOREIGN KEY(province_name) REFERENCES Province(name);
-- ************************************************
CREATE TABLE Vendor(
    id AUTOINCREMENT NOT NULL UNIQUE,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    province_name VARCHAR(25) NOT NULL,
    city_name VARCHAR(25) NOT NULL,
    email VARCHAR(25),
    phone VARCHAR(25),
    PRIMARY KEY(id)
);
-- ************************************************
ALTER TABLE Vendor
ADD FOREIGN KEY(province_name) REFERENCES Province(name);
-- ************************************************
ALTER TABLE Vendor
ADD FOREIGN KEY(city_name) REFERENCES City(name);
-- ************************************************
CREATE TABLE JobPosition(
    name VARCHAR(25) NOT NULL UNIQUE,
    description VARCHAR(250),
    PRIMARY KEY(name)
);
-- ************************************************
CREATE TABLE Organization(
    name VARCHAR(25) NOT NULL UNIQUE,
    description VARCHAR(250),
    manager_id VARCHAR(25),
    PRIMARY KEY(name)
);
-- ************************************************
CREATE TABLE Employee(
    id AUTOINCREMENT NOT NULL UNIQUE,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    province_name VARCHAR(25) NOT NULL,
    city_name VARCHAR(25) NOT NULL,
    salary NUMBER,
    email VARCHAR(25),
    job_position_name VARCHAR(25),
    organization_name VARCHAR(25),
    PRIMARY KEY(id)
);
-- ************************************************
ALTER TABLE Employee
ADD FOREIGN KEY(province_name) REFERENCES Province(name);
-- ************************************************
ALTER TABLE Employee
ADD FOREIGN KEY(city_name) REFERENCES City(name);
-- ************************************************
ALTER TABLE Employee
ADD FOREIGN KEY(job_position_name) REFERENCES JobPosition(name);
-- ************************************************
ALTER TABLE Employee
ADD FOREIGN KEY(organization_name) REFERENCES Organization(name);
-- ************************************************
ALTER TABLE Organization
ADD FOREIGN KEY(manager_id) REFERENCES Employee(id)