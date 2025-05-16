USE lojinha;

INSERT INTO usuarios(nome, cpf, data_nascimento, email, celular, rua, numero, complemento, bairro, cidade, estado, 
genero, ativo)
	VALUES ('Luiz Eduardo', '111.111.111-11', '2005-03-29', 'marina@gamil.com', '(14) 998488890', 'Ave. Nene Galvao', 
    '210', 'casa', 'Jardim Jorge Atala', 'Bauru', 'SP', 'F', 'S'); 
    
INSERT INTO usuarios(nome, cpf, data_nascimento, email, celular, rua, numero, complemento, bairro, cidade, estado, 
genero, ativo)
	VALUES ('Marina Frankin', '111.111.111-11', '2005-03-29', 'marina@gamil.com', '(14) 998488890', 'Ave. Nene Galvao', 
    '271', 'casa', 'Jardim Jorge Atala', 'Jau', 'SP', 'F', 'S'); 
    
INSERT INTO usuarios(nome, cpf, data_nascimento, email, celular, rua, numero, complemento, bairro, cidade, estado, 
genero, ativo)
	VALUES ('Marina Frankin', '111.111.111-11', '2005-03-29', 'marina@gamil.com', '(14) 998488890', 'Ave. Nene Galvao', 
    '271', 'casa', 'Jardim Jorge Atala', 'Jau', 'SP', 'F', 'S'), ('Maria Cristina', '222.222.222-22', '2000-05-25', 'mariaCristina@gamil.com', '(14) 996936628', 'Ave. Nene Galvao', 
    '300', 'apartamento', 'Jardim Jorge Atala', 'Jau', 'SP', 'F', 'S');
    
SELECT * FROM usuarios;

SELECT criado_em, nome, email, celular FROM usuarios;

SELECT 
	criado_em AS "Data de Cadastro", 
	nome AS nome_completo, 
    cpf 
FROM usuarios;
SELECT * FROM usuarios WHERE nome LIKE "Maria%";
SELECT * FROM usuarios WHERE nome LIKE "Marina%";
SELECT * FROM usuarios WHERE nome LIKE "%Frankin";

SELECT * FROM usuarios WHERE email LIKE "%marina%";

SELECT * FROM usuarios WHERE deletado_em IS NULL;
SELECT * FROM usuarios WHERE deletado_em IS NOT NULL;

SELECT * FROM usuarios ORDER BY nome ASC;

SELECT * FROM usuarios LIMIT 1;

SELECT COUNT(*) AS total, nome FROM usuarios;

SELECT cidade, COUNT(*) AS quantidade 
	FROM usuarios 
	GROUP BY cidade;
    
