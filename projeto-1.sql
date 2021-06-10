DROP DATABASE IF EXISTS finance_control;

CREATE DATABASE IF NOT EXISTS finance_control;

USE finance_control;

DROP TABLE IF EXISTS transaction;

CREATE TABLE transaction (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type ENUM("compra", "venda") NOT NULL,
    product VARCHAR(255) NOT NULL,
    value DECIMAL(8, 2) NOT NULL,
    date_time DATETIME NOT NULL
) ENGINE=InnoDB;
# Pesquisar qual a forma de salvar o sinal do valor no bd
INSERT INTO transaction VALUES
	(DEFAULT, "compra", "Água", -20.20, "2021-06-04 12:22:36"),
    (DEFAULT, "venda", "Refrigerante", -40.80, "2021-06-03 15:35:00"),
    (DEFAULT, "venda", "Suco", 61.0, "2021-06-03 19:03:24");
  
SELECT * FROM transaction ORDER BY date_time ASC;

SELECT SUM(value) FROM transaction;

TRUNCATE transaction;





