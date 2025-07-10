CREATE (:Carrera {nombre: 'Ingeniería'});
CREATE (:Carrera {nombre: 'Medicina'});
CREATE (:Carrera {nombre: 'Derecho'});


CREATE (s1:Estudiante {nombre: 'Lucía', id: 1});
CREATE (s2:Estudiante {nombre: 'Mateo', id: 2});
CREATE (s3:Estudiante {nombre: 'Sofía', id: 3});


MATCH (e:Estudiante {id: 1}), (c:Carrera {nombre: 'Ingeniería'})
CREATE (e)-[:PERTENECE_A]->(c);

MATCH (e:Estudiante {id: 2}), (c:Carrera {nombre: 'Medicina'})
CREATE (e)-[:PERTENECE_A]->(c);

MATCH (e:Estudiante {id: 3}), (c:Carrera {nombre: 'Derecho'})
CREATE (e)-[:PERTENECE_A]->(c);


CREATE (:Categoria {nombre: 'Matemática'});
CREATE (:Categoria {nombre: 'Biología'});
CREATE (:Categoria {nombre: 'Leyes'});
CREATE (:Categoria {nombre: 'Programación'});

CREATE (l1:Libro {titulo: 'Álgebra Lineal', id: 101});
CREATE (l2:Libro {titulo: 'Anatomía Humana', id: 102});
CREATE (l3:Libro {titulo: 'Derecho Penal', id: 103});
CREATE (l4:Libro {titulo: 'Estructuras de Datos', id: 104});

MATCH (l:Libro {id: 101}), (c:Categoria {nombre: 'Matemática'})
CREATE (l)-[:PERTENECE_A]->(c);

MATCH (l:Libro {id: 102}), (c:Categoria {nombre: 'Biología'})
CREATE (l)-[:PERTENECE_A]->(c);

MATCH (l:Libro {id: 103}), (c:Categoria {nombre: 'Leyes'})
CREATE (l)-[:PERTENECE_A]->(c);

MATCH (l:Libro {id: 104}), (c:Categoria {nombre: 'Programación'})
CREATE (l)-[:PERTENECE_A]->(c);


MATCH (e:Estudiante {id: 1}), (l:Libro {id: 101})
CREATE (e)-[:PIDIO {fecha: date('2025-07-01'), estado: 'Activo'}]->(l);

MATCH (e:Estudiante {id: 2}), (l:Libro {id: 102})
CREATE (e)-[:PIDIO {fecha: date('2025-06-25'), estado: 'Devuelto'}]->(l);

MATCH (e:Estudiante {id: 3}), (l:Libro {id: 103})
CREATE (e)-[:PIDIO {fecha: date('2025-07-03'), estado: 'Activo'}]->(l);

MATCH (e:Estudiante {id: 1}), (l:Libro {id: 104})
CREATE (e)-[:PIDIO {fecha: date('2025-06-30'), estado: 'Devuelto'}]->(l);

MATCH (e:Estudiante {id: 2}), (l:Libro {id: 104})
CREATE (e)-[:PIDIO {fecha: date('2025-07-05'), estado: 'Activo'}]->(l);