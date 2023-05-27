CREATE TABLE City(
    name VARCHAR(25) NOT NULL,
    province_name VARCHAR(25) NOT NULL,
    PRIMARY KEY(name)
);
CREATE TABLE Province(
    name VARCHAR(25) NOT NULL UNIQUE,
    PRIMARY KEY(name)
);
ALTER TABLE City
ADD FOREIGN KEY(province_name) REFERENCES Province(name);