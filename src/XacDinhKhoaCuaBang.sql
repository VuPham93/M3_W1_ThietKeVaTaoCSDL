CREATE DATABASE xacdinhkhoacuabang;

USE xacdinhkhoacuabang;

CREATE TABLE customers(
    customer_number INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    full_name NVARCHAR(20) NOT NULL,
    address NVARCHAR(40) NOT NULL,
    email NVARCHAR(30) NOT NULL UNIQUE,
    phone NVARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE accounts(
    account_number INT(15) NOT NULL AUTO_INCREMENT,
    account_type NVARCHAR(10) NOT NULL,
    open_date DATE NOT NULL,
    balance INT NOT NULL,
    PRIMARY KEY (account_number),
    customer_number INT(10),
    FOREIGN KEY (customer_number) REFERENCES customers(customer_number)
);

CREATE TABLE transactions(
    tran_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_number INT(15),
    tran_date DATE NOT NULL,
    amount INT,
    descriptions NVARCHAR(100)
);

ALTER TABLE transactions
    ADD FOREIGN KEY (account_number) REFERENCES accounts(account_number)