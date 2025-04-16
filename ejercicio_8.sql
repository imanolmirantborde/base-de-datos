-- Ejercicio 8: Seguridad y Auditoría

-- Creación de la base de datos 
CREATE DATABASE AuditoriaDB;
USE AuditoriaDB;

-- Crear la tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(15)
);

-- Crear la tabla de auditoría
CREATE TABLE IF NOT EXISTS Clientes_auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    operacion VARCHAR(10),
    nombre_anterior VARCHAR(100),
    correo_anterior VARCHAR(100),
    telefono_anterior VARCHAR(15),
    nombre_nuevo VARCHAR(100),
    correo_nuevo VARCHAR(100),
    telefono_nuevo VARCHAR(15),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger para registrar insertos en Clientes
DELIMITER //
CREATE TRIGGER after_insert_clientes
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Clientes_auditoria (cliente_id, operacion, nombre_nuevo, correo_nuevo, telefono_nuevo)
    VALUES (NEW.id, 'INSERT', NEW.nombre, NEW.correo, NEW.telefono);
END;
//
DELIMITER ;

-- Trigger para registrar actualizaciones en Clientes
DELIMITER //
CREATE TRIGGER after_update_clientes
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Clientes_auditoria (cliente_id, operacion, nombre_anterior, correo_anterior, telefono_anterior,
                                    nombre_nuevo, correo_nuevo, telefono_nuevo)
    VALUES (OLD.id, 'UPDATE', OLD.nombre, OLD.correo, OLD.telefono, NEW.nombre, NEW.correo, NEW.telefono);
END;
//
DELIMITER ;

-- Trigger para registrar eliminaciones en Clientes
DELIMITER //
CREATE TRIGGER after_delete_clientes
AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Clientes_auditoria (cliente_id, operacion, nombre_anterior, correo_anterior, telefono_anterior)
    VALUES (OLD.id, 'DELETE', OLD.nombre, OLD.correo, OLD.telefono);
END;
//
DELIMITER ;

-- Ejemplo de cliente
INSERT INTO Clientes (nombre, correo, telefono) VALUES ('Juan Pérez', 'juan@example.com', '1234567890');

-- Actualizar un cliente
UPDATE Clientes SET nombre = 'Juan Pérez Gómez', correo = 'juan.gomez@example.com', telefono = '0987654321' WHERE id = 1;

-- Eliminar un cliente
DELETE FROM Clientes WHERE id = 1;

-- Consultar la tabla de auditoría
SELECT * FROM Clientes_auditoria;