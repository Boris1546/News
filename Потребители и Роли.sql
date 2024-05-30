CREATE ROLE db_admin;
GRANT ALL PRIVILEGES ON DATABASE news TO db_admin;

CREATE ROLE table_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Articles TO table_admin;

CREATE ROLE column_admin;
GRANT SELECT (name, email) ON Authors TO column_admin;

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'password';
GRANT db_admin TO 'admin_user'@'localhost';

CREATE USER 'table_user'@'localhost' IDENTIFIED BY 'password';
GRANT table_admin TO 'table_user'@'localhost';

CREATE USER 'column_user'@'localhost' IDENTIFIED BY 'password';
GRANT column_admin TO 'column_user'@'localhost';
