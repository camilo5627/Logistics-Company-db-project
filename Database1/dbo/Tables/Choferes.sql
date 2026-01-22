create table Choferes(
nroFuncionario int not null,
ci varchar(10) not null,
nombre varchar(255),
apellido varchar(255),
fechaNacimiento date,
nroLicencia varchar(50),
telefono varchar(15)
)
GO
alter table Choferes add constraint pk_choferes primary key (nroFuncionario);