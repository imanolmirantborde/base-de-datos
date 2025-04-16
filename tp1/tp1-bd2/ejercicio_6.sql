-- elimina la tabla si ya existe
DROP TABLE IF EXISTS ventas;

-- creamos la tabla
CREATE TABLE ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    producto_id INTEGER,
    fecha TEXT,
    cantidad INTEGER,
    total REAL
);

-- insertamos los datos
INSERT INTO ventas (producto_id, fecha, cantidad, total) VALUES
(1, '2023-01-15', 10, 100.00),
(2, '2023-01-20', 5, 50.00),
(1, '2023-02-10', 15, 150.00),
(3, '2023-02-12', 8, 80.00),
(2, '2023-02-25', 12, 120.00),
(3, '2023-03-01', 20, 200.00),
(1, '2023-03-05', 10, 100.00),
(2, '2023-03-08', 7, 70.00),
(3, '2023-03-10', 6, 60.00);

-- creamos la vista con resumen mensual por producto
DROP VIEW IF EXISTS resumen_ventas_mensuales;

CREATE VIEW resumen_ventas_mensuales AS
SELECT 
    producto_id,
    CAST(strftime('%m', fecha) AS INTEGER) AS mes,
    CAST(strftime('%Y', fecha) AS INTEGER) AS anio,
    SUM(cantidad) AS total_vendido,
    SUM(total) AS total_facturado
FROM ventas
GROUP BY producto_id, anio, mes;

-- consultamos los 5 productos más vendidos (total acumulado)
SELECT 
    producto_id,
    SUM(total_vendido) AS cantidad_total
FROM resumen_ventas_mensuales
GROUP BY producto_id
ORDER BY cantidad_total DESC
LIMIT 5;