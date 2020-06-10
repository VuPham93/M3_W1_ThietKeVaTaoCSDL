create database librarymanager;

use librarymanager;

create table books(
    book_id int not null primary key,
    book_name nvarchar(50) not null,
    book_category nvarchar(50) not null,
    
);