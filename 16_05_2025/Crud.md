# CRUD com SQL

No SQL para realizar o `CRUD` usamos os comandos `INSERT`, `SELECT`, `UPDATE`, `DELETE`.

## INSERT - criação de novos registros
Após a criação de um BD e uma Tabela, podemos inserir dados utilizando o comando `INSERT`.
```sql

-- Inserindo 1 registro, os valores devem estar na mesma ordem das colunas declaradas
INSERT INTO nome_tabela(campo_tabela, campo_tabela ...)
    VALUE ('valor1', valor3, 'valor3');

-- Inserir vários registros
INSERT INTO nome_tabela (campo1, campo2, campo3)
    VALUE (valor1, valor2, valor3), (valor1, calor2, valor3) ...;

-- IMPORTANTE: Tudo que não for numero deve estar dentro de apóstrofo.
-- NULL não deve estar dentro do apóstrofo e deve ser maíusculo.
-- Campos de ID não são declarados SOMENTE quando são auto_complete.

-- Podemos fazer INSERT sem declarar os campos, porem os valores devem estar na mesma ordem
--  dos campos da tabela (DIFICILMENTE É UTULIZADO);
INSERT INTO tabela VALUES (valor1, valor2, valor3);

-- INSERT sem USE
INSERT INTO nome_banco.nome_tabela (campo1, campo2)
    VALUE (value1, value2);
```

-----------------------------------------------------------------------------------------------


## SELECT - Ler a recuperar registro do BD 
Após a criação de um BD e uma Tabela, podemos ler os dados utilizados o comando `SELECT`.
```sql

-- Leitura simples, retorna tudo que está na Tabela
SELECT * FROM nome_tabela;

-- Escolhendo as colunas a serem retornadas
SELECT nome, email, celular, ... FROM nome_tabela;

-- Aplicando condições
SELECT * FROM nome_tabela WHERE salario > 5000;
SELECT * FROM tabela WHERE nome = "José" AND cidade = "Jaú";
SELECT * FROM tabela WHERE nome = "José" OR nome LIKE "João%";

-- Ordanando resultados
SELECT * FROM tabela ORDER BY nome ASC;
SELECT * FROM tabela ORDER BY salario DESC;

-- Limitando resultados
SELECT * FROM tabela LIMIT 5;

-- Funções de Agregação
SELECT 
    COUNT(id) AS total_usuarios,
    AVG(altura) AS media_altura,
    MAX(altura) AS maior_altura,
    MIN(altura) AS menor_altura
FROM tabela;

-- Agrupando resultado
SELECT cidade, COUNT(*) AS quantidade 
FROM tabela 
GROUP BY cidade;

-- Combinando tabelas
SELECT f.nome, d.departamento 
FROM funcionarios f
INNER JOIN departamentos d ON f.departamento_id = d.id_departamento;

-- TODAS AS COMBINAÇÕES DE EXEMPLOS PODEM SER UTIZADAS EM CONJUNTO.

```