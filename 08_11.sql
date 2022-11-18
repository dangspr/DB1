select * from produtos;

SELECT ProdutoID, ProdutoNome, CategoriaID, PrecoUnitario, 
FORMAT((PrecoUnitario - (PrecoUnitario * 20)/100),2) as PrecoPromocional
FROM produtos
ORDER BY PrecoUnitario DESC;

SELECT * FROM clientes;

SELECT Empresa, Contato, Titulo, Pais
From clientes
WHERE pais like 'BRAZIL%';

SELECT Empresa, Contato, Titulo, Pais
FROM clientes
WHERE titulo like '%Sale%';

SELECT ProdutoID, ProdutoNome, CategoriaID,
FORMAT (PrecoUnitario,2) AS PrecoUnitario
FROM produtos
WHERE PrecoUnitario BETWEEN 10 and 20
ORDER BY PrecoUnitario DESC;

SELECT ProdutoID, ProdutoNome, NivelReabastecimento, UnidadesEstoque
FROM produtos
WHERE UnidadesEstoque < NivelReabastecimento;

SELECT UnidadesPedidas, ProdutoID, ProdutoNome, NivelReabastecimento, UnidadesEstoque
FROM produtos
WHERE UnidadesPedidas = 0;

SELECT ClienteID, Contato, Empresa, Titulo, Pais
FROM clientes
ORDER BY Pais ASC;

SELECT ClienteID, Contato, Empresa, Titulo, Pais
FROM clientes
WHERE Titulo LIKE '%OWNER%'
ORDER BY Pais ASC;

SELECT ClienteID, Contato, Empresa, Titulo, Telefone
FROM clientes
WHERE Contato LIKE 'C%'
ORDER BY Contato ASC;

SELECT FaturaID,DataFatura
FROM faturas
ORDER BY DataFatura asc;

SELECT FaturaID,DataFatura, PaisEnvio, FormaEnvio
FROM faturas
WHERE PaisEnvio = 'USA' and FormaEnvio <> 3;


