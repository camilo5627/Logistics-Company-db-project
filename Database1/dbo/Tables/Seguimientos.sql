create table Seguimientos(
nroLinea int not null,
nroEnvio int not null,
fechaHora datetime,
descripcionEvento varchar(255)
)
GO
alter table Seguimientos add constraint fk_seguimientos foreign key (nroEnvio) references Envios(nroEnvio);
GO
alter table Seguimientos add constraint pk_seguimientos primary key (nroLinea);