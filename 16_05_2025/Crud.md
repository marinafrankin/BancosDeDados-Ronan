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
```