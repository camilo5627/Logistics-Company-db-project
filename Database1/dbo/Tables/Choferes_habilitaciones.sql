create table Choferes_habilitaciones(
nroFuncionario int not null,
idHabilitacion int not null
)
GO
alter table Choferes_habilitaciones add constraint fk1_choferesHabilitaciones foreign key (nroFuncionario) references Choferes(nroFuncionario);
GO
alter table Choferes_habilitaciones add constraint fk2_choferesHabilitaciones foreign key (idHabilitacion) references Habilitaciones(idHabilitacion);
GO
alter table Choferes_habilitaciones add constraint pk_choferesHabilitaciones primary key (nroFuncionario, idHabilitacion);