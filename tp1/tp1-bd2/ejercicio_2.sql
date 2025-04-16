-- EJERCICIO 2: Implementación de Restricciones

-- tabla Alumnos y mafterias con clave primaria
CREATE TABLE Alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Materias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- tabla Matriculas con claves foráneas
CREATE TABLE Matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT,
    materia_id INT,
    FOREIGN KEY (alumno_id) REFERENCES Alumnos(id),
    FOREIGN KEY (materia_id) REFERENCES Materias(id)
);
INSERT INTO Alumnos (nombre) VALUES ('Jimena'), ('Lucas');
INSERT INTO Materias (nombre) VALUES ('Base de Datos'), ('Matemática');

--  insertar una matrícula con alumno y materia que NO existen
-- Este INSERT genera un error porque no existen los IDs 99 y 88 en las tablas referenciadas
-- ERROR esperado: Cannot add or update a child row: a foreign key constraint fails
INSERT INTO Matriculas (alumno_id, materia_id) VALUES (99, 88);
-- Este INSERT sí funciona porque los IDs 1 y 1 existen en Alumnos y Materias
INSERT INTO Matriculas (alumno_id, materia_id) VALUES (1, 1);
