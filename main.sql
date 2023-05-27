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