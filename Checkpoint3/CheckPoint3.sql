/*
	1 - Criação das tabelas com as suas respectivas chaves primárias e estrangeiras.
*/

DROP DATABASE if exists emarketfeiraDB;
CREATE DATABASE IF NOT EXISTS emarketfeiraDB;
USE emarketfeiraDB;

CREATE TABLE IF NOT EXISTS enderecos (
	id_endereco int not null auto_increment primary key,
	rua varchar(100) not null,
    bairro varchar(50) not null,
    numero varchar(20) not null,
    cidade varchar(100) not null,
    estado varchar(50) not null,
	cep varchar(20) not null,
    referencia varchar(150) not null
);

CREATE TABLE IF NOT EXISTS clientes (
	id_cliente int not null auto_increment primary key,
	nome varchar(50) not null,
	sobrenome varchar(100) not null,
	email varchar(300) not null,
	senha char(50) not null,
	cpf bigint not null,
	id_endereco int not null,
	CONSTRAINT fk_enderecos_clientes
		FOREIGN KEY (id_endereco) REFERENCES enderecos (id_endereco) 
);

CREATE TABLE IF NOT EXISTS contatos_clientes (
	id_contato int not null auto_increment primary key,
	telefone varchar(50) not null,
	id_cliente int not null,
	CONSTRAINT fk_contatos_clientes
		FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) 
);

CREATE TABLE IF NOT EXISTS fornecedores (
	id_fornecedor int not null auto_increment primary key,
	nome_fornecedor varchar(100) not null,
	CNPJ bigint not null,
	email_fornecedor varchar(200) not null,
	id_endereco int not null,
    CONSTRAINT fk_fornecedores_enderecos
		FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco)
);

