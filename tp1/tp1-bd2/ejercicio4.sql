-- Optimizacion de consultas, indices y vistas.
-- Ejercicio 4: plan de ejecucion

-- Se creo una base de datos llamada 'ventas'.
-- Dento de esa base de datos se creo una tabla llama 'productos':

CREATE TABLE productos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
precio DECIMAL(10,2) NOT NULL
);

-- Después se insertaron 100.000 resgistros en la tabla 'productos' para poder
-- hacer las pruebas de rendimiento en las consultas.

-- Paso 1: Usar la base de datos creada:

USE ventas;

-- Paso 2: Ejecutar una consulta sin índice usando EXPLAIN:
EXPLAIN SELECT * FROM productos WHERE precio = 100.00;

-- Resultado:
-- type: ALL --> leyo los 100.000 registros para encontrar coincidencias
-- key: NULL
-- rows: 99918
-- Conclusion: MySQL recorre toda la tabla, lo que hace que sea ineficiente en 
-- tablas con muchos registros

-- Paso 3: Crear un indice en la columna 'precio':
CREATE INDEX idx_precio ON productos(precio);

-- Paso 4: Ejecutar de nuevo la consulta con EXPLAIN, teniendo un indice:
EXPLAIN SELECT * FROM productos WHERE precio = 100.00;

-- Resultado:
-- type: ref --> uso el indice para encontrar registros que coinciden con 'precio = 100.00' 
-- key: idx_precio
-- rows: 1014
-- Conclusion: MySQL usa el indice accediendo directamente a las filas que cumplen 
-- con la condicion. Se leen  menos registros y es mas eficiente.

-- Conclusion final: La creacion de indices optimiza el rendimiento de la consulta 
-- al tener tablas con grnades volumenes de datos.
-- En este caso, en la consulta sin indice recorrio 99918 filas y en la consulta 
-- con indice recorrio solamente 1014. 
-- Es muy notable la mejora en la eficiencia.
