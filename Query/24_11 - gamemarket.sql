CREATE SCHEMA  IF NOT EXISTS `gamemarket`;
USE `gamemarket`;


--
-- Estrutura da tabela `Cliente`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  `nome` varchar(50)  NOT NULL,
  `sobrenome` varchar(100)  NOT NULL,
  `apelido` varchar(20) NOT NULL,
  `telefone` varchar(13) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `genero_pref1` varchar(20) NOT NULL,
  `genero_pref2` varchar(20) ,
  `senha` char(30) NOT NULL,
  `cpf` int(11) NOT NULL,
  `cep` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;


--
-- Estrutura da tabela `midias`
--

CREATE TABLE IF NOT EXISTS `midias` (
 `id_midia` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `tipo_midia` VARCHAR (10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

--
-- Estrutura da tabela `jogos`
--

CREATE TABLE IF NOT EXISTS `jogos` (
  `id_jogo` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `titulo` CHAR (50) NOT NULL,
  `Genero` CHAR (20) NOT NULL,
  `Produtora` CHAR (50) NOT NULL,
  `Preco` DOUBLE (10,2) NOT NULL,
  `midia_id` INTEGER NOT NULL
 ) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;
 
 ALTER TABLE Jogos ADD foreign key (midia_id) references midias(id_midia);
 
--
-- Estrutura da tabela `Carrinhos`
--

CREATE TABLE IF NOT EXISTS `carrinhos` (
  `id_carrinho` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  `preco_total` DOUBLE(10,2)  NOT NULL,
  `pedido_id` INTEGER NOT NULL  ,
  `jogo_id` INTEGER NOT NULL   ,
  FOREIGN KEY (jogo_id) REFERENCES jogos(id_jogo)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Estrutura da tabela `Pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `data_pedido` datetime NOT NULL,
  `valor_pedido` DOUBLE (10,2) NOT NULL,
  `valor_frete` DOUBLE (10,2) NOT NULL,
  `transacao_id` INTEGER NOT NULL ,
  `cliente_id` INTEGER NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

ALTER TABLE pedidos ADD FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente);

ALTER TABLE carrinhos ADD FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido);


--
-- Estrutura da tabela `transacoes`
--


CREATE TABLE IF NOT EXISTS `transacoes` (
  `id_transacao` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   `pedido_id` INTEGER NOT NULL  ,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

ALTER TABLE pedidos ADD FOREIGN KEY (transacao_id) REFERENCES transacoes(id_transacao);

--
-- Estrutura da tabela `forma_pagamentos`
--

CREATE TABLE IF NOT EXISTS `forma_pagamentos` (
  `id_forma_pagamento` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `desc_formaPagamento` VARCHAR (30) NOT NULL,
 `transacao_id` INTEGER NOT NULL  ,
  FOREIGN KEY (transacao_id) REFERENCES transacoes(id_transacao)
  ) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

--
-- Estrutura da tabela `valida_Pagamentos`
--

CREATE TABLE IF NOT EXISTS `valida_pagamentos` (
  `id_valida_pagamento` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `numero_Cartao` INT (16) NOT NULL,
  `codigo_Seguranca` INT (3) NOT NULL,
  `Codigo_Captcha` INT (5) NOT NULL,
  `forma_pagamento_id` INTEGER NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

ALTER TABLE valida_pagamentos ADD FOREIGN KEY (forma_pagamento_id) REFERENCES forma_pagamentos(id_forma_pagamento);

--
-- Restrições para a tabela `Pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_transacao_pedido` FOREIGN KEY (`transacao_id`) REFERENCES `transacoes` (`id_transacao`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE;

--
-- Restrições para a tabela `Carrinhos`
--
ALTER TABLE `carrinhos`
  ADD CONSTRAINT `fk_id_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id_pedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_jogo` FOREIGN KEY (`jogo_id`) REFERENCES `jogos` (`id_jogo`) ON UPDATE CASCADE;

--
-- Restrições para a tabela `Jogos`
--
ALTER TABLE `jogos`
  ADD CONSTRAINT `fk_id_midia` FOREIGN KEY (`midia_id`) REFERENCES `midias` (`id_midia`) ON UPDATE CASCADE;
  
  --
-- Restrições para a tabela `Transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `fk_id_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id_pedido`) ON UPDATE CASCADE;

  --
-- Restrições para a tabela `Forma Pagamento`
--
ALTER TABLE `forma_pagamentos`
  ADD CONSTRAINT `fk_id_transacoes` FOREIGN KEY (`transacao_id`) REFERENCES `transacoes` (`id_transacao`) ON UPDATE CASCADE;
  
   --
-- Restrições para a tabela `Valida Pagamento`
--
ALTER TABLE `valida_pagamentos`
  ADD CONSTRAINT `fk_id_forma_pagamento` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamentos` (`id_forma_pagamento`) ON UPDATE CASCADE;



--
-- Insert em Jogos e Mídia
--
INSERT INTO midias (tipo_midia) VALUES
( 'Primaria' ),
( 'Secundaria'),
( 'Fisica' );

/*INSERT INTO Jogos(id_midia) VALUES (LAST_INSERT_ID());*/

INSERT INTO Jogos ( titulo, genero, Produtora, Preco, midia_id) VALUES
( 'Marvel Vs Capcom 3', 'Arcade', 'Capcom', 19.99, 2),
( 'Residente Evil 6', 'Survival Horror', 'Capcom', 19.99, LAST_INSERT_ID()),
( 'Residente Evil 7', 'Survival Horror', 'Capcom', 39.99, 3),
( 'Residente Evil 5', 'Survival Horror', 'Capcom', 29.99, 3),
( 'Marvel Vs Capcom ', 'Arcade', 'Capcom', 14.99, 1);


select id_midia, tipo_midia
from midias;

UPDATE Jogos SET preco = 29.99 WHERE id_jogo = 1;

DELETE FROM jogos WHERE id_jogo = 2;

SELECT id_jogo, titulo, genero, preco, midia_id
FROM jogos
WHERE id_jogo > 0;

SELECT   B.id_midia, A.titulo, A.Genero, A.Preco, B.tipo_midia FROM jogos A
INNER JOIN midias B ON A.midia_id and B.id_midia > 0
group by B.tipo_midia
order by B.tipo_midia ASC;

/*START TRANSACTION;
UPDATE Jogos SET preco = 29.99 WHERE id_jogo = 3;

COMMIT;
ROLLBACK
/*
