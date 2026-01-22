create table Vehiculos_choferes(
idVehiculo int not null,
nroFuncionario int not null
)
GO
alter table Vehiculos_choferes add constraint fk1_vehiculosChoferes foreign key (idVehiculo) references Vehiculos(idVehiculo);
GO
alter table Vehiculos_choferes add constraint fk2_vehiculosChoferes foreign key (nroFuncionario) references Choferes(nroFuncionario);
GO
alter table Vehiculos_choferes add constraint pk_vehiculosChoferes primary key (idVehiculo, nroFuncionario);