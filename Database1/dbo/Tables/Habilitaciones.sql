create table Habilitaciones(
idHabilitacion int not null,
descripcion varchar(255)
)
GO
alter table Habilitaciones add constraint pk_habilitaciones primary key (idHabilitacion);