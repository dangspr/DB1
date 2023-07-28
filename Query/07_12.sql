DELIMITER $$

/* ****************************** Stored Procedures Parte II ******************************
 1) Cálculo de idade 
 a) Crie uma  SP que mostre o sobrenome, nome e idade de cada empregado. A idade dos empregados deve ser  
    calculada a partir da data de nascimento.*/
DROP PROCEDURE IF EXISTS sp_calcular_idade_empregado;
DELIMITER $$
CREATE PROCEDURE sp_calcular_idade_empregado(IN idade_min INT, IN idade_max INT)
BEGIN
	SELECT Sobrenome, Nome, TIMESTAMPDIFF(YEAR,DataNascimento,CURDATE()) AS idade FROM empregados 
    WHERE TIMESTAMPDIFF(YEAR,DataNascimento,CURDATE()) BETWEEN idade_min AND idade_max;
END $$
DELIMITER ;
-- b) Executar a SP indicando un intervalo entre 50 e 60 anos de idade
CALL sp_calcular_idade_empregado(50, 60);



-- 2) Atualização de produtos
/* a) Crie uma SP que receba uma porcentagem e um nome de categoria.  Atualize os produtos pertencentes a essa 
categoria, incrementando as unidades pedidas segundo a porcentagem indicada. Exemplo: Se um produto da categoria 
Seafood tem 30 unidades pedidas, ao invocar a SP com essa categoria e porcentagem 10%, a SP atualizará o valor 
das unidades pedidas com o novo valor: 33*/
DROP PROCEDURE IF EXISTS sp_atualizar_categoria;
CREATE PROCEDURE sp_atualizar_categoria(IN porcentagem INT, IN nome_categoria VARCHAR(30))
BEGIN
	DECLARE var_categoria INT;
	SELECT CategoriaID INTO var_categoria FROM categorias WHERE CategoriaNome = nome_categoria;
    UPDATE produtos SET UnidadesPedidas = UnidadesPedidas + (UnidadesPedidas / 100 * porcentagem) WHERE CategoriaID = var_categoria;
END $$
-- b)  Liste os produtos da categoria Beverages para ver quantas unidades pedidas existem para cada um deles. 
SELECT p.ProdutoNome, p.CategoriaID, p.UnidadesPedidas FROM produtos AS p
INNER JOIN categorias AS c ON c.CategoriaID = p.CategoriaID WHERE c.CategoriaNome = 'Beverages';
-- c)  Invoque a SP com os valores Beverages como categoria e 15 como porcentagem.
CALL sp_atualizar_categoria(15, 'Beverages');
-- d) Liste novamente os produtos, como informado no item a e valide os resultados
SELECT p.ProdutoNome, p.CategoriaID, p.UnidadesPedidas FROM produtos AS p
INNER JOIN categorias AS c ON c.CategoriaID = p.CategoriaID WHERE c.CategoriaNome = 'Beverages';

-- 3) Atualização de Empregados 
-- a) Crie uma SP que crie uma tabela com os nomes, sobrenomes e telefones de contato de todos os empregados que 
--    foram contratados em data anterior a uma data informada.
DROP PROCEDURE IF EXISTS sp_empregado_contratacao;
CREATE PROCEDURE sp_empregado_contratacao(IN data_contrato DATE)
BEGIN
	DROP TABLE IF EXISTS empregado_tmp;
    CREATE TABLE empregado_tmp (
		EmpregadoID INT NOT NULL AUTO_INCREMENT,
		Nome VARCHAR(20) NOT NULL,
		Sobrenome VARCHAR(10) NOT NULL,
		DataContratacao DATETIME,
		PRIMARY KEY (EmpregadoID));
	INSERT INTO empregado_tmp SELECT EmpregadoID, Nome, Sobrenome, DataContratacao FROM empregados WHERE DataContratacao <= data_contrato;
END $$
-- b) Execute a SP para gerar uma tabela de empregados com data de contratação anterior a  01/01/1994. 

CALL sp_empregado_contratacao('1994-01-01');
-- c) Consulte a tabela gerada e valide os resultados.
SELECT * FROM empregado_tmp;