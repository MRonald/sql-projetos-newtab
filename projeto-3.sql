# Apagando o banco caso exista
DROP DATABASE IF EXISTS hashtag_finder;

# Criando o banco
CREATE DATABASE IF NOT EXISTS hashtag_finder default character set utf8 default collate utf8_general_ci;

USE hashtag_finder;

# Tabela FIND ---

# Apagando a tabela caso exista
DROP TABLE IF EXISTS find;

# Criando a tabela
CREATE TABLE find (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hashtag VARCHAR(255) NOT NULL,
    register_date DATETIME NOT NULL
) ENGINE=InnoDB;

# Inserindo dados na tabela
INSERT INTO find VALUES
	(DEFAULT, "HTML", "2021-06-04 12:22:36"),
    (DEFAULT, "CSS", "2021-06-03 15:35:00"),
    (DEFAULT, "JavaScript", "2021-06-03 19:03:24");

# Usuários em ordem alfabética
SELECT * FROM find ORDER BY register_date ASC;

# ---------------

# Tabela SQUAD ---

# Apagando a tabela caso exista
DROP TABLE IF EXISTS squad;

# Criando a tabela
CREATE TABLE squad (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    github_profile VARCHAR(150) NOT NULL,
    linkedin_profile VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    image_url VARCHAR(150) NOT NULL
) ENGINE=InnoDB;

# Inserindo dados na tabela
INSERT INTO squad VALUES
	(DEFAULT, "Michael", "Programador por natureza, sou um eterno aprendiz do que amo: tecnologia. Contribuí com esse projeto desenvolvendo a página Home e a parte de busca por hashtags.", 
		"https://github.com/MRonald", "https://www.linkedin.com/in/mr-dev/", "meuemail@gmail.com", "https://google.com/image");

# Usuários em ordem alfabética
SELECT * FROM squad;

# ---------------

# Tabela USER ---

# Apagando a tabela caso exista
DROP TABLE IF EXISTS user;

# Criando a tabela
CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL,
    password VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

# Inserindo dados na tabela
INSERT INTO user VALUES
	(DEFAULT, "contato@newtab.academy", "123456");

# Usuários em ordem alfabética
SELECT * FROM user;

# ---------------