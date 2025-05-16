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
	deletado_em TIMESTAMP
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
    deletado_em TIMESTAMP
);



CREATE TABLE IF NOT EXISTS vendas(
	id_venda BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id BIGINT UNSIGNED NOT NULL,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    forma_pagamento ENUM('Dinheiro','Cartão Débito','Cartão Crédito','PIX'),
    desconto_em DECIMAL(14,3) DEFAULT 0,
    alterado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em TIMESTAMP,
    CONSTRAINT fk_cliente_vendas
		FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);



CREATE TABLE IF NOT EXISTS itens_vendas(
	id_item_venda BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    produto_id BIGINT UNSIGNED NOT NULL,
    quantidade DECIMAL (14,3) NOT NULL,
    valor_initario DECIMAL(14,3) NOT NULL,
    desconto DECIMAL(14,3) NOT NULL,
    total DECIMAL(14,3) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    alterado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em TIMESTAMP,
    CONSTRAINT fk_produto_itens_vendas
		FOREIGN KEY (produto_id) REFERENCES produtos(id_produt)
);