create table Envios(
nroEnvio int not null,
nroFuncionario int not null,
fechaEstimada date,
finalizado date,
salida date
)
GO
alter table Envios add constraint fk_envios foreign key (nroFuncionario) references Choferes(nroFuncionario);
GO
alter table Envios add constraint pk_envios primary key (nroEnvio);