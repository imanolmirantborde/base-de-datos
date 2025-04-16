--  Crear base de datos y usarla
CREATE DATABASE Empresa;
USE Empresa;

--  Crear tablas de ejemplo
CREATE TABLE Empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(100)
);

CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(100),
    cantidad INT
);

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Insertar algunos datos
INSERT INTO Empleados (nombre, puesto) VALUES 
('Juan Pérez', 'Analista'),
('María Gómez', 'Vendedora');

INSERT INTO Ventas (producto, cantidad) VALUES 
('Laptop', 5),
('Teléfono', 10);

INSERT INTO Clientes (nombre, email) VALUES 
('Pedro López', 'pedro@mail.com'),
('Ana Torres', 'ana@mail.com');

--  Crear el usuario analista y darle permisos limitados
CREATE USER IF NOT EXISTS 'analista'@'localhost' IDENTIFIED BY 'password123';

-- Darle solo permiso de SELECT en las tablas Empleados y Ventas (no en Clientes)
GRANT SELECT ON Empresa.Empleados TO 'analista'@'localhost';
GRANT SELECT ON Empresa.Ventas TO 'analista'@'localhost';

-- Aplicar los cambios de privilegios
FLUSH PRIVILEGES;

-- Probar acciones desde el usuario analista

-- Estas instrucciones deberías ejecutarlas conectándote como el usuario 'analista'
-- Por ejemplo, en consola:
-- mysql -u analista -p

-- El siguiente bloque simula las acciones que harías como el usuario analista:

-- SELECT (permitido)
-- SELECT * FROM Empleados;
-- SELECT * FROM Ventas;

-- INSERT (NO permitido - generará error)
-- INTENTA ejecutar lo siguiente desde el usuario analista:
-- INSERT INTO Empleados (nombre, puesto) VALUES ('Luis Díaz', 'Contador');

-- Resultado esperado:
-- ERROR 1142 (42000): INSERT command denied to user 'analista'@'localhost' for table 'Empleados'