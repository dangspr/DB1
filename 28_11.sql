
Create View clienteView  As 
	select 
		ClienteId,
        Contato,
        Fax,
        Telefone
	from emarket.clientes ;


select 
	telefone
from emarket.clientes
where Fax is null or Fax = '';

select 
	telefone
from emarket.clienteview
where Fax is null or Fax = ''; 	


use emarket;

Create View fornecedores AS
select 
	ProvedorID,
    Contato,
    Empresa,
    Concat(Endereco,' ',Cidade,' ',CodigoPostal,' ',Pais) AS Endereco
from emarket.provedores;


select 
	*
from emarket.provedores
where Endereco like '%American%' and pais like '%Brazil%';


select 
	*
from emarket.fornecedores
where Endereco like '%American%'  and pais like '%Brazil%';



Create View produtosView AS 
	select 
		ProdutoID,
        ProdutoNome,
        round(PrecoUnitario,0),
        UnidadesEstoque,
        UnidadesPedidas,
        Case 
			When (UnidadesPedidas = 0 or UnidadesPedidas is null) Then 'Baixa'
			When UnidadesPedidas < UnidadesEstoque then 'Media'
            When (UnidadesPedidas > UnidadesEstoque And UnidadesPedidas < (UnidadesEstoque*2)) then 'Urgente'
            Else "Prioritario" End As Prioridade
	from emarket.produtos;
		
			
        


	