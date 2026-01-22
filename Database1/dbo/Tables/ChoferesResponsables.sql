create table ChoferesResponsables(
idEnvio int not null,
choferResponsable int not null
)
GO
alter table ChoferesResponsables add constraint fk1_choferesResponsables foreign key (idEnvio) references Envios(nroEnvio);
GO
alter table ChoferesResponsables add constraint fk2_choferesResponsables foreign key (choferResponsable) references Choferes(nroFuncionario);
GO
alter table ChoferesResponsables add constraint pk_choferesResponsables primary key (idEnvio, choferResponsable);