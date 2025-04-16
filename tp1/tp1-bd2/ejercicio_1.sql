-- EJERCICIO 1: Reglas de integridad Referencial

-- Crear base de datos y usarla
CREATE DATABASE bd2_tp1;
USE bd2_tp1;

-- Crear tablas estudiantes y cursos
CREATE TABLE Estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- crear tabla Inscripciones con claves foraneas SIN accion especial
CREATE TABLE Inscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT,
    curso_id INT,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

--  inserto datos
INSERT INTO Estudiantes (nombre) VALUES ('Jimena'), ('Carlos');
INSERT INTO Cursos (nombre) VALUES ('Base de Datos'), ('Programación');
INSERT INTO Inscripciones (estudiante_id, curso_id) VALUES (1, 1), (1, 2);

-- intento eliminar un estudiante con inscripciones
-- espero un error por restriccion de integridad referencial
DELETE FROM Estudiantes WHERE id = 1;

-- ERROR: Cannot delete or update a parent row: a foreign key constraint fails
-- bd2_tp1.inscripciones, CONSTRAINT inscripciones_ibfk_1 FOREIGN KEY (estudiante_id) REFERENCES estudiantes (id)

-- Solucion: crear Inscripciones con ON DELETE CASCADE, antes elimino la tabla mal creada
DROP TABLE Inscripciones;

CREATE TABLE Inscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT,
    curso_id INT,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- reinsertar datos para probar el CASCADE
INSERT INTO Inscripciones (estudiante_id, curso_id) VALUES (1, 1), (1, 2);

-- Ahora eliminar estudiante id = 1
-- Se espera que tmbn se eliminen sus inscripciones 
DELETE FROM Estudiantes WHERE id = 1;

-- 9. Otra alternativa sería ON DELETE SET NULL (no implementada aquí)

