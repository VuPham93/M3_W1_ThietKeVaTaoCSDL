CREATE DATABASE thaoTacVoiBang;

USE thaoTacVoiBang;

CREATE TABLE contacts
( contact_id INT(11) NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(30) NOT NULL,
  first_name VARCHAR(25),
  birthday DATE,
  CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);

CREATE TABLE suppliers
( supplier_id INT(11) NOT NULL AUTO_INCREMENT,
  supplier_name VARCHAR(50) NOT NULL,
  account_rep VARCHAR(30) NOT NULL DEFAULT 'TBD',
  CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);

DROP TABLE contacts;

DROP TABLE contacts, suppliers;

ALTER TABLE contacts
    ADD second_name varchar(40) NOT NULL
        AFTER contact_id;

ALTER TABLE suppliers
    ADD supplier_type VARCHAR(10)
        FIRST,
    ADD supplier_weight int
        AFTER account_rep
;

ALTER TABLE contacts
    MODIFY birthday varchar(50) null;

ALTER TABLE contacts
    DROP COLUMN second_name;

ALTER TABLE contacts
    CHANGE COLUMN birthday date_of_birth
        VARCHAR(20) NOT NULL;

ALTER TABLE contacts
    RENAME TO people;
