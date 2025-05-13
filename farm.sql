-- Create the database
CREATE DATABASE IF NOT EXISTS farm_inventory;
USE farm_inventory;

-- Table: Farms
CREATE TABLE Farms (
    farm_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(150) NOT NULL
);

-- Table: Houses
CREATE TABLE Houses (
    house_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0),
    FOREIGN KEY (farm_id) REFERENCES Farms(farm_id)
);

-- Table: Chicken Batches
CREATE TABLE Chicken_Batches (
    batch_id INT AUTO_INCREMENT PRIMARY KEY,
    house_id INT NOT NULL,
    breed VARCHAR(50) NOT NULL,
    arrival_date DATE NOT NULL,
    expected_culling_date DATE,
    FOREIGN KEY (house_id) REFERENCES Houses(house_id)
);

-- Table: Suppliers
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    contact_info VARCHAR(150)
);

-- Table: Feeds
CREATE TABLE Feeds (
    feed_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    supplier_id INT,
    UNIQUE (name, type),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Table: Feed Usage (Many-to-Many)
CREATE TABLE Feed_Usage (
    usage_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_id INT NOT NULL,
    feed_id INT NOT NULL,
    amount_used DECIMAL(10,2) NOT NULL CHECK (amount_used >= 0),
    usage_date DATE NOT NULL,
    FOREIGN KEY (batch_id) REFERENCES Chicken_Batches(batch_id),
    FOREIGN KEY (feed_id) REFERENCES Feeds(feed_id)
);

-- Table: Egg Production
CREATE TABLE Egg_Production (
    production_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_id INT NOT NULL,
    production_date DATE NOT NULL,
    eggs_collected INT NOT NULL CHECK (eggs_collected >= 0),
    cracked_eggs INT DEFAULT 0 CHECK (cracked_eggs >= 0),
    FOREIGN KEY (batch_id) REFERENCES Chicken_Batches(batch_id)
);

-- Table: Vaccinations
CREATE TABLE Vaccinations (
    vaccination_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_id INT NOT NULL,
    vaccine_name VARCHAR(100) NOT NULL,
    vaccination_date DATE NOT NULL,
    administered_by VARCHAR(100),
    FOREIGN KEY (batch_id) REFERENCES Chicken_Batches(batch_id)
);

-- Table: Mortality Records
CREATE TABLE Mortality_Records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_id INT NOT NULL,
    date_reported DATE NOT NULL,
    number_dead INT NOT NULL CHECK (number_dead >= 0),
    cause VARCHAR(150),
    FOREIGN KEY (batch_id) REFERENCES Chicken_Batches(batch_id)
);

-- Table: Roles
CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

-- Table: Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    date_joined DATE DEFAULT CURRENT_DATE
);

-- Junction Table: User_Roles (Many-to-Many)
CREATE TABLE User_Roles (
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    assigned_date DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);
