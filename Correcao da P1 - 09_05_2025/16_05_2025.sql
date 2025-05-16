USE lojinha;

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