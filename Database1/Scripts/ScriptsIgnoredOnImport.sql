
USE db_Obligatorio;
GO

-- 5.1 Listar cada cliente con la cantidad total de envíos que ha realizado.

SELECT 
    c.nroCliente,
    c.razonSocial, 
    COUNT(DISTINCT p.nroEnvio) AS Total_Envios_Realizados
FROM 
    Clientes c
JOIN 
    Paquetes p ON c.nroCliente = p.nroCliente
GROUP BY 
    c.nroCliente, c.razonSocial
ORDER BY 
    Total_Envios_Realizados DESC;
GO

-- 5.2 Mostrar todos los clientes y la cantidad de envíos.

SELECT 
    c.nroCliente,
    c.razonSocial, 
    COUNT(DISTINCT p.nroEnvio) AS Cantidad_Envios
FROM 
    Clientes c
LEFT JOIN 
    Paquetes p ON c.nroCliente = p.nroCliente
GROUP BY 
    c.nroCliente, c.razonSocial;
GO

-- 5.3 Calcular el peso promedio de los paquetes transportados por cada vehículo.

SELECT 
    v.matricula,
    v.marca,
    v.modelo,
    AVG(p.peso) AS Peso_Promedio_Paquete
FROM 
    Vehiculos v
JOIN 
    Vehiculos_choferes vc ON v.idVehiculo = vc.idVehiculo
JOIN 
    Envios e ON vc.nroFuncionario = e.nroFuncionario
JOIN 
    Paquetes p ON e.nroEnvio = p.nroEnvio
GROUP BY 
    v.idVehiculo, v.matricula, v.marca, v.modelo;
GO

-- 5.4 Listar los choferes que existen en la empresa pero que nunca participaron en ningún envío
SELECT 
    c.nroFuncionario,
    c.nombre,
    c.apellido
FROM 
    Choferes c
LEFT JOIN 
    Envios e ON c.nroFuncionario = e.nroFuncionario
WHERE 
    e.nroEnvio IS NULL;
GO

-- 5.5 Obtener el vehículo con mayor cantidad de envíos realizados
SELECT TOP 1
    v.idVehiculo,
    v.matricula,
    COUNT(e.nroEnvio) AS Cantidad_Envios
FROM 
    Vehiculos v
JOIN 
    Vehiculos_choferes vc ON v.idVehiculo = vc.idVehiculo
JOIN 
    Envios e ON vc.nroFuncionario = e.nroFuncionario
GROUP BY 
    v.idVehiculo, v.matricula
ORDER BY 
    Cantidad_Envios DESC;
GO

-- 5.6 Listar cada insumo junto con la descripción de los insumos que son compatibles con él

SELECT 
    i.codigoInsumo AS Codigo,
    i.descripcion AS Descripcion,
    ic.codigoInsumo AS Codigo_Compatible,
    ic.descripcion AS Descripcion_Compatible
FROM 
    Insumos i
LEFT JOIN 
    Insumos ic ON i.codigoInsumoCompatible = ic.codigoInsumo;
GO

-- 5.7 Agregar stock disponible = 100 para todos los insumos

UPDATE Insumos
SET cantidadStock = 100
WHERE cantidadStock IS NULL;
GO

SELECT
cantidadStock 
FROM Insumos;
GO

create database db_Obligatorio;
GO

USE db_Obligatorio;
GO

-- RNE

--RNE 1

alter table TipoVehiculos
alter column codigoTipo varchar(5) not null;
GO

--RNE 2
alter table TipoVehiculos
alter column descripcion varchar(30) not null
GO

--RNE 3
alter table Vehiculos 
alter column descripcion varchar(30) not null
GO

--RNE 4
alter table Vehiculos 
alter column marca varchar(20) not null
GO

alter table Vehiculos 
alter column modelo varchar(20) not null
GO

--RNE 6
alter table Habilitaciones
alter column descripcion varchar(20)
GO

--- Cliente

--RNE7
ALTER TABLE Clientes
ALTER COLUMN razonSocial VARCHAR(40) NOT NULL;
GO

-- Paquete

--RNE8
ALTER TABLE Paquetes
ALTER COLUMN descripcion VARCHAR(60) NOT NULL;
GO

-- Insumo

--RNE9
ALTER TABLE Insumos
ALTER COLUMN codigoInsumo CHAR(5) NOT NULL;
GO

--RNE10
ALTER TABLE Insumos
ALTER COLUMN descripcion VARCHAR(20);
GO

--RNE 12

alter table Vehiculos
alter column codigoTipo varchar(5) not null;
GO

