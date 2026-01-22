create table TipoVehiculos(
codigoTipo varchar(255) not null,
descripcion varchar(255)
)
GO
alter table TipoVehiculos
add constraint chk_codigoTipo_formato
check (codigoTipo like '[A-Z][A-Z][A-Z][0-9][0-9]');
GO
alter table TipoVehiculos add constraint pk_tipoVehiculos primary key (codigoTipo);