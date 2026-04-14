drop database if exists phone_test;
CREATE DATABASE phone_test;
USE phone_test;

CREATE TABLE USERS (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(50),
    Phone INT -- Kiểu INT đang bị lỗi mất số 0 đây
);

INSERT INTO USERS (UserName, Phone) VALUES ('Hoang', 987654321);

ALTER TABLE USERS ADD COLUMN Phone_tmp VARCHAR(15);
SET SQL_SAFE_UPDATES = 0;
UPDATE USERS SET Phone_tmp = LPAD(Phone, 10, '0');
SET SQL_SAFE_UPDATES = 1;
ALTER TABLE USERS DROP COLUMN Phone;
ALTER TABLE USERS RENAME COLUMN Phone_tmp TO Phone;