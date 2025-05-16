CREATE DATABASE IF NOT EXISTS lojinha CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

USE lojinha;

CREATE TABLE IF NOT EXISTS cliente(
	id_cliente BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL, 
    data_nascimento DATE NOT NULL, 
    email VARCHAR(255),
    celular VARCHAR(20) NOT NULL,
    rua VARCHAR(255),
    numero VARCHAR(10),
    complemento VARCHAR(255),
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    estado CHAR(2),
    genero CHAR(1),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    alterado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	deletado_em TIMESTAMP NULL
);


CREATE TABLE IF NOT EXISTS produtos(
	id_produto BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    marca VARCHAR(100),
    estoque DECIMAL(14,3) DEFAULT 0,
    valor_compra DECIMAL(14,3) NOT NULL,
    valor_venda DECIMAL(14,3) NOT NULL,
    ativo BOOL DEFAULT 1,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    alterado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em TIMESTAMP NULL
);



CREATE TABLE IF NOT EXISTS vendas(
	id_venda BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id BIGINT UNSIGNED NOT NULL,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    forma_pagamento ENUM('Dinheiro','Cartão Débito','Cartão Crédito','PIX'),
    desconto_em DECIMAL(14,3) DEFAULT 0,
    alterado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em TIMESTAMP NULL,
    CONSTRAINT fk_cliente_vendas
	FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);



DROP TABLE IF EXISTS itens_vendas;

CREATE TABLE IF NOT EXISTS itens_vendas(
	id_item_venda BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    produto_id BIGINT UNSIGNED NOT NULL,
    venda_id BIGINT UNSIGNED NOT NULL,
    quantidade DECIMAL (14,3) NOT NULL,
    valor_initario DECIMAL(14,3) NOT NULL,
    desconto DECIMAL(14,3) NOT NULL,
    total DECIMAL(14,3) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    alterado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em TIMESTAMP NULL,
	CONSTRAINT fk_produto_itens_vendas
		FOREIGN KEY (produto_id) REFERENCES produtos(id_produto),
	CONSTRAINT fk_vendas_itens_vendas
		FOREIGN KEY (venda_id) REFERENCES vendas(id_venda)
);



RENAME TABLE cliente TO usuarios;

ALTER TABLE vendas DROP  FOREIGN KEY fk_cliente_vendas;
ALTER TABLE usuarios RENAME COLUMN id_cliente TO id_usuario;	

-- No Maria DB (Não colocar o PRIMARY KEY)
ALTER TABLE usuarios CHANGE id_cliente id_usuario BIGINT UNSIGNED AUTO_INCREMENT;

ALTER TABLE usuarios DROP COLUMN id_cliente;
ALTER TABLE usuarios 
	ADD COLUMN id_usuario BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY FIRST;

-- Altera o nomde do campo de FK
ALTER TABLE vendas CHANGE cliente_id usuario_id BIGINT UNSIGNED;
ALTER TABLE vendas ADD CONSTRAINT fk_usuario_vendas FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario);

-- Adiciona um campo chamativo em cada tabela, inicialmente do tipo TINYINT
ALTER TABLE usuarios ADD COLUMN ativo TINYINT AFTER genero;
ALTER TABLE produtos ADD COLUMN ativo TINYINT AFTER valor_venda;
ALTER TABLE vendas ADD COLUMN ativo TINYINT AFTER total_venda;

-- Em seguida, altere o tipo do campo ativo para CHAR(1) em todas as tabeles
ALTER TABLE usuarios CHANGE ativo ativo CHAR(1);
ALTER TABLE produtos CHANGE ativo ativo CHAR(1);
ALTER TABLE vendas CHANGE ativo ativo CHAR(1);

-- Crie um usuario no SGB com seu nome proprio
CREATE USER 'marina'@'localhost' IDENTIFIED BY 'SenhaForteAqui123';

--Conceda a esse usuário permissões de CRUD (Create, Read, Update, Delete) para todas as tabelas
GRANT SELECT, INSERT, UPDATE, DELETE ON lojinha.* TO 'marina'@'localhost';
FLUSH PRIVILEGES;