create table Clientes(
nroCliente int not null,
razonSocial varchar(255),
direccion varchar(255),
telefono varchar(10),
paisOrigen varchar(255)
)
GO
alter table Clientes add constraint pk_clientes primary key (nroCliente);