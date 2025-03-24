-- Inserções para a tabela Clients
insert into Clients (fName, sName, phone, cpf, birthday, address, neighborhood, complement, city, _state, zip_code) values
('Ana', 'Silva', '11999991111', '11122233344', '1990-05-15', 'Rua A, 123', 'Centro', 'Apto 101', 'São Paulo', 'SP', '01000000'),
('Bruno', 'Oliveira', '21988882222', '22233344455', '1985-10-20', 'Avenida B, 456', 'Copacabana', 'Casa 2', 'Rio de Janeiro', 'RJ', '22000000'),
('Carla', 'Santos', '31977773333', '33344455566', '1992-03-25', 'Rua C, 789', 'Savassi', 'Loja 3', 'Belo Horizonte', 'MG', '30000000'),
('Daniel', 'Pereira', '41966664444', '44455566677', '1988-12-01', 'Avenida D, 101', 'Boa Vista', 'Sala 404', 'Porto Alegre', 'RS', '90000000'),
('Elaine', 'Rodrigues', '51955555555', '55566677788', '1995-07-10', 'Rua E, 202', 'Centro', 'Apto 202', 'Curitiba', 'PR', '80000000');

-- Inserções para a tabela Employee
insert into Employee (fName, sName, cpf, birthday, address, neighborhood, complement, city, _state, zip_code, NIS) values
('Fernando', 'Almeida', '66677788899', '1980-01-05', 'Rua F, 303', 'Centro', 'Casa 3', 'São Paulo', 'SP', '01000001', '12345678901'),
('Gabriela', 'Costa', '77788899900', '1987-06-12', 'Avenida G, 404', 'Ipanema', 'Apto 303', 'Rio de Janeiro', 'RJ', '22000001', '23456789012'),
('Henrique', 'Martins', '88899900011', '1993-11-18', 'Rua H, 505', 'Centro', 'Loja 4', 'Belo Horizonte', 'MG', '30000001', '34567890123');

-- Inserções para a tabela PDV
insert into PDV (pdvNumber, idEmployee) values
('01', 1),
('02', 2),
('03', 3);

-- Inserções para a tabela Category
insert into Category (name, description) values
('Alimentos', 'Produtos alimentícios em geral'),
('Bebidas', 'Bebidas alcoólicas e não alcoólicas'),
('Limpeza', 'Produtos de limpeza para o lar'),
('Higiene', 'Produtos de higiene pessoal'),
('Frios', 'Produtos refrigerados e congelados');

-- Inserções para a tabela Product
insert into Product (name, manufacturer, description, pValue, idCategory) values
('Arroz', 'Tio João', 'Arroz branco tipo 1', 5.50, 1),
('Feijão', 'Kicaldo', 'Feijão carioca', 4.20, 1),
('Macarrão', 'Adria', 'Macarrão espaguete', 3.80, 1),
('Óleo', 'Liza', 'Óleo de soja', 6.00, 1),
('Açúcar', 'União', 'Açúcar refinado', 2.90, 1),
('Sal', 'Cisne', 'Sal refinado', 1.50, 1),
('Café', 'Pilão', 'Café torrado e moído', 8.00, 1),
('Leite', 'Italac', 'Leite integral', 4.50, 1),
('Pão', 'Pullman', 'Pão de forma', 5.00, 1),
('Ovos', 'Mantiqueira', 'Ovos brancos', 7.00, 1),
('Banana', 'Local', 'Banana prata', 3.00, 1),
('Maçã', 'Local', 'Maçã gala', 4.00, 1),
('Laranja', 'Local', 'Laranja pera', 3.50, 1),
('Tomate', 'Local', 'Tomate salada', 2.80, 1),
('Cebola', 'Local', 'Cebola branca', 2.50, 1),
('Alho', 'Local', 'Alho a granel', 6.00, 1),
('Chocolate', 'Nestlé', 'Chocolate ao leite', 6.00, 1),
('Queijo', 'Sadia', 'Queijo mussarela', 12.00, 5),
('Presunto', 'Perdigão', 'Presunto fatiado', 10.00, 5),
('Frango', 'Seara', 'Frango congelado', 15.00, 5),
('Carne', 'Friboi', 'Carne bovina', 20.00, 5),
('Detergente', 'Ypê', 'Detergente líquido', 2.00, 3),
('Sabão', 'OMO', 'Sabão em pó', 9.00, 3),
('Amaciante', 'Downy', 'Amaciante concentrado', 11.00, 3),
('Água sanitária', 'Candida', 'Água sanitária', 3.00, 3),
('Papel higiênico', 'Neve', 'Papel higiênico folha dupla', 8.50, 4),
('Refrigerante', 'Coca-Cola', 'Refrigerante cola', 5.00, 2),
('Suco', 'Del Valle', 'Suco de laranja', 4.00, 2),
('Cerveja', 'Brahma', 'Cerveja lata', 3.50, 2),
('Vinho', 'Gallo', 'Vinho tinto', 25.00, 2);

-- Inserções para a tabela Supplier
insert into Supplier (social_name, CNPJ, phone, address, neighborhood, complement, city, _state, zip_code) values
('Distribuidora Alimentos LTDA', '12345678901234', '11987654321', 'Rua X, 1000', 'Industrial', 'Galpão 1', 'São Paulo', 'SP', '01000002'),
('Bebidas Unidas SA', '56789012345678', '21976543210', 'Avenida Y, 2000', 'Centro', 'Loja 2', 'Rio de Janeiro', 'RJ', '22000002'),
('Produtos Limpeza Z', '90123456789012', '31965432109', 'Rua Z, 3000', 'Comercial', 'Sala 3', 'Belo Horizonte', 'MG', '30000002');

-- Inserções para a tabela PRODUCT_SUPPLIER
insert into PRODUCT_SUPPLIER (idSupplier, idProduct, product_quantity) values
(1, 1, 100),
(1, 2, 150),
(1, 3, 200),
(2, 26, 50),
(2, 27, 75),
(3, 21, 120),
(3, 22, 90),
(3, 23, 110),
(1, 4, 100),
(1, 5, 100);

-- Inserções para a tabela Storage
insert into Storage (quantity, idProduct) values
(100, 1),
(150, 2),
(200,3),
(50, 26),
(75, 27),
(120, 21),
(90, 22),
(110, 23),
(100, 4),
(100, 5);

-- Inserções para a tabela Sale
insert into Sale (idClient, idPDV, sDate, total, payment_method) values
(1, 1, '2023-10-26 10:30:00', 50.00, 'Cartão de credito'),
(2, 2, '2023-10-26 10:30:00', 75.00, 'Dinheiro'),
(3, 3, '2023-10-26 10:30:00', 100.00, 'Pix'),
(4, 1, '2023-10-26 14:15:00', 120.00, 'Cartão de credito'),
(5, 2, '2023-10-26 14:15:00', 90.00, 'Dinheiro');

-- Inserções para a tabela Sale_Product
insert into Sale_Product (idSale, idProduct) values
(1, 1),
(1, 2),
(2, 26),
(2, 27),
(3, 21),
(3, 22),
(4, 4),
(4, 5),
(5, 3),
(5, 6),
(1, 1),
(1, 3),
(1, 5),
(2, 2),
(2, 4),
(3, 6),
(3, 8),
(3, 10),
(3, 12),
(4, 7),
(4, 9),
(4, 11),
(5, 13),
(5, 15),
(5, 17),
(5, 19),
(5, 21),
(1, 2),
(2, 6),
(4, 14),
(3, 20),
(5, 22);
