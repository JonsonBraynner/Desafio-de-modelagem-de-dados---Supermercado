use supermarket;

-- Recuperações simples com SELECT Statement -  retorna todas as vendas realizadas, o valor, o PDV responsavel e forma de pagamento;
select 
	idSale as Venda, idPdv as 'PDV Responsavel',
    DATE_FORMAT(sDate, '%d/%m/%Y %H:%i:%s') as 'Data e horário',
    concat('R$ ',total) as Valor,
    payment_method as 'Metodo de pagamento' 
from sale;
    
-- Filtros com WHERE Statement - retorna todas as compras com valor maior oi igual a R$38,90;
select 
	idSale as Venda, idPdv as 'PDV Responsavel',
    DATE_FORMAT(sDate, '%d/%m/%Y %H:%i:%s') as 'Data e horário',
    concat('R$ ',total) as Valor,
    payment_method as 'Metodo de pagamento' 
from sale where total>=38.9;

-- busca produtos por categoria ou nome e ordena por categoria e valor
select p.name as Produto, c.name as Categoria, concat('R$ ',p.pValue) as Valor from  category as c join product as p  on  p.idCategory=c.idCategory
where c.name like "" or p.name like "%a%" order by c.name, p.pValue;
;

-- Crie expressões para gerar atributos derivados - forma o nome e endereço completo e retorna a idade;
select
	concat(fName,' ',sName) as Nome,
    timestampdiff(year,birthday, NOW()) as Idade,
    concat(address,' ',neighborhood,' ',complement,' ',city,' ',_state) as Endereço
from clients;

-- Defina ordenações dos dados com ORDER BY - faz a ordenação de todos os produtos pelo seu valor;
select name as Produto, concat('R$ ',pValue) as Valor from product order by pValue;

-- Condições de filtros aos grupos – HAVING Statement - agrupa todos os produtos por categoria e exibe as categorias com 4 ou mais produtos;
select category.name as 'Nome da categoria', count(idProduct) as 'Qtd. de produtos' from Product inner join category on
	product.idCategory = category.idCategory
    group by (category.name) having count(idProduct)>=4;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados - busca dados de uma compra através do id do cliente ou da compra;
select s.idSale as Venda,
	concat(cl.fName, cl.sName) as Nome,
	DATE_FORMAT(sDate, '%d/%m/%Y %H:%i:%s') as 'Data e horário',
	payment_method as 'Pagamento',
    p.name as Produto, manufacturer as Fabricante,
    p.description as Descrição,
    concat('R$ ',pValue) as Valor,
    pdv.pdvNumber as PDV,
    e.fName as 'Vendedor',
    c.name as Categoria
from sale as s inner join sale_product as sp
on  sp.idSale = s.idSale inner join Product as p
on p.idProduct = sp.idProduct
inner join category as c on p.idCategory = c.idCategory
inner join clients as cl on s.idClient = cl.idClient
inner join pdv on pdv.idPDV = s.idPDV
inner join employee as e on e.idEmployee = pdv.idEmployee
where s.idClient = null  or s.idSale= 1