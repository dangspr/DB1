SELECT c.Empresa, COUNT(f.FaturaId) as QtdVendas, FORMAT(sum(f.Transporte), 2) as ValorTotalTransporte
FROM correios c INNER JOIN faturas f ON f.FormaEnvio = c.CorreioID group by c.Empresa;

SELECT CONCAT("Sr(a) ", c.Contato) AS Contato, CONCAT("Cargo: ", c.Titulo) as Cargo, CONCAT(c.Endereco, " - ", c.Cidade) as Endereco FROM clientes c
GROUP BY Contato ORDER BY Contato ASC; 

SELECT c.CategoriaNome, c.Descricao, COUNT(p.ProdutoID) as QtdProdutos FROM categorias c
INNER JOIN produtos p GROUP BY c.CategoriaNome;