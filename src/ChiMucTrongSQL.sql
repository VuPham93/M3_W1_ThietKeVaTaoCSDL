use classicmodels;

select * from customers where customerNumber = 175;

explain select * from customers where customerNumber = 175;

alter table customers add index idx_customerNumber(customerNumber);

explain select * from customers where customerNumber = 175;

alter table customers add index idx_full_name(contactFirstName, contactLastName);

explain select * from customers where contactFirstName = 'jean' or contactFirstName = 'King';

alter table customers drop index idx_full_name;

alter table customers drop index idx_customerNumber;



