-- Ejercicio 5: Creación de Indices

-- elimina la tabla si ya existe
DROP TABLE IF EXISTS ventas;

-- creamos la tabla
CREATE TABLE ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    producto_id INTEGER,
    fecha TEXT,
    total REAL
);

-- insertamos algunos registros 
INSERT INTO ventas (cliente_id, producto_id, fecha, total) VALUES
(101, 201, '2023-01-01', 500.00),
(101, 202, '2023-01-02', 300.00),
(102, 201, '2023-01-03', 150.00),
(103, 203, '2023-01-04', 700.00),
(123, 45,  '2023-01-05', 1000.00), -- este es el que vamos a consultar
(124, 46,  '2023-01-06', 900.00),
(123, 47,  '2023-01-07', 600.00),
(125, 45,  '2023-01-08', 400.00),
(126, 48,  '2023-01-09', 550.00),
(127, 49,  '2023-01-10', 1200.00);

-- consulta SIN índice
EXPLAIN QUERY PLAN
SELECT * FROM ventas WHERE cliente_id = 123 AND producto_id = 45;

-- creamos índices simples
CREATE INDEX idx_cliente ON ventas(cliente_id);
CREATE INDEX idx_producto ON ventas(producto_id);

-- consulta con índices simples
EXPLAIN QUERY PLAN
SELECT * FROM ventas WHERE cliente_id = 123 AND producto_id = 45;

-- creamos índice compuesto
CREATE INDEX idx_cliente_producto ON ventas(cliente_id, producto_id);

-- consulta con índice compuesto
EXPLAIN QUERY PLAN
SELECT * FROM ventas WHERE cliente_id = 123 AND producto_id = 45;