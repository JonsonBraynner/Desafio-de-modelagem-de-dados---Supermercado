drop database if exists Supermarket;
create database if not exists Supermarket;
use Supermarket;

create table Clients(
	idClient int not null auto_increment,
	fName varchar(20),
	sName varchar(20),
	phone char(11),
	cpf char(11),
	birthday DATE,
	address varchar(20),
	neighborhood varchar(15),
	complement varchar(20),
	city varchar(20),
	_state varchar(20),
	zip_code varchar(20),
	primary key(idClient),
	constraint unique_cpf unique(cpf)
);

create table Employee(
	idEmployee int not null auto_increment,
	fName varchar(20),
	sName varchar(20),
	cpf char(11),
	birthday DATE,
	address varchar(20),
	neighborhood varchar(15),
	complement varchar(20),
	city varchar(20),
	_state varchar(20),
	zip_code char(20),
	NIS char(11),
	primary key(idEmployee),
	CONSTRAINT unique_cpf UNIQUE(CPF),
	CONSTRAINT unique_nis UNIQUE(NIS)
);

create table PDV(
	idPDV int not null auto_increment primary key,
	pdvNumber varchar (2),
	idEmployee int not null,
	constraint fk_id_pdv_employee foreign key (idEmployee) references Employee(idEmployee)
);

create table Category(
	idCategory int not null auto_increment,
	name varchar(15),
	description varchar(45),
	primary key(idCategory)
);

create table Product(
	idProduct int not null auto_increment,
	name varchar(20),
	manufacturer varchar(20),
	description varchar(45),
    idCategory int,
	pValue decimal(4,2),
    primary key(idProduct),
    constraint fk_id_product_category  foreign key  (idCategory) references Category(idCategory)
);

create table Supplier(
	idSupplier int not null auto_increment,
	social_name varchar(45),
	CNPJ char(14),
	phone char(11),
	address varchar(20),
	neighborhood varchar(15),
	complement varchar(20),
	city varchar(20),
	_state varchar(20),
	zip_code char(20),
	primary key(idSupplier),
	constraint unique_cnpj unique(CNPJ)
);

create table PRODUCT_SUPPLIER(
    idSupplier int,
    idProduct int,
    product_quantity int default 1,
    primary key(idSupplier, idProduct),
    constraint fk_id_supplier_product_supplier foreign key (idSupplier) references supplier(idSupplier) ON DELETE CASCADE,
    constraint fk_id_product_product_supplier foreign key (idProduct) references product(idProduct) ON DELETE CASCADE
    );



create table Storage(
	idStorage int not null auto_increment,
	quantity int(8),
	idProduct int not null,
	primary key(idStorage),
	constraint fk_st_id_product foreign key (idProduct) references Product(idProduct)
);

create table Sale(
	idSale int not null auto_increment,
	idClient int not null,
	idPDV int not null,
	sDate timestamp,
	total decimal(8,2),
	payment_method ENUM('Dinheiro', 'Cartão de credito', 'Pix'),
	primary key(idSale),
	CONSTRAINT fk_id_s_client foreign key (idClient) references Clients(idClient),
	CONSTRAINT fk_id_s_pdv foreign key (idPDV) references PDV(idPDV)
);

create table Sale_Product(
	idSale int not null,
	idProduct int not null,
	constraint  fk_id_sp_sale foreign key (idSale) references Sale(idSale),
	constraint fk_id_sp_product foreign key (idProduct) references Product(idProduct)
);

delimiter $$
-- trigger para inserção do valor total da compra
create trigger trg_update_sale_total
after insert on Sale_Product
for each row
begin
    declare sumTot decimal(10,2);
    
    select sum(p.pValue) into sumTot from Sale_Product sp
    join Product p on sp.idProduct = p.idProduct
    where sp.idSale = new.idSale;
    update Sale set total = sumTot 
    where idSale = new.idSale;
end $$

delimiter ;