-- Crear DB
CREATE DATABASE Data_Mining;

-- conectarse a la DB
\c Data_Mining;

-- Creación de tablas
CREATE TABLE Clientes(
    id_cliente SERIAL PRIMARY KEY,
    nombre_cliente varchar(255) NOT NULL,
    apellido varchar(255) NOT NULL,
    correo varchar(255) NOT NULL,
    domicilio varchar(255)
);

CREATE TABLE Productos(
    id_producto SERIAL PRIMARY KEY,
    nombre_producto varchar(255) NOT NULL,
    costo varchar(30) NOT NULL,
    elaborado_por varchar(30),
    existencia boolean
);

CREATE TABLE Recibos(
    id_recibo SERIAL PRIMARY KEY,
    id_cliente int NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    id_producto int NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    fecha date NOT NULL, --YYYY-MM-DD
	hora varchar(20),
    dia_de_la_semana varchar(30),
    cantidad int NOT NULL,
    modo_pago varchar(30)
);

-- llenado de tablas:
-- Clientes:
INSERT INTO Clientes(nombre_cliente, apellido, correo, domicilio) VALUES('Alonso', 'Figueroa', 'ag@gmail.com', 'Av. 5 de Julio con El Milagro');

-- Productos:
INSERT INTO Productos(nombre_producto, costo, elaborado_por, existencia) VALUES('Cerveza', '5$', 'Heineken', true);

-- Recibos:
INSERT INTO Recibos(id_cliente, id_producto, fecha, hora, dia_de_la_semana, cantidad, modo_pago) VALUES('1', '1', '2023-05-23', '10:41 p.m.', 'Martes', 4, 'Zelle');


-- borrar filas
delete from clientes where nombre_cliente='Alonso';
delete from productos where nombre_producto='Cerveza';
delete from recibos where dia_de_la_semana='Martes';

--eliminar tabla
drop table clientes;