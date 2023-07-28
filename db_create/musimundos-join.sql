use musimundos;
/*
1 - Liste o nome das canções, alterando o nome da coluna para ‘Musica’ e seus respectivos gêneros, alterando o nome da coluna para ‘Genero’, ordenando
a lista alfabeticamente por Genero.
*/

SELECT c.nome AS Música, g.nome AS Gêneros
FROM cancoes c
INNER JOIN generos g
ON c.id = g.id
ORDER BY g.nome ASC;

/*
2. Liste o nome e o sobrenome dos clientes, concatenados na mesma coluna,
atribuindo o nome Clientes para esta coluna. Liste também o país de
origem de cada cliente, atribuindo o nome Pais para a coluna, ordenando
alfabeticamente pela coluna Cliente.
*/

SELECT CONCAT(c.nome, ' ', c.sobrenome) AS Clientes, c.pais AS País
FROM clientes c
ORDER BY Clientes ASC;


/*
3. Liste todas as canções com seus respectivos albuns;
*/

SELECT c.nome AS Canções, a.titulo AS Albuns
FROM cancoes c
INNER JOIN albuns a
ON c.id = a.id;

/*
4. Liste a quantidade de músicas por gênero. Agrupe por gênero, ordenando
de forma decrescente pela quantidade de músicas.
*/

SELECT COUNT(c.id) AS QtdMusicas, g.nome AS Gêneros
FROM generos g
RIGHT JOIN cancoes c
ON c.id_genero = g.id
GROUP BY g.nome
ORDER BY QtdMusicas DESC;


/*
Alunos: Claudio Leite, Danilo Gaspar, Gabriel Godoy, José Ricardo Braga e Vanilza Flora Silvestre
*/																																						
                                                                                                                                                        