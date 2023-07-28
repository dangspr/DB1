SELECT i.inventario_id,i.loja_id, concat(c.nome, ' ', c.sobrenome) as Cliente, f.titulo as Filme, 
concat(fu.nome, ' ', fu.sobrenome) as Funcionario, l.data_locacao, f.preco_locacao
FROM inventario i 
INNER JOIN locacao l
ON i.inventario_id = l.inventario_id
INNER JOIN cliente c
ON l.cliente_id = c.cliente_id
INNER JOIN funcionario fu
ON l.funcionario_id = fu.funcionario_id
INNER JOIN filme f
ON i.filme_id = f.filme_id

