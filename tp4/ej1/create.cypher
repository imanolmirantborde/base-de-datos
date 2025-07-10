CREATE (:Departamento {nombre: 'Recursos Humanos'});
CREATE (:Departamento {nombre: 'IT'});
CREATE (:Departamento {nombre: 'Finanzas'});

CREATE (e1:Empleado {nombre: 'Ana', id: 1})
CREATE (e2:Empleado {nombre: 'Bruno', id: 2})
CREATE (e3:Empleado {nombre: 'Carla', id: 3})


MATCH (e:Empleado {id: 1}), (d:Departamento {nombre: 'Recursos Humanos'})
CREATE (e)-[:PERTENECE_A]->(d);

MATCH (e:Empleado {id: 2}), (d:Departamento {nombre: 'IT'})
CREATE (e)-[:PERTENECE_A]->(d);

MATCH (e:Empleado {id: 3}), (d:Departamento {nombre: 'Finanzas'})
CREATE (e)-[:PERTENECE_A]->(d);

CREATE (p1:Proyecto {nombre: 'Proyecto A'})
CREATE (p2:Proyecto {nombre: 'Proyecto B'})


MATCH (e:Empleado {id: 1}), (p:Proyecto {nombre: 'Proyecto A'})
CREATE (e)-[:TRABAJA_EN {horas: 10}]->(p);

MATCH (e:Empleado {id: 2}), (p:Proyecto {nombre: 'Proyecto A'})
CREATE (e)-[:TRABAJA_EN {horas: 20}]->(p);

MATCH (e:Empleado {id: 2}), (p:Proyecto {nombre: 'Proyecto B'})
CREATE (e)-[:TRABAJA_EN {horas: 15}]->(p);

MATCH (e:Empleado {id: 3}), (p:Proyecto {nombre: 'Proyecto B'})
CREATE (e)-[:TRABAJA_EN {horas: 25}]->(p);


MATCH (e:Empleado {id: 1}), (p:Proyecto {nombre: 'Proyecto A'})
CREATE (e)-[:LIDERA]->(p);

MATCH (e:Empleado {id: 3}), (p:Proyecto {nombre: 'Proyecto B'})
CREATE (e)-[:LIDERA]->(p);