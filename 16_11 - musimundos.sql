SELECT id, id_cliente, pais_cobranca, valor_total, cidade_cobranca,
MAX(valor_total) as valorMaior
FROM faturas
WHERE cidade_cobranca LIKE '%Osl%';

SELECT id, id_cliente, pais_cobranca, valor_total, cidade_cobranca,
MIN(valor_total) as valorMenor
FROM faturas;

SELECT id, id_cliente, pais_cobranca, valor_total, cidade_cobranca,
FORMAT(AVG(valor_total),2) as valorMedio
FROM faturas
WHERE pais_cobranca like '%Ca%';

SELECT id_cliente, pais_cobranca, count(id) as contagem
FROM faturas
WHERE pais_cobranca like 'Can%';

SELECT id, count(id) as contagem
FROM faturas;

SELECT id, data_fatura, valor_total ,
FORMAT(AVG(valor_total),2) as valorMedio
FROM faturas
GROUP BY valor_total
HAVING valorMedio < 5.65;

SELECT id, data_nascimento, nome,
MIN(data_nascimento) as maisJovem
FROM empregados;

SELECT id, data_nascimento, nome,
MAX(data_nascimento) as maisVelho
FROM empregados;

SELECT id, data_nascimento, nome, DATE_FORMAT(data_nascimento, "%d %b %Y") as dataformatada
FROM empregados
GROUP BY nome;

SELECT id, nome, compositor, count(id)
FROM cancoes
WHERE compositor LIKE 'AC%';

SELECT id, 
FORMAT(AVG(duracao_milisegundos),2) as tempoMedio
FROM cancoes;

SELECT id, compositor,
FORMAT(AVG(bytes),2) as tamanhoMedio
FROM cancoes
WHERE  compositor LIKE 'AC%';

SELECT count(id) as qtdClientes , cidade
FROM clientes
WHERE cidade LIKE 'São P%';

SELECT  count(id) as qtdClientes , cidade
FROM clientes
WHERE cidade LIKE 'Par%';

SELECT  count(id) as qtdClientes 
FROM clientes
WHERE email LIKE '%yahoo%';


