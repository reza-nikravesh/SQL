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
CREATE TABLE Category(
    name VARCHAR(25) NOT NULL UNIQUE,
    description VARCHAR(250),
    PRIMARY KEY(name)
);
-- ************************************************
CREATE TABLE Product(
    id AUTOINCREMENT NOT NULL UNIQUE,
    name VARCHAR(25),
    category_name VARCHAR(25),
    photo VARCHAR(250) NOT NULL,
    vendor_id INT NOT NULL,
    price NUMBER,
    description VARCHAR(250),
    PRIMARY KEY(id)
);
-- ************************************************
ALTER TABLE Product
ADD FOREIGN KEY(category_name) REFERENCES Category(name);
-- ************************************************
ALTER TABLE Product
ADD FOREIGN KEY(vendor_id) REFERENCES Vendor(id);
-- ************************************************
CREATE TABLE Customer(
    id AUTOINCREMENT NOT NULL UNIQUE,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    province_name VARCHAR(25) NOT NULL,
    city_name VARCHAR(25) NOT NULL,
    street VARCHAR(25),
    house_number NUMBER,
    email VARCHAR(25),
    PRIMARY KEY(id)
);
-- ************************************************
CREATE TABLE Order(
    id AUTOINCREMENT NOT NULL UNIQUE,
    customer_id INT,
    product_id INT,
    order_number NUMBER NOT NULL,
    delivery_date DATE,
    province_name VARCHAR(25) NOT NULL,
    city_name VARCHAR(25) NOT NULL,
    street VARCHAR(25),
    house_number NUMBER,
    PRIMARY KEY(id)
);
-- ************************************************
ALTER TABLE Customer
ADD FOREIGN KEY(province_name) REFERENCES Province(name);
-- ************************************************
ALTER TABLE Customer
ADD FOREIGN KEY(city_name) REFERENCES City(name);
-- ************************************************
ALTER TABLE Order
ADD FOREIGN KEY(province_name) REFERENCES Province(name);
-- ************************************************
ALTER TABLE Order
ADD FOREIGN KEY(city_name) REFERENCES City(name);
-- ************************************************
ALTER TABLE Order
ADD FOREIGN KEY(product_id) REFERENCES Customer(id);
-- ************************************************
ALTER TABLE Order
ADD FOREIGN KEY(customer_id) REFERENCES Product(id);
-- ************************************************