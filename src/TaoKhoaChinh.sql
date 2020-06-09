CREATE DATABASE taokhoachinh;

USE taokhoachinh;

CREATE TABLE users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(40),
    password VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE roles(
    role_id INT AUTO_INCREMENT,
    role_name VARCHAR(50),
    PRIMARY KEY (role_id)
);

CREATE TABLE userRoles(
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY(user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES  users(user_id),
    FOREIGN KEY (user_id) REFERENCES  roles(role_id)
);

CREATE TABLE test(
    id INT
);

ALTER TABLE test
    ADD PRIMARY KEY (id);
