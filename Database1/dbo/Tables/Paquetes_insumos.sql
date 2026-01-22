create table Paquetes_insumos(
idPaquete int not null,
codigoInsumo varchar(255) not null
)
GO
alter table Paquetes_insumos add constraint fk1_paquetesInsumos foreign key (idPaquete) references Paquetes(idPaquete);
GO
alter table Paquetes_insumos add constraint fk2_paquetesInsumos foreign key (codigoInsumo) references Insumos(codigoInsumo);
GO
ALTER TABLE Paquetes_insumos
ADD CONSTRAINT chk_codigoPaqueteInsumo_formato
CHECK (codigoInsumo LIKE '[A-Z][A-Z][A-Z][A-Z][A-Z]');
GO
alter table Paquetes_insumos add constraint pk_paquetesInsumos primary key (idPaquete, codigoInsumo);