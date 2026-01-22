create table Vehiculos(
idVehiculo int not null,
matricula varchar(7),
descripcion varchar(255),
marca varchar(255),
modelo varchar(255),
anioFabricacion int,
capacidadCarga int,
consumoPromedio decimal(10,2),
codigoTipo varchar(255) not null
)
GO
alter table Vehiculos add constraint fk_vehiculos foreign key (codigoTipo) references TipoVehiculos(codigoTipo);
GO
--RNE 5
alter table Vehiculos
add constraint chk_capacidadCarga_noNegativo
check (capacidadCarga >= 0);
GO
alter table Vehiculos
add constraint chk_codigoVehiculo_formato
check (codigoTipo like '[A-Z][A-Z][A-Z][0-9][0-9]');
GO
alter table Vehiculos add constraint pk_vehiculos primary key (idVehiculo);