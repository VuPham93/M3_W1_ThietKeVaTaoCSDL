create database demo;

use demo;

create table Products(
    id int primary key not null auto_increment,
    productCode nvarchar(20) not null,
    productName nvarchar(30) not null,
    productPrice double not null,
    productAmount int not null,
    productDescription nvarchar(50),
    productStatus nvarchar(20) default 'Good'
);

insert into Products value
    (1, '001', 'Iphone Xs Max', 1000, 100, 'Made in china', default),
    (2, '002', 'Iphone Xs', 900, 200, 'Made in china', default),
    (3, '003', 'Galaxy S20 Ultra', 1200, 500, 'Made in korea', default),
    (4, '004', 'Galaxy S20', 1100, 500, 'Made in korea', default);

create unique index productCode_index
on Products (productCode);

explain select * from Products where productCode = '002';

alter table products add index product_serial_index(productName, productCode);

explain select * from Products where productCode = '002';

create view product_view as
    select productCode, productName, productPrice, productStatus
from products;

select * from product_view;

create or replace view product_view as
    select productName, productPrice, productAmount, productDescription
from products;

select * from product_view;

drop view demo.product_view;

delimiter //
create procedure findAllProducts()
begin
    select * from products;
end //;
delimiter ;

call findAllProducts();

delimiter //
create procedure createProduct(
in id int,
in productCode nvarchar(20),
in productName nvarchar(30),
in productPrice double,
in productAmount int,
in productDescription nvarchar(50),
in productStatus nvarchar(20))
begin
    insert into Products value (id, productCode, productName, productPrice, productAmount, productDescription, productStatus);
end //
delimiter ;

call createProduct(5, '005', 'Galaxy zFlip', 2000, 130, 'Made in korea', 'New');

delimiter //
create procedure editProduct(
    in findId int,
    in newProductCode nvarchar(20),
    in newProductName nvarchar(30),
    in newProductPrice double,
    in newProductAmount int,
    in newProductDescription nvarchar(50),
    in newProductStatus nvarchar(20))
begin
    update products
    set productCode = newProductCode,
        productName = newProductName,
        productPrice = newProductPrice,
        productAmount = newProductAmount,
        productDescription = newProductDescription,
        productStatus = newProductStatus
    where id = findId;
end //
delimiter ;

call editProduct(5, '005', 'Galaxy Z Flip', 1800, 100, 'Made in korea', 'New');

delimiter //
create procedure deleteProduct(in findId int)
begin
    delete from products
    where id = findId;
end //
delimiter ;

call deleteProduct(4);