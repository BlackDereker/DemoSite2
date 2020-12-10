CREATE DATABASE IF NOT EXISTS loja_schema;

CREATE USER 'loja'@'localhost' IDENTIFIED BY 'root';

DELETE FROM mysql.user WHERE user=''; FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON loja_schema.* TO 'loja'@'%' IDENTIFIED BY 'root';