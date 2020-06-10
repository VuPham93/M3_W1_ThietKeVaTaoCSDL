CREATE DATABASE quanlythuvien;

USE quanlythuvien;

CREATE TABLE student
(student_number VARCHAR(15) PRIMARY KEY ,
 student_name VARCHAR(50) NOT NULL ,
 address VARCHAR(500) NOT NULL ,
 email VARCHAR(50) NOT NULL ,
 image VARCHAR(50) NOT NULL
);

CREATE TABLE category
(cate_number VARCHAR(15) PRIMARY KEY
);

CREATE TABLE book
(book_id INT PRIMARY KEY ,
 book_name VARCHAR(50) NOT NULL ,
 price DOUBLE NOT NULL
);

CREATE TABLE borrowOrder
(order_number INT PRIMARY KEY ,
 order_data DATE NOT NULL
);

ALTER TABLE book
    ADD cate_number VARCHAR(15),
    ADD CONSTRAINT FOREIGN KEY (cate_number) REFERENCES category(cate_number);

ALTER TABLE borrowOrder
    ADD student_number VARCHAR(15),
    ADD CONSTRAINT FOREIGN KEY (student_number) REFERENCES student(student_number);

ALTER TABLE borrowOrder
    ADD book_id INT,
    ADD CONSTRAINT FOREIGN KEY (book_id) REFERENCES book(book_id);