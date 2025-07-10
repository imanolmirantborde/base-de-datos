//1) Obtener todos los libros actualmente prestados (estado "Activo" ).
MATCH (e:Estudiante)-[p:PIDIO {estado: 'Activo'}]->(l:Libro)
RETURN l.titulo AS Libro, e.nombre AS PrestadoPor, p.fecha AS Fecha;
//2) Listar cuántos libros ha pedido prestado cada estudiante
MATCH (e:Estudiante)-[p:PIDIO]->(l:Libro)
RETURN e.nombre AS Estudiante, COUNT(p) AS TotalPrestamos;
//3) Mostrar las categorías con más préstamos activos
MATCH (e:Estudiante)-[p:PIDIO {estado: 'Activo'}]->(l:Libro)-[:PERTENECE_A]->(c:Categoria)
RETURN c.nombre AS Categoria, COUNT(p) AS PrestamosActivos
ORDER BY PrestamosActivos DESC;
//4) Encontrar los estudiantes que no tienen préstamos activos.
MATCH (e:Estudiante)
WHERE NOT (e)-[:PIDIO {estado: 'Activo'}]->(:Libro)
RETURN e.nombre AS EstudianteSinPrestamoActivo;