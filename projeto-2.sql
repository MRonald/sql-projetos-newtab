# Apagando o banco caso exista
DROP DATABASE IF EXISTS pay_bills;

# Criando o banco
CREATE DATABASE IF NOT EXISTS pay_bills default character set utf8 default collate utf8_general_ci;

USE pay_bills;

# Tabela USER ---

# Apagando a tabela caso exista
DROP TABLE IF EXISTS user;

# Criando a tabela
CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image_url VARCHAR(150) NOT NULL,
    username VARCHAR(50) NOT NULL,
    register_date DATETIME NOT NULL
) ENGINE=InnoDB;

# Inserindo dados na tabela
INSERT INTO user VALUES
	(DEFAULT, "Marcos", "https://google.com", "@marcos", "2021-06-04 12:22:36"),
    (DEFAULT, "Francisco", "https://google.com", "@francisco", "2021-06-03 15:35:00"),
    (DEFAULT, "Pedro", "https://google.com", "@pedro", "2021-06-03 19:03:24");

# Usuários em ordem alfabética
SELECT * FROM user ORDER BY name ASC;

# ---------------

# Tabela CARD ---

# Apagando a tabela caso exista
DROP TABLE IF EXISTS card;

# Criando a tabela
CREATE TABLE card (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number CHAR(16) NOT NULL,
    cvv CHAR(3) NOT NULL,
    expiration_date DATE NOT NULL,
    valid BOOLEAN NOT NULL,
    register_date DATETIME NOT NULL
) ENGINE=InnoDB;

# Inserindo dados na tabela
INSERT INTO card VALUES
	(DEFAULT, "1234567891234567", "325", "2025-06-22", TRUE, "2021-06-04 12:22:36"),
    (DEFAULT, "6546846513513849", "456", "2027-12-24", TRUE, "2021-06-03 15:35:00"),
    (DEFAULT, "1658465432761136", "291", "2022-11-01", TRUE, "2021-06-03 19:03:24");
    
# Cartões válidos em ordem da data de cadastro
SELECT * FROM card WHERE valid = TRUE ORDER BY register_date ASC;

# ---------------

# Tabela TRANSACTION ---

# Apagando a tabela caso exista
DROP TABLE IF EXISTS transaction;

# Criando a tabela
CREATE TABLE transaction (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    id_card INT NOT NULL,
    value DECIMAL(8, 2) NOT NULL,
    register_date DATETIME NOT NULL,
    foreign key (id_user) references user(id),
    foreign key (id_card) references card(id)
) ENGINE=InnoDB;

# Inserindo dados na tabela
INSERT INTO transaction VALUES
	(DEFAULT, 1, 1, 456.78, "2021-06-04 12:22:36"),
    (DEFAULT, 2, 2, 256.99, "2021-06-03 15:35:00"),
    (DEFAULT, 3, 3, 23452.50, "2021-06-03 19:03:24");

# Dados com JOIN em ordem decrescente da data de cadastro
SELECT t.id, u.name, u.username, c.number, c.cvv, DATE_FORMAT(c.expiration_date, '%m/%y'), c.valid, t.value, t.register_date
FROM transaction t JOIN user u ON t.id_user = u.id JOIN card c ON t.id_card = c.id;

# ---------------