--RNE 13

ALTER TABLE Paquetes_insumos
ALTER COLUMN codigoInsumo CHAR(5) NOT NULL;
GO

--RNE 14

ALTER TABLE Insumos
ALTER COLUMN codigoInsumoCompatible CHAR(5) NOT NULL;
GO

USE db_Obligatorio;
GO

INSERT INTO TipoVehiculos (codigoTipo, descripcion) VALUES
('CAM01', 'Camión'),
('FUR02', 'Furgón'),
('MOT03', 'Moto');
GO

INSERT INTO Vehiculos (idVehiculo, matricula, descripcion, marca, modelo, anioFabricacion, capacidadCarga, consumoPromedio, codigoTipo) VALUES
(1, 'ABC1234', 'Camioneta', 'Ford', 'F150', 2018, 1500, 12.5, 'CAM01'),
(2, 'DEF5678', 'Furgoneta', 'Hyundai', 'H100', 2020, 800, 9.2, 'FUR02'),
(3, 'GHI9012', 'Moto reparto', 'Honda', 'XR150', 2021, 50, 3.5, 'MOT03');
GO

INSERT INTO Choferes (nroFuncionario, ci, nombre, apellido, fechaNacimiento, nroLicencia, telefono) VALUES
(1, '41234567', 'Juan', 'Pérez', '1985-03-12', 'L12345', '098111111'),
(2, '42345678', 'Ana', 'Gómez', '1990-07-20', 'L54321', '098222222'),
(3, '43456789', 'Luis', 'Martínez', '1978-11-03', 'L99999', '098333333'),
(4, '45458769', 'Javier', 'Rodriguez', '1978-12-03', 'L94576', '098346333');
GO

INSERT INTO Vehiculos_choferes (idVehiculo, nroFuncionario) VALUES
(1, 1),
(2, 2),
(3, 3);
GO

INSERT INTO Habilitaciones (idHabilitacion, descripcion) VALUES
(1, 'Carga liviana'),
(2, 'Carga pesada'),
(3, 'Peligrosos');
GO

INSERT INTO Choferes_habilitaciones (nroFuncionario, idHabilitacion) VALUES
(1, 2),
(2, 1),
(3, 1),
(3, 3);
GO

INSERT INTO Clientes (nroCliente, razonSocial, direccion, telefono, paisOrigen) VALUES
(1, 'LogiTrans', 'Av. Italia 1234', '29010000', 'Uruguay'),
(2, 'MundoPack', 'Rivera 2300', '29020000', 'Argentina'),
(3, 'GlobalShip', '18 de Julio 1550', '29030000', 'Brasil');
GO

INSERT INTO Envios (nroEnvio, nroFuncionario, fechaEstimada, finalizado, salida) VALUES
(1, 1, '2025-01-10', '2025-01-11', '2025-01-10'),
(2, 2, '2025-01-12', NULL, '2025-01-12'),
(3, 1, '2025-01-15', NULL, '2025-01-15'),
(4, 3, '2024-11-30', NULL, '2024-11-29');
GO

INSERT INTO Seguimientos (nroLinea, nroEnvio, fechaHora, descripcionEvento) VALUES
(1, 1, '2025-01-10 08:00', 'Salida'),
(2, 1, '2025-01-10 12:00', 'En tránsito'),
(3, 2, '2025-01-12 09:00', 'Salida');
GO

INSERT INTO Paquetes (idPaquete, nroEnvio, nroCliente, peso, volumen, descripcion) VALUES
(1, 1, 1, 12.5, 0.3, 'Paquete chico'),
(2, 1, 2, 30.0, 0.5, 'Caja mediana'),
(3, 2, 3, 5.0, 0.1, 'Sobre'),
(4, 3, 1, 15.0, 0.4, 'Caja pesada'),
(6, 4, 2, 50.00, 0.5, 'Prueba carga liviana'),
(7, 4, 3, 150.00, 1.2, 'Prueba carga pesada');
GO

INSERT INTO Insumos (codigoInsumo, descripcion, cantidadStock, proveedor, codigoInsumoCompatible) VALUES
('CINTA', 'Cinta', 50, 'Provee SA', 'BOLSA'),
('BOLSA', 'Bolsa', 80, 'Empaques SRL', 'CINTA'),
('ETIQU', 'Etiqueta', 100, 'Etiquetas Ltd', 'CINTA');
GO

INSERT INTO Paquetes_insumos (idPaquete, codigoInsumo) VALUES
(1, 'CINTA'),
(2, 'BOLSA'),
(3, 'ETIQU');
GO
