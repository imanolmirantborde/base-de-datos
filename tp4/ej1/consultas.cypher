//1) Obtener el nombre del proyecto, su líder y los empleados asignados
MATCH (lider:Empleado)-[:LIDERA]->(p:Proyecto)
OPTIONAL MATCH (emp:Empleado)-[r:TRABAJA_EN]->(p)
RETURN p.nombre AS Proyecto, 
       lider.nombre AS Lider, 
       collect(emp.nombre) AS EmpleadosAsignados


//2) Calcular el total de horas semanales por proyecto
MATCH (e:Empleado)-[r:TRABAJA_EN]->(p:Proyecto)
RETURN p.nombre AS Proyecto, SUM(r.horas) AS TotalHorasSemanales

//3) Listar los empleados que trabajan en más de un proyecto
MATCH (e:Empleado)-[:TRABAJA_EN]->(p:Proyecto)
WITH e, COUNT(DISTINCT p) AS cantidadProyectos
WHERE cantidadProyectos > 1
RETURN e.nombre AS Empleado, cantidadProyectos