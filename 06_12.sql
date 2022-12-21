
delimiter $$
create procedure clienteFatura (IN p_id varchar(20))
begin
	SELECT c.Contato AS cliente,Transporte AS ValorFatura
    FROM clientes c
    INNER JOIN faturas f ON c.ClienteID = f.ClienteID
    WHERE c.ClienteID = p_id;
end $$
delimiter ;
call clienteFatura('AROUT');

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_filme_ator;
CREATE PROCEDURE sp_filme_ator(IN ator varchar(30))
BEGIN	
     SELECT f.titulo as filme
     FROM filme f
     INNER JOIN filme_ator fa ON f.filme_id = fa.filme_id 
     INNER JOIN ator a on a.ator_id = fa.ator_id AND a.nome = ator;
END $$
DELIMITER ;
CALL sp_filme_ator('Ed');

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_listar_filmes;
CREATE PROCEDURE sp_listar_filmes()
BEGIN	
     SELECT f.titulo as Filme, c.nome as Categoria
     FROM filme f
     INNER JOIN filme_categoria fc on f.filme_id = fc.filme_id
     INNER JOIN categoria c on c.categoria_id = fc.categoria_id
     order by Filme;
END $$
CALL sp_listar_filmes();

DELIMITER $$ 
CREATE PROCEDURE sp_contarFaturas(OUT qtd int) 
BEGIN 
SELECT count(id) INTO qtd FROM faturas; 
END $$ 
DELIMITER ; 
CALL sp_contarFaturas(@qtd);