CREATE TABLE IF NOT EXISTS contatos_fornecedor (
	id_contato int not null auto_increment primary key,
	telefone varchar(50) not null,
	id_fornecedor int not null,
    CONSTRAINT fk_contatos_fornecedores
		FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

CREATE TABLE IF NOT EXISTS produtos(
	id_produto int not null auto_increment primary key,
	nome varchar(100) not null,
	descricao varchar(150) not null,
	preco_unitario double(10,2) not null,
	id_fornecedor int not null,
	CONSTRAINT fk_fornecedores_produtos
		FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

CREATE TABLE IF NOT EXISTS vendas(
	id_venda int not null auto_increment primary key,
	data_venda datetime not null,
	valor_venda double(10,2),
	id_cliente int not null,
	CONSTRAINT fk_clientes_vendas
		FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE IF NOT EXISTS cesta_de_compras (
	id_cestadecompras int not null auto_increment primary key,
	preco_total double(10,2) not null,
	id_venda int not null,
	id_produto int not null,
    CONSTRAINT fk_cesta_vendas
		FOREIGN KEY (id_venda) REFERENCES Vendas(id_venda),
	CONSTRAINT fk_cesta_produtos
		FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

CREATE TABLE IF NOT EXISTS transacoes(
	id_transacao int not null auto_increment primary key,
	id_venda int not null,
	CONSTRAINT fk_vendas_transacoes
		FOREIGN KEY (id_venda) REFERENCES vendas(id_venda)
);

CREATE TABLE IF NOT EXISTS forma_pagamentos (
	id_forma_pagamento int not null auto_increment primary key,
	desc_formaPagamento varchar(30) not null,
	id_transacao int not null,
  	CONSTRAINT fk_forma_transacao
		FOREIGN KEY (id_transacao) REFERENCES transacoes (id_transacao)
  );

CREATE TABLE IF NOT EXISTS valida_pagamentos (
	id_valida_pagamento int not null auto_increment primary key,
	numero_cartao bigint not null,
	codigo_seguranca int(3) not null,
	codigo_captcha varchar(10) not null,
	id_forma_pagamento int not null,
  	CONSTRAINT fk_forma_validacao
		FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamentos (id_forma_pagamento)
);

/*
	2 - Inserção de 10 registros em cada tabela.
*/

INSERT INTO enderecos (rua, bairro, numero, cidade, estado, cep, referencia) VALUES 
	('Rua das Fiandeiras', 'Vila Olímpia', '356', 'São Paulo', 'São Paulo', '16015244' ,'Casa'),
	('Rua Pereira Estéfano', 'Vila da Saúde', '52', 'São Paulo', 'São Paulo', '04144070' ,'Apartamento, 84'),
	('Avenida Afonso Pena', 'Boa Viagem', '1093', 'Belo Horizonte', 'Minas Gerais', '30130005' ,'Casa'),
	('Rua Paracatu', 'Parque Imperial', '78', 'São Paulo', 'São Paulo', '04302021' ,'Casa'),
	('Rua Frederico Moura', 'Cidade Nova', '287', 'São Paulo', 'São Paulo', '14401150' ,'Apartamento, 26'),
	('Rua Serra de Bragança', 'Vila Gomes Cardim', '287', 'São Paulo', 'São Paulo', '03318000' ,'Casa'),
	('Rua Alcides Pereira Lima', 'Mangabeiras', '771', 'Belo Horizonte', 'Minas Gerais', '30315090' ,'Apartamento, 02'),
	('Rua Erásio Evangelista', 'São Jorge', '609', 'Belo Horizonte', 'Minas Gerais', '30451138' ,'Casa'),
	
    ('Avenida Rio Branco', 'Centro', '11', 'Rio de Janeiro', 'Rio de Janeiro', '20040002' ,'Distribuidora'),
	('Rua Tendi', 'Campo Grande', '629', 'Rio de Janeiro', 'Rio de Janeiro', '23045070' ,'Distribuidora'),
    ('Rua Diego de Siloe', 'Jardim São Bento Novo', '166', 'São Paulo', 'São Paulo', '05872050' ,'Distribuidora'),
    ('Praça Buritama', 'Jardim Europa', '298', 'São Paulo', 'São Paulo', '01450100' ,'Distribuidora'),
    ('Rua Luís Juliano', 'Interlagos', '98', 'São Paulo', 'São Paulo', '04788170' ,'Distribuidora'),
    ('Rua Marcos Coelho Neto', 'Penha de França', '212', 'São Paulo', 'São Paulo', '03642090' ,'Distribuidora'),
    ('Avenida Condessa Elisabeth de Robiano', 'Jardim América da Penha', '336', 'São Paulo', 'São Paulo', '03704900' ,'Distribuidora'),
    ('Rua Duque de Saldanha', 'Jordanópolis', '49', 'São Paulo', 'São Paulo', '04830390' ,'Distribuidora'),
    ('Rua Jacinto José de Araújo', 'Parque São Jorge', '865', 'São Paulo', 'São Paulo', '03087020' ,'Distribuidora'),
    ('Praça Antônio Filinto', 'Cidade Patriarca', '570', 'São Paulo', 'São Paulo', '03553060' ,'Distribuidora');

INSERT INTO clientes (nome, sobrenome, email, senha, cpf, id_endereco) VALUES 
	('Vitor', 'Sales', 'vitors@gmail.com', 'ige917sq', 53170847090, 1),
    ('Kevin', 'Farias', 'kfarias44@gmail.com', 'j83hi50g', 66254051087, 2),
    ('João Vitor', 'Lopes', 'jvlopes3@gmail.com', 'pwr9hdup', 95285445094, 2),
    ('Caroline', 'Melo', 'caroolmelo@gmail.com', 'xqudkpwb', 52114244091, 3),
    ('Larissa', 'Peixoto', 'laripeix8@gmail.com', 'k7qy9fv9', 80762876000, 4),
    ('Esther', 'Gomes', 'esthergomes439@gmail.com', 'ikcwk94t', 59221475018, 4),
    ('Joana', 'Rodrigues', 'drjoanarodrigues@gmail.com', 'gid4v5oq', 03386615066, 5),
    ('Fernando', 'Silva', 'fernandasilvaa@gmail.com', 'qnhbxw7c', 72589865023, 6),
    ('Mariana', 'Santos', 'marisantoss76@gmail.com', 'gsrgjk5d', 20591133008, 7),
    ('Gabrielly', 'Lopes', 'gabi11lopes@gmail.com', 'kuom3b3w', 82135593044, 8);
    
INSERT INTO contatos_clientes (telefone, id_cliente) VALUES
	('08418506085', 1), ('67126102881', 2), ('27358959219', 3), ('35759902273', 4), 
    ('14324338448', 5), ('51289386238', 6), ('69765662645', 7), ('46663174601', 8),
    ('82988273868', 9), ('33261835775', 10);
    
INSERT INTO fornecedores (nome_fornecedor, CNPJ, email_fornecedor, id_endereco) VALUES
	('Central Verde', 11602102000101, 'centralverde@centralverde.com', 9),
	('Agrofruit Distribuidora', 02826712000190, 'marcelo30@agrofruit.com', 10),
	('Congebras Distribuidora', 13454451000140, 'administrador@congebras.com', 11),
	('Dalefrut Frutas, Legumes e Verduras', 48302427000170, 'leandro@dalefrut.com', 12),
	('Agra Produção e Exportação', 74656225000137, 'agrafornecedora@agrape.com', 13),
	('NL Frutas e Legumes', 55170354000176, 'nicolaslenz@nlfrutas.com', 14),
	('Manoel Verduras', 21399037000104, 'manoel@mverduras.com', 15),
	('Grupo Soares', 35763786000183, 'marcelosrs@gruposoares.com', 16),
	('Ceccarelli Hortifrutti', 56609459000141, 'admin@ceccarelihort.com', 17),
	('Kentisa Comércio de Verduras e Legumes', 81557563000187, 'nathan@kentisa.com', 18);

INSERT INTO contatos_fornecedor (telefone, id_fornecedor) VALUES
	('11233409230', 1), ('11051626380', 2), ('11423370651', 3), ('11463664456', 4),
    ('11751625607', 5), ('11658247287', 6), ('11680460963', 7), ('11186133575', 8),
    ('11707335049', 9), ('11740796214', 10);
    
INSERT INTO produtos (nome, descricao, preco_unitario, id_fornecedor) VALUES
	('Abacaxi', 'Abacaxi Pérola 1KG', 7.47, 1),
    ('Alface', 'Alface Lisa 1KG', 7.66, 2),
    ('Laranja', 'Laranja Pera 1KG', 3.54, 3),
    ('Maçã', 'Maçã Argentina 1KG', 8.45, 4),
    ('Morango', 'Morango 1KG', 30.12, 5),
	('Uva Verde', 'Uva verde sem semente 1KG', 16.6, 6),
    ('Tomate', 'Tomate Cereja 1KG', 14.21, 7),
    ('Cenoura', 'Cenoura 1KG', 6.53, 8),
    ('Pepino', 'Pepino Japonês 1KG', 5.88, 9),
    ('Batata', 'Batata Roxa 1KG', 5.90, 10);

INSERT INTO vendas (data_venda, valor_venda, id_cliente) VALUES
	('2022-10-08 12:33:40', 105.35, 1),
    ('2022-07-08 11:10:55', 95.35, 2),
    ('2021-05-08 16:23:43', 125.35, 2),
    ('2021-05-08 15:14:32', 235.35, 2),
    ('2022-04-08 14:55:30', 405.35, 3),
    ('2022-03-08 15:31:55', 22.35, 5),
    ('2021-01-08 17:26:11', 37.35, 6),
    ('2022-02-08 13:05:02', 70.35, 8),
    ('2021-11-08 14:11:44', 43.35, 8),
    ('2022-10-08 09:40:32', 162.35, 9);

INSERT INTO cesta_de_compras (preco_total, id_venda, id_produto) VALUES
	(32.3, 1, 2), (25.3, 1, 4),
    (52.7, 2, 3), (71.4, 3, 5),
    (22.9, 5, 1), (45.8, 5, 1),
    (10.5, 6, 1), (132.0, 7, 2),
    (36.2, 9, 10), (42.1, 9, 8);
    
INSERT INTO transacoes (id_venda) VALUES
	(1), (2), (3), (4), (5),
    (6), (7), (8), (9), (10);
    
INSERT INTO forma_pagamentos (desc_formaPagamento, id_transacao) VALUES
	('Pix', 1), ('Cartão de Débito', 2), ('Pix', 3), ('Pix', 4), ('Cartão de Crédito', 5),
	('Cartão de Crédito', 6), ('Cartão de Débito', 7), ('Cartão de Débito', 8), ('Pix', 9), ('Cartão de Crédito', 10); 

INSERT INTO valida_pagamentos (numero_cartao, codigo_seguranca, codigo_captcha, id_forma_pagamento) VALUES 
	(5137438568562026, 718, 'gaGrq', 1), (4024007164738808, 137, 'aCQz8', 2), 
    (5592076994367731, 546, 'P8pEt', 3), (5599605072607569, 422, 'j5Z7x', 4), 
    (4556193650584207, 251, 'XagM4', 5), (348959623144001, 5525, 'BE7D1', 6),
    (344266216195877, 1702, '87oRD', 7), (5441116221516719, 178, 'ruSbA', 8), 
    (5179649394763153, 923, 'TNSP1', 9), (5155961788118383, 694, 'dSAcH', 10);
    
/* 
	3 - Consultas CRUD
*/
    
-- A. Selects
SELECT CONCAT(c.nome, ' ', c.sobrenome) as Cliente, SUM(valor_venda) as ValorVendas  
FROM clientes c
INNER JOIN vendas v
ON c.id_cliente = v.id_cliente
GROUP BY c.nome;

SELECT f.nome_fornecedor as Fornecedor, f.email_fornecedor as Email, p.nome as Produto, p.preco_unitario as Preco
FROM fornecedores f
INNER JOIN produtos p
ON f.id_fornecedor = p.id_fornecedor;

SELECT CONCAT(c.nome, ' ', c.sobrenome) as Nome, cc.telefone as Contato, CONCAT(e.rua, ', ', e.bairro, ', ', e.numero) as Endereco, e.cidade, e.estado
FROM clientes c
INNER JOIN enderecos e
ON c.id_endereco = e.id_endereco
INNER JOIN contatos_clientes cc
ON c.id_cliente = cc.id_cliente;

-- B. Update
UPDATE enderecos
SET rua = 'Rua José Fernando Pinto', bairro = 'Morro Nova Cintra', numero = '154B', cidade = 'Santos', cep = '11080450'
WHERE id_endereco = 4;

UPDATE enderecos
SET rua = 'Praça da Matriz', bairro = 'Centro', numero = 's/n', cidade = 'São Braz', cep = '38788971'
WHERE id_endereco = 8;

UPDATE enderecos
SET rua = 'Rua José Alves do Nascimento', bairro = 'Três Irmãs', numero = 's/n', cidade = 'Campina Grande', estado = 'Paraíba', cep = '58423825', referencia= 'Casa'
WHERE id_endereco = 2;

UPDATE contatos_clientes
SET telefone = '83988457541'
WHERE id_contato = 2;

-- C. Delete
DELETE FROM contatos_clientes
WHERE id_contato = 10;

DELETE FROM clientes
WHERE id_cliente = 10;

/*
	4 - Alter Table + Update
*/

ALTER TABLE clientes
ADD data_nascimento date;

UPDATE clientes
SET data_nascimento = '1951-04-09'
WHERE id_cliente = 1;

UPDATE clientes
SET data_nascimento = '1951-10-15'
WHERE id_cliente = 2;

UPDATE clientes
SET data_nascimento = '1953-11-20'
WHERE id_cliente = 3;

UPDATE clientes
SET data_nascimento = '1955-12-07'
WHERE id_cliente = 4;

UPDATE clientes
SET data_nascimento = '1965-11-25'
WHERE id_cliente = 5;

UPDATE clientes
SET data_nascimento = '1979-06-20'
WHERE id_cliente = 6;

UPDATE clientes
SET data_nascimento = '1986-02-18'
WHERE id_cliente = 7;

UPDATE clientes
SET data_nascimento = '1987-04-03'
WHERE id_cliente = 8;

UPDATE clientes
SET data_nascimento = '1987-06-18'
WHERE id_cliente = 9;

/*
	5 - Criação de uma View que contempla todos dados importantes do Banco
*/
DROP VIEW IF EXISTS vw_geral;
CREATE VIEW vw_geral AS
SELECT CONCAT(c.nome, ' ', c.sobrenome) AS Cliente, date_format(v.data_venda, '%d/%m/%Y') as DataVenda, p.nome, p.descricao, 
	f.nome_fornecedor AS Fornecedor , t.id_transacao AS Transação, fp.desc_formaPagamento AS FormaPagamento,
    vp.numero_cartao as Cartão, vp.codigo_seguranca AS CodigoSeguranca
FROM clientes c
INNER JOIN vendas v ON c.id_cliente = v.id_cliente
INNER JOIN transacoes t ON v.id_venda = t.id_venda
INNER JOIN forma_pagamentos fp ON t.id_transacao = fp.id_transacao
INNER JOIN valida_pagamentos vp ON fp.id_forma_pagamento = vp.id_forma_pagamento
INNER JOIN cesta_de_compras cc ON v.id_venda = cc.id_venda
INNER JOIN produtos p ON cc.id_produto = p.id_produto
INNER JOIN fornecedores f ON p.id_fornecedor = f.id_fornecedor;

SELECT * FROM vw_geral;

/*
	6 - Criação de uma Store Procedure
*/
/* A SP visa identificar o valor das compras por cliente e oferecer um
 vale compras mais alto para os que menos consomem e incentivando a compra, assim também
 com os clientes assíduos, porém em uma menor proporção , enviando Cupons Promocionais
 por email com bot e observando os resultados ao longo dos meses.*/

DROP PROCEDURE IF EXISTS sp_consulta_cliente;
DELIMITER $$
CREATE PROCEDURE sp_consulta_cliente(IN id_cliente INT )
BEGIN
	DECLARE id_cliente INT;
	SELECT SUM(valor_venda) as valorCompra , nome, email  FROM vendas v
    INNER JOIN clientes c on c.id_cliente = id_cliente
    GROUP BY nome
    ORDER BY valorCompra;

END $$
DELIMITER ;

call emarketfeiradb.sp_consulta_cliente(2);

-- Verificar quantidade de produtos cadastrados

DROP PROCEDURE IF EXISTS sp_verificar_qtd_prod;
DELIMITER $$
CREATE PROCEDURE  sp_verificar_qtd_prod (OUT id_produto INT)
BEGIN
SELECT COUNT(*) INTO id_produto FROM produtos;
END $$
DELIMITER ;

CALL sp_verificar_qtd_prod(@total);
SELECT @total;