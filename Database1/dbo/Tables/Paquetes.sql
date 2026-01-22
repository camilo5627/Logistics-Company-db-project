create table Paquetes(
idPaquete int not null,
nroEnvio int not null,
nroCliente int not null,
peso decimal(10,2),
volumen decimal(10,2),
descripcion varchar(255)
)
GO
alter table Paquetes add constraint fk1_Paquetes foreign key (nroEnvio) references Envios(nroEnvio);
GO
alter table Paquetes add constraint fk2_Paquetes foreign key (nroCliente) references Clientes(nroCliente);
GO
alter table Paquetes add constraint pk_paquetes primary key (idPaquete);