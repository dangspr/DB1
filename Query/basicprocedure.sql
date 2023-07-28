-- A estratégia visa identificar o valor das compras por cliente e oferecer um
-- vale compras mais alto para os que menos consomem e incentivando a compra, assim também
-- com os clientes assíduos, porém em uma menor proporção , enviando Cupons Promocionais
-- por email com bot e observando os resultados ao longo dos meses.

DROP PROCEDURE IF EXISTS sp_consulta_cliente;
DELIMITER $$
CREATE PROCEDURE sp_consulta_cliente(IN id_cliente INT )
BEGIN
	DECLARE id_cliente INT;
	SELECT SUM(valor_venda) as valorCompra , nome, email  FROM vendas v
    INNER JOIN clientes c on c.id_cliente = v.id_cliente
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
