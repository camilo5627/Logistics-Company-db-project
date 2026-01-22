create table Insumos(
codigoInsumo varchar(255) not null,
descripcion varchar(255),
cantidadStock int,
proveedor varchar(255),
codigoInsumoCompatible varchar(255) not null
)
GO
alter table Insumos add constraint fk_insumos foreign key (codigoInsumoCompatible) references Insumos(codigoInsumo);
GO
ALTER TABLE Insumos
ADD CONSTRAINT chk_codigoInsumo_formato
CHECK (codigoInsumo LIKE '[A-Z][A-Z][A-Z][A-Z][A-Z]');
GO
--RNE11

ALTER TABLE Insumos
ADD CONSTRAINT chk_cantidadStock_noNegativa
CHECK (cantidadStock >= 0);
GO
ALTER TABLE Insumos
ADD CONSTRAINT chk_codigoInsumoCompatible_formato
CHECK (codigoInsumoCompatible LIKE '[A-Z][A-Z][A-Z][A-Z][A-Z]');
GO
alter table Insumos add constraint pk_insumos primary key (codigoInsumo);