create database phantichvathietkecsdl;

use phantichvathietkecsdl;

create table customers(
    customer_number int not null primary key,
    customer_name nvarchar(50) not null,
    last_name nvarchar(50) not null,
    first_name nvarchar(50) not null,
    phone nvarchar(50) not null,
    address_1 nvarchar(50) not null,
    address_2 nvarchar(50),
    city nvarchar(50) not null,
    state nvarchar(50) not null,
    postal_code nvarchar(15) not null,
    country nvarchar(50) not null,
    credit_limit double
);

create table offices(
    office_code nvarchar(10) not null primary key,
    city nvarchar(50) not null,
    phone nvarchar(50) not null,
    address_1 nvarchar(50) not null,
    address_2 nvarchar(50),
    state nvarchar(50),
    country nvarchar(50) not null,
    postal_code nvarchar(15) not null
);

create table orders(
    orderNumber int not null primary key,
    orderDate date not null,
    requiredDate date not null,
    shippedDate date,
    status nvarchar(15) not null,
    comments text,
    quantity_ordered int not null,
    priceEach double not null,
    customer_number int,
    foreign key (customer_number) references customers(customer_number)
);

create table employees(
    employee_number int not null primary key,
    last_name nvarchar(50) not null,
    first_name nvarchar(50) not null,
    email nvarchar(100) not null,
    job_title nvarchar(50) not null,
    reportTo int,
    foreign key (reportTo) references employees(employee_number),
    office_code nvarchar(10),
    foreign key (office_code) references offices(office_code)
);

alter table customers
    add column employee_number int,
    add foreign key (employee_number) references employees(employee_number);

create table payments(
    customer_number int,
    check_number nvarchar(50) not null,
    payment_date date not null,
    amount double not null,
    foreign key (customer_number) references customers(customer_number),
    salesRepEmployeeNumber int,
    foreign key (salesRepEmployeeNumber) references employees(employee_number)
);

create table productlines(
    product_line nvarchar(50) not null primary key,
    text_description nvarchar(50),
    image nvarchar(50)
);

create table products(
    product_code nvarchar(15) not null primary key,
    product_name nvarchar(70) not null,
    product_scale nvarchar(10) not null,
    product_vendor nvarchar(50) not null,
    product_description text(50) not null,
    quantity_in_stock int not null,
    buy_price double not null,
    msrp double not null,
    product_line nvarchar(50),
    foreign key (product_line) references productlines(product_line)
);

create table order_detail(
    order_number int,
    product_number nvarchar(15),
    foreign key (order_number) references orders(orderNumber),
    foreign key (product_number) references products(product_code)
);